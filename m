Received: from courier.cs.helsinki.fi ([128.214.9.1] helo=mail.cs.helsinki.fi)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtKq4-0000cF-J6
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 10:56:05 +0000
Date: Tue, 6 May 2008 13:56:00 +0300 (EEST)
From: "=?ISO-8859-1?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@helsinki.fi>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: cfi_{build,send_gen}_cmd bloats, how to uninline?
In-Reply-To: <1210068189.25560.759.camel@pmac.infradead.org>
Message-ID: <Pine.LNX.4.64.0805061305270.1888@wrl-59.cs.helsinki.fi>
References: <Pine.LNX.4.64.0805030002240.3985@wrl-59.cs.helsinki.fi>
	<1210068189.25560.759.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	boundary="-696208474-1487223862-1210069029=:1888"
Content-ID: <Pine.LNX.4.64.0805061334390.1888@wrl-59.cs.helsinki.fi>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---696208474-1487223862-1210069029=:1888
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Content-ID: <Pine.LNX.4.64.0805061334391.1888@wrl-59.cs.helsinki.fi>

On Tue, 6 May 2008, David Woodhouse wrote:

> On Tue, 2008-05-06 at 12:53 +0300, Ilpo Järvinen wrote:
> > Hi,
> > 
> > When doing some time ago measurements on how static inlines affect the 
> > size of the kernel, I found out that uninlining cfi_{build,send_gen}_cmd 
> > yield to considerable size reduction (measured with 32-bit x86, gcc 
> > version 4.1.2 20070626 (Red Hat 4.1.2-13), on v2.6.25-rc2-mm1 IIRC, 
> > allyesconfig minus number of manually selected DEBUG related CONFIGs):
> > 
> > 42 funcs, 199 +, 33328 -, diff: -33129 --- cfi_build_cmd
> > 14 funcs, 365 +, 14648 -, diff: -14283 --- cfi_send_gen_cmd
> > 
> > ...(Because there's depency between them as cfi_send_gen_cmd includes a 
> > call to cfi_build_cmd, total for both to is likely going to less than what 
> > those two summed together are, uninlining cfi_send_gen_cmd might even not 
> > pay off much).
> > 
> > I'm unsure how should the uninlining be performed in this case, 
> > especially since there's some alerting comment like this:
> > 
> > "/* We do it this way to give the compiler a fighting chance
> >     of optimising away all ..."
> > 
> > "* It looks too long to be inline, but in the common case it should almost all
> >  * get optimised away."
> > 
> > ...Perhaps somebody has just assumed gcc to be more clever than it 
> > actually is, I wonder if the claimed optimization was ever happening
> > in practice... :-/
> 
> Were you testing with only a single interleave/bankwidth enabled, or did
> you have them all supported? It's the single-geometry case where we 
> expect it to all fall out and the inlines to be really trivial.

I had allyesconfig-like setting (minus some DEBUG configs), so I suppose 
it had all of them? 

Is there still something else related than those MAP_BANK_WIDTH_xx and 
MTD_CFI_Ix I should tune if I want to verify that things really become 
as trivial as expected (I'll have to this ain't the most simplest case
to understand :-))?

> I suspect that we should make the inlining optional though -- a lot of
> people are building generic kernels with CFI support these days, or just
> not bothering to optimise their config.

It would definately be a good thing to find out some arrangement to such 
case too, worst case offender was 60k in some skbuff.h function, these 
are of the same magnitude.

For me it's not even clear if in practical cases only one of them would be 
strictly necessary? ...Many of the defconfigs seem to have a handful of 
them enabled, leaving considerable amount of code there (though I doubt  
that defconfigs are a good measure for anything). Because of a 
considerable number of call sites, even a small per site bloat easily 
grows to mind-boggling numbers.


-- 
 i.
---696208474-1487223862-1210069029=:1888--
