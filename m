Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB74CC44508
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2026 01:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QXj3hXaR3A9i5XvHYWdJrC/qOuhIu6Pk2GcI9nQCpmM=; b=D87bFaR4x6su0l
	x9UKM8air2v/8uj/lPUAvkeRwcLtSSggnzf+SBrrKyFUoDJjAq2dq9i5kYT2Tqp3MopfR6UMtuN0S
	u99oi4hcjYzVkPt9Q5AcaKtiA+bgETKg+xvJdwos7IXyfkEHtPBZ/J6EZ+8f3SMDDVb+Y982UiVyO
	wOSI714QK1/u1omCM6gTch7/vXpdk+5RpD523tHxFdRpkJo1pIXGT5wafa+9tUpR+S6BBdncg0rcw
	7XHSWF3AAEV3V/JAcwPj0wBRvgfFpovlAadWpCQ6AAtpuKIj2333qWC7L84y6MIYXqugXEYYu/Yye
	VVL1YgCxzZq2/xMNhzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoGd-0000000DYAi-2dgn;
	Wed, 15 Jul 2026 01:18:31 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoGZ-0000000DYA4-1oxR
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jul 2026 01:18:28 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7ec1e9d3359so1662001a34.0
        for <linux-mtd@lists.infradead.org>; Tue, 14 Jul 2026 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784078305; x=1784683105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmWi+q4U/3Jh0sLZd43CKAcg7w00/ya4BM9LL/VWxc4=;
        b=pDOea4FbKubZC0BMM8IhHBlsNB7HKWVEaZgMX+WKr0rQEUkl36TGSEMgwhCoGrDmiZ
         oNlq7J/79PKtQgHwEeYUZ5bBZGAgpL+WjXovUGQlRXd8pBQMHzwf32B5/M8XrKKgb/VF
         oy8xZ1zBgY60PVVe/YioIepSDK7/Dr/d/Wqyb6rs4Y89HGRp4r2CgcBElVNEwskm/rQn
         1ZtOfSJbETWBogrkCMxrk4eDZUfPh+ABrwXNMU5Nl04f/FkHAGMqsRVrJGVgJD/sWp3R
         jP/ujRpDulzYRhPAlCNJPESJZtGulTKP5Uj0ABV3hhx8HzUsSr3INZdINdHbauBwl9q6
         8Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078305; x=1784683105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmWi+q4U/3Jh0sLZd43CKAcg7w00/ya4BM9LL/VWxc4=;
        b=JBe/7aTZi+LibHxeXT23pOyl1mkkIdy08lPSae5geyxqVWALawoULnQordJrY4Gs7t
         k4F74tFLqy4f4uDNKFlhT+Dpgt7MEtmbUOUWQtZRhwJB1eEcr/QZTSsG2awBjHgqH6Pf
         xkE7jApJ+y0G9B5DtTy2gUdxM0f7awHtGP0V6w19s16OHwi/Iw+TMepBjHM8h22uystu
         5W7aOAhMuTdoJqslPtnpNsPdmD2xc7y8/TI4WsaNftB3qSlJXhvrAsKRqCO8DaQ/BPcq
         nutr93UmpN9EVJll4pQhEPX9H1rD+pWhHkjOVAth+7OQP3+U9e5pUCRCleLXuCVdjBsP
         HUcA==
X-Gm-Message-State: AOJu0YzkT0SA7IYe6wgxiUgqDTadn5AzjFdoP5NRvKMKRPD3mzy1C6LE
	wUuIRMuFwzCwKk0LBSSLwWuR2MaCKMu+2yRucqlWpEAk1sQdGwcfIsjv3BcyKS7hlhc=
