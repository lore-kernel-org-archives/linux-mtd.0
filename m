Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29D8606A337
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Z+mAWXF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rbdDxkNM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lNZstP7Hkj1R1TINoQ/5MQHf2yjV11WVucEqk8dGuYY=; b=0Z+mAWXFoOMPf4MbCgOFKZ3OiP
	7g6x/Ao2FJweUmD82xhAoS6CJGUNhBxsr8zoyRSnK3dDqv5P9Q653gZqOBK3xjAAJrq9MSqJtdGRO
	qI3ESeGTpFX0Ul2Pt/Tx12ekHkJWz1BIR6oqqY5b92xouq0TiNgRsV1AXwZe+IieUfk2G1iTNm03R
	1Rb46kyWbW9/3GmRx+wPnHtuTxxOCV2YWmcQbLHoh4F/zCFzFvtbzbiL34gGlD9KvIJF1Zw//fZcq
	jfX7aqCuvnibGsokiZcKEduN6IOFyOYIKBCW2DbubQQKSugnt7Ff1v1Koy8i72EnUF2quOI31E2sA
	hcs56+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYR-00000002ycK-3pOZ;
	Tue, 10 Nov 2026 07:46:07 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXX-00000002xGR-1dgH
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:17 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-833e671ee9fso1704647a34.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296710; x=1794901510; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
        b=rbdDxkNMCCCuX0U/T/oHpHOLGj9U4xGesLrEK6BJ5NR57mB4TUOnbuNQwH8cTPi7uW
         x8nre53R/anowWy0q1lZY7wjtYBo2cLqMAT48iWrwhJxt/7FRfPD881bl2t8hT1uWroz
         6C5bvEivl4iAa0PpwdhK0nTM3Zdcsh5rVcrHSj3G6LuhwR2CbYJxew3tjPhRKjQa/vrs
         P5LGaLUMpUcMjzSInqr7SdfeCJm7wZwa2ymF6WXdf3dpyFwWdFS0aacLJDyknpc8bdsy
         aI65DmCqUBYsvgMrmMNzRkCGAX0A2BLJ22VudaqtyeOkVis9dlqFmPpbeJrGALwggwpR
         jFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296710; x=1794901510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
        b=1fPR8s2p6NGNJki04Td+9YqcFzWoHRHw4kmr3wRsSAozrAdevrdfH+XZPXdzEyjtbk
         bffaFflvg/9CGTkTcSpkqZCy6QDCbbularqMwg3kvov4T2zm/jgmfcDgVk5fUTNQNcDg
         xkLlZ1ZRbay8XX/B9lk3mxHlFkTA7dUOwxJHutUi/xO0oLiEzcvbKVm/TAyPQKGo4kdn
         8SlfqPqTGbAQd1+CPAu+3w2hDvsQxlakXGucxQqacLNnmjK7hSmSn1BJr6vzNsmG+iSf
         DKID0fFeWElOKmI2N+J3KXkkiwSOtblZSqForUrBtdr/jVGujqLmJfnAwlo87952FMFl
         SNJw==
X-Gm-Message-State: APuU4Z+BmkUAMnEEGom1cODHY+k2PLwxTPOJrvJlCXXtFuDmQ2FkdHkX
	Dzy4X/ZVaPxWE5tjeYPGaf4zoZfyudGjXX48kAp4o8nwrAjnPZsmhDLp
X-Gm-Gg: AYBFou1GiLn11r/1A1eoMqAs5c9M9QKNmWb19r7DCH1KBuavQ+2mKEiQcIFCJI39Xy/
	N7X+nvF9HucRYPC/99xilY6f98cPwbR1c0f+pBqWgzon/YbLcy9PoSoOqm2lZHT4VYd1auzqY8F
	hygnN1y2OsxE3tmwqGbwqetzngSo3TMWIJW/quK1QsZq5v4nMybb+IbPoyDpv/fTzQVh0GjpFVX
	OV/V2XPblgHeAvoQR6DQjEKmfxZym5Niu2nwDBHZPYIPv0BHMR69YTSzT9QxK/bMFW+0SvoVAXw
	Pj5HJdAhgs9Dwj+Oarc7AynDzllZdVwV3Sow5jvi8aolKvmcnvkssktQb0kCbmA0t7P3FmtpNHj
	1VwWc15CJZ6LanTrOSDwRbBYoTAmMguScW2pp12JVINT215TyiUuJrWIJA7oN1nC91Ck1XCWsMf
	wEt9q7N/X8QNw/L4tuyq+7eEZOQUSHiCXLT8RHs8n2AIFiQAAu8OyqaBZfgnGKCnIpTrRoAIl92
	kJ6jjkCRUFjhsAzAN1Pbjc2w6kFqJGiRzoKnXw/1wfasipI0xNsTjmijcxeedpbQq/bE72PWQah
	jZsZfSj1ePXEIRjH8eeZT1dLt4dP5NGrE5qPGCMZDXUGY2hmElx4VpyEQjKNSr7tFI3SO3uH1Dg
	dj/NJAUzRnqIqXJGnDv0xEs61o6VFUIVQF31HAK9/ptePKEy1jD6Ppa3IWm4HqEb97h8wpXh5Gm
	Aeo3PPOnOyU47vIl1kKghx8FVieDryg25RB81S4ZzsdyEKE0FqCHo=
X-Received: by 2002:a05:6808:13d5:b0:4f7:8bdd:b74 with SMTP id 5614622812f47-5683cd1aeddmr1579138b6e.51.1794296710142;
        Mon, 09 Nov 2026 23:45:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:47 -0700
Subject: [PATCH v2 44/58] mtd: rawnand: davinci: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-44-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234511_573939_D9ED1760 
X-CRM114-Status: GOOD (  16.31  )
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

Disconnect the chip before releasing the shared four-bit ECC engine.
Retain the chip and controller while MTD references remain, with final
NAND cleanup independent of the device-managed hardware resources.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3986553881d0..2231e6a45114 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -895,6 +895,11 @@ static const struct nand_controller_ops davinci_nand_controller_ops = {
 	.setup_interface = davinci_nand_setup_interface,
 };
 
+static void nand_davinci_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct davinci_nand_info, controller));
+}
+
 static int nand_davinci_probe(struct platform_device *pdev)
 {
 	struct davinci_nand_pdata	*pdata;
@@ -919,9 +924,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, nand_davinci_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, info);
 
@@ -986,7 +994,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	nand_controller_init(&info->controller);
 	info->controller.ops = &davinci_nand_controller_ops;
 	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
@@ -995,12 +1002,18 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nand_set_release(&info->chip, NULL);
+	if (ret)
+		goto err_cleanup_nand;
 	if (pdata->parts)
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
-	if (ret < 0)
-		goto err_cleanup_nand;
+	if (ret < 0) {
+		nand_disconnect(&info->chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -1020,14 +1033,16 @@ static void nand_davinci_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &info->chip;
 	int ret;
 
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_disconnect(chip);
+
 	spin_lock_irq(&davinci_nand_lock);
 	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	ret = mtd_device_unregister(nand_to_mtd(chip));
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver nand_davinci_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
