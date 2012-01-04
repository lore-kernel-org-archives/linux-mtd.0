Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiYSU-00026p-N8
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 21:33:19 +0000
Received: by eekc13 with SMTP id c13so17260578eek.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2012 13:33:17 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
Date: Wed, 4 Jan 2012 22:33:15 +0100
References: <201201040148.32847.marek.vasut@gmail.com>
 <4F03EA83.9030503@freescale.com>
In-Reply-To: <4F03EA83.9030503@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201042233.15645.marek.vasut@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi Marek:
> > Hi,
> > 
> > the gpmi-nand.c driver apparently has misconfigured ecc.size field:
> > 
> > drivers/mtd/nand/gpmi-nand/gpmi-nand.c:
> > ---------->8 ----------
> > 1493         chip->ecc.mode          = NAND_ECC_HW;
> > 1494         chip->ecc.size          = 1;
> > 1495         chip->ecc.layout        =&gpmi_hw_ecclayout;
> > ---------- 8<  ----------
> > 
> > This boils down to misconfigured mtd->subpage_sft in:
> > 
> > drivers/mtd/nand/nand_base.c:
> > ---------->8 ----------
> > 3434         /* Allow subpage writes up to ecc.steps. Not possible for
> > MLC flash */
> > 3435         if (!(chip->options&  NAND_NO_SUBPAGE_WRITE)&&
> > 3436             !(chip->cellinfo&  NAND_CI_CELLTYPE_MSK)) {
> > 3437                 switch (chip->ecc.steps) {
> > 3438                 case 2:
> > 3439                         mtd->subpage_sft = 1;
> > 3440                         break;
> > 3441                 case 4:
> > 3442                 case 8:
> > 3443                 case 16:
> > 3444                         mtd->subpage_sft = 2;
> > 3445                         break;
> > 3446                 }
> > 3447         }
> > 3448         chip->subpagesize = mtd->writesize>>  mtd->subpage_sft;
> > ---------- 8<  ----------
> > 
> > The mtd->subpage_sft is accidentally 0 by default. Therefore, the subpage
> > size is mtd->writesize>>  0. Therefore the subpage size reported to UBI
> > formating tools is the size of whole page, which works. Now, if I
> > correct the problem by setting ecc.size properly to 512 bytes, I get
> > into trouble with UBI:
> > 
> > 1) UBI formating tools are reported the driver CAN DO subpage writes
> > 2) UBI formating tools are reported the subpage size is 512 bytes
> 
> The gpmi driver does not support the subpage read/write.

That's what I said above.

> I will be happy if the driver works only by setting the
> NAND_NO_SUBPAGE_WRITE, without setting the ecc.size.

So you intentionally set the ecc.size to 1 to work around the issue?

> 
> Best Regards
> Huang Shijie
> 
> > and this happens even though the NAND_NO_SUBPAGE_WRITE option is set by
> > the driver. This is because:
> > 
> > drivers/mtd/nand/nand_base.c:
> > ---------->8 ----------
> > 3072         /* Get chip options, preserve non chip based options */
> > 3073         chip->options&= ~NAND_CHIPOPTIONS_MSK;
> > 3074         chip->options |= type->options&  NAND_CHIPOPTIONS_MSK;
> > ---------- 8<  ----------
> > 
> > which effectively masks that bit away. So, how are we going to fix it?
> > 
> > Cheers!
> > 
> > Marek
