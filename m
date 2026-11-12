Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF73606A321
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VJ80KNBx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oaJ6RHY4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dJklaN5rI2yLpkQR16twWnxsVRuboPQWGeFRq7Q2GGw=; b=VJ80KNBxuUVz+uLIPo9CCqDKFB
	PdMQ65NSGf3eUg/r+bpkUGBpRgZHOS4NkkwWoIYRSpQWTmiIlY4iI163DA1ZBkF4LOt8B6HFGw5jr
	RUxe0lyLwMv9NI2omcTcn+Jfcy6JfCCm/2sF4SQY/lLeaRQ+5yog0iOtXsFfHsB4MR11atgP3afq0
	gAsyu+Ry7EGbeffHAznJEkny5TgELSN5wbHaRoUmWDPq3q1m7rtpKZj+aKXGd/hXJoR1VCljkpMmc
	QZ1lXDsfqqXuYz59GSAgR6wWUNbJV+8bixYiO17x4AMlRiFOXiRenNlo1upsA/kIavvKoXkAthrX3
	8l2Nn6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcR-00000008LZn-1j4u;
	Thu, 12 Nov 2026 01:28:51 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcH-00000008LGS-2HJ8
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:44 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-825b40f8a26so1722441a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446920; x=1795051720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=oaJ6RHY46dCQHzqy3d233iybAzVF5nZ1HchFw7LWvqvaIupsOcmQ6jhSg9fmGjK0u/
         ky7WTC5NbytrObmTfqGzEhCcRqPtU/UiZ89fAw8qLfpq4iYv1ivofS5uyoLdk8GNyUtv
         zfjwgE5dHG4jA8rrQmmcJ30WBLepSnFGkymO0kZxxv4pvYHTlt7qW5BGgJpzWzWD+KDI
         NsgJqWpEvf15RLbbD2kGGrbZXIT9cESc4CD7WWNj8IV0qEpUPrOhM6lcAlMQ4zSg1Pky
         o4wyZ3sBZzSszq7jpqQSghvKKWsy+58a7D+yzla2HcoAmlf+12Me1//F71Re3a7JJ2kj
         ou8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446920; x=1795051720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=iv+n/q7UYp3x2EMlkgJU+Wu5jblzQPzf2bZIoGa6nHInyzTp0R36wOA+bVoXkEXd9a
         q/JWJpGF1CGJHxXN0kvRLhi0TC+piH62Qo0Z2lreJn0FDCJd0PzivXo+DjoYnM761LVP
         zv6/PDACwFO/gVCPv/VQ/Gllt1xnfH0HpBKjRIy3dYdBC7cKZLh2k+EDmvOgwvzWNUTN
         vcqWciFaeCsTQdKLQsTw4FD1OEUU48EmwJIgaB4xqP0O04MRGesBo2LobkcsYvlVYPdv
         UxCeWZp/RCWyZNgdxgb+xmg3ZRuIOMyTlpc80I6sPuqjGv8E3C7Ggz9SLSJsApYOiUpV
         hO+g==
X-Gm-Message-State: APuU4Z9SbTvtgW8LuYY0G7Qi+YjUjEtJezfHBPnbaBp+6Qh6kEU/u+wv
	plL2QchwwZBWeoUS5RYKGg5BL8+gg6rySexorseHaNIaBTFmwUIOXDt2
