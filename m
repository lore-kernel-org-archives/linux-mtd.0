Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE19F606A31C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 00:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DsiZfYhC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDEqNBVr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vEnMLLiKArV+J6rrwvDv/kRzSg3+ALjNBF6N051qUdo=; b=DsiZfYhCmP8gjX8tN1k0s3V9z6
	NXPd9o5R+UJDYCKeryMEn3uEAZ9vdSmeyuq4jXN+IZ17HsMutkDsf8Xy/acy0pS6X+DJ+XInpRv4M
	vyLwLuLSJ2HBe1evb0vHUxLM5QH9B2h+qwU7u6CttP7qXEOs0SkxvAC1Ez4/GN0TDnD/9eho28jTz
	OlbUON0YNm3ahSp2dbmYPUZtNOaSd/iw6L2zoKrM1G3hdbfmxKPrz2Fdf4j3aNpDCUKLiMt/FbFx5
	7eDwAvY1LJg4ir+T8Qik3VIOXLBlqLc9JxFxwhPAHMFH5NbC9ohgKXy+M47AncaOnHhz5cX3tzccD
	Sn4+RU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQD9c-0000000Gx0W-0RZF;
	Mon, 09 Nov 2026 00:22:32 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQD9Z-0000000Gx02-0piA
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 00:22:31 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-4ada9579947so203616fac.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 16:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183748; x=1794788548; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r0Wktv3qg84AghHEx+Ox2jLbCSIyBPFOaRI1XPUgVtY=;
        b=TDEqNBVraKMizYHapeqdQ/1qOpLjIqtqkYKRX2DlExjVRmE1ulx3NYK5MiZbV7Y2XO
         DSCi659gUbSSGAQAMLjRZ5AMMagEfag6FJMnjM3glmb6L1f5ykbMXiLt2xY4n4FZtQsy
         lzfSN5iqDb4cIRy799ssoCZ1T9WDN2HTZ/SQ/yP3GpGtA2xjHICwDM/P1JV+s3Yek2zd
         Vx3v02V0IP52t/b/a8MLJW/VfLvZvnd9rx37P/z9f3A3F2Dy5N2FtzOHfZfyWyvLcxb4
         YDLQGBpUj3ZKcBMQbSKLhCjGtGj5IPi4zJfS7NU7+k+fh6sUNbst/H6R+NVfYlc9kFyS
         d1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183748; x=1794788548;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r0Wktv3qg84AghHEx+Ox2jLbCSIyBPFOaRI1XPUgVtY=;
        b=ZMoQRQ5odH9hSsPXMY6Wf9Qmq3STRn7BWv/HNPljFkJRZTnqGmYxDIILg2lgtbKTQp
         4siEFwC6v0LNhrzBOV1uxdIc9VzQWy+wsE8n8MCSh9ivB7wCtQTsohfEjESE2qimVzu9
         VE6JU0Mt8ifWII9PkShS8m/NUlcrRvDUDvZEWx+ibx1Nu/RGCy7MO4tHmGtvLqDupflR
         fBGhrKZL3SOZj9lyFu2s/igd8C5t6XwfBKOF2jmAKdakfWwph/rBOlAYcSXFhuA0RBhL
         hDdtlfjdI1f2/sj6cLJhSArylGRgqT2Kl48McKQqbBF+4VknqSaCgsthBRhPQAVr62IF
         n3eA==
X-Gm-Message-State: APuU4Z/H8F3en5Xwkl/jOWO0nJ5SNDXs8RmHSpzjUxzd3iPwW0r+akbt
	t4e7viBKzq15/drQwEQmVOP0YGvxMtDs3IDd4rbYcQ9ZqVPl8Q9xkm2MB+XaOg==
X-Gm-Gg: AYBFou1nisRui6xjf/T3tQFcXuaYugDoqjiTQu2A1cABqrqR/eFPfkjFxNitRZX/XKY
	zcWMT27un5Mjj+XBepDkl/TwXnRdzHRuoTEWuNxdlPCPLewjGu9CHyPT/3vfrcDGSOMCr8Du9As
	B4HfOYbYOqwOQ76ec7rFgvYmYqB1rI4JsKihBj9gSWxjdsHiSrwzjEqQOqIuN2ydY6WCay/siaT
	uSbbZRnXDu7ULJgR/dKBAGm/yMLULS1PDWiHmPN5vLgk4WFl2OI8wjXjRPBKJgh9VGKf839dVUD
	Rgoiwa7CFGZ9dI4ASZdZmURpH0Q09I8/ysW2zIGxMSml4cSg2hHs2QEOQuWcnDzD7SwntQa89DV
	ENQRXMxD4mJrUYoBgdVWVq/xwApiVRTe1eO9JTumO1t4I50imCxmsf5DHS5rfSzUsEOAgynnwlO
	eAN865btm6N1j6FgkRmnV4yNi409tMQ4BIyKurx+HdKa9o38KRJfgbkD/OUbNCb1VPT284W90Cf
	D/cuYQv61ErBojhHBxn2jHFerueGE3abRLXVsvAHIy3pwUgDjoPoFT20DJ7MHC16qzuklVnZaLK
	Fb2wFzcyY0aaIx3s/2P3uRtrdXGiPC6MDJrSoSNWmLXdke08Mx3IjEuQW+hW1m46cENle7dvK5w
	WTlJ27GNesJjAa3pfVfla9Vf4+l29S1zFzcTHw9hGRBLSzLV5FuWvb1V/DrNbA4jquWpzxgbLEC
	0f3I3NsBRhlcC/CSSy7CjRLXzy7BY2Mb5Jt39nC0tactg7HIQes2Q+CA==
