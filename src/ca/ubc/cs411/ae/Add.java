package ca.ubc.cs411.ae;

/**
 * Created by ronaldgarcia on 2017-01-05.
 */
public class Add extends AE {
    public final AE lhs;
    public final AE rhs;

    public Add(AE lhs, AE rhs) {
        this.lhs = lhs;
        this.rhs = rhs;
    }

    @Override
    public String toString() {
        return "new Add(" + lhs + ", " + rhs + ")";
    }

    @Override
    public int interp() {
        return lhs.interp() + rhs.interp();
    }
}
