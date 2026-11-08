Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECDF606A325
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gHRSxqNW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0Nqdepc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2TtTvxtr6DI90P+h8mIkAR7b4S7JnXfVL0CiUISmAEQ=; b=gHRSxqNWRDB8mo78m0CzVF67/w
	Hzr8jLr6xB3Jv2fWCtrjUbKNjWikn9OnOIHmozAl5trFhRq4dWTLuTG3rogoY1XIpCbU+ADdsC0zg
	v4WDZKk0kaENE/MhuWxo8zSx+WqJeiCQZ6322aQV9pL0NwaoHvCD801AwDdrm21aZZRpFogmFrI+D
	c4zUGQi43mNKLVJlvvIgA4PNlZRXHjakI5yLDXFKSQA/27sER9yOq+9vMoiPlUp+u4ZnFZWWZ7vOK
	hIuQVBbKdtS5tN8zLtIwqoTt1I/BuzXdFaWTiXhsXGVcit61M8WDmb2Ylkp4bOTGJiwnKQmLdtYVL
	wzmn1Lww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCIl-0000000GuTM-3z9k;
	Sun, 08 Nov 2026 23:27:55 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCIj-0000000GuSs-1soe
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:27:54 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4b28d9537bcso221176b6e.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 15:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794180472; x=1794785272; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=29ND1xXn3ELD+DnjwkyWpaNhwBfnd9yLmIeaLt62EPg=;
        b=L0Nqdepc2XSziXqqdUn9Z0n4Fo3dLzR9r3vS1f6+/OuqdtrwDpzm3LhFcEldwX/Zgp
         unGPOHCsS0ZTKF6O8gFrLTtrsQZJyqVYq3IiycNXf86Dme80ZnPswC9sWQ8Nm/VKz1vQ
         9F60CvAvEJXXzpshTrja4kQ5+JWsIsJ7eCdbAknwgMQlzlL5WwsZzM7GhkPCMoxZsWg3
         LBzH/FPFq0pcaDIiQfQC4pFdpV6UWROigRz3pw3fZxU8t+znMaCB7wNSfkpboK+ojZQu
         cK0m0sCSYjvDKxd2Keo74Ss2K4GA/XR7m9tIYTI7gnK7M/dEgULWZQQmBfDgERH0gRay
         KAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794180472; x=1794785272;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=29ND1xXn3ELD+DnjwkyWpaNhwBfnd9yLmIeaLt62EPg=;
        b=vYvfiVhoBsEs1OA7j68vd7z6eqDI9T7xM+0Ppl1eHidHKu4e80hFTFMFRAGKH0pv7X
         hTahF3FfXbBF7C9nTQk0TM74LwwuqzcJTP1OmshpZyjnWT97JJjWAHwPQKoYZuXLclPU
         BjWh/JDxZ1HjWGarkDTBBiPVRkEGHKYqV+BS4urrgHxwlx2GosWMmJfnOX190RnTYt7W
         fxVxb2aeD1Y8KDDhtD6hksx9h74jVSxVqPdbsqsdXeXg2RQkwKjUGuYm3GrwIPm1TWyS
         E9y0I8qyQ1xgZAjkmjDKjjXYAlolSJN59QYKyU7IEK/g5qb5KHFh6Pxg94ShDw0b5QPT
         NvDA==
X-Gm-Message-State: APuU4Z/GhMeD6tY2R0T6kx/4PYLKtPKkGcKUUPeuJcAGrVvxaaUddupx
	KRRWdym0fu9F2Vkfv1BppFrQFGAE6HAh5qSroNlXmmQ1ACrZ/7rLTJUr
X-Gm-Gg: AYBFou3jHvoif8A0WTj80zzCqcqdunb7fsl8YaAMrV8Jey9b4qmbX81M00o6QRo6EJJ
	5e4QbnYeNa8b5TLBaabzl+ASI4aapHiPRCywR+r9PDHCYIuQAf7FCrAAaLw7NLGFlfruQpXwlOR
	eq7mJMwY2HfzWCxaE6gUXcAM9UWGfP7pPngjBeTgAsfL3cc5dK1rWu2hx6a38+k45vVAxHZ1Wi1
	bhJ9/LKaEKuiNqtoVybbi2wh0wdp1Gr1j8/xEv41rvUcVfIVuH8aaAuL0X3Qf0gB7umqKOQBn1Z
	RC19tg3hYz6a3biaFxE/iczjFJvd/yVFebauxC8N98UhE+Q7x97RlBW4apXiUYG/piqzwFttMy7
	NR84bHhQxiSz8JUSekTeQU4LjzOu4XGrsiO+1tab2T/qEiGrgB5GH5BqqerpGkbkrB3G2Zqj8xX
	C/dlxUBM7Spa7RliMBOT/J9yow1SYpUUJPLxvzrFY35DtmE45jNvbPx9lwnznmsDIsfR0GTQcND
	se23lWYq3xQ0m0N6nIUGHIQdJtidV2E34zaajKM2Fcx94vRdFidY4mXUJqjETYHucp9tIU1PnCU
	x9E8ss9lQEf6CSaT59Fwj5h+XUme4e6Vg6+dNGo2W/GP2Vk4ZlDUzoFIYwQ/JjgSqHrT3jpBLD4
	r7e3lUOBSosKFeoYZ+cdaE+jRT6drYdM1S7QENYIM8OG7cUP+J+/FGHc8mzYqMWCfHRJEUUUgce
	m9SJEz8Ha57oPstsNsviRkHpYEudfA2/d7g5bZsMQhPcv6p/pVI60=
