Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A41C7EE30
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 08:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CiHMf7ePY4367EB9ynlMQR9/V+MJO+namrx2naTsyYM=; b=okapnUcBPRzy3U
	MYsDUCPWb3QFP46tAKceqXFvjWIZqLOL6W5Lj3+5kCJHw4H2mlpLXKMSfRQYOUBZ0xqmMNh7GFtZK
	XuGLjY+dm79RHNXv4nPr792qmq77XJJ2jaiCcj1WmyOm5ThfirzdQgBTyix7Sn2z0EYfALPwPzDN/
	l/ZPEG17qw/RPwU687xk760cAwQWfBW41OFe+28sAOLVYDNTOqroKUA6NgwpcZ14CnNZcINHie3TY
	+bRjDWh11ALs6GmdRx2rkgL4p4JK5r7eyA/URvtuiAd29mfMFK3yQfgP6bYn1wZ6SAkEf6P879QgL
	nbHiJRMSN8j77QNtoymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsTq-00000007Zqy-2w6u;
	Wed, 02 Jul 2025 08:06:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrQr-00000007SKu-2B7e
	for linux-mtd@lists.infradead.org;
	Wed, 02 Jul 2025 06:59:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a577f164c8so883236f8f.2
        for <linux-mtd@lists.infradead.org>; Tue, 01 Jul 2025 23:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751439540; x=1752044340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfDpen91rtZVBr1OXE02eGFc3PdKXJexUcMyudmuLZQ=;
        b=LAhJMVEm0Iyw90z/rkCIPTDN8Ab+XJb5AMAeYpcpgZ7F9MlRV+6iOeq4Dz4xy/7YaR
         TEaffT6k6+lEETDqBGMaijdV2YC3cD3Sm7+Q6vL6+5W96WIfIuCJGPlng/egB1ZZkMhL
         E/3G7TChljKYHhQneCE53jOM8uvWiNZl5KuspnDPCg0RIsytqhIeNSmjLPsoVvdoz3I8
         XpQc+TCcT/eh+ihf2/6ZhoRpF8i+QEWP9TS0SThw41jBgDAk/hGcMo/2tFDug4S/fQV4
         nobR60l9Fulcgx7DRi2EXnHzMFT81CltO6z6j264mzxenTU0FL/3NvYAzxL+qe402Ne/
         jL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751439540; x=1752044340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfDpen91rtZVBr1OXE02eGFc3PdKXJexUcMyudmuLZQ=;
        b=VQkZYVNES/AYy6V2+JLoX7wZIRDUL0WPlsbBxOgxHKcUqkgq9+RkgAUCWNOQdCZvbP
         fMIxMsVRzmEu92xS/CzTd5GzWvrrAtJlorY8alXJ7HJxuZ79/9uYuOLm7RBELvaYM3Cr
         ByTNStonBGD3ZeVDKkuHtElJhSQVs1n9HlV0s3kvvFZpMrRels0FmwcmR9/+8tj3fL8R
         PFMkrkLg619Ee3xbDyHD2/CunBDLYzWC2E+cFXoVYKGnidr4/r9ku2c55WBTZn/Eo1ke
         TnuG7VoBHu66qQsSV3MhfkInxdxhVCdEnABExNHQ3BE84P4PER+Rs7V24En2Qy6e1DoC
         LXJw==
X-Forwarded-Encrypted: i=1; AJvYcCU7MgbX3WOnDpQksP7JWROTh6ubxveQAGWICO4b2rGXe+Sq4GMIsKN7IvY/IUdiQtXSEEifaqFjj34=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzPAYGV9vSshkN4E82o/QJI9T+CGDYMWF034koTGlWHqnq9iGP
	N3bO7W6yyHba0BihIGZNShkmREX0UjuFJpAjsm3zzaqeSY1GRjqkJ25NyAkWDMz+
X-Gm-Gg: ASbGncs+dhRuXinLPacB8+7wMPrXpcpv1vSVBt2Vc17Us7ChrcekK2RTRHCbHvMJJpv
	5JY/CdEnPkCVAPyCqiiXO1M+oJH8LBqjTzVGlHRp6tVu6F83ImCJI0xshrHN+96oT80xtz36pYG
	hUbORScxrBTrQHvyimryYKdOITwn5TD6C2MfiRGYBDk+a/z85s3d6ql5Rt8JlWNNFnD5VVTVx3O
	kTQ61JEmNaq6Hx0YrTPdNay4IGN7xxaCDixnnAtnnbyJ5HmRHQOXg/7nsn96fsm/JDaX6Qi4IYj
	cC6jrripGi2XFlbuIixtFT8a+wStJ1kSybgjFbyyo8eOLnWDaU2X/+KJWqm2Yp6vdDfAJ642uRn
	xkoN9ytWQO7k5cJgPQNjb+bw=
X-Google-Smtp-Source: AGHT+IGoL50y2ca/4Gf2mM1HgwW4biChFjoSDM5++my3AnnmPW/FAJC661fd5kX44+oDByiM/7p4Uw==
X-Received: by 2002:a05:600c:3b15:b0:453:8ab4:1b50 with SMTP id 5b1f17b1804b1-454a36e56bbmr6766395e9.3.1751439539848;
        Tue, 01 Jul 2025 23:58:59 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:9d5:215:761c:daff])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538a390d05sm192091395e9.2.2025.07.01.23.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:58:59 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Vipin Kumar <vipin.kumar@st.com>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	Viresh Kumar <vireshk@kernel.org>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: atmel: Add missing check after DMA map
Date: Wed,  2 Jul 2025 08:58:02 +0200
Message-ID: <20250702065806.20983-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_235901_557175_3F2F8A1E 
X-CRM114-Status: GOOD (  11.71  )
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

The DMA map functions can fail and should be tested for errors.

Fixes: 4774fb0a48aa ("mtd: nand/fsmc: Add DMA support")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1 -> v2:
- Add stable@vger.kernel.org
- Fix subject prefix
 
 drivers/mtd/nand/raw/fsmc_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index d579d5dd60d6..df61db8ce466 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -503,6 +503,8 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 
 	dma_dev = chan->device;
 	dma_addr = dma_map_single(dma_dev->dev, buffer, len, direction);
+	if (dma_mapping_error(dma_dev->dev, dma_addr))
+		return -EINVAL;
 
 	if (direction == DMA_TO_DEVICE) {
 		dma_src = dma_addr;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
