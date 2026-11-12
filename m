Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7CE606A334
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dE7ZBR2X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AHdxOJ4d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pbMI9lUo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S2H5POHn9PB27ONdQp9ov0+OhH/Q9iGiltXhoK4Plh0=; b=dE7ZBR2X9tUDVQmbmYddPobD1h
	us45FTWgesOfVdlM2aoSEDNNjZdaOYDmRdrjwkF47kiXI3who2LuJ9dQzcK2MPW1d18oAfCI30XHT
	FOdW9OBxwu1uQ6yhZj9uKv/I0Gets+CrtL/H9lTA2PZEpHpcBavD2w2QB5Q4OlIyAROVS9j+8vsfV
	fXOlaRU+u6NcCm6apsPblqTddr9vaHILGYOUuIXERrB7vaYwUMqj+trGXZ9amJOO5g4o5kD37eVqI
	melyjPgrxGp2+M7bleesu1Gz96L6CZGt1v2kuwi07pvMCW6KyF0cZGhIp40Vq0+VDFR40f1u/m7ox
	P9yJ4hxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdz-00000008OWJ-1NFL;
	Thu, 12 Nov 2026 01:30:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdI-00000008N3s-38fi
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=; b=AHdxOJ4dSWdi3MbORMKEm/bTW4
	zhqk6OuqFxQQxc+QGplBn2g5Iz/PDXMkcWaNt47TUHdKu8ERnIOL/Gg5aU9LxGEoZr0Oy4d+ZOQi4
	YwuPkiD8OSCFAYJ6e3dYmtU2g3v/A0bOBTWFuvKaSP5RR2KnTgt26GYtbwAuiz2kHdfGGMseV+qXY
	QeOzBIV3OENU+TR90PnSIRSdZX2LR7gQhWOfWi1ZDWwGwhFFCz2wpRkOzE+Iii+4GiGfb1ByQy+3h
	4kQiInSZa9RO63GSY3ufUfd0oaC7Sjo1HyvTW34VaOGIqDHJSiSwKN5aYFTlH28iAgRbaQVRFRN3i
	RM0AEUIQ==;
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd1-00000009mxK-2hAV
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:31 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-4adae3eb4d3so1586917fac.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446964; x=1795051764; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=pbMI9lUoCgKQHfnkcjXA2a8GgAJmHemMNPhlOl3ugUHI9KAbGbdtUGQqgIC5YEk0mD
         L1g305wlht5pk6P7ItqSuEpxpMbAjWbpITeHnYSfmZtcy0/RgCIkJsVQ9LnNgjSV2eFs
         cVIJSaySxUp64aPzUDhN9gUA5fybiiXZGPMAI0QgbIZcv3J4zcOAtLdWNTSVNb3c5UaJ
         3/V6V6AELY9oRn0/SIje5791LRFRz1M7P7MCyHGbUi1ljvaKHnwvf8mQHXFVXv4c12qm
         vDuU/ik5O/ywcBk7m7+jNDwoUQIlSRvp0XDZVoNsXC36xK57MYEgY4kG/kC4vG9LgmYR
         JaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446964; x=1795051764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=D16vl4/O6nqvHVakxwDIzIAyujZsJZ41Y7l9T8G2bSid3FC6ZfdD7jRn+EzsPFQp4A
         TeNm9a8jdHGGtStKpC8zkvbBAFvjQ484U/nK1BVUhIMQnnvL5VuH6bDRVBUr7agANK1n
         rzrQnSBa5bXdj4fkimlpdJeHGx5e5Wka7z28lvnsDusZA5yB+/1LQgEmOEk219nzzOqd
         qFxSRX9MxQHguZXthgAUDXG2tzxdIoVyv+EdzVCH3ewkDcU37zlZbIGwnUVqk9exsVRc
         3Khfn0UYVavtRZ+RFArTZkLA/nNxPB+jMJTe1USnsOR22ZXO/qLF9U89WKJ5tlzUq+oI
         HrWw==
X-Gm-Message-State: APuU4Z/q5DGqojCRGh8dJpGf/QXp3/fC32gWVUuoN0zYS1fUjiO4laoo
	T/dpG+C8EVNe3sp9cPziHbvZbJv+8krofWUWv4+LtpMLI1kmKBAAIOMJ
X-Gm-Gg: AYBFou1tFKhBcrhtvlSQ6GX7oatW4Uweptu6pRDmqcCAJ/uPrbieIaQG3lCYa9KHygM
	/RZmftixr7gKHRYsiBrCX5/96gy0NwP3/zezANMRE0XGfhl8rXtvJsAxN+QIu3B1GU1gQ/ix+7J
	8U0XSHNGVTq+ueWeGY4FB7WJwhO5Zt6xiYr786zFtTtNfq+RMLFZLQYWhmtVjj/LEGn8QqN3Db6
	jIAEbgBt9Zwh8XjYWPSmHXqoBg/7k8ICQlj2v+tGi3iLgUuGtip3/MXgaD7spedDnLtRoE5P6Zt
	i/39C4vVanGK6MUTssrM+5jTJi9c8xFNPiTmSpVuJMy6TwTXwC4FlgnOQrDTuHtMrx3KXlLKR7S
	mjDdM2tfRyBEDT7lUrInhJ9aFisEFKI+JJ0hnIUryMvyCEhg79yQXdJi8xrDWLuCTTgGCtvXgg6
	n6McjSdPXi6BzEJGT1iqSBf3Q++O/jThmFQOzjTc0wBO6AVchrgscUpF6PhUai55Uk4duumseiF
	pO3HczGyfNEVla4aueZMpTEnZqAHhNFXooGl3e7qjZKMPLS1TzAgKKjOBQZtVybphAghjWrkGrS
	0tgLMAFZ9rOFhkjZYtGh0h7PeRpsTUn0vEE/ZF2rXCGwe/n+RwZPDfm5KwCH8WZ5paxl7o+eJjC
	BpQfsxtTjzWnWw1ksxY7XO6jAN2mYGwugkml1ohycmIhdSLfI90m0uTvkziuBr629/ubw9KgX8c
	r0CG7gJEw6RKfRgh/Va87ms0I0GguQ7kJCyenhZdd+TkmqECLl8yAP
X-Received: by 2002:a05:6808:5198:b0:4f4:9314:af39 with SMTP id 5614622812f47-56b96bd3b81mr3330935b6e.28.1794446964497;
        Wed, 11 Nov 2026 17:29:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:30 -0700
Subject: [PATCH v3 51/58] mtd: rawnand: mpc5121: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-51-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012928_362327_9CA08C25 
X-CRM114-Status: GOOD (  14.50  )
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

Drain NAND access before unmapping the external chip-select registers.
Keep the embedded chip and controller alive until the final MTD
reference, and unwind scanned NAND state on unsupported geometry and
publication failure.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: bb315f749f8c ("mtd: nand: Add MPC5121 NAND Flash Controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 0aeeb6327472..42e167e1db7e 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -636,6 +636,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, prv);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +651,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	if (irq < 0)
 		return irq;
 
-	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
-	if (!prv)
-		return -ENOMEM;
-
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
-	nand_controller_init(&prv->controller);
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
@@ -782,19 +784,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_lifetime(chip, NULL);
+	if (retval)
+		goto cleanup_nand;
 	retval = mtd_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		goto error;
 	}
 
 	return 0;
+cleanup_nand:
+	nand_cleanup(chip);
 error:
 	mpc5121_nfc_free(dev, mtd);
 	return retval;
@@ -808,8 +817,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