X-Received: by 2002:a05:6808:1691:b0:4a4:64b0:bf5e with SMTP id 5614622812f47-568143032a5mr1010143b6e.2.1794180472163;
        Sun, 08 Nov 2026 15:27:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e56700sm2936856b6e.17.2026.11.08.15.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:27:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:27:48 -0700
Subject: [PATCH v2] mtd: rawnand: r852: preserve card changes during
 detection work
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-card-detect-lock-v1-v2-1-e3251bc3680a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42O3Q6CMAyFX8Xs2iobDNQr38NwsZ8CUzfMNgmG8
 O5u+AImTZNz2n49CwnoDQZy2S3E42SCGV0SbL8jahCuRzA6acIKVlNanCC8pTUR/IkzUMJr0Bh
 RRXiO6gEThYaWsuNKn1ktSaK8PHZm3j7c2p9OiHs6ydi8IUVAkF44NWTLRn10wqWGc8zzwYQ4+
 s8WcaKZ83+aVBQ4pxU2vCpZcb72VpjnQY2WtOu6fgEUKZLuAAEAAA==
X-Change-ID: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_152753_503941_C70DF01B 
X-CRM114-Status: GOOD (  18.80  )
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

r852_update_card_detect() reads and writes the card interrupt enable
register without holding irqlock. A card interrupt can mask detection
interrupts and mark the card unstable between those accesses, only for
the worker to overwrite the mask with its saved value.

The worker also calls this helper before and after registering or
unregistering a card. An interrupt between these calls starts a new
debounce interval, but the second call clears card_unstable and enables
interrupts again before that interval has elapsed. The interrupt can
also change card_detected between the worker's registration checks.

Hold irqlock across the interrupt mask update and leave the mask alone
while the card is unstable. Move the transition to stable state into
the locked card sample, and return that sample for both of the worker's
registration decisions.

Keep registration failure from overwriting a newer interrupt's card
state, so the next delayed work invocation can process that change.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204068@kernel.org/
Closes: https://lore.kernel.org/r/sashiko-outbox-204135@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Keep new debounce events pending until the next card-state sample.
- Use one presence sample for the worker's registration decisions.
- Protect the registration-failure update from newer IRQ events.
- Link to v1: https://patch.msgid.link/20261108-submit-r852-card-detect-lock-v1-v1-1-5514e7543209@gmail.com

To: Maxim Levitsky <maximlevitsky@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/nand/raw/r852.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..4c094648673b 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -557,15 +557,20 @@ static void r852_engine_disable(struct r852_device *dev)
  * Test if card is present
  */
 
-static void r852_card_update_present(struct r852_device *dev)
+static bool r852_card_update_present(struct r852_device *dev)
 {
 	unsigned long flags;
 	uint8_t reg;
+	bool present;
 
 	spin_lock_irqsave(&dev->irqlock, flags);
 	reg = r852_read_reg(dev, R852_CARD_STA);
-	dev->card_detected = !!(reg & R852_CARD_STA_PRESENT);
+	present = !!(reg & R852_CARD_STA_PRESENT);
+	dev->card_detected = present;
+	dev->card_unstable = 0;
 	spin_unlock_irqrestore(&dev->irqlock, flags);
+
+	return present;
 }
 
 /*
@@ -574,8 +579,14 @@ static void r852_card_update_present(struct r852_device *dev)
  */
 static void r852_update_card_detect(struct r852_device *dev)
 {
-	int card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
-	dev->card_unstable = 0;
+	unsigned long flags;
+	int card_detect_reg;
+
+	spin_lock_irqsave(&dev->irqlock, flags);
+	if (dev->card_unstable)
+		goto out;
+
+	card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
 
 	card_detect_reg &= ~(R852_CARD_IRQ_REMOVE | R852_CARD_IRQ_INSERT);
 	card_detect_reg |= R852_CARD_IRQ_GENABLE;
@@ -584,6 +595,8 @@ static void r852_update_card_detect(struct r852_device *dev)
 		R852_CARD_IRQ_REMOVE : R852_CARD_IRQ_INSERT;
 
 	r852_write_reg(dev, R852_CARD_IRQ_ENABLE, card_detect_reg);
+out:
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
 static ssize_t media_type_show(struct device *sys_dev,
@@ -632,6 +645,7 @@ static void r852_update_media_status(struct r852_device *dev)
 static int r852_register_nand_device(struct r852_device *dev)
 {
 	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	unsigned long flags;
 
 	WARN_ON(dev->card_registered);
 
@@ -657,7 +671,10 @@ static int r852_register_nand_device(struct r852_device *dev)
 	nand_cleanup(dev->chip);
 error1:
 	/* Force card redetect */
-	dev->card_detected = 0;
+	spin_lock_irqsave(&dev->irqlock, flags);
+	if (!dev->card_unstable)
+		dev->card_detected = 0;
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 	return -1;
 }
 
@@ -684,20 +701,20 @@ static void r852_card_detect_work(struct work_struct *work)
 {
 	struct r852_device *dev =
 		container_of(work, struct r852_device, card_detect_work.work);
+	bool present;
 
-	r852_card_update_present(dev);
+	present = r852_card_update_present(dev);
 	r852_update_card_detect(dev);
-	dev->card_unstable = 0;
 
 	/* False alarm */
-	if (dev->card_detected == dev->card_registered)
+	if (present == dev->card_registered)
 		goto exit;
 
 	/* Read media properties */
 	r852_update_media_status(dev);
 
 	/* Register the card */
-	if (dev->card_detected)
+	if (present)
 		r852_register_nand_device(dev);
 	else
 		r852_unregister_nand_device(dev);

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
