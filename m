Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
From: David Woodhouse <dwmw2@infradead.org>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
In-Reply-To: <ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<1218472202.2977.12.camel@pmac.infradead.org>
	<ac9c93b10808120153m7435424ci3e49a70d3599cc06@mail.gmail.com>
	<1218535872.2977.133.camel@pmac.infradead.org>
	<alpine.DEB.0.99.0808142007340.6572@frans-desktop>
	<48A48330.70105@boundarydevices.com>
	<ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
	<1218789997.3184.64.camel@pmac.infradead.org>
	<ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 15 Aug 2008 10:41:11 +0100
Message-Id: <1218793271.3184.77.camel@pmac.infradead.org>
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

On Fri, 2008-08-15 at 11:23 +0200, Frans Meulenbroeks wrote:
> 2008/8/15, David Woodhouse <dwmw2@infradead.org>:
> If desired I can install and test on a 64 bit kernel.

No need -- if you've thought about it and believe it should work, that's
probably enough. I just saw some 'unsigned long' data types, which are
going to have a different size between 32-bit and 64-bit systems, and
wondered if that would introduce differences.

> Yikes. Can you email me the error log?

patching file Documentation/nand/ecc.txt
patching file drivers/mtd/nand/nand_ecc.c
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 28.
2 out of 2 hunks FAILED -- saving rejects to file drivers/mtd/nand/nand_ecc.c.rej

I see stuff like this in the patch file:

  }
  EXPORT_SYMBOL(nand_correct_data);

  MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
+MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
  MODULE_DESCRIPTION("Generic NAND ECC support");

But those lines at the end of the file aren't indented by a space,
although the patch seems to expect them to be.

> I know about sending patches to myself and testing them, but again
> things are more complicated here.
> I've developed this on a fresh kernel from kernel.org. The previous
> version failed because the mtd git has a change from beginning of june
> where all cvs comments have been removed. This change has not
> propagated to mainline yet (2.6.26.2 still contains the cvs comment).
> As I have no git experience, what I did was pull a copy of nand_ecc.c
> (the only file I change) from the mtd git using my browser
> (http://git.infradead.org/mtd-2.6.git?a=blob_plain;f=drivers/mtd/nand/nand_ecc.c;hb=HEAD)
> and overwrite the one in 2.6.26.2. The only thing I can imagine is
> that something went wrong with that. (e.g. tabs and spaces).

You'd do better with just 
 git clone git://git.infradead.org/mtd-2.6.git
 cp ~/nand_ecc.c drivers/mtd/nand
 git-diff drivers/mtd/nand/nand_ecc.c | mail dwmw2

But I actually suspect it was mangled in transit in the patch -- an
attachment might survive, although you should really work out what's
eating your mail.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
