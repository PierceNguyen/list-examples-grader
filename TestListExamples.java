import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test(timeout = 500)
  public void testMergeLeftEnd() {
    List<String> right = Arrays.asList("a", "b", "c", "c", "d", "e", "y", "z");
    List<String> left = Arrays.asList("a", "d", "x", "z");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "c", "d", "d", "e", "x", "y", "z", "z");
    assertEquals(expected, merged);
  }

  @Test(timeout = 500)
  public void testFilter() {
    List<String> list = Arrays.asList("a", "b", "c", "moon", "1", "c", "a", "d", "m", "moon");
    IsMoon sc = new IsMoon();
    List<String> expected = Arrays.asList("moon", "moon");
    assertEquals(expected, ListExamples.filter(list, sc));
  }
}
