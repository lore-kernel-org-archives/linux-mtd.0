Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92129606DF41
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pQsVK90q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RvI/9aBW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlCTqxCE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VhcPkPIOVa7ozUte33tph/yKQKvuTUspu0gt/HBJHAU=; b=pQsVK90q+Vc2WtvZ31xekz2AFe
	RJZrkYoIynBm78yvUBSWIQ8J3SVqyCoLAp8enT7/1hEqT0mzp9W6QyxhmufV8L8EGhuhxeyxGjzRE
	j+Rcxhk7KKMFCIFv3Z4yFjiuc8wPq9INE4jLvGKNDe2E9TBfMzeg6qaJy89YnW6aW0PIrBaS2oktZ
	z4T8J+llfAzN24Lf5g8bylWxOjjNlYLsXy3jUphyDMg6WE4d+iUX+FYLAepPgzzKfJDGy4c5fQS1+
	ii/Dw4aPHJQKtg86HK7r+jxjV5OaPRWDalKn+YQlA+vJsCS/VMQCPD8DrdN/xAF2oQ4I3UFZspE4/
	XTkQwTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYI-00000002yJx-3SGm;
	Tue, 10 Nov 2026 07:45:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXZ-00000002xKf-31Wt
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=; b=RvI/9aBWXvjdLRrqipwNAiohTc
	zLhLXRB3C42EmLGlND2zJ6GgVvnePQ2wws+DFoytLW8t8gr16PMMBSVgXebl8KmsLa0h6F6t88LIa
	zzkPClLtJORx9Gy5N6L+Ah7l6/ruOPU7KnnKkYeBn1+O8LNKrDlAnnxUgIXqj/I70SV3uWbqbuLsX
	vcgaIIPqxCXPeOWZvGaeKQrj8UvGmJX+dBUtJ2/1pRu1aFz1rBQOs+SCt1h9tFfnETjx8CHMjLlNb
	4faevE/AmBvremc4V/To+AM9YStt1SQFNnyFX93gKYegP6HVxn1lyhwAz0om+L3+w0EF4F2sMCvm0
	APXm7ayA==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXS-00000007e5s-05YO
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:10 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-82109f51565so699282a34.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296702; x=1794901502; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=;
        b=dlCTqxCEYlb95IUNKsnrjB27kEyVqj7CnSMBefJJtqNOKex8QqDMy7dDxVA/2mxlVV
         rXQjg3eccDUGYbitNoVZe5rnFjxg4F5JfdXixT2zbgyeInrMA0oWk9hZuuJDLmidEXU9
         OqLLq/eaFin0k35aXf0JD7jwyaXFRGVJquZd6czQLPm6XOv+I0KFFkGd2TQ+E+htb/c9
         9RVuiPGOJt/SEAZZrItpvFJZxAl9khiZpG2LvhAoGjQ9ct2pGIymF9grEJHB3nrwoFlF
         7C7HRMUIHCVlztPxbyLazCjpy6+n6sv/AZWqJEsLeMANL0K9zP7vwfsaoBw1VjjYHriY
         hzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296702; x=1794901502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=;
        b=IovAewFEPTZ3ahZeNfolwCZrC41W6TG1KSKYWjx5YdTdGUqfba8enuQ8gO4vYrw9BL
         7W0kbn9JeEBPtPqz2qtH1B6cHxqchzRq/Fl1Nc9toS9erUCVJiNYkjoEoRu9mYgjigZ+
         5rTINorCZaWsnt+BOJQiKwOTapiaYydMW5cozWHFh9CUK/N1+qrBq9WPyFtdgKB1Znuh
         mMmfbbViDQATnt74H3qBkV8vHhf+43HFVxnmVAK3Us4/oam7uqxkTtb/U74jnrownMwN
         zhQmz9BUOAH80EJ1qj2BDTKmWSPV4VMTAYGX1IvIA9xyw9jo0TgsRhdEf7nXOD8VnXYy
         6PVw==
X-Gm-Message-State: APuU4Z/AudE+y5DEWZdlU20liTE0IHJAi29UBE27voBBRtmOhzchGTcu
	W5H7pPkRN3Q4lYcGsFm7wJhE4GO07dvQFFoYWV6lscnFzB1xAbVzr9vH
