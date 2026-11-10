Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A652B606DF18
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JkGJsR6Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kNjreOxo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WOCfNT0B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a+fx39C0C3IkSh47ajIlDLBIqAopn28WKHCMzsrrFIE=; b=JkGJsR6ZWw7Pos8j+vCbcU68e8
	Uze8xwCU2VP/2t5aDOrxdJBP0Z7/NAHnGnyV1oJ/5ZLfto7cjrvS7U9qMoNk79tVSMzwGsfbn5l6m
	v8tYKDwx1PZAQWpRIby5UIYKOYeOviFw8zIu2TGZSdb8oJca/4MQkCHKCRicNGNgtFKaWxX+miDHG
	XemySuhTws+Jh+xn1Fune1VdjdbKgotiWCBqKkzWIrSuf7rxFT8NU9y191OGTBgZg9qGf4bkYBCUW
	sAes2jksBiO32O6fK5x0H1/pYlPc8DwtWlJI/X6Z9MXu65PF4C6Bhu0XVjo/NL2BidOhtDY4aF9Zh
	/Hf00wfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXK-00000002wp9-1V1B;
	Tue, 10 Nov 2026 07:44:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXG-00000002wcA-11T6
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=yGlHUg0UMoYr0Un/Fr2eiWkgM9WVt51jHWV32KTPv0Y=; b=kNjreOxoA3Y9dPNkuCmZDo3rhP
	iEPQAP52lxEyNw8iI16hpUy7HiApKHqeYvCKkw5MfrZcfKd53kHD0vwRIbv4zTLI3lt0UoliUIOsi
	TjFzPCw/+KmqC0CjE4JEtY6oz3DtYrD6fHPwAZcH/nlRCk5DTh6LYkKsACr/kSD+HEKf49BcS9lKt
	QDBvbNtL6CcCIcHPpX1hWPH3NG2CsT6QoYtcVrT+LF6A4acRuxfDTUDqOQO4ltN/nJRU/9G5EysjY
	wuHnCuunFaSxTAORrBQODa3CpdFU4Xm3ZHF7ZI6LPqU0OUSMWWkRX3cVjLPQYWMSqi93mZKRHxjbQ
	rhid8wDQ==;
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXC-00000009G5L-0INs
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:52 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4b190cdc9feso982257b6e.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296687; x=1794901487; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGlHUg0UMoYr0Un/Fr2eiWkgM9WVt51jHWV32KTPv0Y=;
        b=WOCfNT0B+IBeuFJDSb9JNbyCFw8fWrZDSzUUslUZI3dih5uSOQYQ97NwQQXqzEd97J
         VORzr+DSgmhBEyK5VN9Ahn5Q3ZcQSwFMMfAygsWHTsyAKtvDnWoijveDbvqb/2IHxt23
         bgNZtfFIRsjfZYkn26A+lKabL+SEOnfAumcG8gZzy05fCripWdNiD/YyRODbyG/D/+4+
         nEk8I3lZrKRzHoFSZK3cek/JshFD1f7wbhK4PK1uXXnpR2nhDyRwo+h9/HojQEt0LAas
         7fGrOjD5QdNB7B+JpDhFnSE/GLQ15Oqyo81lV+/lvM3t/zCMPbNx2LaOwm8+43AiG8OT
         gCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296687; x=1794901487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGlHUg0UMoYr0Un/Fr2eiWkgM9WVt51jHWV32KTPv0Y=;
        b=1b15wqZ2c9m0PxcCNPAl/h5ejHJQIIIJt/eixZtOJg2VVQ6ildNStcfMPCQJFUes1K
         2C9JqoAZrsp5NncJtHaqcObpu1O9/HbZowbE9qxCqYKU4WijEQsaWV0ffDh0EyV/Rt+K
         onXYsarjhf/hkbqmE3LnlJKw25Np8S1CqKg6X9ghjNvJwDzpqSVMly52W6djLvpCwB/9
         Go46kSGZV0Dl015C9UI85cmgAi8gBmKCUgGXFYj4hyHMu1jK8qAvuo65IEueCS+4Iu4y
         8E2xcC/yac4MWHi+nOgk388KCw5nkA2GnIol28vKQpvP+0JFe0wAkeEWUbfoz1PIjCaj
         p0pA==
X-Gm-Message-State: APuU4Z9YYhBdieXausCRCgThgISbZXgtSs66AKAOcN7fG0QyG+F1K5I3
	9hfJMp14zPK/rVOLM9J/X3gCdqYH8zY8HHAVyaqHJskaFniKsGjjJIMa
X-Gm-Gg: AYBFou1Ok5Ve1cMDq1D+IVBCzj8k+7WUjc2CPw8ZEsaJKsMNd7ks9q5piRc3uJxpOvc
	y6ub08KzNRIvjlNhFNJjXWVOXOGUWArYDLuepe3rDokGfxC4FDwI14RvJNsvpOUd8P0pHtMlsVN
	SkpRhLJVlfXR7ssT9R3cFroCpP6S05NmauIjCFHtQRVBSvP2ZJLV8tc3bruC2K8/tQYyALm7YgP
	Oz8YvKAcnThuY/Xg3u0Zy5dlfBaQc1H36HByv+gnG+ex3CkGqxByWb/AYjgtO1L+1+sGErYxg4f
	u8l4go8XBw5iFg8XzyK7ltmaXovGtmTtUBdjiooPaI8efrU7SHj4powqIUqMHiDUfmjEcCPRoyk
	ZPNA3rf124HlfCdF8uFr7oz+bBKHpoNt2nsfW8It/Mru1yGKsM/iE60Dr+o1NtBzr2HuNiP+dCs
	dQ1Q7EnTYJ02i2mJpovDZ6z7aPuK01LdUXVIHWYkYQn1ttkriZ7Yn5E7KtemfTJzGEzqwsz7Ri1
	CWJLSkAzO3eGDQj7SvFj5lPWhIKlc1PIRYLv9cSF2e8toSYzE3s7HtuR2m8iX5KEpKtOiYRR4FR
	rci3nEbgEMtniAj2EiwrQlorX/GOISdnoYT3xSy7gfVZ2BFjSLDM2N5XulZYG3XhwEoh9RTaNNO
	5tcUw31n5UaeaxSLGDcJbLFUk9j2ryiAw7DGwFGI6cb5kfJQmyEJ5t5RR7EwZYTdb5JJA2GyL3B
	3szjbiXp85S01Q0X0bWMwTPTjv+anTWp43tiUBXz/LhtHJC+UcuFjlOJzg4h0LtspJeB77ZxkX
X-Received: by 2002:a05:6808:c3ea:b0:4f4:73a9:f831 with SMTP id 5614622812f47-5683ccd5f77mr1328903b6e.19.1794296686871;
        Mon, 09 Nov 2026 23:44:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:27 -0700
Subject: [PATCH v2 24/58] mtd: rawnand: xway: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-24-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074450_182781_CC86E9B3 
X-CRM114-Status: GOOD (  15.85  )
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

Retain the embedded controller and chip across platform-device removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index af84395dc66e..1e330aa5d56b 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -159,6 +160,11 @@ static const struct nand_controller_ops xway_nand_ops = {
 	.attach_chip = xway_attach_chip,
 };
 
+static void xway_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct xway_nand_data, controller));
+}
+
 /*
  * Probe for the NAND device.
  */
@@ -171,10 +177,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, xway_nand_release);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +200,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +235,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_release(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +260,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
