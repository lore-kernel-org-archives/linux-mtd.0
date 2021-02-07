Return-Path: <SRS0=dz4H=HJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFC6C433E0
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Feb 2021 07:53:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8530B64E88
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Feb 2021 07:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8530B64E88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YXXGHM04dlawDkJVjS4Malpiwl0NmJrlSxjKQfc5dss=; b=Qqc+3na0NFN4T2ZmIX3gl19L4e
	fcpa2+2aTSCXu5G6ImuIXBi9jJNenKeA+K7VD2flqd7cNtdBJUepSMolUm4lxfVXudgUm3JCHHGmw
	fGzCmaImdJyPSDo8k3GDXtVMOsT/QEIfuOPVKcZyX8j72lr7qukAd447xUHRNNOuHFMbe6cv7HUx+
	siTfWER+A4znCLaL3/NZI0WINWM1AwQe0NQb3+FW1DtheCCMj2SuJGcSUpdhp4+AqHVYqf8SLr3Nb
	UnYv7r4ZWhBoRiOESSmswp5nU/S3H4xAV6xHWtIm2LzW259jdMcBKcC9ZQTKoXIm86rHpaFycetcE
	+FN6ebdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8ero-00045U-8l; Sun, 07 Feb 2021 07:52:24 +0000
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8erk-000454-9N
 for linux-mtd@lists.infradead.org; Sun, 07 Feb 2021 07:52:22 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R801e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0UO3XDKG_1612684328; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UO3XDKG_1612684328) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 07 Feb 2021 15:52:13 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH v2] mtd: convert sysfs sprintf/snprintf family to sysfs_emit
Date: Sun,  7 Feb 2021 15:52:07 +0800
Message-Id: <1612684327-115106-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_025220_682675_30FF1445 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix the following coccicheck warning:

convert sysfs snprintf family to sysfs_emit in 'mtdcore.c'.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  - Adjust the description of the modified content.

 drivers/mtd/mtdcore.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d..c37056e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -131,7 +131,7 @@ static ssize_t mtd_type_show(struct device *dev,
 		type = "unknown";
 	}
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", type);
+	return sysfs_emit(buf, "%s\n", type);
 }
 static DEVICE_ATTR(type, S_IRUGO, mtd_type_show, NULL);
 
@@ -140,7 +140,7 @@ static ssize_t mtd_flags_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)mtd->flags);
+	return sysfs_emit(buf, "0x%lx\n", (unsigned long)mtd->flags);
 }
 static DEVICE_ATTR(flags, S_IRUGO, mtd_flags_show, NULL);
 
@@ -149,8 +149,7 @@ static ssize_t mtd_size_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		(unsigned long long)mtd->size);
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)mtd->size);
 }
 static DEVICE_ATTR(size, S_IRUGO, mtd_size_show, NULL);
 
@@ -159,7 +158,7 @@ static ssize_t mtd_erasesize_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->erasesize);
+	return sysfs_emit(buf, "%lu\n", (unsigned long)mtd->erasesize);
 }
 static DEVICE_ATTR(erasesize, S_IRUGO, mtd_erasesize_show, NULL);
 
@@ -168,7 +167,7 @@ static ssize_t mtd_writesize_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->writesize);
+	return sysfs_emit(buf, "%lu\n", (unsigned long)mtd->writesize);
 }
 static DEVICE_ATTR(writesize, S_IRUGO, mtd_writesize_show, NULL);
 
@@ -178,7 +177,7 @@ static ssize_t mtd_subpagesize_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	unsigned int subpagesize = mtd->writesize >> mtd->subpage_sft;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", subpagesize);
+	return sysfs_emit(buf, "%u\n", subpagesize);
 }
 static DEVICE_ATTR(subpagesize, S_IRUGO, mtd_subpagesize_show, NULL);
 
@@ -187,7 +186,7 @@ static ssize_t mtd_oobsize_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->oobsize);
+	return sysfs_emit(buf, "%lu\n", (unsigned long)mtd->oobsize);
 }
 static DEVICE_ATTR(oobsize, S_IRUGO, mtd_oobsize_show, NULL);
 
@@ -196,7 +195,7 @@ static ssize_t mtd_oobavail_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->oobavail);
+	return sysfs_emit(buf, "%u\n", mtd->oobavail);
 }
 static DEVICE_ATTR(oobavail, S_IRUGO, mtd_oobavail_show, NULL);
 
@@ -205,7 +204,7 @@ static ssize_t mtd_numeraseregions_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->numeraseregions);
+	return sysfs_emit(buf, "%u\n", mtd->numeraseregions);
 }
 static DEVICE_ATTR(numeraseregions, S_IRUGO, mtd_numeraseregions_show,
 	NULL);
@@ -215,7 +214,7 @@ static ssize_t mtd_name_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->name);
+	return sysfs_emit(buf, "%s\n", mtd->name);
 }
 static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
 
@@ -224,7 +223,7 @@ static ssize_t mtd_ecc_strength_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->ecc_strength);
+	return sysfs_emit(buf, "%u\n", mtd->ecc_strength);
 }
 static DEVICE_ATTR(ecc_strength, S_IRUGO, mtd_ecc_strength_show, NULL);
 
@@ -234,7 +233,7 @@ static ssize_t mtd_bitflip_threshold_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->bitflip_threshold);
+	return sysfs_emit(buf, "%u\n", mtd->bitflip_threshold);
 }
 
 static ssize_t mtd_bitflip_threshold_store(struct device *dev,
@@ -261,7 +260,7 @@ static ssize_t mtd_ecc_step_size_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->ecc_step_size);
+	return sysfs_emit(buf, "%u\n", mtd->ecc_step_size);
 
 }
 static DEVICE_ATTR(ecc_step_size, S_IRUGO, mtd_ecc_step_size_show, NULL);
@@ -272,7 +271,7 @@ static ssize_t mtd_ecc_stats_corrected_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->corrected);
+	return sysfs_emit(buf, "%u\n", ecc_stats->corrected);
 }
 static DEVICE_ATTR(corrected_bits, S_IRUGO,
 		   mtd_ecc_stats_corrected_show, NULL);
@@ -283,7 +282,7 @@ static ssize_t mtd_ecc_stats_errors_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->failed);
+	return sysfs_emit(buf, "%u\n", ecc_stats->failed);
 }
 static DEVICE_ATTR(ecc_failures, S_IRUGO, mtd_ecc_stats_errors_show, NULL);
 
@@ -293,7 +292,7 @@ static ssize_t mtd_badblocks_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->badblocks);
+	return sysfs_emit(buf, "%u\n", ecc_stats->badblocks);
 }
 static DEVICE_ATTR(bad_blocks, S_IRUGO, mtd_badblocks_show, NULL);
 
@@ -303,7 +302,7 @@ static ssize_t mtd_bbtblocks_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->bbtblocks);
+	return sysfs_emit(buf, "%u\n", ecc_stats->bbtblocks);
 }
 static DEVICE_ATTR(bbt_blocks, S_IRUGO, mtd_bbtblocks_show, NULL);
 
-- 
1.8.3.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
