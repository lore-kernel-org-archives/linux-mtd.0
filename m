Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2B4606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FL1T4bLB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JzB4ZCKn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MPgmFYzL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S2H5POHn9PB27ONdQp9ov0+OhH/Q9iGiltXhoK4Plh0=; b=FL1T4bLBSDV9zb3B/nvBZGmUqD
	AFO6uneg+yCE9iOWVQZoBw5mF1PdsoIvHNKWmmp3fInRkTpzMaSTJbjoWsWoZmw4HA7d3sRAolei3
	kpHRFpF9jwVjbkx6B05eBzec+1Cnv5OHZ0Vzt706Lp2ZXNOKBrSLIRstS8Te7mgdVbBboOSIeVV61
	VAIjyQYpPoY2r4WG/mAXt++xC3oNasBS568PtOnqKICVmu98Qov8ei3IdHdp9JFVmes3BxjudOQOx
	MGyjmIBoZT7SHDbRd0KohVYXPRzaf4RR6N99P+/+ooZP/4jr42i2iYx369MTeWjvk+GSVla3GGYHX
	K6dz99Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFe-00000001HyV-1TdE;
	Mon, 16 Nov 2026 06:31:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFP-00000001GWd-2hl6
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=; b=JzB4ZCKnAYVaXq88UPLKZGF5Q9
	maKL0LUPCi5nNUN35QBf0nuIjpEgBIYmaMZfVWeCnuowHLqCYcgPMjxsteZSm30pCJIh5N36VA03K
	GXukK2JFCgm9/o7P24UvXq2WdZ3pFAHY2IHwz5CetbC/17dCs7fFPLlyylQCLwOXzUCRcehEucLt1
	e4A8/afmw0yDFHYe4FWOsezbWIcwGSMAQn47R05V/a9/uBdtbHa9B4jJ0pBO/U2/bXJkvewgF2RXA
	X+k1l9fFVjeR7K+sAO+Nkwv4DBgy9wu8ukNjml90ZAgoJU/Sq3+pMpDJkXVg1vnqgwD+WH4xzFx9F
	zALzUSHA==;
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEr-0000000Cei7-24bR
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:53 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-71ab5e64742so2622589eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810647; x=1795415447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=MPgmFYzLek/PlgrpWaQ6C0TmMkcCB9ovHN7FZ+/TRO0DlHjhtogbAPjBlzZtUJac1o
         /xwYXva2KOxdaZcRSTPWcECiQs/fqYkwGwk/krjNyLka4p+MteMZehQykED1NpzFMgJn
         X9sFCsAAfsncKYwKCZ+bQFe0M7p5pfgstZpzW5uG8JUpac631Y1o+pY1oDRsND7qWy/4
         9w7dzxx5dAxDtIZnSmLO1esSdIlX9JbC96UhypQDkoUqrU+W7r/RXQlfIftqL/NgUJgE
         4rkd7Tvl+PXgDueOfWCQ98QePuHn1LQ3yhsV41PngtUbL5D1T37yQtzcm9o8eImJsQma
         wJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810647; x=1795415447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=rskVVom1TBznXJXOZeizNhtXCWGV5g5cYiXwcXsQXct0mPpOv5CFIQV8yxRc0Xw+gO
         Y9GYdj371qRFW9fu8lOUk7oZsLQ7MHXXF4iRgFiLMVz3RWcRk/WP3in/dv/5Pqyz4UGg
         4rh1qwt3Gf6oqmYtD60n27ny6MZigtj7a0ZTzGeru1MWe5vl7Y/ss8IiWAvS+GLR8arA
         bdclj1u1nyn003ludAMRF3xvnMvH7vIht3FjQVnh6FPVvoy2ND04NdnDJzgSOjd+vUT4
         WqEemMZMEAlixH9fldZMhVkRUlEzZhQl5LFP2rXNwAtRB7Mhva/I8KYxh5bjtdmXH/KI
         jYUA==
X-Gm-Message-State: APuU4Z9nDz4kkLBHREkE49DpviLBWGFWqyhkb3Ow4LKRPSQbNa7ZZb5b
	kvDqUjOyfRTpq69ldqXWb656nVABL7Zb8QNFKVPXWVNHWg/KBSpf9LrY
X-Gm-Gg: AYBFou2zHDSJuLFTFxxlRsnV+aWb4VWoix/iupWeuzdUxsNohHMDRUbhbwdj/k8up4U
	bQJUQJmSQLjmbh9VJcsqo48uFbiX6h3Gpf63LZomQYO0FUg/BXKhMgoyVo0LJydyFVYGRp8Anlg
	Zb0FQEJC6e++SwQT4v+eYVgzPPyVFc1j5eleBEOrCm6Sjdc5b6ibzQPzRrVzS/IhXLCtRo6c/Np
	4Gn4N2xFNT/E82PD/nuvui2f++q7/xUoBJn2LV/a+w45BYpCBhaqdsoL9RODKnGJWfQyV7zSdDE
	C3JehMSE0dDN+HQ+SPztTdYD+tweCA43VESMS4au7iT5QwQ5uavGRXRP8UFzyn/pM9Oqmfn1T99
	ja4IFYxy2KJuhufijtjWS+0qXbysmH6vGwO8P2IN1uuPjsOu4SgM9n5yKToyCj5oAQG7lbdb8LQ
	0WG3bmZ4Myy/fTVbULVYjzP/A0QpE7HJF0iYgr5aD6ifmgYR7rc40AUO5l3w4M2ZS87jw5qHoZ6
	T3/YjP/Jv7SPsWLR316RjSQ87Uapbox1G62qClehfL35OpW3dxFcBtnnntPO08psOzO6ox3xewz
	S1b5HxjPm1Zem475KYbpXpDKlyBXTuiu0jaREfbiHr5E8vpBGTfiXWO4x1ctHfvzE2cYGd9EPTk
	+9eis+CBvhLchJVkXYAxkUy9CKubgs0EMjsUKyRRIkDGr+u2VbMBrv/936hjNxo4SA1WAhZqoQa
	tRHrs3dedaMojQN9EX/nAm5Gmf/0sUvJt6sX4KTwP8siO5y4tXSdSGKnwCvYQInwrtwfJPc1iG
X-Received: by 2002:a05:6820:1caa:b0:70b:9b1f:e896 with SMTP id 006d021491bc7-71ab518e4a6mr6545615eaf.77.1794810647281;
        Sun, 15 Nov 2026 22:30:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:06 -0700
Subject: [PATCH v5 51/58] mtd: rawnand: mpc5121: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-51-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063051_706767_6ACC08EA 
X-CRM114-Status: GOOD (  12.74  )
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
