Subject: Re: cfi_{build,send_gen}_cmd bloats, how to uninline?
From: David Woodhouse <dwmw2@infradead.org>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@helsinki.fi>
In-Reply-To: <Pine.LNX.4.64.0805030002240.3985@wrl-59.cs.helsinki.fi>
References: <Pine.LNX.4.64.0805030002240.3985@wrl-59.cs.helsinki.fi>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 May 2008 11:03:09 +0100
Message-Id: <1210068189.25560.759.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-05-06 at 12:53 +0300, Ilpo Järvinen wrote:
> Hi,
> 
> When doing some time ago measurements on how static inlines affect the 
> size of the kernel, I found out that uninlining cfi_{build,send_gen}_cmd 
> yield to considerable size reduction (measured with 32-bit x86, gcc 
> version 4.1.2 20070626 (Red Hat 4.1.2-13), on v2.6.25-rc2-mm1 IIRC, 
> allyesconfig minus number of manually selected DEBUG related CONFIGs):
> 
> 42 funcs, 199 +, 33328 -, diff: -33129 --- cfi_build_cmd
> 14 funcs, 365 +, 14648 -, diff: -14283 --- cfi_send_gen_cmd
> 
> ...(Because there's depency between them as cfi_send_gen_cmd includes a 
> call to cfi_build_cmd, total for both to is likely going to less than what 
> those two summed together are, uninlining cfi_send_gen_cmd might even not 
> pay off much).
> 
> I'm unsure how should the uninlining be performed in this case, 
> especially since there's some alerting comment like this:
> 
> "/* We do it this way to give the compiler a fighting chance
>     of optimising away all ..."
> 
> "* It looks too long to be inline, but in the common case it should almost all
>  * get optimised away."
> 
> ...Perhaps somebody has just assumed gcc to be more clever than it 
> actually is, I wonder if the claimed optimization was ever happening
> in practice... :-/

Were you testing with only a single interleave/bankwidth enabled, or did
you have them all supported? It's the single-geometry case where we
expect it to all fall out and the inlines to be really trivial.

I suspect that we should make the inlining optional though -- a lot of
people are building generic kernels with CFI support these days, or just
not bothering to optimise their config.

-- 
dwmw2
