MIME-Version: 1.0
Date: Fri, 25 Sep 2009 08:01:44 -0400
Message-ID: <771cded00909250501v2d8ba4e7r6abe00767be3217f@mail.gmail.com>
Subject: [PATCH 4/5] add pxa3xx onenand
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>, kyungmin.park@samsung.com,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=0016e644c18e3e1679047465b6ad
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016e644c18e3e1679047465b6ad
Content-Type: multipart/alternative; boundary=0016e644c18e3e1667047465b6ab

--0016e644c18e3e1667047465b6ab
Content-Type: text/plain; charset=ISO-8859-1

>From 73f686a00ba4efee62ad61e3b65b337939db038e Mon Sep 17 00:00:00 2001
From: Haojian Zhuang <haojian.zhuang@marvell.com>
Date: Fri, 25 Sep 2009 15:25:03 -0400
Subject: [PATCH] [MTD] [ONENAND] add pxa3xx onenand

In order to support Marvell PXA3xx bad block management, add pxa3xx onenand
device driver. Since there's some specific operation in it.

Either pxa3xx onenand or generic onenand device driver can be supported.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 drivers/mtd/onenand/Kconfig  |    7 +
 drivers/mtd/onenand/Makefile |    1 +
 drivers/mtd/onenand/pxa3xx.c |  248
++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/pxa3xx_bbm.c     |    4 +
 4 files changed, 260 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/onenand/pxa3xx.c

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 79fa79e..d2878ac 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -34,6 +34,13 @@ config MTD_ONENAND_OMAP2
       Support for a OneNAND flash device connected to an OMAP2/OMAP3 CPU
       via the GPMC memory controller.

+config MTD_ONENAND_PXA3xx
+    tristate "OneNAND on PXA3xx/MMP support"
+    depends on MTD_ONENAND && (ARCH_PXA || ARCH_MMP)
+    help
+      Support for a OneNAND flash device connected to an PXA3xx CPU
+      via the static memory controller.
+
 config MTD_ONENAND_OTP
     bool "OneNAND OTP Support"
     select HAVE_MTD_OTP
diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/onenand/Makefile
index 64b6cc6..66cc1fb 100644
--- a/drivers/mtd/onenand/Makefile
+++ b/drivers/mtd/onenand/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_MTD_ONENAND)        += onenand.o
 # Board specific.
 obj-$(CONFIG_MTD_ONENAND_GENERIC)    += generic.o
 obj-$(CONFIG_MTD_ONENAND_OMAP2)        += omap2.o
+obj-$(CONFIG_MTD_ONENAND_PXA3xx)    += pxa3xx.o

 # Simulator
 obj-$(CONFIG_MTD_ONENAND_SIM)        += onenand_sim.o
diff --git a/drivers/mtd/onenand/pxa3xx.c b/drivers/mtd/onenand/pxa3xx.c
new file mode 100644
index 0000000..d97ec15
--- /dev/null
+++ b/drivers/mtd/onenand/pxa3xx.c
@@ -0,0 +1,248 @@
+/*
+ *  linux/drivers/mtd/onenand/onenand_base.c
+ *
+ *  Copyright (C) 2007 Marvell Internal Ltd.
+ *
+ *  Haojian Zhuang <haojian.zhuang@marvell.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/onenand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/mach/flash.h>
+
+#ifdef CONFIG_PXA3xx_BBM
+#include <plat/pxa3xx_bbm.h>
+#endif
+
+#define DRIVER_NAME    "pxa3xx-onenand"
+
+
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probes[] = { "cmdlinepart", NULL,  };
+#endif
+
+struct pxa3xx_onenand_info {
+    struct onenand_chip    onenand;
+#ifdef CONFIG_PXA3xx_BBM
+    /*
+     * Restriction: onenand_chip should be the first one of
+     * pxa3xx_onenand_info.
+     * bbm should be the second one of pxa3xx_nand_info.
+     * Marvell PXA3xx BBM always access this field to get bbm.
+     */
+    struct pxa3xx_bbm    *bbm;
+#endif
+    struct mtd_info        mtd;
+    struct mtd_partition    *parts;
+};
+
+#ifdef CONFIG_PXA3xx_BBM
+static int pxa3xx_onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+    struct pxa3xx_onenand_info *info = mtd->priv;
+    struct pxa3xx_bbm *bbm = info->bbm;
+    struct onenand_chip *this = mtd->priv;
+    unsigned char buf[2] = {0, 0};
+    struct mtd_oob_ops ops = {
+        .mode = MTD_OOB_PLACE,
+        .ooblen = 2,
+        .oobbuf = buf,
+        .ooboffs = 0,
+    };
+    int block, ret;
+
+    /* Get block number */
+    block = onenand_block(this, ofs);
+
+        /* We write two bytes, so we dont have to mess with 16 bit access
*/
+        ofs += mtd->oobsize + (ONENAND_BADBLOCK_POS & ~0x01);
+    /* FIXME : What to do when marking SLC block in partition
+     *        with MLC erasesize? For now, it is not advisable to
+     *       create partitions containing both SLC and MLC regions.
+     */
+    ret = mtd->write_oob(mtd, ofs, &ops);
+    if (ret)
+        return ret;
+
+    return bbm->block_markbad(mtd, block);
+}
+
+int verify_onenand_bbm(struct mtd_info *mtd, struct pxa3xx_bbm **bbm)
+{
+    struct onenand_chip *chip = mtd->priv;
+    struct pxa3xx_bbm **nbbm = NULL;
+
+    /* check whether current flash is onenand */
+    nbbm = (struct pxa3xx_bbm **)(++chip);
+    if (((unsigned int)nbbm < PAGE_OFFSET)
+        || ((unsigned int)*nbbm < PAGE_OFFSET))
+        return PXA3xx_BBM_INVALID;
+
+    if ((*nbbm)->magic == PXA_BBM_MAGIC) {
+        pr_debug("%s:Found Onenand flash.\n", __func__);
+        *bbm = *nbbm;
+        return PXA3xx_BBM_ONENAND;
+    }
+    return PXA3xx_BBM_INVALID;
+}
+
+/**
+ * pxa3xx_onenand_command - Send command to OneNAND device
+ * @param mtd        MTD device structure
+ * @param cmd        the command to be sent
+ * @param addr        offset to read from or write to
+ * @param len        number of bytes to read or write
+ *
+ * Send command to OneNAND device. This function is used for middle/large
page
+ * devices (1KB/2KB Bytes per page)
+ */
+static int pxa3xx_onenand_command(struct mtd_info *mtd, int cmd,
+                  loff_t addr, size_t len)
+{
+    struct pxa3xx_onenand_info *info = mtd->priv;
+    struct pxa3xx_bbm *bbm = info->bbm;
+
+    /* Get reolocated address */
+    addr = bbm->search(mtd, addr);
+    return onenand_command(mtd, cmd, addr, len);
+}
+
+static void pxa3xx_onenand_init_chip(struct pxa3xx_onenand_info *info)
+{
+    struct onenand_chip *this = &info->onenand;
+    struct pxa3xx_bbm *bbm = NULL;
+
+    bbm = pxa3xx_query_bbm();
+    if (bbm) {
+        /* Marvell PXA3xx BBM is initialized successfully */
+        info->bbm = bbm;
+        this->scan_bbt = bbm->scan_bbt;
+        this->block_markbad = pxa3xx_onenand_block_markbad;
+        this->command = pxa3xx_onenand_command;
+    }
+}
+#else
+static void pxa3xx_onenand_init_chip(struct pxa3xx_onenand_info *info) {}
+#endif
+
+static int __devinit pxa3xx_onenand_probe(struct platform_device *pdev)
+{
+    struct pxa3xx_onenand_info *info = NULL;
+    struct flash_platform_data *pdata = pdev->dev.platform_data;
+    struct resource *res = pdev->resource;
+    unsigned long size = res->end - res->start + 1;
+    int err;
+
+    info = kzalloc(sizeof(struct pxa3xx_onenand_info), GFP_KERNEL);
+    if (!info)
+        return -ENOMEM;
+
+    if (!request_mem_region(res->start, size, pdev->dev.driver->name)) {
+        err = -EBUSY;
+        goto out_free_info;
+    }
+
+    info->onenand.base = ioremap(res->start, size);
+    if (!info->onenand.base) {
+        err = -ENOMEM;
+        goto out_release_mem_region;
+    }
+
+    info->onenand.mmcontrol = pdata->mmcontrol;
+    info->onenand.irq = platform_get_irq(pdev, 0);
+
+    pxa3xx_onenand_init_chip(info);
+
+    info->mtd.name = dev_name(&pdev->dev);
+    info->mtd.priv = &info->onenand;
+    info->mtd.owner = THIS_MODULE;
+
+    if (onenand_scan(&info->mtd, 1)) {
+        err = -ENXIO;
+        goto out_iounmap;
+    }
+
+#ifdef CONFIG_MTD_PARTITIONS
+    err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
+    if (err > 0)
+        add_mtd_partitions(&info->mtd, info->parts, err);
+    else if (err <= 0 && pdata->parts)
+        add_mtd_partitions(&info->mtd, pdata->parts, pdata->nr_parts);
+    else
+#endif
+        err = add_mtd_device(&info->mtd);
+
+    platform_set_drvdata(pdev, info);
+
+    return 0;
+
+out_iounmap:
+    iounmap(info->onenand.base);
+out_release_mem_region:
+    release_mem_region(res->start, size);
+out_free_info:
+    kfree(info);
+
+    return err;
+}
+
+static int __devexit pxa3xx_onenand_remove(struct platform_device *pdev)
+{
+    struct pxa3xx_onenand_info *info = platform_get_drvdata(pdev);
+    struct resource *res = pdev->resource;
+    unsigned long size = res->end - res->start + 1;
+
+    platform_set_drvdata(pdev, NULL);
+
+    if (info) {
+        if (info->parts)
+            del_mtd_partitions(&info->mtd);
+        else
+            del_mtd_device(&info->mtd);
+
+        onenand_release(&info->mtd);
+        release_mem_region(res->start, size);
+        iounmap(info->onenand.base);
+        kfree(info);
+    }
+
+    return 0;
+}
+
+static struct platform_driver pxa3xx_onenand_driver = {
+    .driver = {
+        .name        = DRIVER_NAME,
+        .owner        = THIS_MODULE,
+    },
+    .probe        = pxa3xx_onenand_probe,
+    .remove        = __devexit_p(pxa3xx_onenand_remove),
+};
+
+MODULE_ALIAS(DRIVER_NAME);
+
+static int __init pxa3xx_onenand_init(void)
+{
+    return platform_driver_register(&pxa3xx_onenand_driver);
+}
+
+static void __exit pxa3xx_onenand_exit(void)
+{
+    platform_driver_unregister(&pxa3xx_onenand_driver);
+}
+
+module_init(pxa3xx_onenand_init);
+module_exit(pxa3xx_onenand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Haojian Zhuang <haojian.zhuang@marvell.com>");
+MODULE_DESCRIPTION("Glue layer for OneNAND flash on Marvell PXA3xx");
diff --git a/drivers/mtd/pxa3xx_bbm.c b/drivers/mtd/pxa3xx_bbm.c
index bcc9a35..070e5d1 100644
--- a/drivers/mtd/pxa3xx_bbm.c
+++ b/drivers/mtd/pxa3xx_bbm.c
@@ -27,6 +27,10 @@ static int verify_bbm_magic(struct mtd_info *mtd, struct
pxa3xx_bbm **bbm)
     int ret;

     ret = verify_nand_bbm(mtd, bbm);
+    if (ret >= 0)
+        return ret;
+
+    ret = verify_onenand_bbm(mtd, bbm);
     return ret;
 }

