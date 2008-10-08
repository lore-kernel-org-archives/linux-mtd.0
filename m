Received: from web58906.mail.re1.yahoo.com ([66.196.100.235])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kni8k-00069s-Mo
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 23:08:22 +0000
Date: Wed, 8 Oct 2008 16:08:20 -0700 (PDT)
From: Philip Rakity <prakity@yahoo.com>
Subject: [PATCH] [MTD] add cmdline parsing (mtdparts=) support to cafe_nand
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <147967.8329.qm@web58906.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adds command line mtdparts=3D support for cafe_nand flash.=0A=0ANOTE: =0AI =
changed where add_mtd_device was done so that there is NOT a complete=0Afla=
sh mount point following by the partitions that were added.  Before=0Athis =
n+1 partitions were added.  1 partition for the complete flash and=0Athen n=
 partitions.=0A=0A=0ASigned-off-by: Philip Rakity <pakity@yahoo.com>=0A--- =
linux-2.6.26.5/drivers/mtd/nand/cafe_nand.c.orig    2008-10-08 15:47:24.000=
000000 -0700=0A+++ linux-2.6.26.5/drivers/mtd/nand/cafe_nand.c 2008-10-08 1=
5:52:08.000000000 -0700=0A@@ -87,8 +87,12 @@ static int timing[3];=0A modul=
e_param_array(timing, int, &numtimings, 0644);=0A=0A #ifdef CONFIG_MTD_PART=
ITIONS=0A+#ifdef CONFIG_MTD_CMDLINE_PARTS=0A+static const char *part_probes=
[] =3D { "cmdlinepart", "RedBoot", NULL };=0A+#else=0A static const char *p=
art_probes[] =3D { "RedBoot", NULL };=0A #endif=0A+#endif=0A=0A /* Hrm. Why=
 isn't this already conditional on something in the struct device? */=0A #d=
efine cafe_dev_dbg(dev, args...) do { if (debug) dev_dbg(dev, ##args); } wh=
ile(0)=0A@@ -628,7 +632,7 @@ static int __devinit cafe_nand_probe(str=0A   =
     struct cafe_priv *cafe;=0A        struct mtd_partition *parts;=0A     =
   uint32_t ctrl;=0A-       int nr_parts;=0A+       int nr_parts =3D 0;=0A =
       int err =3D 0;=0A=0A        /* Very old versions shared the same PCI=
 ident for all three=0A@@ -796,17 +800,21 @@ static int __devinit cafe_nand=
_probe(str=0A=0A        pci_set_drvdata(pdev, mtd);=0A=0A-       /* We regi=
ster the whole device first, separate from the partitions */=0A-       add_=
mtd_device(mtd);=0A-=0A #ifdef CONFIG_MTD_PARTITIONS=0A+#ifdef CONFIG_MTD_C=
MDLINE_PARTS=0A+        mtd->name =3D "cafe_nand";=0A+#endif=0A        nr_p=
arts =3D parse_mtd_partitions(mtd, part_probes, &parts, 0);=0A        if (n=
r_parts > 0) {=0A                cafe->parts =3D parts;=0A-               d=
ev_info(&cafe->pdev->dev, "%d RedBoot partitions found\n", nr_parts);=0A+  =
             dev_info(&cafe->pdev->dev, "%d partitions found\n", nr_parts);=
=0A                add_mtd_partitions(mtd, parts, nr_parts);=0A        }=0A=
 #endif=0A+=0A+       /* We register the whole device first, separate from =
the partitions */=0A+       if (nr_parts <=3D 0)=0A+               add_mtd_=
device(mtd);=0A        goto out;=0A=0A  out_irq:=0A@@ -908,3 +916,4 @@ modu=
le_exit(cafe_nand_exit);=0A MODULE_LICENSE("GPL");=0A MODULE_AUTHOR("David =
Woodhouse <dwmw2@infradead.org>");=0A MODULE_DESCRIPTION("NAND flash driver=
 for OLPC CAF=C9 chip");=0A+=0A=0A=0A      
