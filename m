Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BBAC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HxE1ag9+reIfW1TkMooPCEqRQPk5UOz9N7SJU8W8NTE=; b=CNwm5uW+3XJDZb
	JINYajFjG6jGiAREDmP6MKToc/+QgU37gkA3uXelAHwgQk1tE0o7fOm4AqpmdrwJR12eCF+gpBogg
	ylhie2q7g3ybHMNJpICdhRfwlo471FqHHinH+xCaBANKg9+mkSfl9WQhhmc4LX445WHVY18naJMr9
	ozsmT7Jq/Bs57CMRx7xEyUVidHb1+ZI8SjVj09n7zQiL92QREdE4zyLXHyhn3gCKafD69mzjuPP6e
	sdiVSiXga/XZ2goG06wd6xFW98LAl9fRN8He1XXCRyniMRGmzcy1CPO2VC5vw4wceIlNfzdGGssGV
	jtJZ/y31esKfVkY6YkHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNbsO-005RTK-67; Fri, 25 Feb 2022 14:47:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNbsJ-005RRX-PV
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 14:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645800435; x=1677336435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dkGAyHEWVTQl3NiL0UwoSudZNIgtkk6fnodpWJNCbOI=;
 b=ZjypqnrV3XlUhNYxQ94ar4q4P58khN6cDs+Oo6PtdaVfddqBtcPU6Ovi
 FuzUuzTuVYqapwcRkl3Ug+E49JII35WPxJm0NrxrcguMHCySCDcU59B1U
 hnfp+B5werQ6O/cmVLUNyy7iw1F+ZWsp5NEt9j9QruwYTHVnYrE1bc45F
 bbkaas8YVIlbk68afbWRh4yTtFifp5RGNE1Wcm5Awlv55O+G3dKS3PORv
 Tmn2YV/z296HvLxlRTISjsL2CacgP5sBB/PTEt3AxP7z85MiPjeI5uvWx
 jYP17N73A3xN5M9T+arhTHE6OyDwn5mPZA79tFUlKJ2th1lnv6E1dSEG8 Q==;
X-IronPort-AV: E=Sophos;i="5.90,136,1643698800"; d="scan'208";a="87026717"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Feb 2022 07:47:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 25 Feb 2022 07:47:05 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 25 Feb 2022 07:47:03 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v2] mtd: core: Remove partid and partname debugfs files
Date: Fri, 25 Feb 2022 16:46:56 +0200
Message-ID: <20220225144656.634682-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_064715_940354_F7DCF766 
X-CRM114-Status: GOOD (  11.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

partid and partname debugfs files were used just by SPI NOR, but they were
replaced by sysfs entries. Since these debugfs files are no longer used in
mtd, remove dead code. The directory is kept as it is used by nandsim,
mtdswap and docg3.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
v2:
- update commit message
- collect R-b tag

 drivers/mtd/mtdcore.c   | 35 +----------------------------------
 include/linux/mtd/mtd.h |  3 ---
 2 files changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1e7f3bbf847e..7dd105daf19d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -336,28 +336,6 @@ static const struct device_type mtd_devtype = {
 	.release	= mtd_release,
 };
 
-static int mtd_partid_debug_show(struct seq_file *s, void *p)
-{
-	struct mtd_info *mtd = s->private;
-
-	seq_printf(s, "%s\n", mtd->dbg.partid);
-
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(mtd_partid_debug);
-
-static int mtd_partname_debug_show(struct seq_file *s, void *p)
-{
-	struct mtd_info *mtd = s->private;
-
-	seq_printf(s, "%s\n", mtd->dbg.partname);
-
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(mtd_partname_debug);
-
 static bool mtd_expert_analysis_mode;
 
 #ifdef CONFIG_DEBUG_FS
@@ -377,23 +355,12 @@ static struct dentry *dfs_dir_mtd;
 
 static void mtd_debugfs_populate(struct mtd_info *mtd)
 {
-	struct mtd_info *master = mtd_get_master(mtd);
 	struct device *dev = &mtd->dev;
-	struct dentry *root;
 
 	if (IS_ERR_OR_NULL(dfs_dir_mtd))
 		return;
 
-	root = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
-	mtd->dbg.dfs_dir = root;
-
-	if (master->dbg.partid)
-		debugfs_create_file("partid", 0400, root, master,
-				    &mtd_partid_debug_fops);
-
-	if (master->dbg.partname)
-		debugfs_create_file("partname", 0400, root, master,
-				    &mtd_partname_debug_fops);
+	mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
 }
 
 #ifndef CONFIG_MMU
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 1b3fc8c71ab3..151607e9d64a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -188,9 +188,6 @@ struct module;	/* only needed for owner field in mtd_info */
  */
 struct mtd_debug_info {
 	struct dentry *dfs_dir;
-
-	const char *partname;
-	const char *partid;
 };
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
