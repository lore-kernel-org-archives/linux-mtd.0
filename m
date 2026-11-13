Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0202E606FE5E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D075cZY1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8y+wOtG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tS/uFgh6SBWmBH2PzNdJ8P8BnvVqdNeCNe/xS7gcooM=; b=D075cZY1+ffIa8ZlRWtmP+0MMj
	sZcYPDdTYOijDyCTXE1zSMzZ9MmY3YYDiLMeCQEFSV+XDXHihnr3+kVelkiQkdARAXAFKHfWqwsvE
	+lEAbHBg49O4GWCFMBG2dUm4hQHxsihlFk51ExWePOlFYclrW6SSDPyhYkz52My4QXfoI/H/5yVLn
	vmAqPtGrj7SCxzhvIgCIswm9q9VLW4i8Iqnq3kQDaEFVl0Ml2o1d8SUsWySWuposO/D7C3yR538gs
	EbhtwFFp6VLvhrA1efkTAkP6Oly6cSWLcPyrSnoLNC//HNI6F16GgVwPMrA1ylzGsQWFiKrSoC4DX
	Dx3b0iOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpA-0000000DsQP-3f1P;
	Fri, 13 Nov 2026 18:16:33 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvon-0000000DriB-2ITB
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:11 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-8479f46ecd8so449074a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593768; x=1795198568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=i8y+wOtGElnugPLT+5NSFaNT47loOlPDjH3kHGx56co+SL4oU7uErtUM9p722RExS4
         bcDo9naenRluTeiaHo+XsxJVZI9hhg0nPcbWcVJTn5uRc6QzvXC2kECURWWUsPPK2JCm
         9Ck2LfZQyUXrcJ4N2qiK5ZN0OqOrStZHo0iTAAk4i7WehKjAY9J2c5PQgHmijj/u6YSf
         a4nqsIKlGXbtg/VQwUAWN7Wo7BDRcn8lL085upXV/CXy/QFWi1xCg3Fc7UjSupkhkjzd
         jpbyNbExMxzKSJJT1GB/9AnMAblYW2/qPO/0Jkqb2qsByy9Nza/jmSIA0OoI0LFk8Lbh
         +6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593768; x=1795198568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvuynEc/zou9KrFKkA7KFsXhyWwB/r4tY3U/lfuSaD4=;
        b=b3dyKcAcSx1+UJGPa9eavO2oF4L350W15WXKvgo8EUVrJ5RhIM9ck3m6d2W6JFHzuU
         b4A0BcbKHEXNeDIMpAtytIdIm4a0gCrNKLP8SegQj08qLkyiHV0fIb2q7T5Mu9V47EXj
         6PS/fqtFnnJIch9J0l+QPWL4fRnUyn099km6dhLZcusT4ksD/T7rZ1+xjp1s8SqsmrAP
         w+WnwuAIphErg+1za7HDSVgvSqiM9GW2kjmgvYBzkYJWg4pp8CDkQk8+uBBGB9xIsO7q
         q9s5URl/sIilXQdtGnr5d3Nx3e6QS0qNTpS1EoVHtMUjz7bK9s9I6OCGEEkDr83h7asn
         TN2A==
X-Gm-Message-State: APuU4Z/sk75oi8kKgOAALpP9i32T4GozCnLV7HU7lVQEejUpiYSDbKNf
	xHUjtWsJCVP4HeHp0b6MRvyQMlQFcE3QSzeAogKAzG2bMzWV/6I4+xzb
X-Gm-Gg: AYBFou3hG3jCvc8i7b3WXE9G1Tc5Lm+5K16GZHw+B4ENuv6QTza48K0ZWlMqoaf6RCG
	exRtcYxAnCQ9W7A8LDBLKOoR599MtqkDHtOZ45DKlAKy52gi/PNTp1kVy3d9dwZ+ByYlpkHT30W
	K0341ex/NTNnyoZY4fC6osIquBm04yKRj2X/sf+EyjLmFJxqkoBWKq8ni2aZxxP5ADG2Jwf1ojz
	r5mxo4JEClPKgCfuwxphBe7OGZQ+3gwdgHRTV3H1UZHzvkX7Zm6MEj9IiAavRm9z/SMw6QHMy8s
	9FpUHkKKZOfGmZAu1IXhSS7XML/Ya8CwgSgIYRlzujJjWhoOYX88sHo3BA46KypYQirQaaXmuP4
	1GrNhDtmQv19+OVcaidUnQ26pG/EFKTT8Zfv/f6NEz6nrJc+LHNFfN4x1JqKcA9SRKjgqHtmwhA
	CawUoONpoBZ4KQJFsMAvkUIh3vJssXrRThIGVpPvU+GFkibaLcCMwjkiy/aRSO+zIYs2XAdsRCY
	KRQ7GqkbXRKSAGV8JLuDRBUlkQF/bP6wXmoLOUqsW8fx2RAKD5hA1PkTHDTax7yDu0GBcRdJE7j
	rUGbvnxYTZOzc4o4dps5KqgMlTgWRQBcL1Yz2N1sK+xMl1PJy713yFPHjtkcuF5N9SbdIXbRGMm
	HRQ/euR0Up9+6DDmIM4zHDcG6QsYcaVBeGmUojYjbTlILB4z7nDtYw5+HVgDXaiAPH1bQW7pidv
	WxhTu/+PzATtlK2Zc16gz+BOAH7PvgS426wOCm5ia29eJA8sxAkLI=
X-Received: by 2002:a05:6830:3489:b0:829:8a9b:de79 with SMTP id 46e09a7af769-8628979e4dcmr2843473a34.4.1794593768395;
        Fri, 13 Nov 2026 10:16:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:49 -0700
Subject: [PATCH v4 33/58] mtd: rawnand: gpmi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-33-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101609_644673_5520D13C 
X-CRM114-Status: GOOD (  13.55  )
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
