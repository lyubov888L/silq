
enum Format{
	default_,
	gnuplot,
	matlab,
	maple,
	mathematica,
	sympy,
	lisp,
}

enum InferenceMethod{
	symbolic,
}

struct Options{
	InferenceMethod backend;
	bool plot=false;
	string plotRange="[-10:10]";
	bool cdf=false;
	bool kill=false;
	auto formatting=Format.default_;
	bool casBench=false;
	bool noBoundsCheck=false;
	bool trace=false;
	bool expectation=false;
}
Options opt; // TODO: get rid of global?

struct Expected{
	bool exists;
	bool todo;
	string ex;
}
Expected expected;
string casExt(Format formatting=opt.formatting){
	final switch(formatting) with(Format){
		case default_: return "dexpr";
		case gnuplot: return "gnu";
		case matlab: return "m";
		case mathematica: return "m";
		case maple: return "mpl";
		case sympy: return "py";
		case lisp: return "lisp";
	}
}
enum Simpl{
	full,
	deltas,
	raw
}
Simpl simplification=Simpl.full;
