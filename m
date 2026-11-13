Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187C606A33D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sv9cfluT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RMAEaY0Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYBnM1c/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0UC46j2nZ8qH9blAdanFnB2/MIHyizk8Wq8bGV7LEd4=; b=Sv9cfluTht+diIifUGVjZ/3ZCR
	tn1wrSDUtIJu2DWQFEE79hW+qbK4QpgaBQus2h4QKHuPMW1MWrWuniHuXRjXeYG2Bg/WCQ4uiT9eK
	QLYKCHp8/ndI/rwqpN8Al8zYuXSmP2tC6WRVT9lnhm/qEl6isCITKInr/xWddgok+7IPPXxr7gZNt
	ppaMBZTpTIbDq6++gkSVPSWqcQm8pBBey8zHEHDRIrM+b0wrgoiWM42e1KMX48RTbNL4S5uEffPFF
	2/8nBuXqDNZ560hCaIWAZrgCcVXNdiw5a+v1nsuLbDFJjHuQiTp/EtvYNrC1/PO3rUoVCKidjfQoa
	0me3+Hug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpY-0000000DtFY-2cjm;
	Fri, 13 Nov 2026 18:16:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpA-0000000DsPH-3rdp
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=; b=RMAEaY0QAWNCMb2rhLLyY+8liL
	VZkU6qKNShq8HpBbFe3RxusAspOVMtT6++xwnOg85MsuOgPTn2PXHMemm6mvZGBIeJc7yJvtOyGan
	IoYouf3r730Opr7ke5z9oiDn06wCWLi4gI6FDpsJH8pB2r7tcSTRwp0WKSl6aR9MCWM2NaRvoztY6
	l0LOCzKoZisu8JJP2lzkpl3RCjR110sJYL/+lylo4cDMFu+vVRD1h2fomg1AqQfa/yeMhEjRT0I7a
	1R7Iszt6jJsH/wWsMvM5y40Gi4VNwFkM8sB5GQc3AJHoAnBEZ/Y0NDSmOqaJq0NtRwto4q7EkN+/X
	rneduRDQ==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp6-0000000Bdtr-30Df
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:31 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-84e513877a3so1984094a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593787; x=1795198587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=JYBnM1c/xsdd4wrWFsHVxk1qqM3HF7B+wlDOUL3kALgmAvYps7bMNflpU+03B1Bwx5
         artKy1Nf23iFlFi1HIzRfuHl/vr4Z8BLhNyajpkAIbzSJDZ1BabzlWNoyGfEIVg0Lm9r
         JWrd59H4j3jSyd7kKB7zeLr2fcIvAopo0mpbLY0szyaoXGg18ABaHcC3/5ZSJimEVXdA
         WH89RH8gO1Z6U+Jae408I1SR58o65EwUygtPkG+dXVB500K0smN1srMoJIe+hRkceb6D
         SPAQ6U6n8JPEbjHWWB3f4BsnLDRU7GkMVX+8xa3gAH6+coXZHEVzXekKjoAMrIcdpjJQ
         OP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593787; x=1795198587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=j/nzKjalmSEnsoY3BLI6boBHex3H34Tu704LEKu8pSgLC+WdKdBh1YxDj5Y4mHVzcj
         uuUk43aL6UnaXhMa0bFnnIkWQZPxIvaNr6LRW5MQt/ZhMA+4zSVcLcPYrj8BnkMAE9s7
         9Kjj95xwJ5KEZ1Zc0zn1EddzElDz2wz8j7qlxUg+Sm1NcLz8chze0+PjfgTkxvV2JqlN
         Yxi9ncTbb6FtiCGYKq3rYdPnCVIxBWkxnu3DUtH7mEpBGF4WRyMq/ijts6jD8x3wrOpj
         4/rJE+C5nG6OopHYdhw2KdEI9dJDpnOeO1NlttGQecYTaWcVr+fRICtUUljy8zE7IGDC
         +5uw==
X-Gm-Message-State: APuU4Z+lJ6EO2USpQPzidl5wnuGYvZ0RoUGuphkiLAEDcWA17y4px3EJ
	+/xsIhk26XOtFsrhrj2iwgHZN0kmd8sWph2dBPmQqWKTu/RE4AL3hiCp
X-Gm-Gg: AYBFou2QDLg8J4kr5XwZDvdzEVih0KfuxWWxteS2lOTjRuNHNW8dvMZcHjoVLhhHm37
	iQI0zUMjkny1Y9pIttL+D7IMNoC60/v7Ri5vtITynqHs/xoH6Zj9pQ90UhrQozYcri/kJTDQMWe
	L94RjBSLc9MDqjlxKZJGtzsay5stPqD0p1Bj2VQQlttLcOus2+2bA7+xblsjNBzIqWo6dEfdV9T
	i1cTk4V+vNdgTWgoKpGfl7RZZk0w/ZiPabMVfkIU1T4x+9lth5ZAgqVcOORXd2/BLaZ+qrKf7TP
	MFjfHAXZoAMGFJdGjI0ALX4brrPaOfiiB1OdC7QDBN4FMLZhYaqvAr/Z+QPhQkU3ozh3DFH18Vz
	xdL/OP7Fxxi467JJ5PJ1c03c76El/zTINjHdyyxfIRNByXwMOvWHz+qtKB8gL1Kj8aypbQyMKav
	0znsyLd+1Gs7dLpIgHcW3RW/DGIG9AtbpyNR6qoXTFxz6uYjg3DqVNxPapbleowYXbphy7cFQ2L
	N5JWyUFAQzGyu/U6ZDfKrgT9IUjRcpDPNoUAUbXkHZv2HpGee6CYr5g9BR7vWupnKAAoK5AfIN4
	BC0+7FYOfbF+Z6hFqqDmlGZPQm2nlCtM8UuLWsGDONWBcFGAETslFy+5mJludqQeNLj2qz3ws5T
	4dDgle1lJ2P2WW1hSo9usJOPe2pipXiZspBFwxGlc2UxL1lC43+nkKFySwQPaGCcQWz785nLXs4
	E4cc0RRXuqwbdrtyRBGy9dqyB27ZlxpptPyJtW2BtAOax0RIuROMQ=
X-Received: by 2002:a05:6830:7183:b0:861:5924:c305 with SMTP id 46e09a7af769-8628980c4abmr1694581a34.3.1794593786906;
        Fri, 13 Nov 2026 10:16:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:01 -0700
Subject: [PATCH v4 45/58] mtd: rawnand: sh_flctl: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-45-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181628_644252_11E51584 
X-CRM114-Status: GOOD (  15.16  )
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

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 36ba5b3da3a0..b230f5ef448b 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1119,9 +1119,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1192,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1218,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
