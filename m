Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF4AC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vjlKyE2AhLRDSwkdFthRfeaf4A2RKzwA3KfuHytXZ68=; b=fCrq8kO0kcW9LQ
	EGGPr1aEveH2sgujNjFjhsM+N/xNse3wMq8D3MbTjPONKRLKyJiLlmsS7lu0AtXDdjoFzifMASSP8
	JGxHLV3xuAAjdn1Pf/FcXxrWuBzyxxi/3y7VwUp+Mx9Va2r2rbAVYt3axedkRxK23tsw2niDCYtx7
	f+FBgpkLG21xfl1kqnmgD27C5kHnvlZ69D0hvrzopp9yA5BoeToRR5D/JKehyahHAUBhZcCkccoeF
	pkem7WKycr8AB8XFpbyJ9gtd6HsmVur5jg9iGwT8zzwtMNuQphUzOOzytsFu1/1CvTk9LVOeRnGLM
	yvOYe8WrmXiCCJaZTVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChsQ-005IQa-2A;
	Mon, 11 Dec 2023 15:07:22 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChsC-005IIm-2t;
	Mon, 11 Dec 2023 15:07:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F33EDFF80A;
	Mon, 11 Dec 2023 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702307226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+IG8edyMhn3FE8xgdJtbiJSuCXcG/WjMqFQomY/cHok=;
	b=lh5zGP5FO5/ZpxLd8TIhtY60UAozhTv0xXej8AGly1KO7aZvzIuxTlsm8Nh7xaKvACv0i9
	475YA1n01wVeS4HTiJWiB6CuBzZiNiYVwfsvsOSiJfj35dcTDPQTe1PLrFM6QyTmqxDCCf
	Mby6pALwG6HC+G2wfcx2hyKp813pwRVgU+Tq4uIo/cdwQv20kiYJQWkoBsfWsWzGTwNKr4
	kAyOJD83tALofG7IlyEUia6XdCFI3+jxGRrt/xADzX5YVT3qxrcN7YhogEjtW27T2VHg1u
	3a2vKZT0AjMzVSza2BvEmW+iIho+NIo4fvxlK1TeK8Ef8kdNQnkZI0Rsh7TXzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	<linux-rockchip@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] mtd: rawnand: rockchip: Rename a structure
Date: Mon, 11 Dec 2023 16:07:03 +0100
Message-Id: <20231211150704.109138-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_070709_087154_911ED47E 
X-CRM114-Status: GOOD (  10.65  )
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

Robots are unhappy with the ecc_cnt_status structure because the kernel
doc says it should be called rk_ecc_cnt_status. In general, it is
considered a better practice to prefix all symbols in a file with the
same prexif, and thus it seems more relevant to rename the structure
rather than changing the kernel doc header.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312102130.geZ4dqyN-lkp@intel.com/
Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 596cf9a78274..ab1a9e8687e0 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -98,7 +98,7 @@ enum nfc_type {
  * @high: ECC count high bit index at register.
  * @high_mask: mask bit
  */
-struct ecc_cnt_status {
+struct rk_ecc_cnt_status {
 	u8 err_flag_bit;
 	u8 low;
 	u8 low_mask;
@@ -144,8 +144,8 @@ struct nfc_cfg {
 	u32 int_st_off;
 	u32 oob0_off;
 	u32 oob1_off;
-	struct ecc_cnt_status ecc0;
-	struct ecc_cnt_status ecc1;
+	struct rk_ecc_cnt_status ecc0;
+	struct rk_ecc_cnt_status ecc1;
 };
 
 struct rk_nfc_nand_chip {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
