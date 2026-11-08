Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906C9606A339
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LOKEdtQT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EadXu8EX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PRCqqQGbLOfC4cEf/+MQ6RgDV9hlc1G170vO40XC6RE=; b=LOKEdtQTRkzTmF3Wh78bnAqixN
	mNNbUWvxFL1eF4ftzc8SldtGeoPQUnMky22K/iy3l7FvAaBXdIJEIf1kxobefhiUz2m7hKm1oWBQP
	RPezYx/VB6qXi2TExYBCn9Nzi1Ce8ibQnC8HvL++pAuhrISLuY3q+pH+hZ2aTPH4NOiIK80TY3oIG
	H+pCCOyktkhLQb/lXuw/HoI0XFd1B7/KshFI62AIciNRTy8S0cMZkX0eLZVLZYx4zNBNw1f7ago/u
	+VH0TxX9SoAqemswbGHUZaj5WvaQAf7KIDYrCII9+AN+FOXtj7e/v0XEi5fYXNIVafxR2UxtfEATC
	FcbDIUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAFt-0000000GhZ5-12zK;
	Sun, 08 Nov 2026 21:16:49 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAFp-0000000GhWn-2feA
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:16:47 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6f5a0893610so182593eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172605; x=1794777405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=EadXu8EX3RNwUX4rbNTbGyuYx5ZD/a/kfXqivfchO1iUO2kpPpqJcLkNCi6LQbNMQd
         zZg47lOamo25un2AQtfRqVnLx3/gciH3UuEa+23y8gWeBsy0/SfXdXXGrcOVzLpiseMh
         EKNkXwVdi1a+d0C8r1LX3YWED+UXuNbDmEqYGaUVrkImViTJSdg6SXXHZLBtINB8tPlt
         sQWColpBYwc7lrVyTxydsjGMWX9QzWDILKppscxxSSLdxZPKrASNyfhbLKzUFlRlDxS+
         50apeoyPIT2SVKrxbwFUJrpms/qhIpQxnPudlNuewj081hognbxdTMRhROT033L5Y29g
         GcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172605; x=1794777405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=DCQHFj1aVef/oO8l60MV5xjwVW5pdqVJJQyYh6sz5Fw6CJUj0F9MJ4Fv5qn1vZBLrX
         xRoB81szAnbGbWAVKrx9iq8441PrJc5O2shHGWL1xZIkFwvYHfi8U4M2gBX/xymrv0ym
         cm2KTyjEtuFZ5u4wzU6QMrDgtfqZ2lnr5IkqletlHuIbpQ3z7J8ivxT2YX4bFBUI+E4A
         9W9ubIViCOYGiV1PqvYtGyNLbKa1YKJ1GDYZv//tTEdQJ+4ipDIP/AW0UGmDswbXrvzq
         amrqTg3s60Y64Skj1VJ/k2P076VO6wjbR7Kai2Umbs7fbmPI5NDtNnbi7TugTwVtph1s
         tlOA==
X-Gm-Message-State: APuU4Z9dqWVAzmKATkUFCN5eHdH8/UYw90u/4ULEUT3lnzSIAWZB5HQK
	acg1VZXU3dRf9ZnwUbET+xszQWj+2LEELQnknDk5njo7MxeDJX3AOHkY7NNNXw==
X-Gm-Gg: AYBFou2kokhbKijoILg5vaAEdfS7v+E4E20C43jzMv1PklR/oZWLr1eJSqxRIVUuCCH
	5PUVlCc+4yPA2kck058SioXaww3zJCK9soQ08/xXe6JoukZYeIazBKj7y01G61OpcngnxtO2GRw
	U/4wFiyrUzBCLFPaucYO/w0aHysI6JHk5jNdnd8oEs23klVa29QGX3zr3Wd/jQ9bQbPpBqBkUjh
	X8jEbi7l8NU7XW/CEgIIBNZD9oIL7GIv9f8RQ/O9fyBQwPFHQreFBvWDi+42MBLBD7ugrUa1kW9
	KA4V4NIe1NO+fsBj+6iYALEd/uZj3ACXY+pNl3/PrQ/9MWEmuMGsNC6EpQ/yF+9/cvhqXXfBw+K
	h515s4nP7MJHpscUbO9Nsy1KGhTDaiKOstj6L75fLXyfojpkLcOsgOVb3As1isLgqVH/4zJ4FsU
	bF6YOFtSnuWnda6mikbvR6PzreFq77TslKrIaXoi6Gvck9uN6xU0A7WIwqTLm5+UHhv+1Ttj97v
	gHcZLgiSPEEcWuEexfpg112sa+WwjjcVg9vNwKQ9Nm5Y0dFRSA2jn/X28OXu5spKKnZpSi/+JKQ
	VaImNxG1/IZgkirtdelOT4GWdQ0rhpgril9O0LLbhRnenqcSemlzhjtxUSdniOTBS7JxyWNK/vn
	yZlr5cN7LG1GqfvdzVzoq8RAIM4lOGmiUGhMi5dr7rulX9taM5G6J6TX9CEfP2UryUhMKFUasyH
	xF1BOC1dZucPhTosdjidVbxFn1940FgoAnbOBWeP0K2J9HOfMVAsWu
X-Received: by 2002:a05:6820:858a:20b0:716:e3d0:c671 with SMTP id 006d021491bc7-7170f25b9e5mr902761eaf.14.1794172604868;
        Sun, 08 Nov 2026 13:16:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:16:37 -0700
Subject: [PATCH 3/3] mtd: rawnand: qcom: unwind registered chips on child
 probe failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-3-509f30a9e14d@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131645_923070_C69B5F26 
X-CRM114-Status: GOOD (  13.95  )
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

qcom_probe_nand_devices() continues after a child initialization error,
allowing a later successful child to hide failures such as -ENOMEM or
-EPROBE_DEFER. If the last child fails, or allocating a subsequent host
fails, probe releases controller resources without unregistering chips
that were already published.

Fail probe on the first error from an enabled NAND child and propagate
that error. Share chip cleanup with removal and run it before releasing
DMA resources or disabling the controller clocks.

Fixes: 89f5127c4b0d ("mtd: nand: qcom: reorganize nand devices probing")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 062fba9eaecc..14bb7f3d6c36 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2085,7 +2085,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
 		if (ret) {
 			devm_kfree(dev, host);
-			continue;
+			return ret;
 		}
 
 		list_add_tail(&host->node, &nandc->host_list);
@@ -2094,6 +2094,19 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	return ret;
 }
 
+static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
+{
+	struct qcom_nand_host *host, *tmp;
+	int ret;
+
+	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+		WARN_ON(ret);
+		nand_cleanup(&host->chip);
+		list_del(&host->node);
+	}
+}
+
 /* parse custom DT properties here */
 static int qcom_nandc_parse_dt(struct platform_device *pdev)
 {
@@ -2184,10 +2197,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 
 	ret = qcom_probe_nand_devices(nandc);
 	if (ret)
-		goto err_setup;
+		goto err_cleanup_chips;
 
 	return 0;
 
+err_cleanup_chips:
+	qcom_nandc_cleanup_chips(nandc);
 err_setup:
 	qcom_nandc_unalloc(nandc);
 err_nandc_alloc:
@@ -2204,16 +2219,8 @@ static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct qcom_nand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &nandc->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	qcom_nandc_cleanup_chips(nandc);
 
 	qcom_nandc_unalloc(nandc);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
