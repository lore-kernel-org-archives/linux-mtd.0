Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9902606A88E
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B8c54L4C;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mx00D0ez
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ce384O4aKXa9uzJk0mNjJWyLb/6pJB8ng+Ef9DPoaRg=; b=B8c54L4CsdROEnxos15bIck6lK
	MhrQ2+bkTBCwbLR5W88M9vLrSwf00Pc2zXvJ5EH7yZvgwAuZiaGO0+5YweKqI4IqOQTH+5xB9fgDK
	q3Ki87r/n/RN8ZpXZj4J7fB3jazwGYmuMd7GOwITY/XlR93GQM9Pa6OtXer+7wkDHRRHNF8zNEfrV
	CjN0qZn5tYJyfSPM8DkijT/dzCgmeskNsJ60xCLG6rBIhDbNKPxuMM0PLNM04yeLYxyfIyPySIJ8E
	Kjv1Yu6Fmuqbadz4d8CCe3ATQcOgjB0UsLTyIDSfKMexreYD1f47VwcF9+PcsQk5p0+hSRqXLHXTJ
	1GCYHZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE4-00000001Eso-16Fu;
	Mon, 16 Nov 2026 06:30:00 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE0-00000001Ejx-0Hu6
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:29:57 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6d290b10a35so1088315eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810595; x=1795415395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=mx00D0ezzzJuLvZrLeynzxLBVUgxEnyzJ+173PVL6TVqBrANVnbZ9yweuIgMaOVJw4
         oGOEymXemUzksV6FwJs6FyS82xDC64JVmohgA+Uk0YerNAn93wWmOYNRNzmn1W8F37dl
         dJN2mYk81IvhShDjSYR9JJY4b1UYAuNHmKI+MWfaTc7MzgDLN+Bh2fp00Mp/xFQayWpt
         coMRuF6bMwayW219GnraFLFYcUKUq8lv/sGMSdj9YK75CPJD99eW/fikI1K4j60PZkFL
         zzHdIplW0cKOkFVcTNNVtG/jUUSdKMxE3m1TeeF+fMcPmonCyiWE8XjjKrouDoLLc7k0
         ypkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810595; x=1795415395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=iIDok1QmYAwmB9968NN/fU+sGUDY3GLvmwcUzrzxsfB5vy/OGWOh/GHDrOtYXH8kh7
         5SdBn3qLkUA5Fx8gPC/YFMAjZcJ+RYZo3VUAf6tQ9KN+xtvd1IixTljwOPzRNYqjtWsh
         8lTf7LwfzZVXiBzpw2gmVwSdX7QqSpe/0L1MIfTA2GW4rCP2CqSRDNFA66UXa9DHmnLj
         UYw0MYFK0a+3hnElQTAfF15DZ8o2JjTADFUmDT/oVUCVUY+4hP08wKcyHZn6Hx4DfvLq
         eqlt4lzBo80JwP/9hdyy0/iu65anJEYv5cDEBwfCBXv8q3xE/xFkNmTpH77Dp9kak8Cs
         lX0A==
X-Gm-Message-State: APuU4Z9eAuNQk8tl5t1wHj7dmHDXKmMj8+JqrzXosU/CFQMR76Dlq5pg
	v9IRveWTgWjNFQ8q2eon5Sgu2DF5U1CGqYAv9rPvX2Do9Et03i7vwZVj
X-Gm-Gg: AYBFou3J5k6iRIugqBPFaAOqo+bs4gk65ir9NYdUsHeXJNCdELUPnDPIuB/gJcUgoyC
	whJeLOtelUKmCBKbJ8FwQ/Hi8CKR8jiiD0sMQo3L/dZcHh34LdD7botbHfU6BAwPUhEQobSDGoC
	7z0csGICA5m0q4co8spCEkZAzjdAVO7r44PBfTJVLvpA9BQc14a7N+tIdwDYM833B5DZGxC/4dg
	u+SCRWL3AGHkJiPRcxhK3f3jf07zkcQ2Fk3YgTFNmQwFZySDu2SHiWrb/AJnCsyzOjLkNMV0QBj
	4ekbpGcFC99RWDMdaiycY5uBNk58JGNMWiLAjee1mZTlGeji9fP789AoPZvD2sVtcMgSkDHMSCs
	Vqkd3rFn16T5M7QsJVOcnpIpSOT4lBaCNppUORWFINxpslj+PSYTRmKTYACuSN5V76+B9VW1Ibq
	t+qHoeul/Urq8L1CZdisOgNUpI84AuSHvIWRqLL8ULezz0708J0Kc8iQbfM3E39cVU3lwxLfCmu
	fj1ZVi7tpWUzd5eRdGRKYf3l9uaQyEFA5SLRc/b/lRzfbymBwgYJOB7GN4VhsF8rcvos7WScapV
	wlq6QW6QgxvsOsRhYOSfW3Zapth6SThqFZPWnieZt0eAkGyIPK9PfhVGL4w/dwSFMmJapMWdTSz
	POVzvz5ClibGuISUwMum/6JluD6MQhbCFvQRvYhF3J0nZv/0RA4N3AWq/m6RoV1qDkh7J3+voSI
	VwJEWTGDTDbgkBBud0Z4PbFna1XBcgfafK85tl/rIvwVE/XRGFay/PAXSoPGk7sTMWKEG28/mz
X-Received: by 2002:a05:6820:3416:10b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-71ab51acb62mr3691644eaf.82.1794810594847;
        Sun, 15 Nov 2026 22:29:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:23 -0700
Subject: [PATCH v5 08/58] mtd: rawnand: plat_nand: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-8-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_222956_152953_468183B7 
X-CRM114-Status: GOOD (  17.55  )
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Run NAND cleanup while the platform is bound. Keep the chip, controller
lock and copied layout until the last MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vitaly Wool <vitalywool@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index a2775886e7c4..7963ca2d4557 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -65,10 +65,12 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +79,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +127,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_lifetime(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +140,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +160,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
