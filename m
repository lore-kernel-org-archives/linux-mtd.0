Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3B9606D811
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mdhdohAr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BAFgFcrG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5lcR4x63qPyoIov3tQAEgyZNYwEuChOEgPaMuuIrVKU=; b=mdhdohArLgy50BKeoWZCcVYbj7
	95EpTm/41GQXtgNSFlIszazMIOzPnis+AS+xCBzPJIksBConeGO0O8DMC7t5XiNdwiD2f3JJP2T1z
	v+M98U4bxtwaT1rSPA0f7yWI0ILqmXinSN/rJeJmT58FxL7/liTpdLCwP9XNzVZ1a7wIOOuLfyzAY
	SZ/lLrQrWBHb1532uzxs+b/pitpyd6Jm8VYNvwnhrqfoZRzlr54xr5B9XDxFXTpstbQMAdituILkd
	QZTOUdmND/8Y3NE7FM014BxWqEZflLvpnVsVBVs/bAAwUvBYDmiKgAoR5HMySzXOVbrzdjsLw24os
	KtfCwMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA3v-0000000GfEi-3lRE;
	Sun, 08 Nov 2026 21:04:27 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA3t-0000000GfEA-0HTC
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:04:26 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-49429181ce9so185059fac.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171864; x=1794776664; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5GT+YOwt4Wk5UaYozi9TZs9C5IMfkSYjhBBTrIEYhmQ=;
        b=BAFgFcrGJ3bnMmXKkXB6aDctCWqvoufFS2lMYXC6+uABiLhBHdSM+vmh7QtlGyh6nX
         AbulZ6rspzu5iH38Coulk5V1O7f9N1w4aUdvchIec0q6VG54wL2PCfOeXpZ1Zdw2VaQC
         4aAjt2OhSYSsk6/5rJRvBjmGN540XCKxr2YbLXHdAdMnQIA8MT+TUsUIt3zQq3mmvg0f
         FHL84QeilRtuT30E5tFbiJgmkASzXLTJDxognw9PbWMnhxXNE+KuCpp3n8W8bC6NHtXM
         9WoJfITEl3eDFu2ZybnzMawPODX47CqHAOTFQtyOSqKqjgH5U8Xbj0LhhWHwu7RB/Dvj
         Ql3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171864; x=1794776664;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5GT+YOwt4Wk5UaYozi9TZs9C5IMfkSYjhBBTrIEYhmQ=;
        b=rMX+ANi9rDskMG0a1K/X8q0iI8CbRE55ANqWuQ2C0hw7iJRK7zULPNDZkcBp9FqpH8
         1adGYN2o+q+UFJcIWPhDM5Ns0SxRULG1idxOnTMnSiVLa/XHzpNDVVkaWOZlGfStTMAm
         tJDIwWs/QWA4xrTSZeSQ/BBvvFePBOfWA7GS7Aw03zTCdNIUYmWsO5ZfX0zzR1i8Lrza
         561v8WYwbbxjGjqubBAVgrGeKPx/BJsm5mUMwJlM5uKIiXZxK7d7/ESt/aiU8D9t8Lx5
         sD3bwhKe+j3/OcafBEVupt1jZYs3ZhjK9y023C1m9tSUTW9jPGqle2i8aJ6Gt8l+RRQo
         tc6A==
X-Gm-Message-State: APuU4Z+1B6nZRxLbkxdJfZ9nmSimpf1UHfwHEIZMZ3SXuy7SVl8XloV9
	3YlwZtEtLv4+DXSPbMWgDQqnYAwkuROw6Z+d7SXB9rxVRKwwR3z1JKEP
X-Gm-Gg: AYBFou1nVnhjBA1iHHY3my6+V7v29b4ex3xRerGO/EHN0+KkZcSDi9cWYJrBznOruRS
	mFVoZElfu9MaGvcC+EaC8mozznxGjzW6y1ch9R6ibdk7WA6573JdKKpnufe35mdpt+bOW21IPgT
	bwCmprE2i2OEWkrndlEj0ojvpMYBqrONsKKBuoZYqAgLuVO9SftjxGeP47jhD9JA0nm/jxFL+Hd
	087Q9P5qcW3u8UCiqyx0AaIKrylnx5E6JGAbOGrli9fPKqelW/ZoYYNgWAd78U1N+M32ZXIbrXR
	+C4ElODqU78DkzBcKtX5A28wu3xWhXBSggcX/tCRGcD8pbBu4oWyTXQ7/EPXeGaJxDC9JSkLzcW
	05NmNmrdvSUXjUPWJbZUyH6hu+LHIZUIvtWtQLeoyQy2XsqaowqyLrWrdmsxxxSKxFCpz6UGa0e
	tMFTZ0xISx/0EBt/qKDznewuFvMtFqzKk+QHIaZNjZOiGuztkuAWv7n3F5BzEKysmrKHIxJn+AK
	VOy1Wg7Y5GN3Gc689YH9lAG4/CFeLlkUx911IcU9ERwn8+A4xZLRIYX9CEs8KqYN+vktxKSARvX
	dWwWj3AJiN7/HALnZOWhnV85Ks+SfE/Mk22xE9wrUMSexMbNiQoetX6J6b57pLzJhxH3C28N3V/
	UGm4EoUuLiJNrYDg2X7fdfDNErzTcqBf/cK1d4eMIyIXlnU9HOcaI2+uQ30INndTIlTz5Fpilf/
	cGaXxWyJSvSADd2dmHgOp8JVwk2PD79knNvjhxOwfZsJBryE5Dzzl/
X-Received: by 2002:a05:6870:538b:b0:49d:d617:b692 with SMTP id 586e51a60fabf-4adecb98a9dmr1074710fac.49.1794171863950;
        Sun, 08 Nov 2026 13:04:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm3597440fac.10.2026.11.08.13.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:04:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:04:21 -0700
Subject: [PATCH] mtd: rawnand: r852: prevent card work from being requeued
 during shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-shutdown-work-v1-v1-1-8e448ad7c54c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2w7CIBBEf6XZZzcCltb4K8YHLltBU2qAXpKm/
 y7oyyRnMnN2SBQ9Jbg1O0RafPJTKMBPDRinwpPQ28IgmOg4Zz2mWY8+Y7xKgcnN2U5rwHWKb1w
 4cjkQa+WlZ10LRfGJNPjtp78//lz+LzK5OutCq0SoowrG1WrM9hxUKEFbhuP4AqcfqoagAAAA
X-Change-ID: 20261107-submit-r852-shutdown-work-v1-15fe04537064
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130425_116867_09169178 
X-CRM114-Status: GOOD (  12.63  )
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

The card interrupt can queue card_detect_work after shutdown cancels it
but before interrupts are disabled. The worker can then access the
controller after pci_disable_device(), and can enable card interrupts
again while processing the event.

Disable and drain the delayed work before turning off interrupts and the
PCI device. Later queue attempts are rejected while the IRQ handler can
still acknowledge events until interrupt teardown completes.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..bf1c1be7f2aa 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -1007,7 +1007,7 @@ static void r852_shutdown(struct pci_dev *pci_dev)
 {
 	struct r852_device *dev = pci_get_drvdata(pci_dev);
 
-	cancel_delayed_work_sync(&dev->card_detect_work);
+	disable_delayed_work_sync(&dev->card_detect_work);
 	r852_disable_irqs(dev);
 	synchronize_irq(dev->irq);
 	pci_disable_device(pci_dev);

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-r852-shutdown-work-v1-15fe04537064

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
