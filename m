Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D874606A323
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ugeA1r6t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=P75foVGQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPwYtrrb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C7GUbcRC+ndMxRG11ybgAIaPwdWvFWo5cmAajw99Zkc=; b=ugeA1r6tkIe/nmiTFRyf1J9yCL
	vzrmewtniUFs1HWVm3xA5fyq5advhfIZKAeSzPREZcnJYQZuCv1m1/nmwv1x1IUFAuc5S9/Gbb+pm
	tqH6SPIrwcwuLWiDoA7FGY2gweWLtmp7fHfOgyVBCujy0yHvfdDiVO+d9OCFdw57taHU4ZwV81/0S
	yxQY4gbssyrBvfc9gnqQrBxUIWYtsY5HEjXL3VXzEkNmdNFH4AmXY3lztFqmlR8FrOO+h7IxEk5aN
	TktIOO/KWCJR89YifP0om1WYK40yreH5KSz9+MiueCgbTOcSNl1V2dXo2lziSbNGpF2o85na8yb/J
	MuTzlIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqL5-00000001JlX-3PaA;
	Mon, 16 Nov 2026 06:37:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqL5-00000001Jkz-0WWf
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=; b=P75foVGQZAPG7FiB3K9zJcHWMn
	R8Ye9wZYvI/mTikTr5/eKfcxM/48CksKGfRW457XzpNoF7NVeISYhdRjHmn3ptG4/gpiovWV4jyl2
	MYdb6C0iTo8uzJdg6s4HQtX087dRNoYRSq5qYVFGea2yjdjQO8X4To8Yzc6HxWWghqjC7WqeC6Ez5
	Bt15+fBPQ3B2cBsqgskkrhkLgPPF7hP4jb8ygzxWpa6Ni46/nZZkH02hyzt0Wp3HNsFFrrxt6yIuY
	wbWcr/Qqmr4LH1EUlI+1RVQPTg1M2Y08eoNDnHOrwGwfqtPgr+IlrnFI1zLasc1YW5Jp+r9DYzeyp
	mVMwXSjw==;
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqKx-0000000DQ3p-0Gfe
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:37:13 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-33fb4680717so8482353eec.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794811023; x=1795415823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=xPwYtrrb3PodUC07VGtNyJnMA95oDlioXvLbnljgs53GpPOPQhPCNwxf/nYC7xssxo
         io2saI0Lc9svXTuyIv7v/cI7tFg9os4CnfDfLrjoT2XJJjRXFG9ilh/vctqsLcF3Eflq
         6dikLk2qa7q0GXx2m8Ebr/RlQ6DZy05bPRZgBoXDbK8NrNnHGXG1EjZ+1Fjp83WN3h1N
         608YvxP9sH7q3QxXWvjVnwtA2ukeNllOHmgYgSen5uRsBnO+GdEwDgtVzvQKqFvLGlaJ
         v8Vzd36IsDwK6qGM5LMqZLrKLFq8hsQWy5TBBgkKaU5Wok8edE/DTprO3bet7hFpGP2x
         /Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811023; x=1795415823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSvegITAmY5u4uKn9z1UGDwwUgfldn+SGdos3wrXXl8=;
        b=f7iAyt3c/9eqZd6wGh0Ti4qgUYBrsYYZzZWAwpq53J1JmYaB3/rwv39rF3n3M4bYcs
         PBz5OwKqFb8Lvu1L2T0iU9sOvS2tnKgJfoZ5sukuKk/xKRPxbeREkpGCO8gDYo8PNq51
         u8atMLS8zRcKhM5JGvHP6Tq6ZTWrhtnBey+wuEGcYZh0r0DMsr+STyFa7GXoLRLA3YN0
         lA+cB3pz8NX/X2kgygWRqy7jay4IZE5irUiDDkzZvaqMZFPU9MyqGcbUcxg4/xcNsdrA
         ixzPrqdAKZlyVa4g4OdLYUBqdtSbKhXmhbZaH5IGC+dsLENg8mbB3rByBV3DRgQ3YP4S
         v7zA==
X-Gm-Message-State: APuU4Z+kTYXUhcUufe9WebDryPk0nVDDwfN3XM8I3YhPMRSt2q0eVILs
	OqvU9aZA9w5hD6YwxsSJeNPqgwlmdUw6fDo3X9DQzm+ClLhI2jZlulAiOTwVJAyF
X-Gm-Gg: AYBFou0gu4bpZaonwyR2oMqYT8Ne1ks83YJWHjCDD3tR3AykvsbXXfZUpVb30Q1ulma
	x5BY7y5lOf/FkbJrppf+mr3oYnuz5ZLThQJlUZenkSojZ5wiQt5mslCjm1C579Y4sgaQF/aZy9Y
	qANou8vDwLLY8gC28bkM52soqMkn2AA8JQvLbM3GbgWVyiE23JqC8Khct46Ix+LM8EdRzeLP3wD
	uK/o6OY3Yfvs/z7R/HkTAmVKLDJjP69QmnO4NTv6JADHmnj0aV+P7R5fTnT/9/cVAPBJGFgGJ8X
	ZCd9n0DeqitxPYrW1oThr4JjNZzNFtG4IVfQsg1NkhX6Mnf62QklP1nSGkcZ3IZc8+z7GoppoMw
	fArzvtocyQ6slAaXrs9tgSLbEkCHXkZpV2tkgh2zYiEb1JJWwiaU46JS6zJElxmuA14SwI4UUIh
	G1FveR7jRDuLUwCHMd8EcV01AmI8BL1sSj6K6R3zxqhLFDi88l9vCf2bfSwgBbo+coSDNDTkL+8
	vx2yHBksNGECKfxgOZRSchAV7RUXT/yEfgzKGeoV5eVT0s7EFX9FvNBM3FIZ2DZurD2IYbzMD8g
	8UXe7k5ojuWaOuej44WtbuoOmum3H9TdkFFZG6p66ZyQiE0z5YWkYQju4dBHIAckc0DVxVVM8kN
	AIDsNC+syWqJeJqrXJCYZsLeMlCTZ13zlbwxMMS8UKd7lpLWZERwvFSNnpT4P4bskQaB+W2xvwr
	9F32+bZGfDCK99cYpgDSggceL6fC6K4qbjzKVmYTe6OiIuUlWcdiY=
X-Received: by 2002:a05:6820:2206:b0:70d:7738:4089 with SMTP id 006d021491bc7-71ab4cf7a6cmr6644456eaf.12.1794810620675;
        Sun, 15 Nov 2026 22:30:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:43 -0700
Subject: [PATCH v5 28/58] mtd: rawnand: loongson: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-28-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063711_713067_E7B99C8D 
X-CRM114-Status: GOOD (  14.42  )
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

Disconnect the chip before DMA resource cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 741e19f351d1..7f8ea6819097 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -863,15 +863,20 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
 	chip->buf_align = 16;
 	mtd->parent_dev = dev;
-	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan(chip, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
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
 
@@ -890,9 +895,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, host);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +919,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +944,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
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
