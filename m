Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE777606A330
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yGZP9ZhZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=geaE4mAN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DtcCzx1IkwFBV3D5zBYHCsOquRQWnkE9rrE1U1kCA+s=; b=yGZP9ZhZWHn2sYfNf2aXiZKlPD
	tlUbgT3aaVN4o7MLGr9UylWXlqatyET7Ij9JhemFoPEDV6W9aFcvgIVG9vn2qtoE6JEptCHcVnKA+
	6ktwrJhjvEFW7h6O23S8keNJM7pnNn5S1C/RFU2GhRddM0U2WyYp9Si2CtxT/PgWb7J4hMnwZ7K7J
	zzgK93TFdBdxnA7Y/Whjc9bpx/d4X5tAHMUXC7Co60ZXWbXYG4VJ6WmLkIsH9wLbDnfocklBiz59J
	ihEoFj+Cd1bz7KWHs+R/lVm2HvJG+R9dOAw2O8swMEnuUFdTXSNYvG3xyCzx2lPW51w0bajN9MkKw
	OmdkrBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQC5A-0000000GsgI-35di;
	Sun, 08 Nov 2026 23:13:52 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQC57-0000000Gsfv-41v6
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:13:51 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-499f20c7054so157126fac.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 15:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794179629; x=1794784429; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zMgYc/LH+39KF5WFc6nQc4tMwI5XGyz5B8atapOp6WM=;
        b=geaE4mAN7owjDN4j/7+nz+BQbcUptXKQxnfDNveTAAzq/79p7XrGKVZ77ngWt5yUq+
         U8nINiUyK/hQ6/bf2YGb0MmYOc03VmVd3yiRC8Oqlgzf0M2FUFYcAdLDx1h6MommpQA3
         nMT0koBAZggaYBvIaTY5k1yThUq252bWMy+JdrzChBXQEI1j4qVfhdYaPpBXxtjgTKQX
         ITxFH6NnhSzOC+PBq6gBpPrtwi0l1s5JVqnW5qUbpFu0+HYm5IT+aMJUkj1PcemstV9B
         M+ulsMY++cjxDpEgY8T1ZyyQWm2xyfvaXMHxmpLW2MPdA8VWEA/odE0pfWAJIvTtzt/A
         YiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794179629; x=1794784429;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zMgYc/LH+39KF5WFc6nQc4tMwI5XGyz5B8atapOp6WM=;
        b=dyKgvn27y9B1l1E6E7Ns2UlW10Hza9hUkccnL4Tp8HUy7G+XhPGEAFmnfLgjab2FCK
         cc+5ZGmeOinm248xxcBY8qoree9nJyBR15uNPuwSzmEtYaTSx9Lt46npaIXxQumi0Lf0
         kAs/2QhZ1jobOcKx1l4sU4C3zBxTYl0oey3VrxsDItXuMgqLSp4pfJg5coZkM3TwfO/v
         cpg4qIdhDWOBicT5UPtKglnsf0bjqLaiLjEQQzZQhloYYqqz7WvE6pAhFy3ZhS5ypr99
         ueWILYOTGMWQ3eqqeacXfS4Qn73xXAQEBWakGm28BOz2OJpuYNfDfJQIlugxoxWVaaLY
         Cy8w==
X-Gm-Message-State: APuU4Z/6opdslNoiccqOw28AMk4TnC+D0AjJLqaaV+ofsGgzPLfjexaX
	S5fxBInVO4RDhwPt8UV2c1fxz2ctgzyBx6Na8Oq1I4JG884g5oBLGoBX