X-Gm-Gg: AYBFou1kT048UrIczDd5m4GGB2NCHRK0MDNyPev/c4Ydrr9cnVmzX7L+l3ZeLr5Xljb
	VJt+QaegUQqDOY5ia2KPJj4XNSAzPNPNKMNk31nfvB3jaSdp5rM25nn4YZ0G5ouReHvHcjgOhdr
	eAa6LgQ7KSk1eAaVb92rSWbXRA4RKwWlVSFvAcTkDjdCOwazHIhES5l2c85t3zWOSUaXhmnEzL2
	TilXFoIAVSSf7cePv++KEmSQnSw/HXlkI3MHBwhuTIkdVZKn+Re4W6/S/PN5oMcev/s35Ce1oB1
	ISDBqDi/8Pt+fwQStnblR1yY/WnJUsrvIcXQuJJCdDlx7Ko72KhMZQL/qkRxagkH3jQqpDEPXgO
	R5CNR6WE//9RLDH7WoNunffvqg81AJR+7MMNG9dstnKMxbjP7FKpLpj/ATI8PqfD+mmwzA9mNvn
	/HxPnJi9ONcl+jLOTWrjrvwa7SRg0jv+CN1NSkKOwg1vMUF50r6TUulIVTbumA/VLauqthoCuFx
	QwswgDlH2uuNEdF+j8uBO+OVjrfF1zF+lQMezLJ9WWzZQ5y0BjDHTu1hxIoLg+Y5Sns7vEHkoUt
	5mwzjunBBRyFSFIJa6VzYxzO2a1Q8XdzMRJR2ErlhorKxte2lKG9Lq4pKkpvpZqxTI0WNh0g0L5
	zNaQ325xPiNqUenD1yVKKPhzn2CWk4bc/QlkHXjEa+V739lckSNwLhPlWUNcpTGOrpcMZNajXqd
	Xs5Ua1PW4XGjbrBbxP/kgrcSypvco8x1U4UfQdM8K3HcqHWbH4r7Q=
X-Received: by 2002:a05:6808:c232:b0:4e7:c6f2:75a6 with SMTP id 5614622812f47-5683cbbd185mr1424922b6e.68.1794296701713;
        Mon, 09 Nov 2026 23:45:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:40 -0700
Subject: [PATCH v2 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-37-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Liang Yang <liang.yang@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074509_349059_756B4846 
X-CRM114-Status: GOOD (  17.91  )
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

The deferred detach callback only frees heap-allocated transfer buffers.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Liang Yang <liang.yang@amlogic.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 55 +++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index b8834aa96e81..4f33ea7a1b4d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1381,6 +1381,11 @@ static const struct nand_controller_ops meson_nand_controller_ops = {
 	.exec_op = meson_nfc_exec_op,
 };
 
+static void meson_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(to_meson_nand(nand));
+}
+
 static int
 meson_nfc_nand_chip_init(struct device *dev,
 			 struct meson_nfc *nfc, struct device_node *np)
@@ -1398,8 +1403,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1414,13 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 	}
 
@@ -1434,14 +1439,16 @@ meson_nfc_nand_chip_init(struct device *dev,
 	if (ret == -EINVAL)
 		nfc->no_rb_pin = true;
 	else if (ret)
-		return ret;
+		goto free_chip;
 
-	if (nand_rb_val)
-		return -EINVAL;
+	if (nand_rb_val) {
+		ret = -EINVAL;
+		goto free_chip;
+	}
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (nand->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "amlogic,boot-pages",
@@ -1449,8 +1456,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1464,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_release(nand, meson_nfc_nand_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&meson_chip->node, &nfc->chips);
 
 	return 0;
+
+cleanup_nand:
+	nand_cleanup(nand);
+free_chip:
+	kfree(meson_chip);
+	return ret;
 }
 
 static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
@@ -1486,8 +1501,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1544,21 +1560,28 @@ static const struct of_device_id meson_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
 
+static void meson_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct meson_nfc, controller));
+}
+
 static int meson_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, meson_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->data = of_device_get_match_data(&pdev->dev);
 	if (!nfc->data)
 		return -ENODEV;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
