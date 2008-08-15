Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
From: David Woodhouse <dwmw2@infradead.org>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
In-Reply-To: <ac9c93b10808150304k14f054faw402a7f67e868d2a@mail.gmail.com>
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<1218472202.2977.12.camel@pmac.infradead.org>
	<ac9c93b10808120153m7435424ci3e49a70d3599cc06@mail.gmail.com>
	<1218535872.2977.133.camel@pmac.infradead.org>
	<alpine.DEB.0.99.0808142007340.6572@frans-desktop>
	<48A48330.70105@boundarydevices.com>
	<ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
	<1218789997.3184.64.camel@pmac.infradead.org>
	<ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>
	<1218793271.3184.77.camel@pmac.infradead.org>
	<ac9c93b10808150304k14f054faw402a7f67e868d2a@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 15 Aug 2008 11:12:20 +0100
Message-Id: <1218795140.3184.84.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-08-15 at 12:04 +0200, Frans Meulenbroeks wrote:
> 2008/8/15, David Woodhouse <dwmw2@infradead.org>:
> > On Fri, 2008-08-15 at 11:23 +0200, Frans Meulenbroeks wrote:
> >  > 2008/8/15, David Woodhouse <dwmw2@infradead.org>:
> >
> > No need -- if you've thought about it and believe it should work, that's
> >  probably enough. I just saw some 'unsigned long' data types, which are
> >  going to have a different size between 32-bit and 64-bit systems, and
> >  wondered if that would introduce differences.
> 
> I was unaware of that. For me unsigned long is more or less a synonym
> for 32 bit. Maybe I'm just getting too old :-(
> Anyway, if you have a suggestion for a better type, I'll happily change things.
> Would uint32_t be better?

If it needs to be 32-bit, then yes -- uint32_t is the correct type to
use.

If 64-bit is OK, then 'unsigned long' is likely to be more efficient on
some platforms.

> >  I see stuff like this in the patch file:
> >
> >
> >   }
> >   EXPORT_SYMBOL(nand_correct_data);
> >
> >   MODULE_LICENSE("GPL");
> >  -MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
> >  +MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
> >   MODULE_DESCRIPTION("Generic NAND ECC support");
> >
> >
> > But those lines at the end of the file aren't indented by a space,
> >  although the patch seems to expect them to be.

Er, stop. What you quoted above _isn't_ what I sent you. In what I sent,
there were _two_ spaces before the 'context' lines (MODULE_LICENSE...
and MODULE_DESCRIPTION...).

Your mail setup is corrupting your mail.

> Will try this tonight (which is in 8 hrs or so).
> Not sure if the | mail will work.

It's fairly unlikely to -- that was kind of a placeholder for sending
mail _somehow_ that doesn't get it corrupted.

> I mostly use web based mail, and for this I installed alpine to avoid
> html makeup and line wrapping. Alpine is coupled to my gmail account.

Make sure you turn off flowed text in alpine.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
