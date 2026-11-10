Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ECA606A94D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HROsUuSf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYPHCTTf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JQ22k3CXFx71+Wccp6r4psk2KRwHal9kD87f6AM72BU=; b=HROsUuSf8xHoHLToCo8MJ4Wj11
	EqoBPl+28IupH3PTQk01aBiyoE31m2kZj60D+YDXjuQ1sU1Px0qFH660ZZZFXlrHmESEb7rC01Zqq
	rEFohSQoweW3EW7J4uiNA2vNVVG2aFx2+WbSrnqEJNh7IuipXeLp4JIXgRA46UnLeNLMnSVKMV7ul
	mdQS36l0tKVcMIeaS3uP/g5NEl9wDDyQvyudOxuTTg6xX/KvUtSfC1Jbi2rrBtbYboDR/JzVnoa+j
	g1uo9zedY621aHonetogItpZkD9CoapYOSpQiwLo6LQWV3nh9nzFIIPwGaGhtVZAPg3WcFGb2Bbuu
	RwFnQ0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYq-00000002z7f-0puM;
	Tue, 10 Nov 2026 07:46:32 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXe-00000002xY9-46Xm
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:33 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-70b875f6f13so1344331eaf.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296718; x=1794901518; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gqrRTSfkd4qUlgHqzykH7Su9/kkdmS/joWQRvX1nxI=;
        b=qYPHCTTfoK3tOMoYMKHqoE3mbUAK0DkJqgVloNoTdxljAEaLF1xwGJkpjXPgN9SZiX
         0Zf5B80iD3X6WiEEK5lovCW6syTncC6D7x5Owrynecs5KWxJ7TyvlS1apjydZSvaaVIQ
         pYpzMTjEh7g8Zrf2jr1JqNVUJ0gs7n7b+hg2dDKz0BJ6dOXnjiac0Z28L8TASEpjv9Xc
         HbrIlpo9RQUL7qrhbloQzwSbYDQjiaJtPyuohK74isj7MZvqCn+UlKq7hdADllweAoWv
         d2+7AVc6PoAxY7lbdapv4WWB/IzrfzCMhlWahw4saq60UCFgsf+40sDaNOFH52xwvh6d
         2g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296718; x=1794901518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gqrRTSfkd4qUlgHqzykH7Su9/kkdmS/joWQRvX1nxI=;
        b=b1yranG2pPHdIArnULD7KsT6DezGhQRb7R96suMbJ9vXjORaVVnD2JM42qNduqGcVU
         w6trUAvGG8aILuQjaSECDTXFbVsBZ0hHDB2u26MAqlgs7+NwlsjwyCpO0GsxnNwK8ZoW
         rxLCXg2uwmorDOh7idc72RrE+mDUzATJLFu825IJvLwTbTd7Y4nRD6BUSH4+dbvmGOds
         UL9A45Dx5pQTo/ZKFGZCawEqPN0PT7GCynF5PcBrPDsUDW+kYthIIQ7ytUkhvCvr65fd
         9Tl1SI2VeRXr4CvglMYNpA6WDiybvHBrgCb70oYDixSkETMR4J3buzmUUhAfJoFMkTps
         lg+A==
X-Gm-Message-State: APuU4Z8OVwoDUriX2LYMz5ozFgEDcoxAvtUgInSDd0DD2pw++TybzkOQ
	5Lmp390U2QDcLEtt89VKiE1p1iKXCgF4ns5tgXS9eIHkyzzQCejX9oiK
X-Gm-Gg: AYBFou1klgUGCj9urtBZrUtil9NiVSz1ZBhgUr9Mnc7I0DDQ/TcgBRxdXKufooCVQ6p
	uadPpg8zDyt5G4AsJKwz4PAGDYAPQyn6B7zFgG+z+1k+7V2flzPfZUZ8xNYn5aZ9aRVhBOayXpQ
	0U2Apq0ACV1nXCTFGSLRPxV4KPEnxSWH1UdEIO9yMikog30UFpAvDsZgbFzYRTnNaCfQjfrOASa
	h33uCUPs8bO5Jw+l7D4Z2Nt0y2mnfJ64ZCd8Kcvj85W6WuDjlFG2deN5b2z830YZ8by4hG+WfFd
	G8Ew+lIB3niLteuj3W0r9YjwhDC94wJZ16JtGwZchDl2w45baTGHaoXJ14jpz4Snb2ue+rUjQLD
	F4H4v5zy5g/ovMnPNySxFCtV65rezUxpkpHabmH44fBgLlWTeTGGjvY0d32ZTUJ7Wk3734MeOSW
	C+L+UVfKxvPfpIEZs68iaFhlezrY+22BE1IDnx1WuHiVdyR/w/E4Z2DS98bqPKhS8Fg+M86gZFa
	yGweZVINr5zjGzxic96JH6Ee7NCPVVMqzkZNunpIsMlKJMvm1vsrO2irwyTrCZoFoUScyuGgBCn
	LKlPlYvdrct66LzU/ge2P+2i5TO3/X+5Kk5X3TM9C+huZ+xwJfwfBfYMn7BMMNNj+dCd6H0NhYQ
	A28CFVqnmRu4KwINODZTnhmxzZkRt3Yp0iX/hcMJ5Jaa8HA+pdBqrkwyovc1IyDF1cgDI4J5Yim
	5oai9icVnSVGRGl6yHRiVluv+Qn5caGGxRisZFYfkJgvO5jktwpvdJHPFBRYycokd7F1ht7Kmr
X-Received: by 2002:a05:6808:67c3:b0:4f4:d914:8603 with SMTP id 5614622812f47-5683c946635mr1510202b6e.15.1794296717893;
        Mon, 09 Nov 2026 23:45:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:54 -0700
Subject: [PATCH v2 51/58] mtd: rawnand: mpc5121: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-51-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234520_505160_3C05FFDF 
X-CRM114-Status: GOOD (  14.06  )
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

Fixes: bb315f749f8c ("mtd: nand: Add MPC5121 NAND Flash Controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index e6594548b7e0..1618f46f69df 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -611,6 +611,11 @@ static const struct nand_controller_ops mpc5121_nfc_ops = {
 	.attach_chip = mpc5121_nfc_attach_chip,
 };
 
+static void mpc5121_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mpc5121_nfc_prv, controller));
+}
+
 static int mpc5121_nfc_probe(struct platform_device *op)
 {
 	struct device_node *dn = op->dev.of_node;
@@ -636,6 +641,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, mpc5121_nfc_release);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +656,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
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
 
@@ -782,19 +789,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_release(chip, NULL);
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
@@ -808,8 +822,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
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
