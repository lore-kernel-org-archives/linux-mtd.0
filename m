Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281556074E57
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jLAy0n9f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MmZZBYpM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ir/4xPAd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kb9sjQrM4echU0jxgsjM2ylGN2aj+HCkznLx+kAfqcM=; b=jLAy0n9f1IvhRg9iLm10JKf+/K
	LFerjSri/dXwJ8nGqAsGLXuyRlk9+uL0ewESq4WwCvfgyhDVUYjDfNKGMC2Y4cbEF/GKxQjqYY2XP
	IrxpBCLyMVx5zxvmvQ3AJ7/CRyuIwlUy+uDu85Mu6sIdXWQobh95eDBvEW4gFxtnWcFqrCsgGTD1D
	MUR/vfVedXhJo5LEHgBywGdNeWHq+yx6/5VkD5VatoValgJBXJ2dhehEb6AGpQ9c/U5F4/LW+UaL2
	6tWNfura7pGH9zq76h99bRY2yqVfm603hrFXXzFCSQe0lLSBmJM6dd66m7c16K/QSR1QNWiqSN5Ul
	jannJq8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdD-00000008Myf-3WcD;
	Thu, 12 Nov 2026 01:29:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJck-00000008MB5-3emm
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=; b=MmZZBYpMR93ohiZmKN1fXWdWPf
	/uSPxxgIU7QgfwkTpcGWUvz+ppu7lsmYKrhSW9e15GC/ybAEEP+sh4TH+Ca4Jhc2HbljvhcSmfzi8
	4wIskebafJlQU9PTptDprgCv+3Ye5mEcN6sJX5Cn6hNwOOb6LmxvVnXSmPW3cwo4zSt9PBQGhwXCr
	AZfoaKDKR7wN61jsrtDTzGI1rrCYk9p50qZ86X8e0jq60ddC7BcCNCcK0pLtyyvV2blMaz1MzS0FC
	ibYD1LzrnZOKyTB+LOELMQPWy2Esef5MZMdOPSEh9SkbOKDBwNFea3veyMB0Hg7Kx1KBkjh8OV9yE
	+C9ntpuQ==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcb-00000009mnE-32vP
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:06 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-8439fe796ebso2448521a34.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446939; x=1795051739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=Ir/4xPAd2wEdoFHajQew8Wt5q82tf3c7OVWMrFX6YBde9tZSRVLmg+FxR2sRo+5+uE
         Rgr1UAkZo/GlS0Xsy4fW81r1EVbHxvSbgWV5TQHf/niYc65Ft6oUM9bzepSHKK7WGdQG
         +PM1oL658wH0FJlN8c60JW1mv2D5AL7CD72zhhsgzhsNXXqslymVs25X+uC+NiZ4EKKM
         15h8aq43W4XzyPVY/ElSleH5njtcix2MDwAYVOS4p09TTjB0JSfpMQQk4FEl39Anh2lh
         NcZqNckkS3mwf/yHOivjEpUDPSKujy5EQbp+uxyC6BY2HXQxdx6eMgv2J0fWZzTFlIJp
         lnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446939; x=1795051739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=YwW1R7rQB9EhFcsWSnu3DEesTG7m/xjwU126nOcbZJT52zi000+J5YI+fwli97h9Qz
         Wks+dbCTfFPZVpS6oFkrmr1g96Zr7WWcec3rQjMotN8BOQbtMeh54DYSOaB+XForBzas
         hes94Fs+YLG7YV7wSYt+cnDYv9IDOo/Esl11VY1Jh9+bCaKsGsR/VFkBXRFZz4KeyyPc
         /8X28dvHgbjFSxIney/6hqu6ClMBzVB/u9ume9jXwqrK+/fh6bezhUdGQiZRhpe9RXce
         SY49idR6krNaqpXzVynA66kCOJWT3qBMpm/fp3NaCczaScml5f9nbcBN80H3UMP8kxbG
         Ws0w==
X-Gm-Message-State: APuU4Z+fYbglJ0WqGVgzJbnsB1lV491LanPn+NzBcMJp0RioaglRWcSX
	eo500p1LdOOK/10Ox81+0CazRrl8zqjZ5dxzp/QVv1iG8Gnb/JX7o1Fi
X-Gm-Gg: AYBFou3scJHFikFHErtCDyKr3qui9YpsmBzV65yYCtg9DXg22+g95oK7iTPKe5nQKCy
	22HX9xzKkyPJq+NWHAYMVVYjtteCXZSp5gTflV1y4Ctd7/WTsXJAuH8/bUjE3W77pWH6/obQDSi
	AN7XVp/oaIkkSCKUig/BvCAiwxH24qcmDCLl1JwH+Ij3IP3/1+ITXZJqmdTKsqXJIrrEbQjWgNH
	C6tpCxdPCxofr1+4iQImQiANi/J8nKwrmpWkhCTPXQDAevF6dIWSQZnwfwn+XVlNuY7hEvKX1Rj
	nou96ZQ6yHecKd3lHuYrmhyudZUTK1bDAiHCnvkivQ1UJeZICArmbOq14GBkvE+LdU7ZdOXwVqf
	DD/wdTI4SqTRLBbE03Js0lFME6TvlMAHAHBwfAtH2vhpg5yWeXHuhaXhIpoZjdmum+aMRtF08tZ
	j16H+nyPmKDk/cFM5CyX2tUCkChZCz/5o4gBYMPy51DO8x614zZcrmGx9iOXUr8NurJCZTqnNgS
	c3W07RcoPUBOchOKcLQ1e9H9NCjwyFapaOsxc4PFxpXB2/jd0tVdXYhH5q7p8+9NXdq4arE26qd
	jys1DR7FQjojowBQPgH385obeSQw/c+ZHCEyuWfO7YSX1Swd4ahoWeY88Lsh9FOlvcu5Y77xLEX
	PxOAxY76TkcOxoUgkDnOyU6yXeRf/1PszLZicps0Y+4AQZa9BB/r6mraLyCA1hcZltcl8MUXes1
	vKR6tJ93zw/tix2A/BZ4e04FISkKLPlNdcGldfl073qvkF0o8lGs5SNWWq1g3nyYOi13gISB+ib
	w==
X-Received: by 2002:a05:6808:1a09:b0:53a:ad3c:17aa with SMTP id 5614622812f47-56b98620830mr4057105b6e.55.1794446934468;
        Wed, 11 Nov 2026 17:28:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:02 -0700
Subject: [PATCH v3 23/58] mtd: rawnand: ams-delta: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-23-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012903_933854_DADFC58F 
X-CRM114-Status: GOOD (  15.71  )
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
