Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A46C5DF97
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Aug 2026 22:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ldz8KnYIXM7+lFxJ4y4LGhOfLnsmxhhS3OVN3nA4H5Y=; b=bc7ImviQe1Ywtt
	QbjuNJHdwKYLDnCDpdpnD+xYw4d4JP2mV1cRf5nVu9Sy50iX2CMtwkZy5DGr8BdYCtJUMilAm+zkN
	qaHQjugT3rsMpHps4sPZRvE6QPkNpUFz3YFWfipcyui3iS3RxYB/d2m2Qwh/74bKDIV5kIp+0CpFO
	vI63sjMc2X4jR0l20qfrAQbltS48CrbMkYBSuGmu3EprjY9cGUCsBgjvps6oIVT38al4JuON8cd2I
	BCuuaQFexlNqKOB43FcppbDOYgLNlqaB3+gouJ7yL0PRHD6Azd18fTxyhmcJ1yZnCJTijv8DEe2dH
	cI8gUyZFz3niFNI+HBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxuPV-0000000ErgB-3XPi;
	Sat, 22 Aug 2026 22:41:57 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxuPS-0000000ErfN-1VHr
	for linux-mtd@lists.infradead.org;
	Sat, 22 Aug 2026 22:41:56 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1657529a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 22 Aug 2026 15:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787438513; x=1788043313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r4j5wv0w/ADuufI7v1wFxK87Vhz8Ot+ciPGoH6CtO5A=;
        b=X06+6CaH/dywkS/O7+Jc079IjwuYMCTGtjgmgPWOO1cd1bQB7++etXE57K10TnGgr1
         AuGb/lcBcXAUYw/13vSFW2xFCUTx6a+JLpKsSGbZ04VGO2mjpLB+YBPUpo10uTISwVtV
         /2RjV3CvTY1AD6GbJNa5TGqmYXTwN3QZ7Xc1gAUexl2/Loa78xtbDSrEF9O2BeyvQI/N
         AqkMGQqIxSnhwsVV14947MjKHxVhgn+6ShpW8L/7HWjDS/++vvL9V7lhmkFCvccJSVR+
         WnT0XoHMk6UU7KN5pEYTA5kFJj4mC2KHD+Ss7SQVFvoZ7CrqpfyEGh93k5+UGN4O3I1j
         d1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787438513; x=1788043313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4j5wv0w/ADuufI7v1wFxK87Vhz8Ot+ciPGoH6CtO5A=;
        b=jKDjLex2y1hy8+4hQBBjXPV9rsydBd5Ft5zrS+IfJQdihlyoa7sSYUfyc2wyoFO6E+
         ifgDObep0XLOSQOFH+OZpVqopuxUJjkaCcECN+uOtYYCltMxd4/NMnq0vaWukQyrn59w
         /DGhq7edsqs+Fc9zTfSKR197QvWh4oJi8MKHWxhT+mc+a3bCL73D8hBEZ4SRKdq0b8Op
         7RKgnc9/W22WoM9vdtU9L1un7w5m/Vf1UE6EKMUjCqeazpDTDP9mKfwBXT4+BHI+fXN7
         cwu9Fdhm94k1/VuHGFFUkAyI/yRbp8vDicChZcAX11UffQGjJ6SigILzOr/mBpMnEASL
         Wtxg==
X-Gm-Message-State: AFuF++nOtRpC4NwrV9EE9lpj1F03pns3YxWiomoMWGbDqpZ+vzagVOKl
	CTMeIJMriXzjw344zAcoLtyPANAZM77D/rjrE9GG7zfNEtbhFFDtaubHvSc7bw==
X-Gm-Gg: AR+sD11lwisCPcZ6VmjXbk6kJ8IdiE9oIzYg9N/uXKrxTZT4ZNhxZ5CPsRDpLfm2J6M
	ZNt77Q5/UrjjrNdUdeAG0wlV51VjevEXacZhDjEBWUGGNz9adTsncs1BJ0Vuhg8ElqSqVXsQT9X
	nDeVMU+edNJAAD04QhHsNh/o8xA8X8PGfsbwE2thvQISUJ1sS5DswLFustsScEE2gKLb2E9LYNs
	VaGdLJLPu/Nmo5fCklBIG4KoucxBFQU1a03J64iD/SIfmofmLIfMbTX4v2/c+7LPSqs6laS+QBF
	xvpYxHS8oLb4zVQECJ7bx12Hl2IQoyxBrdMNLpwyydOh1VfIfthFrYvvvtWusJNXUMgKfQr9KwR
	D+VAKFWkXph3olDRPOeep9XrGiOV5G7mKjC/wo3GbHDlwcbOanZZLSuCTbBO8qQn//TJmOQ0NsS
	PGWrM/RmjlMbu7ULm1TPK+IXgYVd2DoTAzw/808RV2Hp6TTmqiBFo+1Cx12FoPuny4BI6mcymjt
	NG2f7eUCEKv2IVCiU+SqM5Oat95gwGt2MkqcbBbwsBYCErM0AJH5AtPNdeDx0V/7SoHM8OGvNLM
	PIW1CHPXcuuDWMqytURBZRcz5Gm2u26Lzrj4SygjmALEh47Y
X-Received: by 2002:a05:6a00:3a12:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-8520b9466c6mr12014353b3a.3.1787438512961;
        Sat, 22 Aug 2026 15:41:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f16d77csm839261b3a.59.2026.08.22.15.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 15:41:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: ndfc: use devm_platform_ioremap_resource
Date: Sat, 22 Aug 2026 15:41:50 -0700
Message-ID: <20260822224150.198749-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_154154_402496_10108237 
X-CRM114-Status: GOOD (  12.48  )
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

Replace the open-coded of_iomap()/iounmap() with the managed
devm_platform_ioremap_resource() helper. This fixes a mapping leak on
probe failure and on driver remove (the old code never called
iounmap()) and simplifies the error path by dropping the manual
cleanup in ndfc_probe().

There is no overlapping memory-region concern introduced by this
change: each supported board DT describes a single ndfc node with a
unique 0x2000 register region, and the EBC parent uses dcr-reg rather
than a MEM reg resource, so the newly added request_mem_region() cannot
conflict with an existing reservation. Distinct chip selects map to
distinct 64-bit physical addresses, so CS instances do not overlap.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index a48274297d3b..6bb22de1f206 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -185,11 +185,16 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
+	void __iomem *ndfcbase;
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
 	int err, len = 0;
 
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
+
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
 	if (reg == NULL || len != 12) {
@@ -210,11 +215,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
-	ndfc->ndfcbase = of_iomap(ofdev->dev.of_node, 0);
-	if (!ndfc->ndfcbase) {
-		dev_err(&ofdev->dev, "failed to get memory\n");
-		return -EIO;
-	}
+	ndfc->ndfcbase = ndfcbase;
 
 	ccr = NDFC_CCR_BS(ndfc->chip_select);
 
@@ -232,13 +233,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 		iowrite32be(be32_to_cpup(reg), ndfc->ndfcbase + offset);
 	}
 
-	err = ndfc_chip_init(ndfc, ofdev->dev.of_node);
-	if (err) {
-		iounmap(ndfc->ndfcbase);
-		return err;
-	}
-
-	return 0;
+	return ndfc_chip_init(ndfc, ofdev->dev.of_node);
 }
 
 static void ndfc_remove(struct platform_device *ofdev)
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
