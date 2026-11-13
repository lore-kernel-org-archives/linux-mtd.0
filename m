Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E5606A6FD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OtRhIEX3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFFAjZ3T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C7GUbcRC+ndMxRG11ybgAIaPwdWvFWo5cmAajw99Zkc=; b=OtRhIEX3rtzH6IR92ssbjozKic
	dtJjOP6u+tvipTKU2nfAG6RvRJwo0VY0O0wZeWoigctjLrd6LGVtDrksvHxmfXVTS96jcW1Nx9nhE
	eH3pJAXr9D/Ty/GCW+9Dv5Wg/RSdhX03sRI90Hni8pQd0dxtLyRdGCIzhmGGYM7F1FFYyzX757iPf
	W5r51Vn0SKLfL8oKjx08EhsLcZVvw67jlWR6RNb4wEn7LWqqJwFTKKBCpI1wjjI2kAdvrz5lylHoq
	F/NqftQ0eieDO+6PlF/FVPavBLn5RBv4Sy80T1wK726sQ3XpaY8d7ujTE36OEH3KYkFg1bakpfO72
	dN+tuZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoy-0000000Ds9j-2J0X;
	Fri, 13 Nov 2026 18:16:20 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoW-0000000DrJP-1CQW
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:00 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-86298f9267fso492589a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593751; x=1795198551; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=nFFAjZ3TPqXFfp+TPyWAZSi++G0f2MgP/sjfQoebJyQ+3wikZmS2OZCh7rgBRYk+5+
         dJoGm3uB0LkVZqP6c1PxoBEYgXVTQPjeISMJvjI1/+R7388evLal/ywS88+kjz7fyc6i
         FjJaxMkGWSAu1+YlKtz/F4XSyF6GDdX+AD3c6U0vNDmr0crgChxVCNBnFi6qP0TM+2iv
         EtTlUIzUdLKGANEQXjxjwOphx/uLuW+pLNQVPs0CGYnCXZU/xdr+kpfdaCAS2NdWEmfm
         JZaCC0qE0KdshGK3NzSvDLm1oLRymy/Qv9daGzN68Zh7eaCTrXbvLg65GjMYk5SSxZEc
         sACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593751; x=1795198551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=u+6rcThGHbTL4CPNNWBT8MPgG+V8v9RvpRtHfJW+BJ0zwndmKUohwNiIRJ9RPoIwia
         h1lJfkOZmvvnR1orVBd4zOjBveBnd8o4HxYSPEZecveJmHKFeKXsaOoiMJwdX0H1O3kK
         GTPopJBVJL2Kfz7cKBF20ZzRWLpN+o4s+rUCDD7MpSQNY3KxC93bw5aCmuQOla7UeNHp
         QBMaBhj47S8xgYZXjhjeovbcuj1dgTCSJ0Zd51iGNXrMCvuYpavHc2qau6ZjCbEZffSG
         ymhEvV/6esK26DkbSPIJDrM8TgqsfvMMtyEYk4pB8jnt8rJbvK2sKSIGWPaGuPYmaEj4
         RWvQ==
X-Gm-Message-State: APuU4Z/gBkVk5w+Tun0AAon+zHCyko+uu/3jlLW9tySAuQfJtbDGZkaA
	p/3X4DHpIpRAkzrsgaJG/wJOkQ1ZOrIQvZcGdeQ5S8+5XQBWgpzG2MDzb6hNQMMf
X-Gm-Gg: AYBFou07vcblDaWJ3jikMO7xjjLk7AR7vxxu7nQUTu1ayC41bCB16Cn2eO/YHgpwt7i
	UdiAX8UJHuMzIKNWekJWK3E3HypgTyMsTAG50HcIEISlRVKsfoMk/kQB30qL+mR3zICoVoM8lYe
	KXP7qqJShPjveabGlKkyaOgKT6wWkDAOqmdY+KMKyBFTq7MVWD9T9USOFLG3EeRjSu1z3Jx9auF
	xunEjs/dcxt7cnC5iEeUHO137xYdBNgDIqk5aTjO7tmjJ0AdltkJX7VmoE+jSnPLdsW//V3XKxH
	u89wW0w+wuY/Y645AyYIGrttbH34/hLZImSJuPboqYU146uXOiMUfjA/VXF3G7FsW7ZB0dMQAtf
	g1splz4mmuo6peyEXwGdWy7RpjMrlUKNYrWsE+OuO7F/SqBaeLNM/cUqmHRvJmsd82j9Xh67BYG
	MPuPafuur7WkpGtrE1fgnti5Zztj9Jt4u3ngQDDiBEdeZAbzaoFyKCfRNaIdUxdWwjwDNaglwY9
	4VIyqoUm27LKo0wdWf3U0htLLh4fpGtIwhc6OqPMLUnUqIAH9QSXx9RPl49Mf+EnKT6MjB+Q4bP
	0Gibk98sGRVX5swUoUsYyD0mRPio2V5iwIIcoqDn8I351f22Ca1ps/aMuJo+cz5AVjaKAqcjO9j
	C3H5aJvAVc0E/QOfFlNUO1jWYShRt4jQJd1RFlnKDtrV77EFxUezegxiQkKFhwvluyW7opUhuAI
	V9p7QtImNyn/XuXLY8ww8JM3B6K6CQR1gBKlitlQBf8RHJABzwa00=
X-Received: by 2002:a05:6830:91e:b0:80c:d30f:97a with SMTP id 46e09a7af769-862899671f6mr3587981a34.27.1794593750625;
        Fri, 13 Nov 2026 10:15:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:44 -0700
Subject: [PATCH v4 28/58] mtd: rawnand: loongson: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-28-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101552_499788_05381756 
X-CRM114-Status: GOOD (  13.37  )
X-Spam-Score: -1.8 (-)
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

Disconnect the chip before DMA resource cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 741e19f351d1..7f8ea6819097 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -863,15 +863,20 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
 	chip->buf_align = 16;
 	mtd->parent_dev = dev;
-	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan(chip, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
@@ -890,9 +895,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, host);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +919,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +944,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
