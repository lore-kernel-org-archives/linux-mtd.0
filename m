Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA6DC5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2+riFAPy4l3lyPbFhDYjkD3ufRkc0s1UMjMXQklr8Ig=; b=v7eyttixMmTy1v
	2yO6xx1Q36qkhcq3KlB7JA0Ts3m+xZTeJs7yG8CK2vhsFMJg6tbTdcYvDgtkEO2K01zw5g4+LzX2t
	hLhyWy+cjy5jFWt+FpZkeVEo2DiOXPTu0omgjbNDyrvb+Zbln+mHEYa+AYIy3toRKlmVDZp0Jk1QH
	mBjNy3MQt+ea6cI0UOgljWemqWEhTGBICvqJeoeWiM2jPfL8bGUX2Qikckue8DFH4kFCa6Oksyduz
	wOdmaulsWYqPAmuopezfW6qZ/yIxIDrasyJb1+E6mxXSc+7xGxdQ/jJMCUCuJE991auf7ni1tpDVa
	3ePYInsw7h7pL2AxOn8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sibiS-00000007q3s-28Nh;
	Mon, 26 Aug 2024 15:33:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sibhK-00000007pZB-2e9D
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 15:32:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F852FF807;
	Mon, 26 Aug 2024 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724686319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RZxAu0I6Vof5zJX526HnIkoP+pn3kd1ph2IcJF9w6bg=;
	b=Nh7cbRYXhPx1QUk3iiTanQognF9JgP/6puKt4ctC8DvD7Ve5pVREtCRtAfFoMhRJi2FkF9
	i4QYHDFsLYop0mk3mrZK6EPM99ZmDtHCTXG8fwOlNa3wHytRN7+aPKIxcI/x80Zacwmxur
	uxy/s9FFAdikcwMKblRUys0fBgeqe4GLX/vKStJo5ZZjLeqdO/Ip2BArx4e8tFgFAJoiVW
	Kbq+QfB1VugYcl+JGhDJcbcnjz6w9lFsuKhaIz0UY36hW2SGSLrbrNF9Vm91n/hXlrxPx0
	YHkY7o/+VXQixq4HGxsDkcRtb58SNaEEJFHKSdC/slm/0jgZ5xN/z8MgWkzctg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: meson: Fix typo in function name
Date: Mon, 26 Aug 2024 17:31:58 +0200
Message-ID: <20240826153158.67334-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_083202_836229_4267FB5D 
X-CRM114-Status: GOOD (  11.69  )
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

There is a reason why sometime we write "NAND chip" with an 's'. It
usually means several chips can be managed by the same controller. So
when initializing a single chip at a time, the wording "chip" must be
used, otherwise when talking about all the chips managed by the
controller, we want to use "chips". Fix the function name to clarify the
meson_nfc_nand_chip*s*_cleanup() helper intend.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 8806a06462ac..fbb06aa305cb 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1475,7 +1475,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 	return 0;
 }
 
-static void meson_nfc_nand_chip_cleanup(struct meson_nfc *nfc)
+static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 {
 	struct meson_nfc_nand_chip *meson_chip;
 	struct mtd_info *mtd;
@@ -1500,7 +1500,7 @@ static int meson_nfc_nand_chips_init(struct device *dev,
 	for_each_child_of_node_scoped(np, nand_np) {
 		ret = meson_nfc_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
-			meson_nfc_nand_chip_cleanup(nfc);
+			meson_nfc_nand_chips_cleanup(nfc);
 			return ret;
 		}
 	}
@@ -1614,7 +1614,7 @@ static void meson_nfc_remove(struct platform_device *pdev)
 {
 	struct meson_nfc *nfc = platform_get_drvdata(pdev);
 
-	meson_nfc_nand_chip_cleanup(nfc);
+	meson_nfc_nand_chips_cleanup(nfc);
 
 	meson_nfc_disable_clk(nfc);
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