X-Gm-Gg: AYBFou1nSBaiphG7euk527iC9NBrOPWGCPOvszte63OGWQ/BBhCodGaK1F0Cw7fHYKn
	kcsLTO0o9JCybVUWCMgBYQq0c5mupTSHQKnH/NIa1SeG1k5O0KqE24L9H8TYx5x4FBsCuTsUmn3
	QVminwtRvOSw/Kz098k3u5aYUN1N1zcu8tek/nbDEZRdQ+DRDhZk1Yg+EaBCEEMvsMt/AhRpAUP
	Qvh03xZnWYJNwEoTkIdiB3Tsj6SedWdgqW8KgqssrACDyD+9ryv0cZKTTHKiesCSDJZ+sHE/ZfQ
	EfmhWRxHIaUnxbKvGIAr+U4ztoBo9hlIJEr/5RlwMJvw0bJG1dlu8KwaKq26/8MO1wbKIoN9MJe
	gHXFJcUQFVDtMkf+yXcUW3LZ5wayces0FJ/AitXX1qVduOJt7QTqK9sUHYIoZ7iFk0ERaUTa1k5
	4A6FvuyuLp9YUtStlAoRaitZuGXYd5NZCs2RJu++Jd3GZ2rVvOCOifQ5OyjRyQmfXcJLWM4jqEf
	L7YElBHLA9Q5AFxr8wtZoNoi+6ao0aR04hiD7Uhulir0G27F1f3e1R7q9QP28854/lLJG78SDga
	ZN0T1dTzpbi0B93GdtRiy6Ic+hg1rsfNcAdm3ItGhvDdymXAO9I+vjrLRiOTqEFFPGWmEueLQFB
	RW6vdTfZatx6cCV2lWr75Wntd0f/UUY1oS6Q8Z0p57D1oh5dREzk7g2AGWPglri05Sy7BOySPXL
	qMJYQ9awcDO5SksFFFARHD7ALCYs3aOWvlucLzFkyFPwmHJgoS4SCT7+NNfjqDf/e51hgQM643
X-Received: by 2002:a05:6870:c26d:b0:4a6:f6e2:690 with SMTP id 586e51a60fabf-4adec9a3f30mr1367311fac.22.1794179628828;
        Sun, 08 Nov 2026 15:13:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f24esm3362985fac.1.2026.11.08.15.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:13:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:13:40 -0700
Subject: [PATCH] mtd: rawnand: r852: serialize DMA timeout cleanup with
 interrupts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-dma-timeout-race-v1-v1-1-6b24c6368de6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQqDMBBEf0X23KUmoNj+Sulhk2zrFhJLEkUQ/
 921vQy8YXizQeEsXODebJB5kSJTUjCXBvxI6c0oQRlsa3tj2gHL7KJUzENnMUTCKpGnWQvyjIv
 Bm7NdH3QePINavplfsv4eHs8/q+LDvp7ac+GoMLpMyY9nFWu4JkoavFbY9wPzHP/uowAAAA==
X-Change-ID: 20261108-submit-r852-dma-timeout-race-v1-9b256d202dce
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_151350_044777_1A560A14 
X-CRM114-Status: GOOD (  18.32  )
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

r852_do_dma() calls r852_dma_done() without irqlock when its completion
wait times out. A completion interrupt can finish the same transfer and
unmap its buffer before, or concurrently with, the timeout cleanup. The
second cleanup then unmaps the buffer again and overwrites the result.

Take irqlock after the wait and abort only if the DMA stage is still
active. If the interrupt completed first, retain its result and copy
successful bounced reads back to the caller even when the wait expired.

Publish the active transfer state under the same lock after preparing
its buffer, and clear pending DMA status before starting it. Ignore
interrupts for an idle transfer, including error interrupts, so they
cannot release an already completed mapping or signal a new completion.

Use the active stage to determine mapping ownership and clear the saved
address after teardown. A streaming mapping at DMA address zero must
also be unmapped; only the persistent coherent bounce buffer is exempt.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204135@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..12877dd14683 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -12,6 +12,7 @@
 #include <linux/jiffies.h>
 #include <linux/workqueue.h>
 #include <linux/interrupt.h>
