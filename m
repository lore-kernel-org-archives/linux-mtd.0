Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1FB606A337
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nXewaFFf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uYDhDXlq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyjrB9i9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kb9sjQrM4echU0jxgsjM2ylGN2aj+HCkznLx+kAfqcM=; b=nXewaFFfqZsXhQqmLOrZe1OQ8B
	j84ad6ajh3IaTn6gi143TZnwUKXqh7tDZVNaWfvAWILx7Sp1ZKbf+ooO8GQQ+ZMeezJk71/4G1y5l
	JiW5s63udMIKZ3N1gQ8iWI4qVkAzHsYtPd7B/E79/Rk8QoLZ3KifLw8/6vJGGXcQlteJPOi6nL8Ks
	yCR+7lFNgq7u+V8575bgcx4exg4voX6BsWuntLYz6Nfatm/awgYTjzkpbPXrkOdsIQPq87QRYd7TW
	GTonFISdzkSRKO48TpwT6KwAx72ndb0XsmHMLbnXUkvzIXq9NDey5UWc2rMuOm7Lwt7lglA+N/pRT
	buHhFWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFK-00000001HDP-3ceo;
	Mon, 16 Nov 2026 06:31:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEo-00000001GGT-2sw0
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=; b=uYDhDXlqSj58lXQoLKMDWR5Skt
	nHiXwxrOrrX2QpgibVO/kT6Bdo17He3QDHXSos2VYf7lUFlSvtpmV+tVW6Kg8LhKLcNYG6WQmBq2q
	QHyKuGhcFkRozxXTJtjILG67pcTMtlFNUDcPM3GZ5DZYBE50Bq79WXCSrPXAHZFXrl24nnpuqhwEM
	Atw1ZbpqXB0nkzYmGRQ2WOzvnEkBnYBhmA7IBi0D0s9A5Rfk8XwtZdvS+ANDHEhxLWJY0D7YiiUJj
	tgakph+B1iSP91d+mAQg1MS064MoOVpcT7IxDaj7hqFWEBfP3no+ZIwotD/DxUtPSJjj7WfcJabZ0
	rW0g2/FQ==;
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEL-0000000CeOn-1vQu
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:44 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6b19e291cc6so3902798eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810615; x=1795415415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=FyjrB9i9IJgDF2WGu6LRL9U5aUb0Y67DFPmWKap9jGHO1yxcw6b8SC/BjDYFItGhSB
         F7+9eNBiBOaOs6MoQ7DPRQD45SjC7HsgCnXeuV5J/karfNmN1xCvZ73mTR0cEuhH8bvB
         FtnMCErw9383NvJIWhjha3AOoy97wqPK45uBybLG31pwzRhqc7dLmcuN9ZnmgbRomfHY
         irqvpDdHDL4xP9NoiM7BjukJEAxy8/g65NeJNj9Czgk/4cGi2mSa0HHEtHtea7DpKW7V
         Nr88t0mxoOba2lNSKaOUJ1poaCMgOUa7lC2etUrFO03JSmojmakHUN0E6asrqI4+pFXx
         lf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810615; x=1795415415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=NV7duCJWMSip0B94jkqRcon754byZIQPXX6cHss1Hxm7EQG0UkmLlzHB10dGHyPlNQ
         492ngiNkxLgfun1PBLv7bRK/9u+aUFZGlQ9xOmFSg+PzShOXsZPCGoqtsydgbuYf2NGy
         jC5m6UGal28ceTVnWXzser0jS5d+Qh4azH2DbOswuDJieVZ8ZURKKlQDjK99XP3evlAp
         7LOUr5BMzg12TwziFC0bG7imDYwymXbv+CGthfLwMDXr6hPkWw+8K4mPhslAPWoF33gF
         DfNLsyuDp6wSA0EvI+vrNbUidxOKs2jE34ywgneFz6P6Y4vN0ifUCQnFA+KL8cs9olKn
         SbMw==
X-Gm-Message-State: APuU4Z+J5x7INmw5X8ErY5/o1RHs6mCwRUpFCJgHM2l5aMnEOay/SATj
	A7W/qGtFl8y0+WzhuW/0xUWnfJz1H7S0ghc3MQuoG99imKzE8WMIeXr6
X-Gm-Gg: AYBFou2ptzsx5eM3YRVlAwUYiCFoQyRCuUI2r/xBYZ8JRV3ebuSt8b/QOSCbIfWixk+
	gxInwvMnQh6dRof7cCkYvccIcpiz2uJHC0ObfHXjyHUyl/yxVIF99fV2KeJCU/ThPViLZ0lS9bO
	Z/A/hbUuD3bn/Sg7FOzWdMVRx9e474bAFU4TNu5kpzCq2bdgStBIMGZofa/pH8ei4P25YE29qMw
	qJ23bTo6m6FQSb6ydveUpyhNvYrb35U+L0qkwVevmAyhMOuu/lwR81Gp1pUufA99/bfJirL6OFp
	QezwxO4uGpOmkqFuhlMi4jq2jKF7FEMNWRplb2c8dBmpO/tCC7UNxMhKh0H/Jv/TwhB3+jibDOm
	iT/Us9k1iG3HtlFDysVLDmUOG5eVDo3fEvXSy9RNpY/nH3+p9dWa9xpJsU9wcHTJCE3EVq/0Jkq
	N6JGkUfq6mAcXizRB8ienZ/My5NzEaC2jFhfpY+4OWK4hy3it06wk2DMlQU96HOsLvXTi672ekk
	3HbQKenXs/gZPbhkMQ/vsj3F5BjLtLCiE5DhB9wGB5QXUPL+kmQGMvWbKs0CXuSsAVSXtogSyB6
	w8gUFpupQCAQzRwWfhNxKhyTF9SOuPkTiJ+wsnOqBU+0IOrs5UE574zJ1bT/OiezX72oWAP55sZ
	jSlgexTi1f16t6KbaMC+dQTiAjfDa6bfNGICmPfu8nRYyCtAEzQWjg2q2Jc48XaWfat+LYM2g6l
	MuDHlRR/YAHPPd+iEMOpuLgnHYGyu0DWpkpITK4tbZUCqz1exGh9Y=
X-Received: by 2002:a05:6820:3387:10b0:71a:fa06:4dc8 with SMTP id 006d021491bc7-71afa065577mr384122eaf.56.1794810615197;
        Sun, 15 Nov 2026 22:30:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:38 -0700
Subject: [PATCH v5 23/58] mtd: rawnand: ams-delta: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-23-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063024_403256_0D60CDE5 
X-CRM114-Status: GOOD (  12.92  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Apply write protection after unregister notifiers finish their writes.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 1afeb38145cd..af3641550b2c 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -250,10 +250,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, priv);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +357,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +383,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +410,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
