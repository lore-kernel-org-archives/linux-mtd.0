Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFJM0-0003nC-8X
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 06:06:00 +0000
Received: by bkcjk13 with SMTP id jk13so541768bkc.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Apr 2012 23:05:56 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 3 Apr 2012 23:05:56 -0700
Message-ID: <CAOdLEarFOdmDBS0iDmafLeBU=NNWxWjejTvJ-eEkQjRO12+VYg@mail.gmail.com>
Subject: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
From: Sam Gandhi <samgandhi9@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Has anybody out there been successful in running the new GPMI-NAND
driver when running 3.4-rc1 kernel on any kind of MX28 hardware?

We have enabled options

CONFIG_SOC_IMX28=y
CONFIG_MTD_NAND_GPMI_NAND=y
CONFIG_MXS_DMA=y

When booting kernel with initcall_debug we never see that
gpmi_nand_probe() function is never getting called.

We have tried booting board with kernel parameters
mtdparts=gpmi-nand:10(m),-(user)  or
mtdparts=imx28-gpmi-nand:10(m),-(user)  without any luck.

I have gone through the MTD  mailinglist log, and I didn't find
details on how this GPMI-NAND driver was actually tested on hardware.

Would appreciate the help.

-Sam
