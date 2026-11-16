Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C82E606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xZlaLJcT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=prcmrmNI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PvVtUfBl5DavzbtIO7jKSizTLw5xkL5dwhcKRwJZaTM=; b=xZlaLJcTWFI0NeKd7fDM6HG0Y7
	mfDxfezaNBN6HiyOeD7zlCeJ5UMyspiwmliKOUudyIMlh7LMk6NJ2J0ZrDNW76Iglw4kMS7aRi0ih
	Ze9tgGLnfFVVOFcIBfPaaqcq3zWoUqmOIESwHYfI3nVnsJBZUvz4vvUbxsYjjKrJbuWurMD8vhx5w
	j8MfC0WS8fJPErhoBHRTWqURk94KlqfOeHB+InWZg0YH3JjWp0brRxPY3JVU2ZTp+4e0XkjzsfQ9m
	Ye/ll1EcxI3l7qqNBc1Ivx0mRkCd1AAQ2WeWSPadcdhIbQz+DmuT3o3pwZ0A+8VIwxfzt9wgU8AKg
	FyMfNl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFH-00000001H6o-2b8g;
	Mon, 16 Nov 2026 06:31:15 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEi-00000001G32-0gTF
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:41 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-71aed54d4c5so464733eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810639; x=1795415439; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=prcmrmNIQhvvmqd8ydqtxs0Qcxc26D+VF+ziJkxas5hV9SjG1kUA4klfTNWEw2cAe8
         OybaAKhEV9qETcsnTt5ZBWM6BBmGcrYceTCBudFSACdx1VNSnwjDAOmZgLhY0Rav3fhM
         5n2gTijNrhMYivdnERb8ziH8VgAVWLJqPkao0ABIRxbObtE1Xr2ptnXfm+YsLUK6ebNu
         p3B1ZPiOE50Opqb9kJ5o02SAU4O8dQdVpR0J7v5nz/kiiIHVRIm0XujkPP0jMtCLJFwg
         CspiMeMMrTGwy1hfxhCK3sVf3gn6ZEoKWwGlFArg3MgFVrFbUzvBhUVKTq4lqSbHlnMF
         cy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810639; x=1795415439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=Q8hddLyo+Onh0Ncv0i4e+Mbxsu/cIIhGX4gGXwEPZzRfZlWu7jUQjGkacv5BzWE21K
         LUcI/UWHXyC88zfsusvi/9vDGtTCs/GYGtTdPojS/R8nB56AI9JV1gB4fPaZMTD66lFy
         w2rNZEn9YCY84B9Sl8R3rnnq4HXIGdWF5iS1LECX9wNiURVSc0QJefb9+5AH0MNEalgy
         resS995TqNLohFGtIQotcdUBZtwwaK9kw5AVaBVi580IM4cieLnXDS1OZG2Cr7q0x8+4
         Ds7gTnG/exJ1rpBF3RZhB/rw966tQ2di/YVG/AIIQMuijm0pJeGFVhQbDwnKBgbAauoK
         h25A==
X-Gm-Message-State: APuU4Z8/Zi21ebfypqWqt0Hxcw94EG8fLzm/YVkpafhGdd1fVYRvQ7lN
	gllYvyvWtvBWVH8R6kdZm95pi/rOZ8huRHeQZ6A/VcPbjT+LeiHLTkTb
X-Gm-Gg: AYBFou1MQP7obWA/5se6lxLm77J0ET9+VYXBgeqqJefJ7YPrgQaB/efdvC0B0ddkRYe
	ICCFia00iOrMS9ud0hjdOuPjRd6wsNcsIwdBjIaH78Ak02HshLHaQ4gEkbZkFB99AXm3HVcTb0j
	09FmIbtKkAbKQGHXh5aGrHTl2UzupaoCgseJczwOUKh1N6Uu9RkJQF3tFJ2UYHj2rJb/gEcW1Yc
	7+XpmXccRAErEuJWSnjbDew9Bl7lm19DbTmEfjeMltSMfuRzjCLUcP5CSLTPVUmWHq2Ajh7lVOt
	s9JNgEQK33QoODeDa4WpiWtzdBjo+xllim2XxWmZORg3sTnKAg9hPuomSMGxO/Fl5Y6YaCVFo3u
	uZBJ9doqtQpDt/iZaU8ogJFjjrsIbUUAI55TMtAzcU+wfhn+atNRV4Mfn7qZilleAuIX4fI7WAH
	NfTscyGg+5vkSl4fwEzZqftHV+pu0nHyu1EtFZYF7foQWoFnBPTHLaV90j9EyslVA8UzR7PZYjQ
	6jO3L0+KHzxcMCNAz1nS93dclqBDL0VWKgTuQKrNe87Dhs9IhO04ueVDXTaW0iZ1AM2qWMo/2JV
	j/JdaFVWQVHmLije8d+CUNQBDXxkv7GEvVT2sYYHmY3VbsvKeza+irL1qM5wU1lv6TsqH7DoeZy
	g/eWyv4Ne+xyR2kUaALg1t8mzjRA0bmQhZjFHbZpSmRq5l/BYww4I8NhQe0hN/Vcks7OyQOGzga
	TbhJn6Y5KF+HMmYxym2AY5b+6Gf4qgj/cSFzpEuIqiw0Pg8AngTrk=
X-Received: by 2002:a05:6820:f006:b0:714:b51d:f513 with SMTP id 006d021491bc7-71ab4cf6a10mr6609094eaf.13.1794810639270;
        Sun, 15 Nov 2026 22:30:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:59 -0700
Subject: [PATCH v5 44/58] mtd: rawnand: davinci: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-44-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223040_227936_B5216676 
X-CRM114-Status: GOOD (  15.25  )
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

Disconnect the chip before releasing the shared four-bit ECC engine.
Run NAND cleanup while the driver is bound, and retain chip and
controller allocations while MTD references remain.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 17c6fa73f4c3..40291db1fda5 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -919,9 +919,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, info);
 
@@ -986,7 +989,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	nand_controller_init(&info->controller);
 	info->controller.ops = &davinci_nand_controller_ops;
 	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
@@ -995,12 +997,18 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nand_set_lifetime(&info->chip, NULL);
+	if (ret)
+		goto err_cleanup_nand;
 	if (pdata->parts)
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
-	if (ret < 0)
-		goto err_cleanup_nand;
+	if (ret < 0) {
+		nand_disconnect(&info->chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -1020,14 +1028,16 @@ static void nand_davinci_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &info->chip;
 	int ret;
 
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_disconnect(chip);
+
 	spin_lock_irq(&davinci_nand_lock);
 	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	ret = mtd_device_unregister(nand_to_mtd(chip));
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver nand_davinci_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
