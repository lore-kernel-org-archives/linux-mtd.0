Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6B606FEAC
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UXpBHs2F;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiZwDjnC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S2H5POHn9PB27ONdQp9ov0+OhH/Q9iGiltXhoK4Plh0=; b=UXpBHs2FKPwpH7E7633W3A36wJ
	TU8/3PggX/Rkd38wKsjfrTqgDgw2mTcKAbWIWbisayQPrWGaiuiQPP72AqmN82uUy7vrHme3zu5da
	g5g8yB7owN0zaqWRQitiRjotz4GMOsK87sMMCD7eiAwwh+2tt4DIhXp7Hp9O+B9BzWwbwVBskw5nT
	5JyZybdELuklMLr1kCHly5ZVwQGW9ukDJDkRaBbtnON+3P5SR4Fi5ISZ19uEgWHsAcxv7Fa7VlkYT
	QHBsMvuZNpgg43RHRqlPPXaLP5J/3ujMlhi1QJDUZUbTQ5AcAyNaG58D3N7mzeLUmYbHIPZSEI4iU
	RnJhXnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvym-0000000DvuG-0UIl;
	Fri, 13 Nov 2026 18:26:28 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvye-0000000DvnT-3d7f
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:26 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-4adba7b3399so478084fac.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594380; x=1795199180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=PiZwDjnCA0+ubMZtIpTAN9L6MmVpCllFyeyiq5qGHObT466W1YF5D1JkhTC1mXdM0o
         qSZuTujrQ5cRCVtYZOw/pnIFM9p57CfWF07FAXr2oUqfgrjc8pjcFZKBzwpGrUkLt8ns
         8SXJWn+eLM30lXYQ0EgU55Q7hSaZnjvnnomkrNa3KmRPYOqpDZsiO0cocFwWUhmJmX6c
         qgusxRm43kLbl1Ss4eSJ+V+jRh8EAMwQthJGLJovaUdT6HswumBLYIgyX/g9kW3+kEuG
         Nwx3Eok4bCVm0fgvdaGTnNj1SJVl8slTMMLYijXr1+1Nv+gXiEdUdVVwmuIKjTo77nIl
         BzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594380; x=1795199180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=w2in6sYXXFgnMYY33mNhbyHeYjwllF0py/JIDEZk9pGLFEH+wgTmTsRS7DcAgsWEEX
         h3qjZAcN4VAUlFmw7+Zj4pYAJKlLkIsTC/Ock1nznxJSXFavrNun1rz9M3UrwEnK+lum
         KZlmzr51ZUHHSd2V86jCQYN9sZROwHLHTbTwMH4xJm6C7PG4G6gjP5t5F05WqVRhIKtg
         g8Zzf6Q/TKDWwu70R1da3g4CPHrOZzM3sg6iyGWqR3lC1xxKSJHczeu427BSoPKzmacs
         tG91ZssX+s9EkzpORYQAXMcmrPAi+T+F9DbUxF58pi5rn65U+eq9xPHtme15TvMnt87P
         9fFg==
X-Gm-Message-State: APuU4Z8JQC/EnkXOBGofA0/kwSGJ5YoZ9M8yNWVMQMnkb+qrL87XL3XE
	M/8E/miF5a8XTtmqXU6XqcLn3GlrUV9XJg7momZVQSBqDzenuw7QenbQ
X-Gm-Gg: AYBFou2ZeaukONXarudoT1xPPCqVKKGQetOGpXrk+n+L8D/lhF+z5DI3yd0WDTLtZSk
	rkLqjCWH11l4K5HowNZLek5caDvKS9/RQ0mHG8piXEDvHfDYCgh9phrHHyH9flU8oyi9yzuscuT
	rcDu+JlxGjI70650houGFOdJRwuucltZ46ayyH6n/CbfLXdmgQBKvKpxCOSoDYITrmghKyHjc1l
	8qITWoSRsF200WlCDFgeUkelmYJBqhX82aN+T05WHyv1Fi0rFAcRkqfI9PMk05IgCRZ9EHMrVOX
	nTH64XRgqXwQ46wlFVOvBsxRxiCGerz5MSXoZFyTnBSy2G7KWMFCPJMkWrY6ir9KwezOyU5oyjC
	qQEQaJSui7xHprBmQBLc7apIXcasidkmR3t41Iveo3rmQXz0o37mKw9k0u7+bUNg2G8k9aLpsf9
	tMlS7wU3jXkcjRqxY+UolA0BoShtNECncNc0bpTKP9WKSl5QU3+s/XZmWuKPutl3xUukQo/GqKG
	FUkPUMkqod/YhuQzmeyaeqBPwBtmqkm2W9BPSfHiUEXofC7MgZle/2iqBFnY0ZvV42tlq03E8X1
	LpfvQ7bM2cgALySYMLBAzJ1ehh4zs9n9kag7R0L6oyNK28sb2WYPHFoy3Y6VRD1vo48gCY7ljU4
	4YaBTOCn5T8LtqXzgym22a6a0kwLzi2544OBnPejNfxK4ppdHQtgRiyGOOQYjQahdAb1ZAzIBXf
	yY0ZH/TCIuXpEjzA8AwwDXRNChQ/tPPDDXVDyEtKWhYBKt/0VX+x4=
X-Received: by 2002:a05:6870:2190:b0:49e:6862:5308 with SMTP id 586e51a60fabf-4afdf4f0569mr2976775fac.62.1794594379641;
        Fri, 13 Nov 2026 10:26:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:07 -0700
Subject: [PATCH v4 51/58] mtd: rawnand: mpc5121: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-51-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102620_967805_48818A1F 
X-CRM114-Status: GOOD (  13.13  )
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
