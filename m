Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1035606A335
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IxcwqTrE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XczcSEvt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jWGwuHEb+Ngt57b0WGf2kl4u67ebXpfJrREzqg+Bs88=; b=IxcwqTrEHK0EJt9h6wJ4bTtvGM
	X0snqExOHB3rmdPpqPz+JCK61k9ABiTqdYfIn0u/sLnd2K74nC6VaJk8+DUwYW+8qdaa86DqrFLFA
	4/fSMpQzJW67AYYeAZjJ4xrzfNhUR3QmvHLPvxJk/nExGJgNJnmUnrrettHM9NkFQqd0BRnJ6w49G
	7sltqv+gzzHhbskQm3W2tGpgl/XvqAStZvsk8lvYYBViWtsD9Opohsly8HxvGG0W48HFTjiXMYF5j
	t/jWdjJnkrSg5dy/9QxkVpbYvSV13dVHKYiyeG8d5/T+DyCaepjs0bF7jQI1RFi28DEhm66qLMgNJ
	aL1i+Apg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBWc-0000000GpiF-2xXY;
	Sun, 08 Nov 2026 22:38:10 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBWa-0000000Gphd-27VR
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:38:10 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-702dedeb70dso142978eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177486; x=1794782286; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4DfEflGZqUk73zomQ6OOIpIEFcB7FUkB70foIaWoQCs=;
        b=XczcSEvttv0lFrvY8L1UNIKffk3MvVeGhNkyCZCN7+JK6rqYb1rElc91Yhfh8a5me5
         r2iRenf/gDCFwPxBsGKW33UOyM/Hu8ZJlN2HG9bghTHaWcO+Q4mXj44Fo32Xviw8ZLK3
         avRPHcV3DiycmccakqMB/35jhEiLAtSNpO+5ppaXDUnT3ZCvaCU0R9Mr0kUCS7rI/49/
         goVFcqAh8qfNug4CW9a/hGZaBU+3KNn+Un4Uic93XEFXDiU1qnF1gNtORewx5vLBcXlV
         zLpdprsOII8txQr0PH+JPyMf/5Zxedwf58amOIDWnPrsZNANtGl87kP16LPaTiDRwRZI
         ZsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177486; x=1794782286;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4DfEflGZqUk73zomQ6OOIpIEFcB7FUkB70foIaWoQCs=;
        b=T2HW6lfEWpRzQoTDRVUo9EbaZbU5dgDyLEehKoOFK20NW7SAYr7/KTL/CyEpVr4MtL
         Dw5kJoZUyUH//+0wFfqeW9X2u53SpMfNMLWhyzY4C9uejZ2KhKQU6q2dE3yuHeLCvSux
         qyfouoHMkJ0ox8iME04sl/1naYuXEgIni7Q6NEgwGaKbrlTCAIUbsE2kHagQarg0u6eg
         aiD2PBRzYNwNRvqY6eZaZJu5+Kcm15BMDU+YAA/qD32929jMx7I9CBCaWsniWKRKr1Dn
         Be3t4dYgYrPdJIt7NCHTZw+w4MI6VZXjvI9leUlQDYi2Oz7umtmLNEfXBOkzQ6WuPdL/
         PXVw==
X-Gm-Message-State: APuU4Z88jS53W+6reOofRwYC4R7Nyg/FFVrnhc2myd5o2qKcmDcjzfws
	08qH9l2t4pUl/Grt/83o5Dx/wcmBA3VmUvss3OHoJmO9tPTXqUtj/8x6