-- 
1.5.6.5

--0016e644c18e3e1667047465b6ab
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>From 73f686a00ba4efee62ad61e3b65b337939db038e Mon Sep 17 00:00:00 2001<br>F=
rom: Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haoji=
an.zhuang@marvell.com</a>&gt;<br>Date: Fri, 25 Sep 2009 15:25:03 -0400<br>
Subject: [PATCH] [MTD] [ONENAND] add pxa3xx onenand<br><br>In order to supp=
ort Marvell PXA3xx bad block management, add pxa3xx onenand<br>device drive=
r. Since there&#39;s some specific operation in it.<br><br>Either pxa3xx on=
enand or generic onenand device driver can be supported.<br>
<br>Signed-off-by: Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marv=
ell.com">haojian.zhuang@marvell.com</a>&gt;<br>---<br>=A0drivers/mtd/onenan=
d/Kconfig=A0 |=A0=A0=A0 7 +<br>=A0drivers/mtd/onenand/Makefile |=A0=A0=A0 1=
 +<br>=A0drivers/mtd/onenand/pxa3xx.c |=A0 248 ++++++++++++++++++++++++++++=
++++++++++++++<br>
=A0drivers/mtd/pxa3xx_bbm.c=A0=A0=A0=A0 |=A0=A0=A0 4 +<br>=A04 files change=
d, 260 insertions(+), 0 deletions(-)<br>=A0create mode 100644 drivers/mtd/o=
nenand/pxa3xx.c<br><br>diff --git a/drivers/mtd/onenand/Kconfig b/drivers/m=
td/onenand/Kconfig<br>
index 79fa79e..d2878ac 100644<br>--- a/drivers/mtd/onenand/Kconfig<br>+++ b=
/drivers/mtd/onenand/Kconfig<br>@@ -34,6 +34,13 @@ config MTD_ONENAND_OMAP2=
<br>=A0=A0=A0=A0 =A0 Support for a OneNAND flash device connected to an OMA=
P2/OMAP3 CPU<br>
=A0=A0=A0=A0 =A0 via the GPMC memory controller.<br>=A0<br>+config MTD_ONEN=
AND_PXA3xx<br>+=A0=A0=A0 tristate &quot;OneNAND on PXA3xx/MMP support&quot;=
<br>+=A0=A0=A0 depends on MTD_ONENAND &amp;&amp; (ARCH_PXA || ARCH_MMP)<br>=
+=A0=A0=A0 help<br>+=A0=A0=A0 =A0 Support for a OneNAND flash device connec=
ted to an PXA3xx CPU<br>
+=A0=A0=A0 =A0 via the static memory controller.<br>+<br>=A0config MTD_ONEN=
AND_OTP<br>=A0=A0=A0=A0 bool &quot;OneNAND OTP Support&quot;<br>=A0=A0=A0=
=A0 select HAVE_MTD_OTP<br>diff --git a/drivers/mtd/onenand/Makefile b/driv=
ers/mtd/onenand/Makefile<br>
index 64b6cc6..66cc1fb 100644<br>--- a/drivers/mtd/onenand/Makefile<br>+++ =
b/drivers/mtd/onenand/Makefile<br>@@ -8,6 +8,7 @@ obj-$(CONFIG_MTD_ONENAND)=
=A0=A0=A0 =A0=A0=A0 +=3D onenand.o<br>=A0# Board specific.<br>=A0obj-$(CONF=
IG_MTD_ONENAND_GENERIC)=A0=A0=A0 +=3D generic.o<br>
=A0obj-$(CONFIG_MTD_ONENAND_OMAP2)=A0=A0=A0 =A0=A0=A0 +=3D omap2.o<br>+obj-=
$(CONFIG_MTD_ONENAND_PXA3xx)=A0=A0=A0 +=3D pxa3xx.o<br>=A0<br>=A0# Simulato=
r<br>=A0obj-$(CONFIG_MTD_ONENAND_SIM)=A0=A0=A0 =A0=A0=A0 +=3D onenand_sim.o=
<br>diff --git a/drivers/mtd/onenand/pxa3xx.c b/drivers/mtd/onenand/pxa3xx.=
c<br>
new file mode 100644<br>index 0000000..d97ec15<br>--- /dev/null<br>+++ b/dr=
ivers/mtd/onenand/pxa3xx.c<br>@@ -0,0 +1,248 @@<br>+/*<br>+ *=A0 linux/driv=
ers/mtd/onenand/onenand_base.c<br>+ *<br>+ *=A0 Copyright (C) 2007 Marvell =
Internal Ltd.<br>
+ *<br>+ *=A0 Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.c=
om">haojian.zhuang@marvell.com</a>&gt;<br>+ *<br>+ * This program is free s=
oftware; you can redistribute it and/or modify<br>+ * it under the terms of=
 the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>+ */<br>+<br>+#include &l=
