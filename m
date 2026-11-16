Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC7E60A260F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zvbk7GxP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWsqRhHS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dJklaN5rI2yLpkQR16twWnxsVRuboPQWGeFRq7Q2GGw=; b=Zvbk7GxPXR99+4XoyZ8iQvn9AD
	W+Hcc46I8Yz6/x/mOyKmuENKelIxhjsOkmRG5IyP1rbmT1NxsedXBPHcR0OHrT6JW0tjCWCGXeApA
	InKdQtxDbHrXh9fNPPRM8gYVZ0fX06DoKHVdq+/wz2kD7xLiLvnw/MPOYouqsYnK56ML2pgnIt5SJ
	/ZI0zqgEj9hM2kIaaatG9XFbfG1x0/oSSesrmcShXx/qvAIkfL3yjLpV6EB8p8XEmfqduybrMDkrD
	vn1ytIUmXYwx3G7vCHRF14PUgsJJfI7erYibZQ6jY50bYYSMpX7uyy5++J7iKnX0P+cWmTUa9QCmz
	7MEGucoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE3-00000001EqA-0uc4;
	Mon, 16 Nov 2026 06:29:59 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqDy-00000001Eik-25yR
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:29:55 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-71ae5389c00so642528eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810594; x=1795415394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=uWsqRhHSEHf8aHL0Zyrk86YbaqGjI5AUexXmYrocThHoF5bT2H2NG5DuOKzNqI9xmq
         thIklL/t+7RCnQnNZ/P/OB/mUn3/NEnJ2IHewMSCuo5+XIWJEbvPxTdI9tIK187MyJSt
         b4hyBRQKETiDnU0ySyajh0FuNTt90/1A3sZfHzkSDLgrwim7kAMRlpZzoamL9SPtMaJI
         JppKqbepwOLOFOM1OCcaikTF70opW//CvJ3OnfBJIf6XuMxBtApLF6Gkq8vu2Ern9SsA
         86WQYfAA5RNlC/1wkKpaBA8D9YDWYA20HpeSnlOlYZQCddgcQSeyCrltq/NJneXqEdMd
         5C7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810594; x=1795415394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=ReZ1e1zOt2u1x0s2KkdlTDj4qOJ0nhQbh0JQvn6j7hy3Qr25qPShp427FF+6g4e9dQ
         7cC0prG+u+AKqBerL9fzFNbRlrV+VlqNaCRC7Yfq9NO+ezFwevg8d93IikQKxJr+4EFz
         LC19ypdRw9+h6d3TgFdrB2ZjhzmmCKNP/6xwnaqOFfbhfQ8Iwws5ZvU7kAiDOlbZRWgH
         X/9zi0LlJi3YQnSYWv0+C/nkxK4I7pHJoeyY7qbBZOqMotIyRtGT2Vve1JNZ6+N20djJ
         0yEQw6X2auPBKsMRDyNXE5eekOJ6W9SEifyyQfas929DtTOpF9tSoRGStx6YNCisGVDX
         nn7A==
X-Gm-Message-State: APuU4Z9AO6hITWLi5Xy2Y9bwxOww/keWlojcTziHMZINYZrFNPY0NxZC
	kbgWc6oUZ2LM9iexMehXuqzG57EDG+ocdHl/spvY5t6LWxGXNVsigXk3
X-Gm-Gg: AYBFou1DToxVyIW+fPPXJw9ZUqz/hWsL4SBweEr6BHPEVkpNIwhSPQ8OHoFAyXbMkDD
	fId3iKhHQiV0pzGlLNZDa3s896eeL6EPGEpCOwp3k3mm9Kuk6hAsE+AEcQqjZSFojFiGZjxhIkZ
	6jRopLmVMQH53iCJCsHTKTk8awnETteVzzpSI6XcFFmXXnFYGBnurXiNyUQHStefPzqhWZOrhy3
	Xbl9vdWlvcYm9XrL5o9MY674TiRVUaDefbNGxOcFCny/LQaAz2q5m0V4gx0rmx11gnYeygZU7GU
	oyxKC/baz0G65kYFEmzRRckaTdOSmE+WgMs0Ul7ASpAr3WIH6+QWmU+Q9kQLlpx9p31tfaM3PV8
	l+vZ2Gx2lAnyPwIb6mbde5+qkopa1oXpdRINaT26zBtaQKKlb7SMp6rukZ/esRHrPdWAvj6n0KC
	xbsUMQz5/IHoJOpeUzasFn/CsgNvFIzrtIuEhd6DlD/wneyGa8tdbXOLh2+/dPRlDAFZ5D2f327
	5sDHtWsuyUpRoCyGDeTGENcb1iBLAoownD3JTyl7Z+o2ioylwqU2KEfCeiC3Fq0DJ+PjDwqqIHo
	uYSgntfu5QfP348xR7ZB2TcmOXX1RnAO3HIrlKz/rCbFNIzZxzsUpYVhw0KbacrFInTwjmce+/h
	69uceBGWrtU6UV4jVcCAvnIzBfjhuwyNxJ8LjWhLQZwKBEpypztGZQrPVzcu8f0wYwmNwztxgyq
	I7JTU6+rWzKXOSp9lgmHMR9yrQlE2Mw3dwQR2nnUxuNwE+bS78idWJ
X-Received: by 2002:a05:6820:2205:b0:70a:12a9:c43d with SMTP id 006d021491bc7-71ab4f8ca14mr5786666eaf.22.1794810593653;
        Sun, 15 Nov 2026 22:29:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:22 -0700
Subject: [PATCH v5 07/58] mtd: rawnand: sunxi: retain chip state until the
 final MTD put
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-7-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_222954_560915_3CA029AD 
X-CRM114-Status: GOOD (  17.87  )
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
