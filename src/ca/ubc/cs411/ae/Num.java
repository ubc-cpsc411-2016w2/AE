package ca.ubc.cs411.ae;

/**
 * Created by ronaldgarcia on 2017-01-05.
 */
public class Num extends AE {
    public final int n;

    public Num(int n) {
        this.n = n;
    }

    @Override
    public String toString() {
        return "new Num(" + n + ')';
    }

    @Override
    public int interp() {
        return this.n;
    }
}
