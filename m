Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46560711F2
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=owanAXob;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=I+/oY2tk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mzMRumDi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bWSyBYzxNf5AMtkLNEqDvU+YJ/kq/cltWxIx9sqmJCE=; b=owanAXobXrHrXW/vl5Z+iPzOV1
	DI0sR5n6JusZIYvFqJNpklmiHBC9XkeuV617C16w+m2+Xfk52viXYjRUcAL+uS2dBA8zciQvUifs+
	yEK91X4i8BXukv26sRl8afG2LSH44bZzNmJqGSwjgLwal46U+dkCUWkBsBJDFREbW5+1674Nfmvzh
	aEVpGa14Rlcj+c2TNZvp76jq9UxnKQpheZbm/HuOU++5hQVczcjgebkws+FQ+xD87wD1abt/aW3dC
	yP1R2+zdC5jFIzjXsObW4hY21AAOyPEV1FEG38GQbUk6Gn/vgu/7oQHzkS3uuZl31b5X/R1I2gLuy
	DyXILvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXV-00000002xDT-3685;
	Tue, 10 Nov 2026 07:45:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXK-00000002wmQ-3Eqt
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=AyY1jP1oMEYFE/M/Qd6YTaMB/MnEzyz+OC+KFI8MPuM=; b=I+/oY2tk2Cy8shtw1uoeAdAoG/
	8jzKjV2zK6k0BkFifwPYz4PCdaaMRvlT0MDyLCtKzFc6HVVV5aLzpe18Jh92Viq8TmVwJRlbekDqh
	ylDjc1wNzds6f4cpBbYgUZ+EwnGe8hsn9erw5CUBAZsEiyDn8kvPvMZHWa51UpPxDPFH9TUWM8w4D
	yu7KZ7TDK8FUXyk4V1AHxv+B/8vTEagpHtQ1Vsc6i3/pkeVKV4tTkIYYRO5IP1XGoCtAjNsnlRRWZ
	tV32v3CJvKO2Mi0vZ1KGmHjBAjt6ju3iNM4gx8oRpMYYUQ6ipG/ClbzpnzxOCeMR1QLuXRloBB2EB
	4uJ72v/w==;
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXF-00000009GB1-4AEc
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:56 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4b28d9537bcso1202930b6e.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296691; x=1794901491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyY1jP1oMEYFE/M/Qd6YTaMB/MnEzyz+OC+KFI8MPuM=;
        b=mzMRumDi5vV955gUZMPiHgsbVjJn2xo6uvoemQkozOFsF/7AQYWeQUHQuiiowF8nHz
         7wlfR7RI5SRKk+hc4Y/V8bY8Z5bteQH1erP/7+ZLTmc2kV857bqHv/W8MI5KBOUaQQpT
         fhSNabCurVbdPZWiG4Dv8WITUnzhZtjhHYiIeJXyrDQ5DU9y/dio7F2JeilYCzruc66K
         DpLePi2GoolkR/66qe5DPF8cRL76O2GGDufPfENzAapCQHvdwzflYPgSt3lrO32LIuPZ
         MnJxwF00A20WrwgdX47++qrmz4m7xQYBOUcLQdHNampL3FssT+/vWO8DIYPnWIoMeXwA
         aBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296691; x=1794901491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyY1jP1oMEYFE/M/Qd6YTaMB/MnEzyz+OC+KFI8MPuM=;
        b=FS8WPyO/WjRs0O7cRNgxhRolWLB7Tu/M2rmDhMqvxV/3sLde0v2ldI8QaYthFtbAiy
         jmNz/NwUEh254UWKDu2spvpEkpBpsu4Er/kUPhi+fFjxfHVLP04tIkX8tvTptL3NO0X2
         hfRuVfM/14eV1PbtfUhzEOwj7Dnx4esw+5eEoafbPrhnzs2UXB99Df7WYgKkhHqEOzMK
         eKg3BBBescCR5EzYpdzJ2lODKtwfNoWGdIQQC5MsbPl70r8bfWSbqrWLmkQGDiAmuNMj
         VTcnYMJHuFWMke6c3LTT9QOe1GqB6A6NNPUpQgDekUsOIusRlhVBSnT2ovIZJpF5ad1s
         PZyw==
X-Gm-Message-State: APuU4Z8KAIWwr0+hKu1EKS/LY1qfRcUmj7tKYksLREcXHlsFQ2egB0tC
	5hnLquPzJS347MlvNC7Oge4+wCM+MFSyx2KKyuk5+SfM8rjBM3MAOVPj
X-Gm-Gg: AYBFou0sFt0e8ihYMwv7IjuoRCRvke7cZi72o1Dq3PfM22pMSxhwE0sDbpapPIThoV+
	2TjtO+bHXdlurpkfpAIHxGC6N35+1IgR+0gD42gpL+1EUBMX+PY03mmUjwNGHWSfQV7hDkKsmd7
	YBKuxu2KVXRbo2wMIWG1Y4qBiingFy3vA5N+tygD1rsKn3QQ5r+S3rh3s7Zz7Cjh4jDFwHX8S1h
	kvwaI41hoWxIie8eHC0OsX5Nt7JIqgReHKneZOLhEuMsGJ8wkHeDnMsvkvxGozVbnq4nVOJV5cj
	VwFCuZfM87u9Jr24uhX/4UkWnPJvRNClpmsg9mXE8GbstDtJloZUiFbnJReGbFBA43KLBZrPa3f
	S5n0TOeHKLFiXuCk7eH55jt7tYyMxD0qmkQYH0/ZrH6klibhEF4fAqxU09rjYlfgFgia/1A0Vuw
	PJutmgyQ9XLXd5NlgM1m6DFKW37wl6yll1yx72iQy5LDY577WrQycsFm+gUHA9enZoIlUo9BOw4
	h+jd/56FgyZyuUM0jJBhwd6y79zsfAykwfEksguOXZooSXrHDSzZEpLLS0BqPzn0Nn+lMYk3cT2
	jwxkYdjOWt3FDkP3bkvXDCw0RQLH2So0o5I2c/zG/dFmVf+WNIWrY0vtm25DTlzgVZodYdkV9ar
	1Ij208y5VW3YrKVtDryK7JPBp5Uk5STtMhnHWiUHp6nI53HOo4XZc+0beKNg+CMRr1fVNq4L2PU
	ClNvbgeBIQFZHXzIjDrtRmdNXeR23+ifkFNO1fJ/Ynmr6c4f77BMy0Pu6OR0HWWxpHxrCN7/ok
X-Received: by 2002:a05:6808:1822:b0:496:976:acad with SMTP id 5614622812f47-56872834d04mr830298b6e.1.1794296691244;
        Mon, 09 Nov 2026 23:44:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:31 -0700
Subject: [PATCH v2 28/58] mtd: rawnand: loongson: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-28-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074454_098583_C6799BFE 
X-CRM114-Status: GOOD (  13.90  )
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

Disconnect the chip before DMA resource cleanup.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 8490412d5be1..49938c7b9453 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -869,15 +869,26 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
 	return 0;
 }
 
+static void loongson_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct loongson_nand_host, controller));
+}
+
 static int loongson_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,9 +901,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, loongson_nand_release);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +925,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +950,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
