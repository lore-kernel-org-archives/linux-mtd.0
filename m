Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71254606A880
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fRhvCyaU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTj/MuR+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tS/uFgh6SBWmBH2PzNdJ8P8BnvVqdNeCNe/xS7gcooM=; b=fRhvCyaUAb5VNlO5f57xEisT0H
	xxvE5OqL8968vQYgRqNQpidZbH9mSN/PTTW5kV7eGzWgZnF4IDuGGeslkHBUz9pP4GsQLKZkEKILH
	7o9iTOQaCapaNASuXBSrSFAb9kHx3Kg7kc7PfRuNbOv+R4TCqa9e5d1mPV3TtUlhz0Ck8pLB1rJP1
	5ZoMAC/eQKmpNOzwL1XWfl1L86cR6d1Jl7jBReK1jy5Yazs/7l6cdIpOIZqSnC3LvKGnXnXc3WUVv
	SjE70LbbysnuIztKqjxQ97ghFCJtDW7Oz99SqEXcb7iN2LXqdGtbkzy3aO3/AmvStjcF4FUE7SYj3
	CWAUovOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdJ-00000008N93-1p4d;
	Thu, 12 Nov 2026 01:29:45 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcg-00000008M5P-08QO
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:15 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-843b6f8e2c7so3945898a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446945; x=1795051745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=mTj/MuR+2G+jxbmk3ldrW9n0dWjiAlJMV+7dm1kmJNpYEPhnj0bRQxxbXF2SEEUzv/
         PPnwrgKfO6+2Xhusuu8Ep01CF5LQIDJ8/EZqVm8U3KJBf/kIw4N0sByVOymb9q6FZYB0
         KdTydXNeDo6xVtsDFxBhamPR3Byb5A1rdO/bziXVDy6ga5kn2gCgMfW/81wgBujycs/i
         xluc0zUovCdSHXqakVijxGTgsZQiSqciOWEoaLH0446DWmS6begNUZkwqaXW5S+iuUKP
         iUuMGZuPWhCQ/vcbEE+Y4Ex3yNsQh02UFW+e/Ejf8iovBNmLq1k0SHFRbBRs8EN5qd4B
         ep5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446945; x=1795051745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=fIkDbYxjCGyU3EAQ9QEGQfw9t3vhdgy3yUXlwBGnn5kqXKscNXxFocPzIlfQvcOXOW
         BVcVE/al5jlZxVnnYmJYJgJcQmMN00LeHZVmsQWV/6Erx3B0egFp2LAHviECxdmQirVs
         zwC749qoW64MW8cjrEhnTNt4HfG3J0AI1G+ZstdL1LGM7GVTdlbvImORaxUxggESsTJO
         cWyGwD6p3JxXl8pjz4CrqU5mb8g7CWFqlP6ABqbVbztRHf3SUfNyljgMpTd70wrbvuPs
         v1HA3TozS5NT9BULqAyjj6MEd2Y9P9XBDjA6AQUFZ3RvQMRw2mQfP0a6r4Zjir5A2SeK
         NRvg==
X-Gm-Message-State: APuU4Z+VZVMNfpKoPIdJ/zMX8qEqsekMSDinORWBcxTWjk9Ci9UHdFip
	QC1vjg/RTJJ6kim549di8B8IDcbRB/O2/tcld1XjlES2lcJooYRKj+5d
X-Gm-Gg: AYBFou1sMCSsq5QPlQJLmA10EGPz69GWsT4PoSjeq1epYoHoScyYrIdsR7/hgPtbSOm
	ILtAhYQneOs7NmTaNWaVcX1UexWUhJuz9RoXoKWeGFdcy17bwYekCDidQSB9PdQGhFwL6nMO9WW
	Vtsy9wDir1qIs1+dv3Bd78oVpOZ3JdZZHBxFrm/TvmsCXleYrZwcCW6K0u2fLRXj9o1+XHYfC/x
	lp/Xg+y9xuNw0gJEDTOXikvhwUrXYQY66UBTPS0qKZn+2WYQX/7OFCU2A9O8ADDbEpGVL35gKdn
	yio0BGldLVySVrWLqzTFr1NMifETfr+M0ioKgvFpaFRdjPNikNcxJZfg2mjcLYgulr1HCcMy4/U
	viB/31v3A6im0Eh16kFJMj23RlefbJYB9GVr8ooPiGRpXXMM8w4stywMmL9QtlAyBqPxMDdg/S1
	qsNaXPpmkisla7ez1jGny3ojyv+/FUfcjLwWqXgC2wFr4oxYRitT/6NSHtYW8naXWkV4fECFNFG
	4HqxvQ9JG2rLramsp6jz/u0MpmFnvY3ZuWsj5h+YfXUYUNdpng5KsLMKvZdlwcaF7Pu2863Y06G
	eOr96xuON1ySrTCjSzFUfD8KRmJzD88oK2uvYsRKOznFRlF+9rGf5frqooTYGr9LAYuHeQ0f5ge
	a1RuSgeUpJ2pEeEFujeCOTHUSF0BDxyCFHrrulgQlA0HOMRs2yFdtnNOZmBHuzFxMCiSd5nvnhc
	wo1pCBDBrwxDotT+xUuWFwQiTLd79uTS22tnGYqEZEt/O1dA0Ujng5
X-Received: by 2002:a05:6808:6401:b0:4d6:90d3:e185 with SMTP id 5614622812f47-56b97d0d831mr3893218b6e.46.1794446945179;
        Wed, 11 Nov 2026 17:29:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:12 -0700
Subject: [PATCH v3 33/58] mtd: rawnand: gpmi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-33-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172906_198731_C5900859 
X-CRM114-Status: GOOD (  14.07  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4822485bd512..8fc78e679f0f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2787,9 +2792,12 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, this);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2846,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2854,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