t;linux/module.h&gt;<br>+#include &lt;linux/init.h&gt;<br>+#include &lt;lin=
ux/platform_device.h&gt;<br>+#include &lt;linux/mtd/mtd.h&gt;<br>+#include =
&lt;linux/mtd/onenand.h&gt;<br>
+#include &lt;linux/mtd/partitions.h&gt;<br>+<br>+#include &lt;asm/io.h&gt;=
<br>+#include &lt;asm/mach/flash.h&gt;<br>+<br>+#ifdef CONFIG_PXA3xx_BBM<br=
>+#include &lt;plat/pxa3xx_bbm.h&gt;<br>+#endif<br>+<br>+#define DRIVER_NAM=
E=A0=A0=A0 &quot;pxa3xx-onenand&quot;<br>
+<br>+<br>+#ifdef CONFIG_MTD_PARTITIONS<br>+static const char *part_probes[=
] =3D { &quot;cmdlinepart&quot;, NULL,=A0 };<br>+#endif<br>+<br>+struct pxa=
3xx_onenand_info {<br>+=A0=A0=A0 struct onenand_chip=A0=A0=A0 onenand;<br>+=
#ifdef CONFIG_PXA3xx_BBM<br>
+=A0=A0=A0 /*<br>+=A0=A0=A0 =A0* Restriction: onenand_chip should be the fi=
rst one of<br>+=A0=A0=A0 =A0* pxa3xx_onenand_info.<br>+=A0=A0=A0 =A0* bbm s=
hould be the second one of pxa3xx_nand_info.<br>+=A0=A0=A0 =A0* Marvell PXA=
3xx BBM always access this field to get bbm.<br>
+=A0=A0=A0 =A0*/<br>+=A0=A0=A0 struct pxa3xx_bbm=A0=A0=A0 *bbm;<br>+#endif<=
br>+=A0=A0=A0 struct mtd_info=A0=A0=A0 =A0=A0=A0 mtd;<br>+=A0=A0=A0 struct =
mtd_partition=A0=A0=A0 *parts;<br>+};<br>+<br>+#ifdef CONFIG_PXA3xx_BBM<br>=
+static int pxa3xx_onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)<=
br>
+{<br>+=A0=A0=A0 struct pxa3xx_onenand_info *info =3D mtd-&gt;priv;<br>+=A0=
=A0=A0 struct pxa3xx_bbm *bbm =3D info-&gt;bbm;<br>+=A0=A0=A0 struct onenan=
d_chip *this =3D mtd-&gt;priv;<br>+=A0=A0=A0 unsigned char buf[2] =3D {0, 0=
};<br>+=A0=A0=A0 struct mtd_oob_ops ops =3D {<br>
+=A0=A0=A0 =A0=A0=A0 .mode =3D MTD_OOB_PLACE,<br>+=A0=A0=A0 =A0=A0=A0 .oobl=
en =3D 2,<br>+=A0=A0=A0 =A0=A0=A0 .oobbuf =3D buf,<br>+=A0=A0=A0 =A0=A0=A0 =
.ooboffs =3D 0,<br>+=A0=A0=A0 };<br>+=A0=A0=A0 int block, ret;<br>+<br>+=A0=
=A0=A0 /* Get block number */<br>+=A0=A0=A0 block =3D onenand_block(this, o=
fs);<br>
+<br>+=A0=A0=A0=A0=A0=A0=A0 /* We write two bytes, so we dont have to mess =
with 16 bit access */<br>+=A0=A0=A0=A0=A0=A0=A0 ofs +=3D mtd-&gt;oobsize + =
(ONENAND_BADBLOCK_POS &amp; ~0x01);<br>+=A0=A0=A0 /* FIXME : What to do whe=
n marking SLC block in partition<br>
+=A0=A0=A0 =A0* =A0=A0=A0 =A0=A0 with MLC erasesize? For now, it is not adv=
isable to<br>+=A0=A0=A0 =A0*=A0=A0=A0 =A0=A0 create partitions containing b=
oth SLC and MLC regions.<br>+=A0=A0=A0 =A0*/<br>+=A0=A0=A0 ret =3D mtd-&gt;=
write_oob(mtd, ofs, &amp;ops);<br>+=A0=A0=A0 if (ret)<br>
+=A0=A0=A0 =A0=A0=A0 return ret;<br>+<br>+=A0=A0=A0 return bbm-&gt;block_ma=
rkbad(mtd, block);<br>+}<br>+<br>+int verify_onenand_bbm(struct mtd_info *m=
td, struct pxa3xx_bbm **bbm)<br>+{<br>+=A0=A0=A0 struct onenand_chip *chip =
=3D mtd-&gt;priv;<br>+=A0=A0=A0 struct pxa3xx_bbm **nbbm =3D NULL;<br>
+<br>+=A0=A0=A0 /* check whether current flash is onenand */<br>+=A0=A0=A0 =
nbbm =3D (struct pxa3xx_bbm **)(++chip);<br>+=A0=A0=A0 if (((unsigned int)n=
bbm &lt; PAGE_OFFSET)<br>+=A0=A0=A0 =A0=A0=A0 || ((unsigned int)*nbbm &lt; =
PAGE_OFFSET))<br>+=A0=A0=A0 =A0=A0=A0 return PXA3xx_BBM_INVALID;<br>
+<br>+=A0=A0=A0 if ((*nbbm)-&gt;magic =3D=3D PXA_BBM_MAGIC) {<br>+=A0=A0=A0=
 =A0=A0=A0 pr_debug(&quot;%s:Found Onenand flash.\n&quot;, __func__);<br>+=
=A0=A0=A0 =A0=A0=A0 *bbm =3D *nbbm;<br>+=A0=A0=A0 =A0=A0=A0 return PXA3xx_B=
BM_ONENAND;<br>+=A0=A0=A0 }<br>+=A0=A0=A0 return PXA3xx_BBM_INVALID;<br>
+}<br>+<br>+/**<br>+ * pxa3xx_onenand_command - Send command to OneNAND dev=
ice<br>+ * @param mtd=A0=A0=A0 =A0=A0=A0 MTD device structure<br>+ * @param=
 cmd=A0=A0=A0 =A0=A0=A0 the command to be sent<br>+ * @param addr=A0=A0=A0 =
=A0=A0=A0 offset to read from or write to<br>
+ * @param len=A0=A0=A0 =A0=A0=A0 number of bytes to read or write<br>+ *<b=
r>+ * Send command to OneNAND device. This function is used for middle/larg=
e page<br>+ * devices (1KB/2KB Bytes per page)<br>+ */<br>+static int pxa3x=
x_onenand_command(struct mtd_info *mtd, int cmd,<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 loff_t addr, size_t len)<br>+{=
<br>+=A0=A0=A0 struct pxa3xx_onenand_info *info =3D mtd-&gt;priv;<br>+=A0=
=A0=A0 struct pxa3xx_bbm *bbm =3D info-&gt;bbm;<br>+<br>+=A0=A0=A0 /* Get r=
eolocated address */<br>+=A0=A0=A0 addr =3D bbm-&gt;search(mtd, addr);<br>
+=A0=A0=A0 return onenand_command(mtd, cmd, addr, len);<br>+}<br>+<br>+stat=
ic void pxa3xx_onenand_init_chip(struct pxa3xx_onenand_info *info)<br>+{<br=
>+=A0=A0=A0 struct onenand_chip *this =3D &amp;info-&gt;onenand;<br>+=A0=A0=
=A0 struct pxa3xx_bbm *bbm =3D NULL;<br>
+<br>+=A0=A0=A0 bbm =3D pxa3xx_query_bbm();<br>+=A0=A0=A0 if (bbm) {<br>+=
=A0=A0=A0 =A0=A0=A0 /* Marvell PXA3xx BBM is initialized successfully */<br=
>+=A0=A0=A0 =A0=A0=A0 info-&gt;bbm =3D bbm;<br>+=A0=A0=A0 =A0=A0=A0 this-&g=
t;scan_bbt =3D bbm-&gt;scan_bbt;<br>+=A0=A0=A0 =A0=A0=A0 this-&gt;block_mar=
kbad =3D pxa3xx_onenand_block_markbad;<br>
+=A0=A0=A0 =A0=A0=A0 this-&gt;command =3D pxa3xx_onenand_command;<br>+=A0=
=A0=A0 }<br>+}<br>+#else<br>+static void pxa3xx_onenand_init_chip(struct px=
a3xx_onenand_info *info) {}<br>+#endif<br>+<br>+static int __devinit pxa3xx=
_onenand_probe(struct platform_device *pdev)<br>
+{<br>+=A0=A0=A0 struct pxa3xx_onenand_info *info =3D NULL;<br>+=A0=A0=A0 s=
truct flash_platform_data *pdata =3D pdev-&gt;dev.platform_data;<br>+=A0=A0=
=A0 struct resource *res =3D pdev-&gt;resource;<br>+=A0=A0=A0 unsigned long=
 size =3D res-&gt;end - res-&gt;start + 1;<br>
+=A0=A0=A0 int err;<br>+<br>+=A0=A0=A0 info =3D kzalloc(sizeof(struct pxa3x=
x_onenand_info), GFP_KERNEL);<br>+=A0=A0=A0 if (!info)<br>+=A0=A0=A0 =A0=A0=
=A0 return -ENOMEM;<br>+<br>+=A0=A0=A0 if (!request_mem_region(res-&gt;star=
t, size, pdev-&gt;dev.driver-&gt;name)) {<br>
+=A0=A0=A0 =A0=A0=A0 err =3D -EBUSY;<br>+=A0=A0=A0 =A0=A0=A0 goto out_free_=
info;<br>+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 info-&gt;onenand.base =3D ioremap(=
res-&gt;start, size);<br>+=A0=A0=A0 if (!info-&gt;onenand.base) {<br>+=A0=
=A0=A0 =A0=A0=A0 err =3D -ENOMEM;<br>+=A0=A0=A0 =A0=A0=A0 goto out_release_=
mem_region;<br>
+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 info-&gt;onenand.mmcontrol =3D pdata-&gt;mm=
control;<br>+=A0=A0=A0 info-&gt;onenand.irq =3D platform_get_irq(pdev, 0);<=
br>+<br>+=A0=A0=A0 pxa3xx_onenand_init_chip(info);<br>+<br>+=A0=A0=A0 info-=
&gt;<a href=3D"http://mtd.name">mtd.name</a> =3D dev_name(&amp;pdev-&gt;dev=
);<br>
+=A0=A0=A0 info-&gt;mtd.priv =3D &amp;info-&gt;onenand;<br>+=A0=A0=A0 info-=
&gt;mtd.owner =3D THIS_MODULE;<br>+<br>+=A0=A0=A0 if (onenand_scan(&amp;inf=
o-&gt;mtd, 1)) {<br>+=A0=A0=A0 =A0=A0=A0 err =3D -ENXIO;<br>+=A0=A0=A0 =A0=
=A0=A0 goto out_iounmap;<br>+=A0=A0=A0 }<br>+<br>+#ifdef CONFIG_MTD_PARTITI=
ONS<br>
+=A0=A0=A0 err =3D parse_mtd_partitions(&amp;info-&gt;mtd, part_probes, &am=
p;info-&gt;parts, 0);<br>+=A0=A0=A0 if (err &gt; 0)<br>+=A0=A0=A0 =A0=A0=A0=
 add_mtd_partitions(&amp;info-&gt;mtd, info-&gt;parts, err);<br>+=A0=A0=A0 =
else if (err &lt;=3D 0 &amp;&amp; pdata-&gt;parts)<br>
+=A0=A0=A0 =A0=A0=A0 add_mtd_partitions(&amp;info-&gt;mtd, pdata-&gt;parts,=
 pdata-&gt;nr_parts);<br>+=A0=A0=A0 else<br>+#endif<br>+=A0=A0=A0 =A0=A0=A0=
 err =3D add_mtd_device(&amp;info-&gt;mtd);<br>+<br>+=A0=A0=A0 platform_set=
_drvdata(pdev, info);<br>+<br>+=A0=A0=A0 return 0;<br>
+<br>+out_iounmap:<br>+=A0=A0=A0 iounmap(info-&gt;onenand.base);<br>+out_re=
lease_mem_region:<br>+=A0=A0=A0 release_mem_region(res-&gt;start, size);<br=
>+out_free_info:<br>+=A0=A0=A0 kfree(info);<br>+<br>+=A0=A0=A0 return err;<=
br>+}<br>+<br>+static int __devexit pxa3xx_onenand_remove(struct platform_d=
evice *pdev)<br>
+{<br>+=A0=A0=A0 struct pxa3xx_onenand_info *info =3D platform_get_drvdata(=
pdev);<br>+=A0=A0=A0 struct resource *res =3D pdev-&gt;resource;<br>+=A0=A0=
=A0 unsigned long size =3D res-&gt;end - res-&gt;start + 1;<br>+<br>+=A0=A0=
=A0 platform_set_drvdata(pdev, NULL);<br>
+<br>+=A0=A0=A0 if (info) {<br>+=A0=A0=A0 =A0=A0=A0 if (info-&gt;parts)<br>=
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 del_mtd_partitions(&amp;info-&gt;mtd);<br>+=
=A0=A0=A0 =A0=A0=A0 else<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 del_mtd_device(&=
amp;info-&gt;mtd);<br>+<br>+=A0=A0=A0 =A0=A0=A0 onenand_release(&amp;info-&=
gt;mtd);<br>
+=A0=A0=A0 =A0=A0=A0 release_mem_region(res-&gt;start, size);<br>+=A0=A0=A0=
 =A0=A0=A0 iounmap(info-&gt;onenand.base);<br>+=A0=A0=A0 =A0=A0=A0 kfree(in=
fo);<br>+=A0=A0=A0 }<br>+<br>+=A0=A0=A0 return 0;<br>+}<br>+<br>+static str=
uct platform_driver pxa3xx_onenand_driver =3D {<br>
+=A0=A0=A0 .driver =3D {<br>+=A0=A0=A0 =A0=A0=A0 .name=A0=A0=A0 =A0=A0=A0 =
=3D DRIVER_NAME,<br>+=A0=A0=A0 =A0=A0=A0 .owner=A0=A0=A0 =A0=A0=A0 =3D THIS=
_MODULE,<br>+=A0=A0=A0 },<br>+=A0=A0=A0 .probe=A0=A0=A0 =A0=A0=A0 =3D pxa3x=
x_onenand_probe,<br>+=A0=A0=A0 .remove=A0=A0=A0 =A0=A0=A0 =3D __devexit_p(p=
xa3xx_onenand_remove),<br>+};<br>
+<br>+MODULE_ALIAS(DRIVER_NAME);<br>+<br>+static int __init pxa3xx_onenand_=
init(void)<br>+{<br>+=A0=A0=A0 return platform_driver_register(&amp;pxa3xx_=
onenand_driver);<br>+}<br>+<br>+static void __exit pxa3xx_onenand_exit(void=
)<br>
+{<br>+=A0=A0=A0 platform_driver_unregister(&amp;pxa3xx_onenand_driver);<br=
>+}<br>+<br>+module_init(pxa3xx_onenand_init);<br>+module_exit(pxa3xx_onena=
nd_exit);<br>+<br>+MODULE_LICENSE(&quot;GPL&quot;);<br>+MODULE_AUTHOR(&quot=
;Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haojian.z=
huang@marvell.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;Glue layer for OneNAND flash on Marvell PXA3xx&qu=
ot;);<br>diff --git a/drivers/mtd/pxa3xx_bbm.c b/drivers/mtd/pxa3xx_bbm.c<b=
r>index bcc9a35..070e5d1 100644<br>--- a/drivers/mtd/pxa3xx_bbm.c<br>+++ b/=
drivers/mtd/pxa3xx_bbm.c<br>
@@ -27,6 +27,10 @@ static int verify_bbm_magic(struct mtd_info *mtd, struct=
 pxa3xx_bbm **bbm)<br>=A0=A0=A0=A0 int ret;<br>=A0<br>=A0=A0=A0=A0 ret =3D =
verify_nand_bbm(mtd, bbm);<br>+=A0=A0=A0 if (ret &gt;=3D 0)<br>+=A0=A0=A0 =
=A0=A0=A0 return ret;<br>+<br>+=A0=A0=A0 ret =3D verify_onenand_bbm(mtd, bb=
m);<br>
=A0=A0=A0=A0 return ret;<br>=A0}<br>=A0<br>-- <br>1.5.6.5<br><br>

--0016e644c18e3e1667047465b6ab--

--0016e644c18e3e1679047465b6ad
Content-Type: text/x-patch; charset=US-ASCII;
	name="0004--MTD-ONENAND-add-pxa3xx-onenand.patch"
Content-Disposition: attachment;
	filename="0004--MTD-ONENAND-add-pxa3xx-onenand.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g01cq8fx0

RnJvbSA3M2Y2ODZhMDBiYTRlZmVlNjJhZDYxZTNiNjViMzM3OTM5ZGIwMzhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW9qaWFuIFpodWFuZyA8aGFvamlhbi56aHVhbmdAbWFydmVs
bC5jb20+CkRhdGU6IEZyaSwgMjUgU2VwIDIwMDkgMTU6MjU6MDMgLTA0MDAKU3ViamVjdDogW1BB
VENIXSBbTVREXSBbT05FTkFORF0gYWRkIHB4YTN4eCBvbmVuYW5kCgpJbiBvcmRlciB0byBzdXBw
b3J0IE1hcnZlbGwgUFhBM3h4IGJhZCBibG9jayBtYW5hZ2VtZW50LCBhZGQgcHhhM3h4IG9uZW5h
bmQKZGV2aWNlIGRyaXZlci4gU2luY2UgdGhlcmUncyBzb21lIHNwZWNpZmljIG9wZXJhdGlvbiBp
biBpdC4KCkVpdGhlciBweGEzeHggb25lbmFuZCBvciBnZW5lcmljIG9uZW5hbmQgZGV2aWNlIGRy
aXZlciBjYW4gYmUgc3VwcG9ydGVkLgoKU2lnbmVkLW9mZi1ieTogSGFvamlhbiBaaHVhbmcgPGhh
b2ppYW4uemh1YW5nQG1hcnZlbGwuY29tPgotLS0KIGRyaXZlcnMvbXRkL29uZW5hbmQvS2NvbmZp
ZyAgfCAgICA3ICsKIGRyaXZlcnMvbXRkL29uZW5hbmQvTWFrZWZpbGUgfCAgICAxICsKIGRyaXZl
cnMvbXRkL29uZW5hbmQvcHhhM3h4LmMgfCAgMjQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogZHJpdmVycy9tdGQvcHhhM3h4X2JibS5jICAgICB8ICAgIDQgKwog
NCBmaWxlcyBjaGFuZ2VkLCAyNjAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9vbmVuYW5kL3B4YTN4eC5jCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvb25lbmFuZC9LY29uZmlnIGIvZHJpdmVycy9tdGQvb25lbmFuZC9LY29uZmln
CmluZGV4IDc5ZmE3OWUuLmQyODc4YWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL29uZW5hbmQv
S2NvbmZpZworKysgYi9kcml2ZXJzL210ZC9vbmVuYW5kL0tjb25maWcKQEAgLTM0LDYgKzM0LDEz
IEBAIGNvbmZpZyBNVERfT05FTkFORF9PTUFQMgogCSAgU3VwcG9ydCBmb3IgYSBPbmVOQU5EIGZs
YXNoIGRldmljZSBjb25uZWN0ZWQgdG8gYW4gT01BUDIvT01BUDMgQ1BVCiAJICB2aWEgdGhlIEdQ
TUMgbWVtb3J5IGNvbnRyb2xsZXIuCiAKK2NvbmZpZyBNVERfT05FTkFORF9QWEEzeHgKKwl0cmlz
dGF0ZSAiT25lTkFORCBvbiBQWEEzeHgvTU1QIHN1cHBvcnQiCisJZGVwZW5kcyBvbiBNVERfT05F
TkFORCAmJiAoQVJDSF9QWEEgfHwgQVJDSF9NTVApCisJaGVscAorCSAgU3VwcG9ydCBmb3IgYSBP
bmVOQU5EIGZsYXNoIGRldmljZSBjb25uZWN0ZWQgdG8gYW4gUFhBM3h4IENQVQorCSAgdmlhIHRo
ZSBzdGF0aWMgbWVtb3J5IGNvbnRyb2xsZXIuCisKIGNvbmZpZyBNVERfT05FTkFORF9PVFAKIAli
b29sICJPbmVOQU5EIE9UUCBTdXBwb3J0IgogCXNlbGVjdCBIQVZFX01URF9PVFAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL29uZW5hbmQvTWFrZWZpbGUgYi9kcml2ZXJzL210ZC9vbmVuYW5kL01h
a2VmaWxlCmluZGV4IDY0YjZjYzYuLjY2Y2MxZmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL29u
ZW5hbmQvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9tdGQvb25lbmFuZC9NYWtlZmlsZQpAQCAtOCw2
ICs4LDcgQEAgb2JqLSQoQ09ORklHX01URF9PTkVOQU5EKQkJKz0gb25lbmFuZC5vCiAjIEJvYXJk
IHNwZWNpZmljLgogb2JqLSQoQ09ORklHX01URF9PTkVOQU5EX0dFTkVSSUMpCSs9IGdlbmVyaWMu
bwogb2JqLSQoQ09ORklHX01URF9PTkVOQU5EX09NQVAyKQkJKz0gb21hcDIubworb2JqLSQoQ09O
RklHX01URF9PTkVOQU5EX1BYQTN4eCkJKz0gcHhhM3h4Lm8KIAogIyBTaW11bGF0b3IKIG9iai0k
KENPTkZJR19NVERfT05FTkFORF9TSU0pCQkrPSBvbmVuYW5kX3NpbS5vCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9vbmVuYW5kL3B4YTN4eC5jIGIvZHJpdmVycy9tdGQvb25lbmFuZC9weGEzeHgu
YwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5kOTdlYzE1Ci0tLSAvZGV2L251
bGwKKysrIGIvZHJpdmVycy9tdGQvb25lbmFuZC9weGEzeHguYwpAQCAtMCwwICsxLDI0OCBAQAor
LyoKKyAqICBsaW51eC9kcml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCisgKgorICog
IENvcHlyaWdodCAoQykgMjAwNyBNYXJ2ZWxsIEludGVybmFsIEx0ZC4KKyAqCisgKiAgSGFvamlh
biBaaHVhbmcgPGhhb2ppYW4uemh1YW5nQG1hcnZlbGwuY29tPgorICoKKyAqIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5
CisgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IHZlcnNpb24gMiBhcworICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24uCisgKi8KKworI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L2lu
aXQuaD4KKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51
eC9tdGQvbXRkLmg+CisjaW5jbHVkZSA8bGludXgvbXRkL29uZW5hbmQuaD4KKyNpbmNsdWRlIDxs
aW51eC9tdGQvcGFydGl0aW9ucy5oPgorCisjaW5jbHVkZSA8YXNtL2lvLmg+CisjaW5jbHVkZSA8
YXNtL21hY2gvZmxhc2guaD4KKworI2lmZGVmIENPTkZJR19QWEEzeHhfQkJNCisjaW5jbHVkZSA8
cGxhdC9weGEzeHhfYmJtLmg+CisjZW5kaWYKKworI2RlZmluZSBEUklWRVJfTkFNRQkicHhhM3h4
LW9uZW5hbmQiCisKKworI2lmZGVmIENPTkZJR19NVERfUEFSVElUSU9OUworc3RhdGljIGNvbnN0
IGNoYXIgKnBhcnRfcHJvYmVzW10gPSB7ICJjbWRsaW5lcGFydCIsIE5VTEwsICB9OworI2VuZGlm
CisKK3N0cnVjdCBweGEzeHhfb25lbmFuZF9pbmZvIHsKKwlzdHJ1Y3Qgb25lbmFuZF9jaGlwCW9u
ZW5hbmQ7CisjaWZkZWYgQ09ORklHX1BYQTN4eF9CQk0KKwkvKgorCSAqIFJlc3RyaWN0aW9uOiBv
bmVuYW5kX2NoaXAgc2hvdWxkIGJlIHRoZSBmaXJzdCBvbmUgb2YKKwkgKiBweGEzeHhfb25lbmFu
ZF9pbmZvLgorCSAqIGJibSBzaG91bGQgYmUgdGhlIHNlY29uZCBvbmUgb2YgcHhhM3h4X25hbmRf
aW5mby4KKwkgKiBNYXJ2ZWxsIFBYQTN4eCBCQk0gYWx3YXlzIGFjY2VzcyB0aGlzIGZpZWxkIHRv
IGdldCBiYm0uCisJICovCisJc3RydWN0IHB4YTN4eF9iYm0JKmJibTsKKyNlbmRpZgorCXN0cnVj
dCBtdGRfaW5mbwkJbXRkOworCXN0cnVjdCBtdGRfcGFydGl0aW9uCSpwYXJ0czsKK307CisKKyNp
ZmRlZiBDT05GSUdfUFhBM3h4X0JCTQorc3RhdGljIGludCBweGEzeHhfb25lbmFuZF9ibG9ja19t
YXJrYmFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZzKQoreworCXN0cnVjdCBweGEz
eHhfb25lbmFuZF9pbmZvICppbmZvID0gbXRkLT5wcml2OworCXN0cnVjdCBweGEzeHhfYmJtICpi
Ym0gPSBpbmZvLT5iYm07CisJc3RydWN0IG9uZW5hbmRfY2hpcCAqdGhpcyA9IG10ZC0+cHJpdjsK
Kwl1bnNpZ25lZCBjaGFyIGJ1ZlsyXSA9IHswLCAwfTsKKwlzdHJ1Y3QgbXRkX29vYl9vcHMgb3Bz
ID0geworCQkubW9kZSA9IE1URF9PT0JfUExBQ0UsCisJCS5vb2JsZW4gPSAyLAorCQkub29iYnVm
ID0gYnVmLAorCQkub29ib2ZmcyA9IDAsCisJfTsKKwlpbnQgYmxvY2ssIHJldDsKKworCS8qIEdl
dCBibG9jayBudW1iZXIgKi8KKwlibG9jayA9IG9uZW5hbmRfYmxvY2sodGhpcywgb2ZzKTsKKwor
ICAgICAgICAvKiBXZSB3cml0ZSB0d28gYnl0ZXMsIHNvIHdlIGRvbnQgaGF2ZSB0byBtZXNzIHdp
dGggMTYgYml0IGFjY2VzcyAqLworICAgICAgICBvZnMgKz0gbXRkLT5vb2JzaXplICsgKE9ORU5B
TkRfQkFEQkxPQ0tfUE9TICYgfjB4MDEpOworCS8qIEZJWE1FIDogV2hhdCB0byBkbyB3aGVuIG1h
cmtpbmcgU0xDIGJsb2NrIGluIHBhcnRpdGlvbgorCSAqIAkgICB3aXRoIE1MQyBlcmFzZXNpemU/
IEZvciBub3csIGl0IGlzIG5vdCBhZHZpc2FibGUgdG8KKwkgKgkgICBjcmVhdGUgcGFydGl0aW9u
cyBjb250YWluaW5nIGJvdGggU0xDIGFuZCBNTEMgcmVnaW9ucy4KKwkgKi8KKwlyZXQgPSBtdGQt
PndyaXRlX29vYihtdGQsIG9mcywgJm9wcyk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwor
CXJldHVybiBiYm0tPmJsb2NrX21hcmtiYWQobXRkLCBibG9jayk7Cit9CisKK2ludCB2ZXJpZnlf
b25lbmFuZF9iYm0oc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBweGEzeHhfYmJtICoqYmJt
KQoreworCXN0cnVjdCBvbmVuYW5kX2NoaXAgKmNoaXAgPSBtdGQtPnByaXY7CisJc3RydWN0IHB4
YTN4eF9iYm0gKipuYmJtID0gTlVMTDsKKworCS8qIGNoZWNrIHdoZXRoZXIgY3VycmVudCBmbGFz
aCBpcyBvbmVuYW5kICovCisJbmJibSA9IChzdHJ1Y3QgcHhhM3h4X2JibSAqKikoKytjaGlwKTsK
KwlpZiAoKCh1bnNpZ25lZCBpbnQpbmJibSA8IFBBR0VfT0ZGU0VUKQorCQl8fCAoKHVuc2lnbmVk
IGludCkqbmJibSA8IFBBR0VfT0ZGU0VUKSkKKwkJcmV0dXJuIFBYQTN4eF9CQk1fSU5WQUxJRDsK
KworCWlmICgoKm5iYm0pLT5tYWdpYyA9PSBQWEFfQkJNX01BR0lDKSB7CisJCXByX2RlYnVnKCIl
czpGb3VuZCBPbmVuYW5kIGZsYXNoLlxuIiwgX19mdW5jX18pOworCQkqYmJtID0gKm5iYm07CisJ
CXJldHVybiBQWEEzeHhfQkJNX09ORU5BTkQ7CisJfQorCXJldHVybiBQWEEzeHhfQkJNX0lOVkFM
SUQ7Cit9CisKKy8qKgorICogcHhhM3h4X29uZW5hbmRfY29tbWFuZCAtIFNlbmQgY29tbWFuZCB0
byBPbmVOQU5EIGRldmljZQorICogQHBhcmFtIG10ZAkJTVREIGRldmljZSBzdHJ1Y3R1cmUKKyAq
IEBwYXJhbSBjbWQJCXRoZSBjb21tYW5kIHRvIGJlIHNlbnQKKyAqIEBwYXJhbSBhZGRyCQlvZmZz
ZXQgdG8gcmVhZCBmcm9tIG9yIHdyaXRlIHRvCisgKiBAcGFyYW0gbGVuCQludW1iZXIgb2YgYnl0
ZXMgdG8gcmVhZCBvciB3cml0ZQorICoKKyAqIFNlbmQgY29tbWFuZCB0byBPbmVOQU5EIGRldmlj
ZS4gVGhpcyBmdW5jdGlvbiBpcyB1c2VkIGZvciBtaWRkbGUvbGFyZ2UgcGFnZQorICogZGV2aWNl
cyAoMUtCLzJLQiBCeXRlcyBwZXIgcGFnZSkKKyAqLworc3RhdGljIGludCBweGEzeHhfb25lbmFu
ZF9jb21tYW5kKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgY21kLAorCQkJCSAgbG9mZl90IGFk
ZHIsIHNpemVfdCBsZW4pCit7CisJc3RydWN0IHB4YTN4eF9vbmVuYW5kX2luZm8gKmluZm8gPSBt
dGQtPnByaXY7CisJc3RydWN0IHB4YTN4eF9iYm0gKmJibSA9IGluZm8tPmJibTsKKworCS8qIEdl
dCByZW9sb2NhdGVkIGFkZHJlc3MgKi8KKwlhZGRyID0gYmJtLT5zZWFyY2gobXRkLCBhZGRyKTsK
KwlyZXR1cm4gb25lbmFuZF9jb21tYW5kKG10ZCwgY21kLCBhZGRyLCBsZW4pOworfQorCitzdGF0
aWMgdm9pZCBweGEzeHhfb25lbmFuZF9pbml0X2NoaXAoc3RydWN0IHB4YTN4eF9vbmVuYW5kX2lu
Zm8gKmluZm8pCit7CisJc3RydWN0IG9uZW5hbmRfY2hpcCAqdGhpcyA9ICZpbmZvLT5vbmVuYW5k
OworCXN0cnVjdCBweGEzeHhfYmJtICpiYm0gPSBOVUxMOworCisJYmJtID0gcHhhM3h4X3F1ZXJ5
X2JibSgpOworCWlmIChiYm0pIHsKKwkJLyogTWFydmVsbCBQWEEzeHggQkJNIGlzIGluaXRpYWxp
emVkIHN1Y2Nlc3NmdWxseSAqLworCQlpbmZvLT5iYm0gPSBiYm07CisJCXRoaXMtPnNjYW5fYmJ0
ID0gYmJtLT5zY2FuX2JidDsKKwkJdGhpcy0+YmxvY2tfbWFya2JhZCA9IHB4YTN4eF9vbmVuYW5k
X2Jsb2NrX21hcmtiYWQ7CisJCXRoaXMtPmNvbW1hbmQgPSBweGEzeHhfb25lbmFuZF9jb21tYW5k
OworCX0KK30KKyNlbHNlCitzdGF0aWMgdm9pZCBweGEzeHhfb25lbmFuZF9pbml0X2NoaXAoc3Ry
dWN0IHB4YTN4eF9vbmVuYW5kX2luZm8gKmluZm8pIHt9CisjZW5kaWYKKworc3RhdGljIGludCBf
X2RldmluaXQgcHhhM3h4X29uZW5hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKK3sKKwlzdHJ1Y3QgcHhhM3h4X29uZW5hbmRfaW5mbyAqaW5mbyA9IE5VTEw7CisJc3RydWN0
IGZsYXNoX3BsYXRmb3JtX2RhdGEgKnBkYXRhID0gcGRldi0+ZGV2LnBsYXRmb3JtX2RhdGE7CisJ
c3RydWN0IHJlc291cmNlICpyZXMgPSBwZGV2LT5yZXNvdXJjZTsKKwl1bnNpZ25lZCBsb25nIHNp
emUgPSByZXMtPmVuZCAtIHJlcy0+c3RhcnQgKyAxOworCWludCBlcnI7CisKKwlpbmZvID0ga3ph
bGxvYyhzaXplb2Yoc3RydWN0IHB4YTN4eF9vbmVuYW5kX2luZm8pLCBHRlBfS0VSTkVMKTsKKwlp
ZiAoIWluZm8pCisJCXJldHVybiAtRU5PTUVNOworCisJaWYgKCFyZXF1ZXN0X21lbV9yZWdpb24o
cmVzLT5zdGFydCwgc2l6ZSwgcGRldi0+ZGV2LmRyaXZlci0+bmFtZSkpIHsKKwkJZXJyID0gLUVC
VVNZOworCQlnb3RvIG91dF9mcmVlX2luZm87CisJfQorCisJaW5mby0+b25lbmFuZC5iYXNlID0g
aW9yZW1hcChyZXMtPnN0YXJ0LCBzaXplKTsKKwlpZiAoIWluZm8tPm9uZW5hbmQuYmFzZSkgewor
CQllcnIgPSAtRU5PTUVNOworCQlnb3RvIG91dF9yZWxlYXNlX21lbV9yZWdpb247CisJfQorCisJ
aW5mby0+b25lbmFuZC5tbWNvbnRyb2wgPSBwZGF0YS0+bW1jb250cm9sOworCWluZm8tPm9uZW5h
bmQuaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKKworCXB4YTN4eF9vbmVuYW5kX2lu
aXRfY2hpcChpbmZvKTsKKworCWluZm8tPm10ZC5uYW1lID0gZGV2X25hbWUoJnBkZXYtPmRldik7
CisJaW5mby0+bXRkLnByaXYgPSAmaW5mby0+b25lbmFuZDsKKwlpbmZvLT5tdGQub3duZXIgPSBU
SElTX01PRFVMRTsKKworCWlmIChvbmVuYW5kX3NjYW4oJmluZm8tPm10ZCwgMSkpIHsKKwkJZXJy
ID0gLUVOWElPOworCQlnb3RvIG91dF9pb3VubWFwOworCX0KKworI2lmZGVmIENPTkZJR19NVERf
UEFSVElUSU9OUworCWVyciA9IHBhcnNlX210ZF9wYXJ0aXRpb25zKCZpbmZvLT5tdGQsIHBhcnRf
cHJvYmVzLCAmaW5mby0+cGFydHMsIDApOworCWlmIChlcnIgPiAwKQorCQlhZGRfbXRkX3BhcnRp
dGlvbnMoJmluZm8tPm10ZCwgaW5mby0+cGFydHMsIGVycik7CisJZWxzZSBpZiAoZXJyIDw9IDAg
JiYgcGRhdGEtPnBhcnRzKQorCQlhZGRfbXRkX3BhcnRpdGlvbnMoJmluZm8tPm10ZCwgcGRhdGEt
PnBhcnRzLCBwZGF0YS0+bnJfcGFydHMpOworCWVsc2UKKyNlbmRpZgorCQllcnIgPSBhZGRfbXRk
X2RldmljZSgmaW5mby0+bXRkKTsKKworCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGluZm8p
OworCisJcmV0dXJuIDA7CisKK291dF9pb3VubWFwOgorCWlvdW5tYXAoaW5mby0+b25lbmFuZC5i
YXNlKTsKK291dF9yZWxlYXNlX21lbV9yZWdpb246CisJcmVsZWFzZV9tZW1fcmVnaW9uKHJlcy0+
c3RhcnQsIHNpemUpOworb3V0X2ZyZWVfaW5mbzoKKwlrZnJlZShpbmZvKTsKKworCXJldHVybiBl
cnI7Cit9CisKK3N0YXRpYyBpbnQgX19kZXZleGl0IHB4YTN4eF9vbmVuYW5kX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQoreworCXN0cnVjdCBweGEzeHhfb25lbmFuZF9pbmZv
ICppbmZvID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IHJlc291cmNlICpy
ZXMgPSBwZGV2LT5yZXNvdXJjZTsKKwl1bnNpZ25lZCBsb25nIHNpemUgPSByZXMtPmVuZCAtIHJl
cy0+c3RhcnQgKyAxOworCisJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgTlVMTCk7CisKKwlp
ZiAoaW5mbykgeworCQlpZiAoaW5mby0+cGFydHMpCisJCQlkZWxfbXRkX3BhcnRpdGlvbnMoJmlu
Zm8tPm10ZCk7CisJCWVsc2UKKwkJCWRlbF9tdGRfZGV2aWNlKCZpbmZvLT5tdGQpOworCisJCW9u
ZW5hbmRfcmVsZWFzZSgmaW5mby0+bXRkKTsKKwkJcmVsZWFzZV9tZW1fcmVnaW9uKHJlcy0+c3Rh
cnQsIHNpemUpOworCQlpb3VubWFwKGluZm8tPm9uZW5hbmQuYmFzZSk7CisJCWtmcmVlKGluZm8p
OworCX0KKworCXJldHVybiAwOworfQorCitzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBw
eGEzeHhfb25lbmFuZF9kcml2ZXIgPSB7CisJLmRyaXZlciA9IHsKKwkJLm5hbWUJCT0gRFJJVkVS
X05BTUUsCisJCS5vd25lcgkJPSBUSElTX01PRFVMRSwKKwl9LAorCS5wcm9iZQkJPSBweGEzeHhf
b25lbmFuZF9wcm9iZSwKKwkucmVtb3ZlCQk9IF9fZGV2ZXhpdF9wKHB4YTN4eF9vbmVuYW5kX3Jl
bW92ZSksCit9OworCitNT0RVTEVfQUxJQVMoRFJJVkVSX05BTUUpOworCitzdGF0aWMgaW50IF9f
aW5pdCBweGEzeHhfb25lbmFuZF9pbml0KHZvaWQpCit7CisJcmV0dXJuIHBsYXRmb3JtX2RyaXZl
cl9yZWdpc3RlcigmcHhhM3h4X29uZW5hbmRfZHJpdmVyKTsKK30KKworc3RhdGljIHZvaWQgX19l
eGl0IHB4YTN4eF9vbmVuYW5kX2V4aXQodm9pZCkKK3sKKwlwbGF0Zm9ybV9kcml2ZXJfdW5yZWdp
c3RlcigmcHhhM3h4X29uZW5hbmRfZHJpdmVyKTsKK30KKworbW9kdWxlX2luaXQocHhhM3h4X29u
ZW5hbmRfaW5pdCk7Cittb2R1bGVfZXhpdChweGEzeHhfb25lbmFuZF9leGl0KTsKKworTU9EVUxF
X0xJQ0VOU0UoIkdQTCIpOworTU9EVUxFX0FVVEhPUigiSGFvamlhbiBaaHVhbmcgPGhhb2ppYW4u
emh1YW5nQG1hcnZlbGwuY29tPiIpOworTU9EVUxFX0RFU0NSSVBUSU9OKCJHbHVlIGxheWVyIGZv
ciBPbmVOQU5EIGZsYXNoIG9uIE1hcnZlbGwgUFhBM3h4Iik7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9weGEzeHhfYmJtLmMgYi9kcml2ZXJzL210ZC9weGEzeHhfYmJtLmMKaW5kZXggYmNjOWEz
NS4uMDcwZTVkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvcHhhM3h4X2JibS5jCisrKyBiL2Ry
aXZlcnMvbXRkL3B4YTN4eF9iYm0uYwpAQCAtMjcsNiArMjcsMTAgQEAgc3RhdGljIGludCB2ZXJp
ZnlfYmJtX21hZ2ljKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgcHhhM3h4X2JibSAqKmJi
bSkKIAlpbnQgcmV0OwogCiAJcmV0ID0gdmVyaWZ5X25hbmRfYmJtKG10ZCwgYmJtKTsKKwlpZiAo
cmV0ID49IDApCisJCXJldHVybiByZXQ7CisKKwlyZXQgPSB2ZXJpZnlfb25lbmFuZF9iYm0obXRk
LCBiYm0pOwogCXJldHVybiByZXQ7CiB9CiAKLS0gCjEuNS42LjUKCg==
--0016e644c18e3e1679047465b6ad--
