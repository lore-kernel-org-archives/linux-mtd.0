Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A927BC47074
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jan 2024 12:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2+IXnFTRdeDLq1Zk2QL83NAIqYdzoPYD89A13+EBLmQ=; b=hjh9fWwmC1U/w7
	SSeeQ2lX51ym+yP6mDP8TEHu/TrnE0gozwqEE4kcyAacRjDUTerqi5aE16obPV0ddK4X2/8DypEV9
	dzLVV4YUYTZDbT7ywohFjUDDOmVKUWEWETaalb6BIglgq3k7e83MiP490DrYsQ5zszY3GdLmhHRIJ
	YMOaGssFkdzu7f9eYZsT62zwhbVJFbmb/Q8NCwqFBMEeqlbnODm8wCdBVoZPT3DTy5JUAiSSnM088
	qUHGlL7V097Ir6hpHaYfxU0JP7bWjqlbdFZ5hhOzeJcDiUbjJ/e7y0IyexNbWnSyUycAle5vXF1YZ
	grxtWb/RXrRQmnstXJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMSIZ-0031LV-2w;
	Sun, 07 Jan 2024 12:30:39 +0000
Received: from mail-m25480.xmail.ntesmail.com ([103.129.254.80])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMSIV-0031Ko-1C
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jan 2024 12:30:38 +0000
Received: from amadeus-Vostro-3710.lan (unknown [113.118.189.127])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 425C180005B;
	Sun,  7 Jan 2024 20:30:23 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] mtd: nand: Add Dosilicon manufacturer id
Date: Sun,  7 Jan 2024 20:30:20 +0800
Message-Id: <20240107123020.22053-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaThlDVksZTElKSUkdHUsaT1UTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKSFVKSkNVSkNCVUpJTFlXWRYaDxIVHRRZQVlPS0hVSkpLSEpDVUpLS1VLWQY+
X-HM-Tid: 0a8ce3e71cd0b03akuuu425c180005b
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ky46GSo4NzwtGDw2KyIJLxwu
	CygKFEtVSlVKTEtPTUhLTUlPS09JVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSkNVSkNCVUpJTFlXWQgBWUFJSk9JNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_043035_612408_E697964C 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
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

Add Dosilicon manufacturer id.
Tested on Dosilicon FMND1G08S3D.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/mtd/nand/raw/internals.h | 1 +
 drivers/mtd/nand/raw/nand_ids.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b7162ced9efa..e94788597a72 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -18,6 +18,7 @@
  */
 #define NAND_MFR_AMD		0x01
 #define NAND_MFR_ATO		0x9b
+#define NAND_MFR_DOSILICON	0xf8
 #define NAND_MFR_EON		0x92
 #define NAND_MFR_ESMT		0xc8
 #define NAND_MFR_FUJITSU	0x04
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 650351c62af6..54e07e148c6e 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -181,6 +181,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 static const struct nand_manufacturer_desc nand_manufacturer_descs[] = {
 	{NAND_MFR_AMD, "AMD/Spansion", &amd_nand_manuf_ops},
 	{NAND_MFR_ATO, "ATO"},
+	{NAND_MFR_DOSILICON, "Dosilicon"},
 	{NAND_MFR_EON, "Eon"},
 	{NAND_MFR_ESMT, "ESMT", &esmt_nand_manuf_ops},
 	{NAND_MFR_FUJITSU, "Fujitsu"},
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
