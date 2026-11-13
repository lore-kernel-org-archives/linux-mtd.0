Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218C60A6F74
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jlyacuAg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfudGMbM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ce384O4aKXa9uzJk0mNjJWyLb/6pJB8ng+Ef9DPoaRg=; b=jlyacuAgBsqlgFE9cePY8nBHdb
	l/1x8fL/gbIfmwLXjAXX0RpXbHNEjdZ2ucUAWOcM3ShVdxeqGJ4+IcYTnEFwh3mFXMcY0shIQjErH
	SYJU8cUK78eUqUtUC6/HYw1QI4IVb5+aUBOYwv/ylrzrpZKEGZcqTLG67bOOQaUHG0niGUfLxf3VE
	GtPptJxzwdvhdIrV6bu9ckPlGbTaaJuCBpt4S+n/8JCYMF9IKqj+WeRZkAnR8DMRtBajwZgVOR61X
	ny+51JxCGrQ8osA8WA/uQn4+6rdw5wddTL9vhlVMf0RmDQnGLivPF4g8hmibXQga3Xv5MW3Ci82gG
	Ftktvq3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoH-0000000DqrJ-0OlB;
	Fri, 13 Nov 2026 18:15:37 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvo4-0000000DqY4-0hln
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:26 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-8451a619da7so1559601a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593723; x=1795198523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=NfudGMbMkCCnC2bnvHe1dPPHCPoE0/z3aYSKdOE+u+TMJZxizf8FPf3cIhMU13YQXu
         mEHIgOKBv2ssJ/dzBsk7ymL7tI4PS4PBWwhTQp8Rew/3brJM8BPxKFX8O6QvB3pVHW7G
         WT/96ba52d3qGW6wBjU2QENRxTbf0UoBZOfxGNa72yYipDx4v6hxOkLPVe6NaiBLiu7Y
         3RmU+MaNoJ2vC/M2r2eV1VvpvX3xmYVE99em22ZQ6bVJ8fIffsd882JdVYbdPAUXYPvD
         9KmnNn2uq/v2WWU1+VDOOmHR02s7dGZBseQzKbhz/xCgWjoMYNS1JqKypr4wJ94q7m6D
         QhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593723; x=1795198523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=f2iW/t0l8HmM+DnHi796xZdn4fVY2Wc4WDd4YpRmGRQSi2pNg480NoxwhHXhZdNtpq
         xseLcF0FZLafkyv/qWrOtn8CpXH7VW6knnOKgUxo/RmaznHpE4SEcuuxlLHUsT9dhv5I
         Vb8dwiqIANx8ckZWN1WKBf44VS9s4z5BV/NeUGDgl2PFX03SD+Nj6jSjY2IR5J+Xf03n
         Xwqtu2h+sh1hlkKITRf5VmmYMKQp8C/oG1UbRoayLdOLrUFnF5jkyHAjoiy0TSDYYnig
         NnRActo3lnVo2EKvzP87cPON4mJlzpYo5KALfldTkt4ddQBUPItd+QxiUU4DuDbzzN0c
         q8EQ==
X-Gm-Message-State: APuU4Z8gTBRpVDBgaQ0fMVgNucj1ActsS1rWvDG5uensctClTS3iGhaT
	6iUQItN3/r4J742UW3WKgBDEsspgyl3EslLp92Sh4U5q5VsWbr2E5zdi
X-Gm-Gg: AYBFou2TRmNBhXDS11ngPnGgwYy8250n55GKD8XnZeE/a1UVVG2EXBMavdH+fUTpAxz
	vF93lZKkiapz8CYfxP3yVEQXhzvaIRPb+i98JJ/sV4z5g8rDcWuS1iPbVxwZwRE8cTmcbSibE3m
	Dg6cLkYBUeXHd5UjMj5vBx2Y5TOeWRYMbMtw3iYO/AQKVC3yIWieJr20K0vEI50Ecm1pC4G3aLn
	DBuLa4kEoaohebYRx3+zgRxtApUR0FeqFoK1DZv8QGw5b3E5HslAfLZKGwMhm786vJvfGbJ1r34
	5uknilqkFCKCNT+Vqq08B4r1GGk14QY3qjjIhNvjZnDdvG2PU0bV1ql2ZkdBjTqJn39QRtNxwHY
	uou+45U7lsYHMgQETOI8pkiMtT92F+IH7reM8yji3enKMQ0PC/zDxRwc2LIyleNfbJBBdjKYei1
	jAoa2T/F+3gCvO7T1Qh1sOQkhan1jPfXBL3be9AMF/Ik4h9PP4st3UZjJiBcj5I//BhoOm1L+RD
	ugym5/P+DaEo0xlG7VwEuLodCYhgu5KKhEGy02BkJfThF6t5W8KSVVjxQin/Ff4W+ljRo2gu6uY
	c5V62ymEMR5AMZ7kqbAUYHFF48mQd/4XMkK+QuipQVV2r1bIWYKpftnev3UAF/r1IT2YT+FhxFY
	vB8BRy5WH1HOYaa7mwQd4Huatqp/2jD0aWr1bHa8aPSDmHdKRZjgFkZ7hBsugNqqFMKWoEFh221
	6WXzAJhM5vTyYu/YVYBVbIU2OUoUVWcSJ5VKzQL3tQy0jgveYSx7V3/EOzrGCYbOMQ0PXbeWAa
X-Received: by 2002:a05:6830:449f:b0:862:8897:b604 with SMTP id 46e09a7af769-86289904752mr2835539a34.25.1794593723061;
        Fri, 13 Nov 2026 10:15:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:24 -0700
Subject: [PATCH v4 08/58] mtd: rawnand: plat_nand: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-8-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101524_741956_0F45A893 
X-CRM114-Status: GOOD (  17.50  )
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
