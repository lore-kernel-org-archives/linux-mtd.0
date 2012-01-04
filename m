Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiYRh-0001zY-Kb
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 21:32:30 +0000
Received: by eekc13 with SMTP id c13so17259963eek.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2012 13:32:28 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
Date: Wed, 4 Jan 2012 22:32:26 +0100
References: <201201040148.32847.marek.vasut@gmail.com>
 <4F03EA83.9030503@freescale.com> <4F048C99.2010302@freescale.com>
In-Reply-To: <4F048C99.2010302@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201042232.26781.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On 01/03/2012 11:58 PM, Huang Shijie wrote:
> > Hi Marek:
> >> Hi,
> >> 
> >> the gpmi-nand.c driver apparently has misconfigured ecc.size field:
> >> 
> >> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:
> >> ---------->8 ----------
> >> 1493         chip->ecc.mode          = NAND_ECC_HW;
> >> 1494         chip->ecc.size          = 1;
> >> 1495         chip->ecc.layout        =&gpmi_hw_ecclayout;
> >> ---------- 8<  ----------
> 
> [snip]
> 
> > The gpmi driver does not support the subpage read/write.
> > I will be happy if the driver works only by setting the
> > NAND_NO_SUBPAGE_WRITE, without setting the ecc.size.
> 
> Can we just get rid of NAND_CHIPOPTIONS_MSK and trust that drivers won't
> set options that aren't appropriate?  Possibly replace it with
> documentation about which options are for chips, which are for drivers,
> and which (such as NAND_NO_SUBPAGE_WRITE) can be set by either.

Rather let's just adjust the mask?

M
> 
> -Scott
