Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE316074E66
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E7B7cb4a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=A3KJn57d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tj07If6u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wbfC38cx5xZfVrAvJI8IOR7OyImKc+Mf1TPvHLc0vak=; b=E7B7cb4agDEF3LjB4W6PkpkBOq
	peeyiDvx8H5HzLqJZHrKuq8AoPY6Vj22HLMlINyaEgQ0oISnZJHmhuOkza+9FS+F9JCxizZKzCtaQ
	WOPjE09scg04XsVGgJyd+KmVe65b18qzE6IWRnVg4HfT1xTE0VMuPhuG03zNSybXh0Gi7m/o49Ttc
	D+QkthrgCjaKkI/pEAFALi04yk1B43a+e3dJ9pM5oZKFnT0WrAGHFfREWwI/vMJ92ydO/5trRX2i6
	AIgRRzLfUmiooRqORQmJtkbQ2zMm7CCzktqVwSPBZOXM/brmA3NtDhTPLbFum0pz7NtGcAW+Np2O+
	uGs0Orhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdc-00000008Nmd-3Cuq;
	Thu, 12 Nov 2026 01:30:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcx-00000008Mbm-3Piu
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=; b=A3KJn57dUSes+bWZ8DJe4/+jli
	bEOeiViqO33y8DI/icKigjPye+XIb03zZtdfK9e148UieMx51Jbieqbxsv/CqNWidQ5/zDMMk4p3j
	n7aXiRCFhBnI12GUaCT9UR8D2OdhN+BW/4TzY4G496bFQGQXRyOR4pQrsO6wjjcGnx9JkJxohNEjW
	2OSwvO+c4RWHkbMysvxhavKnWBOfB4nUWTKT7i4cjM44AotPN2U5iYlG9UOJ6fBNO6oBtr1moJwgX
	fmOPUWCcUJ0TgvpRHwa7IU1zjLDpEOpkaCuo0PQYY6u2gqmWWbO3XL+twi9VCpi98J9to2fJhNhXR
	TENN5GqA==;
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcv-00000009mvC-0tfD
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:22 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4ed6d69bdfaso2359768b6e.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446959; x=1795051759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=Tj07If6uAwVxAq/v3fYpNLzWX4sevSYUmd9P8IM4iSJ9UTC/d/RtV8ff+1VjKWdIKr
         361WPl6wEOscwB9uTEB84jLrmEzqVo3fCjIEaipy0YZBEd9KhFJHyXt3fTObwu6m+MQx
         CNFIod0XZ6/ObEc8pC6Vs9SqfjbmF91OFA11HDr6+r8Ix0EBsiKWgYxJi6cL1APaQ2ar
         e/qalOT6Bl24uzYf5ETTCPHmXk/hh/LlQVW1bLu7sNyra+riM8/D288foKq4q3Dh9in3
         1BBwVA36bTCR0QZ4NaHN5iaH40TtXXtX8TxRBcPk7mLKMOeQMtrv8dSnDpvqW07qXdED
         kLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446959; x=1795051759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=djGkLhFNkgkxcGB0IxiCyTw+MnohTnLGH8XWVJc70Aoi6FDOVY1dir14dB5EAfLRrs
         Tyd0h7Hadkmz+hltbN95uHXIYow3mVnTBBjBAk7Y2K2NnXrQgZPfZO7ajchBjizWliPl
         16n42+JvjEeiudXeZJH0uqoaLA0UsC9O0XdoPtCMgVKUzTl8Rm18vR5X19sKLDcPmwXZ
         cguEkl1V9/nIF5IdF4xQ4WvxHl7MeiIGqoWVbfwYudmRPzo7nitFXBsaK0r+H1Jbi50g
         Yz+9xkx1xL11EovmCLFTW/LUX/CkE4ArdVeDvsRpsOzPzvKCwrxh0s2bY5j/6YBAT8JX
         bHTA==
X-Gm-Message-State: APuU4Z80EUnGzEawGvomp33+ef1KrW5SS5LOtBpe+IfKrdG85QhviQ9/
	E4HrgZ+avcrPR5ze+2yUzv+6lj2TEK+R7Fgc2q5WbsZNZtbpme/4XkI2
X-Gm-Gg: AYBFou3kjZCmB7aW1sTW1nfZlKv5yn9u+09Y5s0fzG3TglgMEkW/3tzLfqo80yUOmgW
	QrDF6ETAdQ4Ug6cq+LRpCAzf6JebwD8YZkgDyfZ7ytlEHBtWiCRQmHYQ8OJ7nRfnonA3rMR2TXb
	7RCL6EeNViitcRHUn1t4CEwiO/BX4XOTqOUN8i4Xj1Ux+oT88XQYqaKx/aOWBbBYa7LtVnUHEfU
	OjrCWwbQrVIZUghCit1TOGYhxq0c22wlV8q/htwN8uF7vLMiQNbBLRzMLeZJNzEtj8VeC3FEULk
	VUq48uQz35vx//HX81qI04h8pIprRVh9LtS8eMKtLO74+U5/6CdorRqWPzhqKwETBgxMdW/sMOp
	HuYnNH5+MBDrrbby5JdC6xPulKUqfii7PllvclAQpeOzCd5zuJVP7yYg3UPapBMSsYBALZehLoI
	iYufrEidvdHUcOU4QbEQSCS9zj2fNaxM5oVoZR95IRckP5uyvAF+3mC1XJC1xhrUI1Bc9THKrj/
	bA7OY5uj6Yt/ZqCiUouq66mMIK08GlBcV6s6v5xZ3Yxb6z15oHUUKzJne7GdyY/mNzW4WId9yOW
	7OlcvGaYjwo+O0Tn0exFaAL0Z0UQ1FMFunKCjwSYKVIZ4+b5+0cRB57TIsIc1k/scHKDTItORoB
	pWusQKzQBxclN7gQxXzzvRry0OdXwplgQ+0gQEZWgP7G7t9l8WIM4NXC44PKqfhWPLGwEwViTGG
	LdByqMULVw6gBuPGk/ZBlBGEL+k5ybrv/VhzokwMre5fopMHRw2G2t
X-Received: by 2002:a05:6808:1a0a:b0:564:3b0b:fc11 with SMTP id 5614622812f47-56b961931efmr3867926b6e.19.1794446958924;
        Wed, 11 Nov 2026 17:29:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:25 -0700
Subject: [PATCH v3 46/58] mtd: rawnand: lpc32xx_slc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-46-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012921_189609_5C74AD1B 
X-CRM114-Status: GOOD (  16.56  )
X-Spam-Score: 0.1 (/)
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

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index f75ae484ce86..85472c3d4a40 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -829,9 +829,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, host);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -862,7 +867,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd = nand_to_mtd(chip);
 	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, pdev->dev.of_node);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = &pdev->dev;
 
 	/* Get NAND clock */
@@ -915,10 +920,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +955,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +964,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