+#include <linux/lockdep.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 #include <linux/delay.h>
@@ -124,11 +125,11 @@ static void r852_dma_enable(struct r852_device *dev)
 }
 
 /*
- * Disable dma, called from the interrupt handler, which specifies
- * success of the operation via 'error' argument
+ * Disable DMA under irqlock and record the result of the active transfer.
  */
 static void r852_dma_done(struct r852_device *dev, int error)
 {
+	lockdep_assert_held(&dev->irqlock);
 	WARN_ON(dev->dma_stage == 0);
 
 	r852_write_reg_dword(dev, R852_DMA_IRQ_STA,
@@ -145,10 +146,11 @@ static void r852_dma_done(struct r852_device *dev, int error)
 	dev->dma_error = error;
 	dev->dma_stage = 0;
 
-	if (dev->phys_dma_addr && dev->phys_dma_addr != dev->phys_bounce_buffer)
+	if (dev->phys_dma_addr != dev->phys_bounce_buffer)
 		dma_unmap_single(&dev->pci_dev->dev, dev->phys_dma_addr,
 			R852_DMA_LEN,
 			dev->dma_dir ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+	dev->phys_dma_addr = 0;
 }
 
 /*
@@ -175,19 +177,8 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 	unsigned long flags;
 	int error;
 
-	dev->dma_error = 0;
-
-	/* Set dma direction */
-	dev->dma_dir = do_read;
-	dev->dma_stage = 1;
-	reinit_completion(&dev->dma_done);
-
 	dbg_verbose("doing dma %s ", do_read ? "read" : "write");
 
-	/* Set initial dma state: for reading first fill on board buffer,
-	  from device, for writes first fill the buffer  from memory*/
-	dev->dma_state = do_read ? DMA_INTERNAL : DMA_MEMORY;
-
 	/* if incoming buffer is not page aligned, we should do bounce */
 	if ((unsigned long)buf & (R852_DMA_LEN-1))
 		bounce = 1;
@@ -209,16 +200,26 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 
 	/* Enable DMA */
 	spin_lock_irqsave(&dev->irqlock, flags);
+	r852_write_reg_dword(dev, R852_DMA_IRQ_STA, R852_DMA_IRQ_MASK);
+	dev->dma_error = 0;
+	dev->dma_dir = do_read;
+	dev->dma_stage = 1;
+	dev->dma_state = do_read ? DMA_INTERNAL : DMA_MEMORY;
+	reinit_completion(&dev->dma_done);
 	r852_dma_enable(dev);
 	spin_unlock_irqrestore(&dev->irqlock, flags);
 
 	/* Wait till complete */
 	error = r852_dma_wait(dev);
 
-	if (error) {
+	spin_lock_irqsave(&dev->irqlock, flags);
+	if (error && dev->dma_stage)
 		r852_dma_done(dev, error);
+	error = dev->dma_error;
+	spin_unlock_irqrestore(&dev->irqlock, flags);
+
+	if (error)
 		return;
-	}
 
 	if (do_read && bounce)
 		memcpy((void *)buf, dev->bounce_buffer, R852_DMA_LEN);
@@ -766,6 +767,10 @@ static irqreturn_t r852_irq(int irq, void *data)
 
 		ret = IRQ_HANDLED;
 
+		/* Ignore late interrupts after a timeout. */
+		if (dev->dma_stage == 0)
+			goto out;
+
 		if (dma_status & R852_DMA_IRQ_ERROR) {
 			dbg("received dma error IRQ");
 			r852_dma_done(dev, -EIO);
@@ -773,12 +778,6 @@ static irqreturn_t r852_irq(int irq, void *data)
 			goto out;
 		}
 
-		/* received DMA interrupt out of nowhere? */
-		WARN_ON_ONCE(dev->dma_stage == 0);
-
-		if (dev->dma_stage == 0)
-			goto out;
-
 		/* done device access */
 		if (dev->dma_state == DMA_INTERNAL &&
 				(dma_status & R852_DMA_IRQ_INTERNAL)) {

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-dma-timeout-race-v1-9b256d202dce

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
