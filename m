Received: from ring.vpop.net ([207.178.248.5])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DH3V6-0005Pe-74
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 12:30:37 -0500
From: Matthew Reimer <mreimer@vpop.net>
To: tglx@linutronix.de
Date: Thu, 31 Mar 2005 09:29:59 -0800
References: <424B4FFA.7050906@joshuawise.com>
	<1112269966.4228.68.camel@tglx.tec.linutronix.de>
In-Reply-To: <1112269966.4228.68.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200503310929.59763.mreimer@vpop.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: oobavail issues
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 31 March 2005 03:52 am, Thomas Gleixner wrote:
> On Wed, 2005-03-30 at 20:18 -0500, Joshua Wise wrote:
> > We found that making our oobfree match up with oobavail seemed to do the
> > trick for avoiding this, and make JFFS2 work, to boot! Here's what we
> > did:
> >
> > I suspect that oobavail should be summing oobfree instead of doing that
> > arithmetic. Or is there something I'm not seeing?
>
> In general you're right. oobavail should be derived from oobfree, but in
> case of JFFS2 this does not matter at all.
>
> Which problem went away with your changes ?

We're using the nand_oobinfo structure from the s3c2410.c nand driver:

static struct nand_oobinfo nand_hw_eccoob = {
        .useecc         = MTD_NANDECC_AUTOPLACE,
        .eccbytes       = 3,
        .eccpos         = {0, 1, 2 },
        .oobfree        = { {8, 8} }
};

On our platform, it's hooked up to Samsung flash part (k9f5608u0a) with 512 
byte pages and 16 bytes of OOB. We were getting crashes in the memcpy() that 
nand_prepare_oobbuf() does because with the above definition mtd->oobavail = 
12, whereas the total number of oobfree bytes only equals 8. So the first 
memcpy() would be correct and len would advance by 8, but then since len (now 
8) < mtd->oobavail (now 12), it would iterate again. These subsequent 
iterations assume that there are more entries in the oobfree array, and would 
end up reading whatever values happened to follow the oobfree array and using 
those. In our case, it would read zeroes, which would result in len not 
advancing, and eventually it read some impossibly large number which memcpy() 
would choke on and crash the kernel.

We've worked around the crash by making sure that oobfree covers every free 
byte.

I'm not sure what is the correct fix--calculate oobavail differently, or to 
change the loop condition in nand_prepare_oobbuf, or to require 
nand_oobinfo.oobfree to cover every OOB byte. We just copied from the 
s3c2410.c, assuming it was correct.

What would you suggest?

Matt
