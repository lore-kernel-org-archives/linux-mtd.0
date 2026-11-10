Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3060A3825
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lH51nTQm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+Ew3Hbr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RlY8LZNC2Qgnx3OEavohOF8p1yPd6/fP2ZCAtNSw0Zc=; b=lH51nTQmTAMBDTT96UttgCP8TM
	IwafcOX360g+lPlD6kKHCKALRsIhhUIYOQGYRpsmktZZai+h89EwLI9rhQ3HHgUm874xIHjPA/how
	nYnKWXPAuE2O+J5jw5/Vm6rg2S8GFgo7ldFjQFgbF1Av4g0OnPqzq6TyPDl7C7Yx5Wtq2QbmBTYA4
	I95vUrjkl83PtrNDc8axxIid1YzexMxKUidA/iUcdTYS+VXEV+K22LjyE3AkeGEIhomrtLLDAZUDc
	u8c3m+hlIOUYCc46LOaWxwNZUXwtzxak4lenlnExdTFRMEXuLL1+EaYNKYNhAzs1XU+S9t0oga0VT
	pd5AGpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWv-00000002vxn-3bsv;
	Tue, 10 Nov 2026 07:44:33 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWs-00000002voo-1mU1
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:31 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-4adaa0f72abso1237557fac.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296669; x=1794901469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUvf3ot4iqxrUfrMJh1JZkfv+SBMvHqtfVJ/dUW/YP4=;
        b=Q+Ew3HbrVTF5pqxy1ylm4r10mJa4d3+tIWk4jclZ/1yeaz9AimD8z3D6Yy79aJbszA
         27zrbV+kBqbqnqJMuNdWg6+wrWu8lMcThoS65MADRmGAPV+/5jkYalfNTN0fp+K/T2Uh
         EWCWf7VAk7wYGxj09ninEUlZXagEUZVxWgPPYJXVgvS63MP/mD3pMphpIv47irVQjEzT
         iThZ8NXIG8ojuVy3XHTZZkOm4E7UOFfx8bJ3gHq+em66DZeuXs3RFeOGh+PnedcWxNk4
         IuSOl39BDIqmlm5sVvAGLCEbCE+Jf4V9WaIHTNWb4zccYb0DIoaZPl96H+YfdaqrPk9h
         FIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296669; x=1794901469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUvf3ot4iqxrUfrMJh1JZkfv+SBMvHqtfVJ/dUW/YP4=;
        b=dhJ+L6UfY85XKETWfebdorzA9626uW5nY6y+5Fj3Hmvj9yrcR6ByTyhT8O/YMgwz4B
         QCetK8mNU2n4HJOyNbV4qyKQFGubMHjkA1shjutJXGD+0u3pQFNp2OzvFSqNnNdug7E9
         WDXABemH5aRPy0fTmDrpOQtB21l46DWb+hl1tWaGLKF7t6CaRtRL7yVnx1DLQhzKPygs
         z7CbGyZoePOV5Um/knU1Kw9JpnQ1mbFVhT0I00kzpcwtLddkenwi0DCWlQ6vEbt3l2R+
         7e6vE62CwGCXfRdueooYJ0OG3arrzflcDjRS6A1TSVqTZqGAcwjc8aMkM0MmUDqj+bHV
         BXog==
X-Gm-Message-State: APuU4Z99v8g1iqXa2Dx+NYPz3NtyJR0VmkXiQ9QnHjDuJpJd6Y4wr9Yi
	pN0iDkrfb8ghj3umIqgeMB7qdWX8iqjW3bdK3LJbOIjxEGAW24uLhNJU
X-Gm-Gg: AYBFou06kINYoo/IfJyiMA9gjrHr9nVS07VkqF/GMVGv4ZkoqTXrPB4byqCndvm6lJM
	+yPBy3ICFwMUVpr/qhHvsBwsFEC2HoC3WEsmmYSWtFwJgKaRJAEnDrhk3XYZogZqeT6aSzVbx8u
	vdvTnYizFJLq11T6BkSu9mLnSToTQZ2D+OeJyNNsUWlKOOWSdF6CjCpYBXhbOZ616TPan7TZyK+
	X+A4+NG/UCMzJagu0eAoSDAjIpwbWW4/535J4NGKu4mLUlFLBI/v3ODwbzfhkjww2LQv21v+3yY
	sPnc/jBXSmkPBXhq+QCxAtnRzfgX9teafRP09aUyr/tvzS2dCrDIZdNKlscJaJ7zl/sg903+aed
	yRKVWwlavZAvIsVE7y2/TbcczSx1MDFgbO6ONF91G5gCd7msVp7hlKBeglFxD5QEzMkDGfW/aRm
	//2JX8MvlUaf0sWg3o9OgvMSygT3cCvatn9M3rSJ0lS/ZmRCrSO9GbYjnmZoff70I25niDKh3xq
	kI8yALPEYAAx1tyQER7V8xFekdarbBPLD7xxUYa/kHoymKikqXRz37bEp5wx/WH0NJ8PhzmOfPv
	ka4vEnZIBQsi0LI+WLzoIEmP0AQ3+KSt8HsoyarRBQOXKf4GkfHcET9pJkIexg7qW4PAkQj7YvR
	5oxzMQw4oXPOWxY0oGVLlLfwLiKAjSauF2+grgVMA5D4OaJI1YDWsrETf8WsXOGUfQpH28URK/L
	jAG1DJLeEV8n2orUA+UFsMYKav375Xwo+nV0on89z2NsDpfnENGr87Xxkex2UULSRyL30OJI4A
X-Received: by 2002:a05:6808:3089:b0:4fb:c2dd:c7a5 with SMTP id 5614622812f47-5688127ca80mr843014b6e.31.1794296669298;
        Mon, 09 Nov 2026 23:44:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:11 -0700
Subject: [PATCH v2 08/58] mtd: rawnand: plat_nand: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-8-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234430_655622_5B276901 
X-CRM114-Status: GOOD (  19.85  )
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
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vitaly Wool <vitalywool@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
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
