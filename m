Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3858606A336
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LsncuDWs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Qh+SC/qa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjQ3KITJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d92gW0P2GAUagZHE5Z34XzQHNN9u+XBc1zADG0HHByI=; b=LsncuDWs8TH/XUdiitccoTzqfx
	RpmPu8lW3C3qslFcW3ztkXlDucZhpTc4fAHpPlr7GEfe5nvVkZmKbRr1zypHfGkw00fqdgho5PaVW
	9+5OcNTxQ4sysrARweQUrpvrOdbZaUae/OJ7ImCqDcQJjaK9O/xgBnr8gx0K6CVmlZ0KX+Yz/5OUr
	+75Rr5Hxrp938wxyjVd9BB/svcYl0peoj67fB7ru6HBloIOve6tfplZ/S+R/UEw28GOI8mRTWjf++
	VCr10TWTxjfI4hXRKoK74fNZGC3EWfwXWHaQCmzhs71KPRAcO8YxTRUykxwxWxH5jj1CMVa9C+5S3
	sr1bF9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFT-00000001HZb-3l8M;
	Mon, 16 Nov 2026 06:31:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEu-00000001GSF-2Sw1
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=; b=Qh+SC/qaY1fg/D9weCjKL2isJc
	H2SlEl4ZKxrgOxPrtZYF9M5g4nh/DT94s/Ntu7tv2VM8LR5ekociezj9ZMq5Wndsi8GDyVgg0os27
	trZ9qzEZvXq76DBzIQg8HP+wEuBs0BoXIxzSERcNxNLfkEUWxQ2XtKj5PZyBAbu7s4OUsPnYsEf6y
	NjmGIzR+e3UtLe3ECT7FvEgI0/BG3QZT7ablvGcEDcQ7oSPSfd+BHMvE9j2hY2ZkGkZPYODZpSyY/
	YjUD6m3wxMwUOvI2f8C4tGEl1iKzpCx7tTmGtHh+UIW9Iac7+Nwd9bW6zUPcLgvQ1bx7KmxR0m6GT
	zs0tYh2A==;
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEn-0000000DPL5-41F1
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:51 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-71ae5389c00so642877eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810643; x=1795415443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=TjQ3KITJszgZ5BV1ioXrGtOjFqRf9Dogj6nnGMefXQodXcCu4rGjPHpS3eh3sYM4/x
         0PSfH60F83hWpCt04HkxxLFcRLqwlCVS98NOTwBC77w1bgHij80KFPOmV9lHFISsSYZQ
         42HXkzdLvUkqV3u2mYY4rmT9qPJW1Q3GO+pCjQnE3ulA+xT0JioJbPK35VsjtHaOujpa
         fz0aRLVPY8wdkE2f7txXF7w4Gp84B/1s/shY1447K7bALCgSgXwfEUZ1wMruj5B2wCLw
         NmdYlwoSfuTC5wjtyEreEOq0ZogJte3wKU6QW5TiBlDcR6cndqCFdT7rP8Z1v/b5097+
         en/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810643; x=1795415443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=ntoeK7xiMeoN+V8lYNk1YJ3w3tq1gPQ5Aj7UgRU7mxeAS6QSkTioBoy/L39W+a6fzq
         61CSFyEfZXtUB4qYLoHRQccP+xWJUHkO0YwXi8FXDkiRnO+qV80ed8D21c1ZGjUEpd1a
         +ojlixj/8LlWsNdQEU0RnExzwUizwiJCX8w521s8Ppgte6Xzhikt1bcsbD6llZbpjoBT
         l5tgPte/44oAdXCSJCZuYHXWnUSDvSsnnbjVhmRiZUTwIL71JFh7977dGVgtprZzW/JP
         QFxqrQylXCJJ5qObdzmWaKoyLU1OCnWuVVlHCgH+Bcf5mjMacRxyFUmt7/S7WC8c8ecH
         RO0A==
X-Gm-Message-State: APuU4Z9MhI4jzgfT882ZnnP4OrNLSzvb4a6+IIq4ue4byYXz6XBc2xc2
	3S9uku6S4zpQIaA6/kEcVmFtex3nR2X1R0gc2+FojX8Hdl+xvE0Uw7hukn+31zPx
X-Gm-Gg: AYBFou0t/BE/aVy1KOWc8uSQvMNyHEahMHY6RkNlgQYM/baANPH736blGODa0RrJFyG
	wEl6Rkhlv3aAlhP0xq+KIk8s3M8HBbz4yOxz5kHWROaGnY+pU9WFEohHmPxkk+CboeaRmGBER46
	m9cVRwBTuKJfEHtEKYu48wkEPS14V8r+zXseLrqrlWNQZGH8WP49RRa5fADuZHAp0GNwuN/Qdrk
	s3OliITCCbla7FSGKlnNj2qPlpsVqJjeUB4eB4KkUjTi2OHvAr1zuIwA6sFwRDrJRqPTEkegmJB
	+UHM0QOG50NslkVdAhul0e0VYOezWdOr6dOjlAukCP1KwuhSuO59l36H16F4GxyiL+hQw086ugB
	P7R4e3icjDyKw8TuV8V6hHM5pUpAttniF2UVhvsEBAkIn2dyc/hFYggy/Qll6/ZGEDXNGL3crXZ
	9ON3XE0m0fAqXaoz91o1CMiKYnsTbn9RgZEY1OlGlyBJCEC9glnBS3d1rndCbL5RlU78gCfq6dJ
	KFiDa0sxr+GktO+AkAaXxrG/Ksw9lJ7bNOcZ08O1J3uh4/vK1GknAK7E3bQVfXe3Jz8/0iE8JIg
	5bc3ki7xfvPux8USXibNcZ8rdmhKRRpbYmUSHDq09TyurcGEA38YfVei8lD7oaN2oMcolp73/Hr
	xNDFeCm370iXCvpBkZmdMAou8v4xcaRF9MhQcy30Bj195hLpYUmzjEwVj2IekYS9qgG9dEBZeMe
	fNwUHtH58UnlZqVckt9h4DcNLk0fg9MmW66t1rLCGCPuzPBL2u8q4q
X-Received: by 2002:a05:6820:83da:10b0:71a:f498:3048 with SMTP id 006d021491bc7-71af49844e7mr874342eaf.25.1794810643627;
        Sun, 15 Nov 2026 22:30:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:03 -0700
Subject: [PATCH v5 48/58] mtd: rawnand: ndfc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-48-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063048_657118_0F462D4F 
X-CRM114-Status: GOOD (  16.00  )
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

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index ce10fc6a41aa..27ab5c034e70 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,7 +171,16 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
@@ -187,11 +194,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +209,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +254,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