X-Gm-Gg: AYBFou0NBXqA2VGO2uK4d2QBcEUZXUwwLDHHEhdWNx7krlYDHwWFryWRlNyQWONfbID
	tVYc7xgYCIs0XZ8hTfNJGr0qD2DVH01Aq18sMUf7JdIvWX+zgWpnq8ClBhFPqyCKeitm8F42YjY
	dLU0eKbDAov/AF3+xObqXe6W8uuU9s2YbO+CToqOduOgs0Gd2ld33XBXCZlnJWx5NN/vmjpmrLE
	v6SYv5HlFpg52e/YVCdYqdxjIA3bXU4lDBuMg8EkBAEfvpzITMMK4aoUrn7T0jcd5SyoNTBKZBT
	E0dPZ1y1bNWeRf6Z5dtQnpK+Na6lWpwPIAcZShTf34kXEnvtE6VK2qH6nY/+oWSCZSIRHIhOBpe
	CAbhUEFk2q2jiaAQqbjL4qVsv81wHB+DlVgC8nQrEcMsFML+2JbH/TPmJtsHKAwsrb4czjLndlG
	2fbvX2OamKTek7BhplZLav5RPtNLsLMIV+hE5fKC0DUOPQfmtK0rmAIyGtBTN3bN3peLmSBTFMP
	r4FFjKPqJMZQ4hUCGkvwPx7w/PYizONZdsnHVwELedPaykZbX1Nf0wY/21JUeM3SJ3SX5op6zF5
	Oj84txw2i5uJgRF1TbAonFR5qXA4yz2O0xgjpbfkExUcOkDqjKv5sZzgdHFE8M2Y2GbYNW3SAAO
	OogZ+mF45jKKih7B+WK4V3CrUxtbbYZV7D57rUeq2Ym4E7KfeVOtPD7b1Kztw17hfVpODqEM+SQ
	LmGNkRSoceRH2VUmdugnooEgMCaqZQT3ZGe+By5b9fsVUTRs9tERQ=
X-Received: by 2002:a05:6820:858a:20b0:70b:986c:b0bb with SMTP id 006d021491bc7-7170f285402mr919745eaf.39.1794177486181;
        Sun, 08 Nov 2026 14:38:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8cd359sm2111451eaf.8.2026.11.08.14.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:38:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:38:03 -0700
Subject: [PATCH] mtd: rawnand: r852: lock card-detection interrupt updates
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-card-detect-lock-v1-v1-1-5514e7543209@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN3Q6CMAyFX4X02kY2A6KvYrzYT5GqDLJNQkJ4d
 zu9afKdnPN1g0SRKcG12iDSwomnIKAOFbjBhAche2HQtW6VqjtMHztyxtg1Gp2JHj1lchnfk3v
 hovCsTrZvnL/o1oJY5kg9r78Pt/ufRfGUSdGWhjWJ0EYT3FCiMftjMEEOrRn2/Qs+xJfbowAAA
 A==
X-Change-ID: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_143808_556550_E879E8A2 
X-CRM114-Status: GOOD (  11.36  )
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

Hold irqlock across the register update and the transition to stable card
state. Remove the redundant unlocked card_unstable assignment in the
worker, which could otherwise clear an instability indication recorded
by an interrupt after the helper returns.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204068@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..3ff4294a80dc 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -574,7 +574,11 @@ static void r852_card_update_present(struct r852_device *dev)
  */
 static void r852_update_card_detect(struct r852_device *dev)
 {
-	int card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
+	unsigned long flags;
+	int card_detect_reg;
+
+	spin_lock_irqsave(&dev->irqlock, flags);
+	card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
 	dev->card_unstable = 0;
 
 	card_detect_reg &= ~(R852_CARD_IRQ_REMOVE | R852_CARD_IRQ_INSERT);
@@ -584,6 +588,7 @@ static void r852_update_card_detect(struct r852_device *dev)
 		R852_CARD_IRQ_REMOVE : R852_CARD_IRQ_INSERT;
 
 	r852_write_reg(dev, R852_CARD_IRQ_ENABLE, card_detect_reg);
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
 static ssize_t media_type_show(struct device *sys_dev,
@@ -687,7 +692,6 @@ static void r852_card_detect_work(struct work_struct *work)
 
 	r852_card_update_present(dev);
 	r852_update_card_detect(dev);
-	dev->card_unstable = 0;
 
 	/* False alarm */
 	if (dev->card_detected == dev->card_registered)

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
