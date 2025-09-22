Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83613CAC592
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MgRAPLKd2XTP/lSHuZ+ipsH8XF/f99Ly99EfgkenwAQ=; b=GOuXY9LSsg4657
	orJvTUFBpUYKP/1MQraGiddMSA+RuUFroPRv1J5HW5L9n/fKhd7aoCv0WYsc3SCNM8yZfMND8PR80
	FzffFvxwsM+/rFue6RlugxokVlMZ2QAGKNtB+y5tXn9P6oRny8Hd+XOmCf7/woJh+3IIXnUcNrad9
	RJ2f15dXNJtvAWn9WIYwPR6Idcg2BKthBID6NnZSNh24AvikvLPpnZbze9Bmr6FZDHADtfKABNhwg
	Vp+6CqPLLbRRSaEDC11Frb+aIGCpCMvgxcO4QvzodcdJ6NkqO2sWOuqwm6hls+tgFzE+Ot4nC3Wbe
	T8h5b9JDxKWkIaCovY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iNJ-0000000An3R-00P0;
	Mon, 22 Sep 2025 15:22:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iNI-0000000An3H-1Yre
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:22:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0781601FD;
	Mon, 22 Sep 2025 15:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70137C4CEF0;
	Mon, 22 Sep 2025 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758554563;
	bh=f7AAOBOjgXPIcU9dvL/Owulz/NXNusEyUQL8u28tE64=;
	h=From:To:Cc:Subject:Date:From;
	b=bthpSdYL7IlA1gb80jBDIIEbLlx5ypcMwQy8n270nRKyvVp2qqoVwm7XVV4qo+icH
	 5mVKkxyfIopxABReot/BduZH69ZZ+QwmprRz8TxWf4Ula1sDeqBqOAQ3DHJ9SdQXER
	 6Z+3wXKI1vDydd3whAyxjhGnvfwBB1mceBXk3khO48AM/pAJbX/uPMYbhwjNvIk9wQ
	 dwt0w2Zb94GgmyvYzfKKX0TjcfUdHGJiQfM6zvWFQUp3NV3f3iXiMmrFoMgoN6Q5zZ
	 5PcHK2M0lpYFe6TI+ROeDAMKUyNM0rvsmf39zyXqGbi3CB6gIsHf/yJRfnZJjeu9Hn
	 EZV//O/2oGclg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iNA-00000000469-1DsI;
	Mon, 22 Sep 2025 17:22:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] mtd: rawnand: omap2: fix device leak on probe failure
Date: Mon, 22 Sep 2025 17:22:04 +0200
Message-ID: <20250922152204.15702-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
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

Make sure to drop the reference to the elm device taken by
of_find_device_by_node() during probe on errors and on driver unload.

Fixes: 62116e5171e0 ("mtd: nand: omap2: Support for hardware BCH error correction.")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mtd/nand/raw/omap2.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index b8af3a3533fc..61fd98ad5c78 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1979,7 +1979,7 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		err = rawnand_sw_bch_init(chip);
 		if (err) {
 			dev_err(dev, "Unable to use BCH library\n");
-			return err;
+			goto err_put_elm_dev;
 		}
 		break;
 
@@ -2016,7 +2016,7 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		err = rawnand_sw_bch_init(chip);
 		if (err) {
 			dev_err(dev, "unable to use BCH library\n");
-			return err;
+			goto err_put_elm_dev;
 		}
 		break;
 
@@ -2054,7 +2054,8 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		break;
 	default:
 		dev_err(dev, "Invalid or unsupported ECC scheme\n");
-		return -EINVAL;
+		err = -EINVAL;
+		goto err_put_elm_dev;
 	}
 
 	if (elm_bch_strength >= 0) {
@@ -2073,7 +2074,7 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 				 info->nsteps_per_eccpg, chip->ecc.size,
 				 chip->ecc.bytes);
 		if (err < 0)
-			return err;
+			goto err_put_elm_dev;
 	}
 
 	/* Check if NAND device's OOB is enough to store ECC signatures */
@@ -2083,10 +2084,24 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		dev_err(dev,
 			"Not enough OOB bytes: required = %d, available=%d\n",
 			min_oobbytes, mtd->oobsize);
-		return -EINVAL;
+		err = -EINVAL;
+		goto err_put_elm_dev;
 	}
 
 	return 0;
+
+err_put_elm_dev:
+	put_device(info->elm_dev);
+
+	return err;
+}
+
+static void omap_nand_detach_chip(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct omap_nand_info *info = mtd_to_omap(mtd);
+
+	put_device(info->elm_dev);
 }
 
 static void omap_nand_data_in(struct nand_chip *chip, void *buf,
@@ -2187,6 +2202,7 @@ static int omap_nand_exec_op(struct nand_chip *chip,
 
 static const struct nand_controller_ops omap_nand_controller_ops = {
 	.attach_chip = omap_nand_attach_chip,
+	.detach_chip = omap_nand_detach_chip,
 	.exec_op = omap_nand_exec_op,
 };
 
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
