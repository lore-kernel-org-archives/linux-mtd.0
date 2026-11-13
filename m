Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C55606B204
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UQDLuUJC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mjzp7WjX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mzylaEQ1dNkH3rc81RKB+cKSZXck2K4S25Y7bD2yiio=; b=UQDLuUJCXAx0o179uspBHmb9tx
	hmRavBJaomRP9EyFJnrIfw/uS5afH16O4mkyayZ0vYwXq1DJo6Xf6lcOj+r6OQSo11BjPH88yK3ev
	B1OsrFbV01PNn14coxd6aF8I1sdFYjfuo0cwICwgOzDf4QkqZ6S0Ydil9I+gTOHkmlMwL6w1xwl0C
	sI+ri00/Ogwr5COy7Mpnu4XWvK4nxyXKhvcwVHosx6799MCk6aGureTTalJnQJJsubl8Ma9RQSnLx
	7MstjWtMNnn68pfmUv5BYOGf0XVrfFO/YlWZl7irG3nrcKp3B2UoTk8ARUuXa7RsIy6DYFQW8lDsA
	PL6VtDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoo-0000000Drko-2GsP;
	Fri, 13 Nov 2026 18:16:10 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoJ-0000000DqvO-3vdW
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:47 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-843cf077f10so2769119a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593738; x=1795198538; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=mjzp7WjXnQVBOx+MDN0IpfxVb4o5I18cHySSn+6Ox1lTh7vy1NzknVrBT8VdaGyNw7
         WASSup23ocPVd8KOyh48sh2GiZ/77VqpFlgHnb0aLDV/YYFgQRpyZ0cy6zLmkbH0rEys
         Ea1IOobD30ebmD/2cr1T+RyRHGjZEfujPIPLCB6cQNlir4nA53siMHYN68xWheJghWOd
         gWxRAULTItvG3UsUzMur/QpJwi8qesw7wdTICQdoSzydqMIEUdOTbsIsTWS1OYstmCLK
         3QOx7E9yL2ZkE92gTNN72qhvJVepzicPyF+ucV+xCSf0krDvXPCZrGmodlSImXFdppqc
         XZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593738; x=1795198538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=yjBRKknv8As8NfRq/o23nbThx370SSi+XlH2TLWUY4J02wJc4rF6gEgIUuijKaaGCX
         od32dTz+iaT8SX/oN76fm7PGekGQ4Io9AMH59hye1DM9yqtGCu0N9AC0VVO4mALq1+9e
         i0mCJRreKa9kee+Csccb11eqtTOiUlIVMArzVVzO01vp3+de/SNpvMaE5m+akjF5XgKU
         bQQjLTj2g3mU5BlE2+CIcdBa5Ou72+SlISX9+LGAng60Ws8SZi13db5B5r4LoZ/KFciN
         iogxoaEWoeMN5jma8ftJln1JOQu2Hxg4Rd4qQlWS7M+IzQNM6JeghT9AmQoPVobXViT1
         aBXw==
X-Gm-Message-State: APuU4Z8NI+JeJSEG5hur02Z06Am7Qc+eMaMylw5AkoZEAJNGL1Z1zNVf
	fSE1low39zgO/w4DkPYzgRyzeEDcaPvhHWkUMLT35pYlh/bgwrw6A8J8
X-Gm-Gg: AYBFou0SQrQl2hr039RowW0QrdqOMPNNRmz9N0wknw6Xhb+4vTMxtx7mz1ZuAILsBEU
	DxwUoJ2+/KZtbXIpfP6J0Zk9c1PdfpEred4zW1YfL0QlRUrGu0frB7JWsApJOVGjDse7epPVR/h
	ENQhuNzOUiqmLdDbRcEB95AQKt+WIzVKr313rxGNxWomMZhG9JWkAHnQn1eyD6IOU1z7Ugegrkw
	OZcb9vwBDkRgja7HXUHOv96cEjrJAjNZwg0f+aP6ziN4kJlv/lN4Hs5t8bn7xKHZpG6P6E6FgKH
	cwT186cQClbcMygXs12z9afd/O/zD/4JsG2VZKjRUsV+7hgMOG1rKnzDTuLQphNsG8yMN+KfBWA
	iVsfXz8eL1GXLGnyUC9CKS0vGn3XDLBWqWLjo/Vao65wqtW58hSO2NYZ46zsk6pBZO+0rBqEzx6
	J+snDjW5Ws3yJQvNj0gl2KWAq3uQ0Ka2eBUDFZmiO5FrqsVv0T7XPcluBGaELKuVVmq7GkcQLFb
	5pgz2fkOvwjmpa3LPmOpglOvRvdJcPg5OxkSbPAU9tDye9O7zpPB6tXaUe6ARhwu11vLLxnCsI4
	PJWsVgQrojdQa0gYN50cOP6bREUAtLWiL0y3S/5jMLjqU+nqKBtCm06iZe2ODLH1gSuDfQQxm9u
	xTs+bKO7eRZkvIUCpf4DDYB0LgPFiBe1Pbo9CdsLsGX6tD7ikBprrMIoa7dxdUlJcXrOkA8lfXx
	kev7vzmwKkUmuahtTtfXnFNRLjSuUysPqm6e0AmyOej7059J8rkQ2TMBjG2sEuaqh23WPL2r/L
X-Received: by 2002:a05:6830:6815:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-86289779881mr3048117a34.4.1794593738254;
        Fri, 13 Nov 2026 10:15:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:35 -0700
Subject: [PATCH v4 19/58] mtd: rawnand: orion: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-19-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101540_543151_BCBFC3C8 
X-CRM114-Status: GOOD (  13.32  )
X-Spam-Score: -1.8 (-)
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

Retain the embedded chip and its copied name through the shared
allocation.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 2a1dba2931dc ("[MTD] [NAND] Marvell Orion device bus NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 6cec25425710..1b1cf3b31fb3 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -106,15 +106,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +186,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_lifetime(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +209,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
