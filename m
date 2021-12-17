Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458A4C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZRyyptf35f8mGDY6q2ga797Yut+tfONKMOBJAvQQLY=; b=UbsZ0Dv/GYsb1w
	+O1ZSVhHQrPG52qotacnmbtJOCaJ571w4rzc4Odp9BtJ6Y94URIS9OcmbIKuRATFypoGw/ouFEUqJ
	VJfca05htaBulGuMbf75psR6s2JvUmSBvPEX6zmalMt3nw+NlTmjHuaSbU4qnwanM9xDvlD3/twBJ
	Jal4D4NB2otHaFn0EXbb+fte66fZmTEByKUMIW7cOWja1hG5gDDtc6Hb1aaaN9xT+TIT/iyAtNp0P
	BA3Ci3WZKKwFR6ufVmFPhB5YeVsVGFyxWk538oQBYOOY9xbNeBQL/xNoMROPgdPwVoTetEiyfSTGr
	bjzuQGG9MssvBDl49S+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCLS-00A8BX-8s; Fri, 17 Dec 2021 12:28:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCK3-00A7fT-8h
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 12:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639744010; x=1671280010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o0b6NEaAdzRZp/oj1QR5jmYHPgsawDkmnu8lKNhP8dA=;
 b=ifY5eA6dVX2Vvqt8Y2RDgIDxF7a8DYdDmGZ3w31/V09uUWuWc1usfq+B
 8tioqOGDnMAXIA9idLY58I8wcPSKhM4XaBRCAZFP0Za2b2a9ynqJaArBE
 d4ZscUzz8DzxXV5Fbj36tXL34nIZ/To/6huBFbYtvUCUCKoAFmywIWIcj
 Dt9ZQ8JTNyvCRJCoSqRK2tMOSRcKtbuRinI5+hNxVq4acDzWVMYtQFKul
 bTae2ZrBYuvbyBdc6ZZYDpyG7HpAubHoVkRMreJzxYLWu3p4/3dAP8PNZ
 hsmv+kuTFSmjaJ1VeTdcnf34gHvL8pR8Ck2neD41ZidvAYuTlG6acJ7Y8 A==;
IronPort-SDR: FXsndbt7yXlNiJ4sCLGUWhx1mMiHe7cPP9NtEGIoqGaRmhTM7/L2AAVFoc+5tzYl9BpDrZ0iII
 z7dv0P6qRQ7zIyDKgDZvoFVwSGcfGkBQB47b5N2INR8JAN24MgwzMO6hLGH9/+tdY7DHop6rCQ
 uGYS9TiSsvSudvW5CZjt8YZmWcsYX8aKCRuIWVehzLOMqldRqiXB3yEEwo98nMJDQ6BH6U+8/+
 WzJSQDlmjda6Rxvhbd14lCaCvNnrkPJT3hjChcgB01rodpc5XjfM8YmN76qbhzPr4Smf0sAXpt
 36ykzbXkd7hI4a0LjMbsaRSs
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="140126610"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 05:26:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 05:26:46 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 05:26:44 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <zhuohao@chromium.org>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 2/2] mtd: core: Remove partid and partname debugfs files
Date: Fri, 17 Dec 2021 14:26:36 +0200
Message-ID: <20211217122636.474976-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217122636.474976-1-tudor.ambarus@microchip.com>
References: <20211217122636.474976-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_042651_425254_500ACFAC 
X-CRM114-Status: GOOD (  10.76  )
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

partid and partname debugfs file are no longer used in mtd, remove
dead code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/mtdcore.c   | 35 +----------------------------------
 include/linux/mtd/mtd.h |  3 ---
 2 files changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9186268d361b..1977755fc955 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -336,49 +336,16 @@ static const struct device_type mtd_devtype = {
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
 static struct dentry *dfs_dir_mtd;
 
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
index f5e7dfc2e4e9..00cb269d0261 100644
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