X-Received: by 2002:a05:6808:5088:b0:53b:6f4e:5176 with SMTP id 5614622812f47-568147aab31mr1788815b6e.66.1794183748050;
        Sun, 08 Nov 2026 16:22:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm3091574b6e.16.2026.11.08.16.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:22:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 17:22:18 -0700
Subject: [PATCH v3] mtd: rawnand: r852: preserve card changes during
 detection work
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-card-detect-lock-v1-v3-1-ea9e5411314d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOSw7CMAxEr1JljaFJSFtYcQ/EIh/TBtoUJaECo
 d6dpGxYgmRZmrH9PC8S0FsMZF+8iMfJBju6JPiqILqTrkWwJmnCSlZRWjYQ7mqwEXwjGGjpDRi
 MqCP0o77CRKGmXJ2FNjtWKZIoN49n+1g+HE8fnRCXdJKxeUPJgKC8dLrL1hDNxkmXGj5innc2x
 NE/l4gTzZzf06SiIATdYi22nJW7QztI26/1OJCcZmJ/8ljiIWeCKs2rppTfvHme34OJmnRQAQA
 A
X-Change-ID: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_162229_283745_179798B1 
X-CRM114-Status: GOOD (  20.72  )
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
also change card_detected between the worker's registration checks and
its media-property update.

Hold irqlock across the interrupt mask update and leave the mask alone
while the card is unstable. Move the transition to stable state into
the locked card sample, and return that sample for both of the worker's
registration decisions. Sample the write-protect and media-type fields
there as well when a present card is not yet registered, so a later IRQ
cannot make registration use properties left over from a previous card.
Keep the properties of an already registered card unchanged.

Keep registration failure from overwriting a newer interrupt's card
state, so the next delayed work invocation can process that change.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204068@kernel.org/
Closes: https://lore.kernel.org/r/sashiko-outbox-204135@kernel.org/
Link: https://lore.kernel.org/r/sashiko-outbox-204169@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Sample media properties with card presence under irqlock.
- Keep registered-card properties unchanged and log the sampled decision.
- Link to v2: https://patch.msgid.link/20261108-submit-r852-card-detect-lock-v1-v2-1-e3251bc3680a@gmail.com

Changes in v2:
- Keep new debounce events pending until the next card-state sample.
- Use one presence sample for the worker's registration decisions.
- Protect the registration-failure update from newer IRQ events.
- Link to v1: https://patch.msgid.link/20261108-submit-r852-card-detect-lock-v1-v1-1-5514e7543209@gmail.com
---
 drivers/mtd/nand/raw/r852.c | 78 ++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..dbee043e6d8d 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -554,18 +554,28 @@ static void r852_engine_disable(struct r852_device *dev)
 }
 
 /*
- * Test if card is present
+ * Sample card presence and the properties needed for registration
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
+	if (present && !dev->card_registered) {
+		dev->readonly = reg & R852_CARD_STA_RO;
+		reg = r852_read_reg(dev, R852_DMA_CAP);
+		dev->sm = (reg & (R852_DMA1 | R852_DMA2)) && (reg & R852_SMBIT);
+	}
 	spin_unlock_irqrestore(&dev->irqlock, flags);
+
+	return present;
 }
 
 /*
@@ -574,8 +584,14 @@ static void r852_card_update_present(struct r852_device *dev)
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
@@ -584,6 +600,8 @@ static void r852_update_card_detect(struct r852_device *dev)
 		R852_CARD_IRQ_REMOVE : R852_CARD_IRQ_INSERT;
 
 	r852_write_reg(dev, R852_CARD_IRQ_ENABLE, card_detect_reg);
+out:
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
 static ssize_t media_type_show(struct device *sys_dev,
@@ -599,32 +617,6 @@ static ssize_t media_type_show(struct device *sys_dev,
 static DEVICE_ATTR_RO(media_type);
 
 
-/* Detect properties of card in slot */
-static void r852_update_media_status(struct r852_device *dev)
-{
-	uint8_t reg;
-	unsigned long flags;
-	int readonly;
-
-	spin_lock_irqsave(&dev->irqlock, flags);
-	if (!dev->card_detected) {
-		message("card removed");
-		spin_unlock_irqrestore(&dev->irqlock, flags);
-		return ;
-	}
-
-	readonly  = r852_read_reg(dev, R852_CARD_STA) & R852_CARD_STA_RO;
-	reg = r852_read_reg(dev, R852_DMA_CAP);
-	dev->sm = (reg & (R852_DMA1 | R852_DMA2)) && (reg & R852_SMBIT);
-
-	message("detected %s %s card in slot",
-		dev->sm ? "SmartMedia" : "xD",
-		readonly ? "readonly" : "writeable");
-
-	dev->readonly = readonly;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
-}
-
 /*
  * Register the nand device
  * Called when the card is detected
@@ -632,6 +624,7 @@ static void r852_update_media_status(struct r852_device *dev)
 static int r852_register_nand_device(struct r852_device *dev)
 {
 	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	unsigned long flags;
 
 	WARN_ON(dev->card_registered);
 
@@ -657,7 +650,10 @@ static int r852_register_nand_device(struct r852_device *dev)
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
 
@@ -684,23 +680,25 @@ static void r852_card_detect_work(struct work_struct *work)
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
 
-	/* Read media properties */
-	r852_update_media_status(dev);
-
 	/* Register the card */
-	if (dev->card_detected)
+	if (present) {
+		message("detected %s %s card in slot",
+			dev->sm ? "SmartMedia" : "xD",
+			dev->readonly ? "readonly" : "writeable");
 		r852_register_nand_device(dev);
-	else
+	} else {
+		message("card removed");
 		r852_unregister_nand_device(dev);
+	}
 exit:
 	r852_update_card_detect(dev);
 }

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