X-Gm-Gg: AYBFou1/+5lqb1kdUYkDT7u9btQJs1unIwg8MVkoefWn9jFXp/Kkt2sVdPk6XUVehGr
	9HgnpFRurtsWurLdfpdkotzJ0Sm5bsb0MN53JIz/aldIeW9gBY5CP0xMAN3PS6X51wFLJDiDOWS
	0HXFfJhYF8lSL+Js+jfyj9IeWxq+T5b1gNUisM5dvGgozOWt0SgVKM9sDaAwScQhf2BlZ18fhou
	t/A+bZKb+GAd/pCSwjHQUye17lYCdUlzzqu0geXjhmVK9islC2PlNEyMhRn9q+mYBKW4n84UNR9
	u/0KrKn6YqWBTGaAEv+sb+20dwAVXNcuuRKpWVPijc1YIJGIHeIW9Cv5eEfqkS3zv+kHlAeKW+i
	7BGt+8tQWv0HqbZV5pHLvX0cN2EC5nCwZmrBzJ526TRiiRxhO0IH9f3luRN6L9OxkdseweU7Gg2
	OyAklTcdhdPYtKYFGse2scZ+wZzcZHNLSi0GeKfJN+puyFzibt23KceOHE/VBkVOLkBAjwYfdrg
	1eiZWHtCHZpzMuYW3GRlC04NhLS1PV8CsmlHQXbs4+8vTDTjExKjRmCpiGfju7mgisrdw+SlXZW
	9mAINUw/avxA/Tm2GcCrRSSznqpUqEV5HWAi7Y85MKeZOwcVstnZyWw12lDmEje4osV3zNXk53q
	9X4odKCKOJOS94QJwspLhqPaVCL3aNnVOYJzDBPwh3GBdPzruvEmiBXqiZpzV9eTv9nSPfIaiLT
	w5jEEyIYgpxhwcp/TZ4y66oBoVvpLt0zxVnJ6IX+Mj9pgQnvwWRhiN
X-Received: by 2002:a05:6808:6d8c:b0:567:dc9f:c83f with SMTP id 5614622812f47-56b96192788mr3947266b6e.14.1794446915574;
        Wed, 11 Nov 2026 17:28:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:46 -0700
Subject: [PATCH v3 07/58] mtd: rawnand: sunxi: retain chip state until the
 final MTD put
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-7-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172841_637747_9F3F8FB5 
X-CRM114-Status: GOOD (  18.34  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sunxi_nand_chips_cleanup() unregisters each MTD device and immediately
calls nand_cleanup(). Devres subsequently frees the chip and controller.
An open MTD handle can outlive this sequence: another operation or even
closing a writable handle reaches freed metadata and lock storage.

Unregister each MTD device while removal notifiers can still finish I/O,
then disconnect the chip and release the driver's initial MTD lifetime
reference. Run nand_cleanup() during disconnection, freeing the
per-sector working data while the driver is bound. Retain copied names,
OOB regions, flash-node references and chip storage until the final put.

Give the controller a reference for each retained chip and one owned by
devres. Register that devres action first so the IRQ and hardware
resources are released before the initial controller reference. The
shared lock and parent device remain valid until the last chip is
destroyed, while the disconnect gate prevents access to released
hardware resources.

Unwind heap allocations on probe failures, including attach failures for
which nand_scan() does not invoke the detach callback.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4fcb7977de02..d175dc685681 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -27,6 +27,7 @@
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
@@ -2027,9 +2028,8 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 static void sunxi_nand_detach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand->user_data_bytes);
 	sunxi_nand->user_data_bytes = NULL;
 }
 
@@ -2045,8 +2045,7 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (nsectors <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
-						   GFP_KERNEL);
+	sunxi_nand->user_data_bytes = kzalloc(nsectors, GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
@@ -2440,8 +2439,9 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = &sunxi_nand->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&sunxi_nand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2465,8 +2465,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
-				  GFP_KERNEL);
+	sunxi_nand = kzalloc(struct_size(sunxi_nand, sels, nsels), GFP_KERNEL);
 	if (!sunxi_nand)
 		return -ENOMEM;
 
@@ -2477,19 +2476,21 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto err_free_chip;
 		}
 
 		if (tmp > NFC_MAX_CS) {
 			dev_err(dev,
 				"invalid reg value: %u (max CS = 7)\n",
 				tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		sunxi_nand->sels[i].cs = tmp;
@@ -2518,18 +2519,31 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto err_free_chip;
+
+	ret = nand_set_lifetime(nand, sunxi_nand);
+	if (ret)
+		goto err_cleanup_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
+
+err_cleanup_nand:
+	nand_cleanup(nand);
+err_free_chip:
+	/* nand_scan() does not detach a chip whose attach callback failed. */
+	kfree(sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand);
+	return ret;
 }
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
@@ -2610,12 +2624,14 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
