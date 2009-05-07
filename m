Received: from smtp125.sbc.mail.sp1.yahoo.com ([69.147.65.184])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M26rT-0000Xt-HM
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 16:54:26 +0000
From: David Brownell <david-b@pacbell.net>
To: "vimal singh" <vimalsingh@ti.com>
Subject: Re: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large page
	NAND chips
Date: Thu, 7 May 2009 09:54:10 -0700
References: <46149.192.168.10.89.1241686786.squirrel@dbdmail.itg.ti.com>
	<41906.192.168.10.89.1241689856.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <41906.192.168.10.89.1241689856.squirrel@dbdmail.itg.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905070954.10987.david-b@pacbell.net>
Cc: davinci-linux-open-source@linux.davincidsp.com, nsnehaprabha@ti.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 07 May 2009, vimal singh wrote:
> >> How about leaving bytes '4' and '5' for bad block marker, to support 16-bit
> >> NAND parts too.
> >
> > This 4-bit ECC engine only works for 8-bit wide parts ...
> > or are you suggesting that in case TI re-engineers that
> > engine in the future?
>
> I am omap guy and was not aware of that. In omap HW BCH
> ECC (4- or 8- bit correction)can work both kind of memories.

I'm somewhat more of an OMAP guy too -- just got sucked in to
trying to get a dm355 board to run off NAND in mainline-bound
code, and you can see where that landed me!

Last I looked at the OMAP2/OMAP3 NAND controller driver, it
didn't yet support most fancy hardware features, like ECC
using more than one bit or the prefetch/postwrite logic. 

One nice feature of that OMAP2/OMAP3 controller, beyond the
support for 8 bit ECC, is that it buffers the ECC syndrome
data so that it doesn't need NAND_ECC_HW_OOB_FIRST logic to
prevent trashing the manufacturer OOB markers.  The limit
of max 4K pages seems like not a big worry for now.

- Dave
