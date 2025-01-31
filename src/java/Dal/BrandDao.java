/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BrandDao extends DBContext {

    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Brand";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Brand a = new Brand();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Brand getBrandById(int id) {
        Brand brand = null;
        try {
            String sql = "Select * from Brand WHERE bid = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                brand = new Brand();
                brand.setId(rs.getInt("bid"));
                brand.setName(rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return brand;
    }

    public void insertBrand(String name) {
        String query = "INSERT INTO [dbo].[Brand]\n"
                + "           ([name])\n"
                + "     VALUES (?)";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, name);
            ps.executeUpdate();
            System.out.println("Brand inserted successfully.");
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
        }
    }

    public void UpdateBrand(int bid, String name) {
        String sql = "UPDATE [dbo].[Brand]\n"
                + "   SET [name] = ?\n"
                + " WHERE bid = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, bid);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public String DeleteBrand(int bid) {
        String checkSql = "SELECT COUNT(*) FROM [dbo].[Product] WHERE bid = ?";
        String deleteSql = "DELETE FROM [dbo].[Brand] WHERE bid = ?";
        String message = "";

        try {
            // Check for associated products
            PreparedStatement checkSt = connection.prepareStatement(checkSql);
            checkSt.setInt(1, bid);
            ResultSet rs = checkSt.executeQuery();

            if (rs.next()) {
                int productCount = rs.getInt(1);
                if (productCount > 0) {
                    message = "Không thể xóa thương hiệu này. Có các sản phẩm  "+ productCount +" được liên kết với thương hiệu này. Vui lòng xóa hoặc chỉ định lại các sản phẩm này trước khi xóa nhãn hiệu.";
                    return message;
                }
            }

            // Proceed with deleting the brand
            PreparedStatement deleteSt = connection.prepareStatement(deleteSql);
            deleteSt.setInt(1, bid);
            deleteSt.executeUpdate();
            message = "Xóa Nhãn Hàng Thành Công.";

        } catch (SQLException e) {
            message = "SQL Error: " + e.getMessage();
        }
        return message;
    }
    public List<Brand> getBrandCounts() throws Exception {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT b.id, b.name, COUNT(p.id) AS count \n"
                + "                 FROM Brand b \n"
                + "                 LEFT JOIN Product p ON b.id = p.bid\n"
                + "                 GROUP BY b.id, b.name";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Brand a = new Brand();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                a.setCount(rs.getInt(3));
                list.add(a);
            }
        } catch (Exception e) {
            throw new Exception("Error retrieving category counts", e);
        }

        return list;
    }

    public static void main(String[] args) {
        BrandDao bd = new BrandDao();
        List<Brand> bd1 = bd.getAllBrand();
        for (Brand brand : bd1) {
            System.out.println(brand);
        }

    }
}
