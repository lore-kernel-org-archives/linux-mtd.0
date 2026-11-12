Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48444606A880
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SHprhkwo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hRLIGBtt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nq3fE17U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d92gW0P2GAUagZHE5Z34XzQHNN9u+XBc1zADG0HHByI=; b=SHprhkwoPHGasOIhSctHqZHy+H
	c7KwCTnF43FBGTIaY7Bd9XFB9EX7vQcc74+qtCRDAi+/oKwdKi84fVs6CAHYUg1N8j34zBGPOz+Kv
	XLhVamPXzW4queh3pnoxjG40OZIfqSx6ORQEkrb531v4xk3zRcSvTsvTHv4oCKYbtYXCDI0k7IfMW
	OEk0IZhRJBC+bq/KrAzPpdj38KljCH5eRC9TTAXNQNMDPF+ioQ4FHyxSTGGFD2lIQNjVpdVMRfcEH
	YX6qWEif7WsS11BUFQGwHnGOrSwVGADkXddg1eg+jCEmo+vpErDckVFF0gjGGmSPwcMMtggjvVw47
	Q89fC/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdf-00000008Nt4-1aMm;
	Thu, 12 Nov 2026 01:30:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd3-00000008Mk6-0qUP
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=; b=hRLIGBttw5Qgg39BqwBurHuaon
	KqeMR3g5TpYQYVJmI3owd8tMNTwYUKmtzC5De2MVg5QAllF9ayUeH0JJu1gAFWyrDSrfs1/yNQhXf
	YOvJH6RqvmXVI8aYD6sm1J9gBuBGTXYIptdSwMT9uE8Y1DZlMSnrSHh+wouZtnyPWuw/rELHkG8cY
	KlkDeOWMB59g+Mbtrsrjt7z0D4AB5T/3EltLLMOgiI/gbzmSfOWijcm3/9nHwGoLYeTSJzFvjfMCM
	W9mDUFL0x/PgOGcVeiiXsN/fXX148cI3p/okLxblYtSMrmh5idH6wPFI0TEIS6Z8mbfKanEVF1JeE
	6mA8xu/Q==;
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcx-00000009mw3-2enr
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:25 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-4ad4072943dso1334711fac.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446961; x=1795051761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=nq3fE17UXyVuk49x9YVAVbj6YY+EgJ4g6Y1laM7SJQRLOIIg5PzhAqIUkDRoWbXeBW
         ZMHqAjNlsHhznXeHrzMHzJepQnUPvstj5rw9UvNA1tJ1wH+0vW7i50II820dfktp92wd
         EXoXwWOux4bN+VCLOfKz+C/sVJuffTMgaazGAsm33H+6Uh1QutYQDYDakfcAXSD2x87P
         Y4+2rFVtNViS7EnwiY55UeG33Trcv+DvQTQhFXH+/rg6VfCVSanK5S6xbGHXjIfCG273
         lg/V6suGznxuzmnVXqeN0NCxN2pK5kslxabEyWE53dAoT09Oon7yM7ya24iYjAYZmFxg
         IXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446961; x=1795051761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=1AF+eKgX3V+1oqWeGiKZz+j+CITwaUaoTfl0Pxr3j6/hHwQtwJeacg35o7C/LViT7K
         ugae1Q/y2ttLENUoovvQDCanaBpX1w4i6RNJW1lxRHJNnVI3q6kfMUotChNLp9Z4714r
         Q33k8ukP6bTkMhw3YksSAVdMNl3gboiLqbcdvpty5LyYLBURg4ptflbvOh36Opf4apmb
         7+8xmMXOg2Vjlo91UvwF/Rfn4AT72QIvYpIFFeiSB/SvnUlF24GU2znxrdNfDl9Zw9+C
         Jr1jQSNU4CytP8clA9/bUw4V812CgAQh/3Iujn361cw0nJAtpkjLXzGvPoXGMPVNFkTZ
         itiw==
X-Gm-Message-State: APuU4Z9rYkv3EuTEu+Cl5Vp5bbMhKIiBJ2q9hHVmqFrznXAc+QSCN4it
	fpYw0xmefDfQFrvTmQ6vzjJxzPEWmMf/oReOIL4p9W3ZoLRaYL5hXC8R
X-Gm-Gg: AYBFou0wZFGSA37RRAUMwKFn/GaBaVZgjfB4GMiTGX0ZXsxFs0idlDrtqo01j7hh9rR
	wQ6fjOpZ5wojlUYjsVGR5m+2Hm2pehY85S1LlxnTJMrCDFWNuRC1gaKFYZmoAnMwtuvc1nIP6j6
	aEzGRMMkg06aXIcRkXbdE53BqNKADeE3pAMlwr1kdXDtTHqEIbjAF4n3qhyIdEbJ5JVpcZRHeJG
	JAnCfa31AQ3WmLXe3WxmR5+lIQGeSisj2kHMSaejZ1KQHMlNeTb8kWIPlGYptS9v20sdx6b2WKL
	Yg/ccj06uG6VP1Rzz8DvCFmvJzzmsfeIXulUuxRhYoXFcxpaxaijt+7Y7Ei81mFteR+9YihduNQ
	l+IPGcKbdaTk9qX0oV5Wrt6eUtK4HeGXs6G0L9gN2pNJutKA+ljfB89OHvhz8Y4KFpAZw14urN3
	Mfbe6ezGztL3J3/DqhvbZQidDQ7pKkJsFHldRM3wFMiqFlTiwXz184ola/FnaMypiuc8sAm2Ofh
	sxFwr6LndWBhPpgIbXC8phirtjyH5HifAvCNn+zR8APPtT1WpEfWIqKC9N7axATJE39wKjQRt7y
	AsvHhjb5A3TRznvnMmQtO+ywSboevePs6qultlqRv7IEUUBJRndvlzgh9bLSqnbYxd2BpxBEhnQ
	c+DIemqkD1ua5F5ETnRL27Rk8coKy/e/aLrj+l4TgKif9kHnRxwOAcO6RQ95O4QSJzGa6m1vd5M
	KO/JD+PdyvTg1dvKkNljgbg4itSyNuUaMWOtmPrUniD6IWokRz0ENh
X-Received: by 2002:a05:6808:1645:b0:550:de67:2631 with SMTP id 5614622812f47-56b98032003mr3795721b6e.63.1794446961186;
        Wed, 11 Nov 2026 17:29:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:27 -0700
Subject: [PATCH v3 48/58] mtd: rawnand: ndfc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-48-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012923_953349_889EBB65 
X-CRM114-Status: GOOD (  16.38  )
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