X-Gm-Gg: AfdE7cmxuJUsGSdpgataDx3Olnnr1DL+MPdvgZ9/JcnqESbSsSBEQt7HfM4a1T5ughu
	NpBjjvML0Xj4u0UrgpbrZ4/H/5Zcl10cOCpLjzXkOhSgSZb5xd9rQo9G3YT7XszHHm+yjDB1cBY
	wVAa5hvridxV0u03WdOXSaX4UKqH4WnPOG3f9HYXyCfSfC9oztLFQZb33MFQWG9JqHuicIWJ30G
	2VyfuhE+nca7/9OIyzctHErjiXJGSH9r7cHSCh0aMuYS3tO2OYHxKxir6UyLlEA7d5dFIeKNvZq
	mV1uCCBuUvfUV3AIPcQg5tFfHBA2fV1vDNQeWXwXhmmRSH3RI+lVLmmxyMV08q1auDWEQ+S/M3X
	/48PsGZbwNlRYRLOosTrlxUvuhwSY23uV5Z4MCkwm0ohvRNDnh+gl1OLvprgYlhBEMmjSRwkDRf
	2fOhcB2DU86au7a/icVYskYcyboDLVC+FTn7K7LM5VcYce6cDYGY1a12Nqjsysq+wucylu6sn6Z
	BAmKEMNYeudhj4nG/gfLBBdl/vbO2/aoAUxJE3csK9br65ou1hB8/diwQPa7sJNBPiu2ao+uhTr
	8MkEIAa1yg==
X-Received: by 2002:a05:6830:82f4:b0:7eb:c933:efef with SMTP id 46e09a7af769-7ec42149c7emr3643760a34.14.1784078304635;
        Tue, 14 Jul 2026 18:18:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf77ba4sm16326125a34.9.2026.07.14.18.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:18:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: add Toshiba TC58NVG1S3H
Date: Tue, 14 Jul 2026 19:18:00 -0600
Message-ID: <20260715011808.633587-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181827_480962_AE60770A 
X-CRM114-Status: GOOD (  13.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Without a full-ID entry, the non-ONFI TC58NVG1S3H falls back to the
generic 0xda extended-ID decoding. It is therefore identified only as a
generic 256 MiB Toshiba NAND. Without a model-specific interface
configuration, the core leaves it in the conservative reset timing mode.

Add its full five-byte ID with the datasheet geometry, OOB size and ECC
requirements. Its interface timings match the mode-4-derived profile
already used by the related TH58NVG2S3HBAI4 and TH58NVG3S0HBAI4, so
share that profile and select it for the new model.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_ids.c     | 3 +++
 drivers/mtd/nand/raw/nand_toshiba.c | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 62a8cf86d9e2..08707ce9d7c0 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -29,6 +29,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"TC58NVG0S3E 1G 3.3V 8-bit",
 		{ .id = {0x98, 0xd1, 0x90, 0x15, 0x76, 0x14, 0x01, 0x00} },
 		  SZ_2K, SZ_128, SZ_128K, 0, 8, 64, NAND_ECC_INFO(1, SZ_512), },
+	{"TC58NVG1S3H 2G 3.3V 8-bit",
+		{ .id = {0x98, 0xda, 0x90, 0x15, 0x76} },
+		  SZ_2K, SZ_256, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
 	{"TC58NVG2S0F 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08} },
 		  SZ_4K, SZ_512, SZ_256K, 0, 8, 224, NAND_ECC_INFO(4, SZ_512) },
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index d3d34d71921f..32062b26a1f6 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -287,7 +287,9 @@ static int toshiba_nand_init(struct nand_chip *chip)
 	if (!strncmp("TC58NVG0S3E", chip->parameters.model,
 		     sizeof("TC58NVG0S3E") - 1))
 		tc58nvg0s3e_init(chip);
-	if ((!strncmp("TH58NVG2S3HBAI4", chip->parameters.model,
+	if ((!strncmp("TC58NVG1S3H", chip->parameters.model,
+		      sizeof("TC58NVG1S3H") - 1)) ||
+	    (!strncmp("TH58NVG2S3HBAI4", chip->parameters.model,
 		     sizeof("TH58NVG2S3HBAI4") - 1)) ||
 	    (!strncmp("TH58NVG3S0HBAI4", chip->parameters.model,
 		     sizeof("TH58NVG3S0HBAI4") - 1)))
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
