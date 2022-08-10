Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9285DC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y6s0Xe66wQsCKYQf0GbK1JV0Hb3M1D3MONjwYzAsycs=; b=P8tHL4Whtk76W6
	NZp/CcSNJ88Z7MeyG8CHhJMAzNwCJQ+Sr6PF1+7M74kvVyBMn6g5i7uZs6DkeJC2mypta0/DHTxLl
	KGmgsWk/CTr4nmlugCOsb/CZlXtJTdcXvp0Kb3vl28zU9ELTinLHkOryd+52N1RuebWA4jSe3e2VM
	L5hlVqWFg6C+mekQXrOnq6POHxp8Am2V5JxlETal9C7SJOKqI3JTn02t63+mCeNugXa+7O6Ae2RRE
	zGlCPJsHI2RfZunL8nDXB1wURlaNbYINHfNOZxTiK+9OH+Z7ATj4b2FtnL0WY7w+8yhurm10mjcK8
	Uz5QSxGMI6khIIhH0hCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLltl-00C4CS-Ll; Wed, 10 Aug 2022 13:37:25 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLltU-00C414-Og
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 13:37:11 +0000
X-QQ-mid: bizesmtp91t1660138621tyjh25xz
Received: from localhost.localdomain ( [182.148.14.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Aug 2022 21:37:00 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: HIVLo4mOhq43Fq7BEHvabMsAS1Zg45v+vFnVO246XRRJsgce/ZriXp1vHMZmh
	+CmT7ygsoNutrLCO+AhuJtcnxtHwOrnqqF4fKE1Y5CF8jcc7yYCZXlFTA1fKv13lNBsLzt0
	X5/xncwrAkjElfPRoez5ea1e3z7qcV6BS3fthWYoOV2JWELWHKc1DUR4k6BXJkPiVHAWp5Z
	POKAN5hbZU8aAhHJlxSLGDXk8JNQnCeuQgG+lv2AWdHeYIoEIf5QLggK7sXUFamXY69o3eU
	X2QeNNsLUDBNxbjZinY9mAOUorpb4h2h7NzXmdjdbm9cJ8XK6q7ka4N5Rjyro6HCTMPm/V+
	hjg2uVGJsE8V7yO0lGbLGJ79kolyDh+OAsqZ6bEo+Z6KFvPknuoRHD/975ns4Lztp0wObh6
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] mtd/ubi: fix repeated words in comments
Date: Wed, 10 Aug 2022 21:36:53 +0800
Message-Id: <20220810133653.3873-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_063709_242670_EE03E390 
X-CRM114-Status: GOOD (  12.68  )
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

 Delete the redundant word 'the'.
 Delete the redundant word 'a'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/mtd/ubi/ubi-media.h | 2 +-
 drivers/mtd/ubi/vmt.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 386db0598e95..2c9cd3b6434f 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -131,7 +131,7 @@ enum {
  * is changed radically. This field is duplicated in the volume identifier
  * header.
  *
- * The @vid_hdr_offset and @data_offset fields contain the offset of the the
+ * The @vid_hdr_offset and @data_offset fields contain the offset of the
  * volume identifier header and user data, relative to the beginning of the
  * physical eraseblock. These values have to be the same for all physical
  * eraseblocks.
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 6ea95ade4ca6..8fcc0bdf0635 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -623,7 +623,7 @@ void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
  * @ubi: UBI device description object
  * @vol_id: volume ID
  *
- * Returns zero if volume is all right and a a negative error code if not.
+ * Returns zero if volume is all right and a negative error code if not.
  */
 static int self_check_volume(struct ubi_device *ubi, int vol_id)
 {
@@ -776,7 +776,7 @@ static int self_check_volume(struct ubi_device *ubi, int vol_id)
  * self_check_volumes - check information about all volumes.
  * @ubi: UBI device description object
  *
- * Returns zero if volumes are all right and a a negative error code if not.
+ * Returns zero if volumes are all right and a negative error code if not.
  */
 static int self_check_volumes(struct ubi_device *ubi)
 {
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
