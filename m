Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D21606C211
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EXJ0x/Hu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZiEYENJb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8l4aLH9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mzylaEQ1dNkH3rc81RKB+cKSZXck2K4S25Y7bD2yiio=; b=EXJ0x/Hua3qTOe6Zhtt8R9XOPi
	TVJ3ybmU1kV+mGoAR/sBu56yb3NONp3UHP/gG9TtsXLeM+pBa651gjwfOZ6ad1Mbt0gOO1W2djCZB
	lbpUceQCNSf5qR2aq5wdi8xiJ1yLswY+hbjmvDx6+WYPc3ISOmg3AyWgmdkhe/IBSKvBoYdgCjo8t
	Y1FtekiimtIY1o31yuEY91wknwbFRoBahio4Maf8jxcHW2iK/kYNBXSKbvKaV2Ly2rNGq/ubcgzr1
	yqOXjBMkV+zkv02uwC4/laM3YR0RLtQ7SnlWWWqPfp+EF1z/MV3X+kBQU0dHHx3E1xCzKZpX+ht9o
	IDnFNgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEh-00000001G2Q-2Sxy;
	Mon, 16 Nov 2026 06:30:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEP-00000001FZV-32C5
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=; b=ZiEYENJbJvPPHtbUgwZsKgCErT
	2Vc5EOxdfhh0dYzL8kAL3ytRuBaKgDVx7Wgm6Rr3WN1FD+Y175vy7yPwsdnXFYVLhtbwmB8VSd5K+
	UaRfeDtYe/gsv9AnQgLs9fzxNNwD9//67clW7pUhIrTnXHiT9au10drqKc1DrjbZmkeKWsUQ9QZJi
	uD8nCHY9sfb43EWT/4GL3M13BRyYZivSA4Okzt+392FqdAKfS0wy+hibqkGRNmHqLe+TBflJJEzFl
	lu0BBhCXLoRbccjTYl4GInrRnZ8gvg02E25U/4Y0BIU9SL4x4d8aWPfppYLJW9rNReHKJDuyUSbXT
	kM6mhPYQ==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEF-0000000DPCS-0J3M
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:18 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-71ad5f20016so837105eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810609; x=1795415409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=w8l4aLH9NJqhF4AbAQZPK9SmVaKtflcxwXSAbRv4ILHIvBlxAbIZwWcueirHz5/cSl
         FQaKjkK0rOXVZoeAMochJrdyHLDjwR9sK0QWytFe87h+7ClrIOOA9TWYz42ABPSphnxM
         TrQd76RPx1KTdljKTze6lTaVolOsH+j4VslxNi0uvvPbIwjlwNTN36n2OPv+FN+YfEsd
         zf6N3TeX6jZt9Ndg2ucGV0VhCBodkbHIEOj1lG6pq/gQta+v1XvlQpOk1BWgVEhEgWSz
         xkGUoamznrEWy80aGkZ7sH3PDBk7RmREbp5RLQJSsFLdFIOFZ0LNil2zxjNfOZCAVVtl
         Klfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810609; x=1795415409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=UWVQzVLZNJ40xFZHv1gOzlhFIIJ20EesgN49A7H9Oaa5TYEn75sGkAH3F45P2U9NPn
         pSM51Z8xwBnPMLmv2OTlmdVNzAElxGt7MTeEfFEI5rzbYmaF1pmY4GXZTG63ru/Yyy65
         rFUrjVjEnWQrgPh3bu25IUA8HxYwa6zsixVGvt640vMyQVVkUy81VF+kxq2llRccoOQ4
         Ny3YMgE0M1eFxjAVtZo9Fhpu/mS+EnlpoZ7SssaNn8p0lD5inkf/RtAKxHQJ5lP5OquH
         77mENSiOR0o9nMlXN+seBvtuSQcmsKuOrALOyBjf9SuRHFh4sp0EoiDvgwT0UE8hDERP
         bdjw==
X-Gm-Message-State: APuU4Z/sN7x9iGZDyhIilpQUD3AKfku4XyVhZtrYtOKVqxXkyC+WvYJW
	guZ6Udl3XcZnLas4YWn37mSSAV2oQ7X4DOVyiEdLGc2JU60rb83UUNXn
X-Gm-Gg: AYBFou3KxUIMARccYMp2vVMe80+5mMFMDbRLHTq1pb0hnIfJveYNI9dN8Qudevp9CyH
	WynR1eR339rQvaLax8/iDL4tUS5mlTLdMzkrPueSDprc1Ri9RU2kRs4cB/9KfPSvSl2H4jj9vOv
	Rxxl7ROu7LUL9+9EhoVICpImQdLcvRJL7j3WhFsJ8gyubce6YMjuqifBB2W9KtaNb28vScPioKs
	Ci1KEQCugUFo3ICiyxlnUeuxDkjOMsy7M0SyvQiz6avdjGzSUolHye0QWYlYXXY8qWUjQ2Ad1ZZ
	EoQhI1pqkVO2DNY0qlYuPsRTPkZcVfQvfBTNhCL04ett7f2jEeJmh3Ja4nfSDUbetYaBpW9m8PY
	r9rHynDm3DZ5XiSDCVv+h8/16iJ42DBBHc7OJnxdMzuAJntTMIMhFZ7+bijQ3+9RH/zxdQrbw9y
	ia9DyQ/QHuG7r/T27obiWiABMQKp1Nppz03FFVvALd2SW1LqJqcn5fzNWpcVpbyGs8MOFkYsHIC
	kPshJzwt+icWIEDq3EfJEA3IHJ39AMIAZM2B6YLeQIgkOnAXI1/4tZ/EEYxI1ydH3xae13rCnsY
	ClPNfjDA3Hxqk4DoqUHAevSdNgNDhq+N0mPR+3FWVXmhq1KqHh7Ad2JuHlDn5WaVRSDsq6YSZNU
	aXppe2qTB+iO5jfNEhJ6u5H5VUydY7xVnfRQ6fQMyWbB92YMOO//hLYson8Nh+ThD28zxqLbxSR
	9hq0WpR7113FHS66wBqomrwOPX8BALfPJdDLrQXJK3CulbooLQc2o=
X-Received: by 2002:a05:6820:f025:b0:71a:f4ed:7027 with SMTP id 006d021491bc7-71af4ed9bc1mr1313029eaf.2.1794810608752;
        Sun, 15 Nov 2026 22:30:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:34 -0700
Subject: [PATCH v5 19/58] mtd: rawnand: orion: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-19-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063011_622703_4851DD52 
X-CRM114-Status: GOOD (  14.38  )
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

Retain the embedded chip and its copied name through the shared
allocation.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 2a1dba2931dc ("[MTD] [NAND] Marvell Orion device bus NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 6cec25425710..1b1cf3b31fb3 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -106,15 +106,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +186,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_lifetime(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +209,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
