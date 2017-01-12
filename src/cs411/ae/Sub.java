package cs411.ae;

/**
 * Created by ronaldgarcia on 2017-01-05.
 */
public class Sub extends AE {
    public final AE lhs;
    public final AE rhs;

    public Sub(AE lhs, AE rhs) {
        this.lhs = lhs;
        this.rhs = rhs;
    }

    @Override
    public String toString() {
        return "Sub(" +
                lhs +
                "," + rhs +
                ")";

    }
    @Override
    public int interp() {
        return lhs.interp() - rhs.interp();
    }

}
