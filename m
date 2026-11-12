Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F1B60A2618
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MfHl63KJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iopacTEm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5FhiL+G0gHQX/+iRvHVoRqV6ce8h34gkpF8SxVU2eU8=; b=MfHl63KJKcAg7Jbn93OZAv1bO/
	NvP9PaZXTI3nuNO82q5zJMNKUmZ7rl9jIpo3gMFxEXYeVKfNmJw6hDsKCQKlSG69kd3KFLeEfUq6f
	aJgS6r37uGQj6fHHAQ7Mkwv+G95nUXcLNIAN/U43gqz3iffskEENAIpJqdCp3kggPGlP+lnWhO9NB
	KZ3utxRZBGY2awLCpyR+J/zqQs8XLyaJS6euQDxVhWovb1zIkg4IKbf1aGNFp3NVw+z7pzBkLlxxl
	iYX9ufcViszTMyNlpJwNo2B8UnCdCE1iDkzHmru82TxZsn1wqT63Qh9in+i4qYBGxgn14ntsJgH9a
	uddJXaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcu-00000008MW5-2eOV;
	Thu, 12 Nov 2026 01:29:20 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcU-00000008Lfk-2PTi
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:04 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4c5d8c7f326so1480213b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446933; x=1795051733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=iopacTEmzed0SEEO91f1zEW+WJC8PxfKHclBIeH/2rlVVnv9quqVzi8S/Xi2Hc2WR0
         axoaKba0WroD+BueWAWJiCoiP3MG37pq9x2s7EF0GEh9wutbjVvqJ3VSmRimBlUPJrVR
         gEyRZSv4yUhF9xnv8Fx6ixkjLDyQaQZQj3hgAyfshjAujzBGyzb0stgjrikRUm9W7ctt
         WlvFjbLwJ+zWDYurpXNqFMdmnit6EaAi9Ls6m6nKvhEweIQNLLl1kXB63TVRc71HXagP
         Su3SY/yIt0AzE9t9lAYtmUoSite44jDdUqhBNmaAPh00R0o4GtWgLB2HvGodBTUf9u4T
         41Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446933; x=1795051733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=CqVPwZFFSh3GRx6ILWIEe63ivc4nFjW7Aye00qs2NNFa7/buY0GdHyWue3DSNPVJRT
         0cDzWyRVVoFlxrQ2X3X3/dGwCiMCUnwnGWbNh1tY9xSuIJSIMoNV1tTfYjJuRL7hAXgz
         K16WZA6ccA5eoU8S2G3NUn0yR9WOUSQB5ZzeLdP4jQJzcaXQvQgBfzW+VAIAyQfbxG8W
         yt6Ys6V0X2owkfNZFBkSetVF0LW5ndWS5odk4M9G0rUw4UXEK/tYqkL6bBuWPdlNG5jr
         +exn4AFCzQgv0Y0FuUUBkQjUrkugDW5HRXQAAdSOkKxmsWZKT9arlJRNiPoFEIDVqkJD
         RgtQ==
X-Gm-Message-State: APuU4Z/lv8x0+b2YeXEJlAg5suHVE+5/VDaGmUhKdcMm/MJdpEeXfWWy
	qH1yf8D3woNdGmJlGshAf8yyKqXAE0Ew+Uqy11+zRsqjxdI4AaQBZ5W0
X-Gm-Gg: AYBFou0iVS4Q726U/u9vjMVZ+MCEtYjDhH1iQDaOMsRntgG6SyDT0KFy3EqCFXczCmO
	QrUCt2s3CLh9ND85wRZv+kou+71219g/psEWp9dXZ/QwowDMX4q6HuuNX9JdqdLdDrKKiMlg1eF
	da5fSbQBONyYW1B5t1odB9TaUeMT8eC3Ne5cZANn8E32p0FqESLcZ2qsxZ1UjtvnVF2uI85ZgJy
	9J4zSl/Cb709HwEBS6QPGIGI6gC4iE18e56TG1Uaghy8RACfkVi51oeVQfLbit3JeCGP9J+ZwEZ
	gVmwIoDsax2FUtW3FXjxMJXcQhCYqCWFIIrKPQqBpN9i10B44G8vvuljTAxH6eG3bAuN26NCrf9
	DXNfDdxmy1HJoIY5A5BAUSFZRppm9Q+aOzELlh/GkjAKpADW1qseM5WpOjPZMEaCvYAvy6WOBzP
	ReFnwBZsL/X89ohgwbTuTNkeW9Xa9ZNxkkaexLvleXrcryxr40ItBODUUcVCJwJ0wNzgNTPYQj6
	lTHB0FwXERTIOMXG5jFVUsqk9lMtJztLnLvU4qvhlHwswC+IxB/rTUI9zmab95B39/xgR2URzjS
	MPYC/UaV/zWfQFduZWZqVzlUI7/SOS6KSiNH+DJo7hn+kPEOeDyugiuLQMCl5MQpSz3ALAtE9bI
	Xbi29wzLWUwtVYUjmmDXskjE7JAOaN1GAuaaArkUXih8qlPk8iU8JUNAEAQTwhufmR/p5ss2d9i
	lzvbdS56YK71uOEs8NFlAjTfEK0L4EUnw3nxy65xF7yy7bKm7x/MKv
X-Received: by 2002:a05:6808:138c:b0:4d6:90f3:74ae with SMTP id 5614622812f47-56b97710a5amr3991934b6e.46.1794446933274;
        Wed, 11 Nov 2026 17:28:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:01 -0700
Subject: [PATCH v3 22/58] mtd: rawnand: pasemi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-22-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172854_704429_6576B8E7 
X-CRM114-Status: GOOD (  14.69  )
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

Release the LPC region and NAND mapping after disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index b497e84636c1..0a2d5e5bae07 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -122,8 +122,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, ddata);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +138,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +176,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_lifetime(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +198,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +215,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
