Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD76074E68
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HpQlcIif;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dLSM+WHx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xW8Dchj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0UC46j2nZ8qH9blAdanFnB2/MIHyizk8Wq8bGV7LEd4=; b=HpQlcIifnXfzzQ3z93U1M6sMv4
	oIlJxBErTeswGYwGGh4+Xv2TJqF0G5DVNwvbhOqnN75VHyBXgQ6dlXIffNgQs+LQsLbF+Hz9DB/As
	NA+iwFzL7IAoL1t/8xZXw6alfhJKq7MipA+6SKuxZfTkaw26Eu7QyUMeosEjAfb8F62eagVmxeHWr
	G55EFk9mfL6ei4t60wP1duJR4bSIiFzi34kT6exNkY6XLyUZjGpWSXR/gBJISYttHv6AKHuBxxvXH
	UFIEUo2LPjciHMKvZ0vTMxmGAoijeWY1z+oRd8n51a2D6/cl8c4LP6xDCFh+Rsg0LUA4Pthk53aRR
	f1LENVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdb-00000008NkG-2glx;
	Thu, 12 Nov 2026 01:30:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcw-00000008MZl-3YWv
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=; b=dLSM+WHxKusmvKrN5ca8e3GrKl
	GQ35epcPXu5n9sTmwQeXmR6SwzUXj+UgyU1pITw+3sxTFzAOQnAeVb8xtUSrPIiH+7UVws8lWSCaH
	Ix+VvnebK5hCf1C3vkkcmp9a//p6hrx31fcjlDkFtKPtOYDVBxhvcoWdolpll4VMNZT9YIWwWqHEl
	QOxRK8ft0kKeAUGqknmb3ORjdi0ViqiXmvxass246qzjxMSzHDWMYk6FZSH2tfP0mwUD25870XzuN
	CWwuyVp/iRiXp/RpafxZQsiP+m86mIebOE6ItM4qlW3nk7YNPYNfzjPGa4p03+7+ea1MQPnOpS4Oc
	phj0VVrw==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJct-00000009mv8-48g0
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:21 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-53ec92375d2so1479277b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446958; x=1795051758; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=xW8Dchj3N76M1Si1ntwg+Ko/QEo3MPeB7QRXKpMbnJahrHsBb9JryJoi8y3+BshC59
         1tJnyomEyFPsFm4PJibBXe0z0xbna9lOxZJ5TWO9kRmquAw9KAdPCOEEiUwvJqa38iiV
         Oc7nn5B8GJNOI3CChg/xGTCAa0EvnK96P/p2vTzO567Z28drdKVbOusskjX9BvUFGRZy
         fOmiE4dsPE4jLvubPzbUXN8MnH8l9BYonvKX949BIVDIvYnK9djWy0IlOySiFuDQP3RR
         k8qgapbSnHlPMPpkUytrXBVzRFJYflZcjBK9fFLSSd0EEpNuM672b32UmZNZ1dZ42dqG
         lNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446958; x=1795051758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=LxV6G1Fnq8T2cScUNUytQwMkCOHjrVH+eZyUq07NtLfSTGqEwKtLjlJkm0wUYEX34Z
         FzJREjxqwTR4gEIdsWFKfhQyCrcj2UhG/XVI2AgOb4rEMHjVfOLofh5FczEwVo9go5FX
         HfNDg/iGMa2s9wD+G2Ms6BCmOeu84n04tr8PeO3AW0TZkFf0gmsG6uY6tgZVHEKdOazD
         E06/b34zJSz3HFvNmFhoJMMW5ti2NzHUH8zoa8NZkZnFt47usXEGgbQi8j5VUpqm8HGM
         WYDnmXUHpmY8Lg9HqHJlUfE6FmwwylYaBD9DK0AAfMmlzuyVljmdxuKMAT5ZZ47e5AAb
         58RA==
X-Gm-Message-State: APuU4Z8UoaIzxlmtEZ/rNrcp+D6+j7by/rRWM72tI6TE5Z1QmRUqJRLe
	WtuTicmvryihLmGkATnZNDNCqctBWuuAsVdAcLlYBBRdf/shZUI8SUeMqCtXMsmX
X-Gm-Gg: AYBFou0PV8QRcpgHlc+9Y1/s7dYYDDceW5hNxT1RNn6fjoteiBvThGfLkWzs858csEc
	A4rKR636XxWPA1PGgmIkEPEMZlsI8bCx0FO6/3w6q/M+iXNq9iL11CqKosaroHCzW2Gsp6gX6zJ
	Ibapn52hY5pRfDxG2aiSyTLZQ7YZ/uUScl1bysmpzojUVnSOIzmd/y9SZ+RRwDn36JL+qEo7Zqv
	kunU6APE7RQ6NncANq/v4CemMFD1LwaP+wOdKagGTQ/KO5my9Z+F/7fpMHk9RaZZVApWLjpEudp
	XyXzPtElYc4JlLqvUGTFZPicdl5uwS6G+xqMjYkfZoCk1ptaAEIX85uuiRL9espAuVToK6QQ5B3
	GZlkmZeEnHTnJjT0ldwefjXcVgwDVty1tT7DBtF6KH6zVD9rdbw7+MIbm1jlkGDj7wgROJ30eRC
	JeqfQ5UuiiRtlpc8IxRjmBHu7xrvoY477zrw61hk+mIVW+AwaVJ5BkfsftOh/u3Vtj+bAX+GQ0E
	lhoB5IidiHNiKA9opOi35Mc6DSCuAYW+tgiRrgbh0N9Jo+7EEKDAXaLNqxna0TQ/DF8J80Dce4J
	/2eGWtqcAFoqpFKgb0nyFJg7oaqUvCwNqcFVzQ4eQhGiRCri/dvJEOtEGtJS6M+badKPiSxlMOw
	msiryn+bNKZehfDsikmLhRmKxavpp3UFAj1QWnVDpShGtt/K0oL1Muw2l6lmF/5GcBih0aqVqgu
	60X0cf04F8jhDQcMzcG9urkd3Bj2daaSl8KzhnPGXBEfB2rySQPxqO
X-Received: by 2002:a05:6808:30a4:b0:4e5:c2b4:33a4 with SMTP id 5614622812f47-56b980309bdmr4080526b6e.50.1794446957962;
        Wed, 11 Nov 2026 17:29:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:24 -0700
Subject: [PATCH v3 45/58] mtd: rawnand: sh_flctl: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-45-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012920_045145_7FAABF27 
X-CRM114-Status: GOOD (  15.69  )
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

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 36ba5b3da3a0..b230f5ef448b 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1119,9 +1119,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1192,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1218,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
