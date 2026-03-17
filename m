Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE4AFED9F1
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZZSoTO3uON/90M2qVziC77diMG54kPQUKPhHexQeZA0=; b=ar9c85w35QGsfq
	o1a/2czlAx3w8Z0HK2li6EvsJw3ib++WZEvrRrZez7KNRJzW7CNfM162mQC3IOsq8ElxH/nq6p8lw
	0bg/zFRApUjouiPLoTJIP4kITrRzCVdhOz/ScL+nlkC+6d1cxnwSnGxpHNtCIjNzcKeO3KOtxUBsJ
	oHptjPuCTG39SXzt1U+KuO13NY2EBCWL60yoVLKo8TelBHc6yuiQb7CQ6+eOZNcKDklXWRe2c+A3A
	SaxkSNCSWRx3R+imuBqVppExmEyvDj6BOsBcvqlLRfyjTsbKQa3W6PMXPUBMz/pM7xFIAMWPI++Dq
	nMaNJN+8lrY358SYObSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y4C-00000006v6K-1UUy;
	Tue, 17 Mar 2026 17:18:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y49-00000006v5y-1FpE
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 17:18:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-660a293515fso11398101a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773767927; x=1774372727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x+NNnq7TQZcUH92fhtXl669qaHmWjEo80sBNFHMpXaQ=;
        b=IXCGhKwi0tlAZAcytCFohtt52cM08/JWLuP+xeZ2MeJbZPPbSweMGjwMIU3lRTqaPk
         LVRbo6qnq3jirnc9r4wWtr+y0ixs5HYVIaNUjfUnixxqeiehvOzDi57l+q7W/qsncX60
         3/m7ysbg4EsL7izE7gTjOdoWUq+nWm6GAGc8HxizHE4KVFcmYwMubK7uWeKoNMs18mvA
         sx1/jLSrvt1OHUBQNTu66uBiESdOSVFzerItuioG9RoRFV62kLNNYf/KGkZj0SrUuYBr
         SEZRSpHkcBHvBeajRC9ryRYY7HHMIH7+NmzOz45EuvrD6ipsRe9MOEzvRjQbm3I1q1iT
         bR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767927; x=1774372727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+NNnq7TQZcUH92fhtXl669qaHmWjEo80sBNFHMpXaQ=;
        b=lJC94zIhKo6mXrDqnPH/ydlqp3jV6mLBiOfwXCwVKhErpKL1RweAVSMD8FrAeaQPJU
         pq8ZaUxEbQlPFALSMlHzUOtfHfD7S2iAYbedr+iuEOgBH8OWuBWreXDqJo4Ym40EeI6h
         r+NtiUqGLX24TfhMORW64NcfGzG7OzoksfAfRDXFwV+3Fey15EpvcRrHNy3RBXz2a9VR
         tzLWUIBXYUmTjQP6hGrv8oUW/0CGFYIxt62pvJ9vFD8TbS1jp94RNiBLoO80tOetIiSL
         iHfwuDGs7160WwbnTld0bPg1f7BVi8STD2HLmy1CUC0KTipYb/D/QG8ACyfB8GWy57+q
         L0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwaqKst3L814aMFt577pkIEr0QPGdgpLen8T2demKLVIdiE+KHXsRFn4QFRaNnapqZkUJzadxKvn8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgUcr5jj2/RqqqTPF9Q/HkR4bPZY02sovwUj1R/mkurA4GL6Kk
	6BwVIo/B6UZCBmwLMCNWbqClo1ksG7engFhGA1Ap7SRTRwJMKV1SwYax
X-Gm-Gg: ATEYQzz9iNJNrRoHcAW7bylInMtvawZ67agIFpz1PABql4WXqdidnCyaBj0wOdHvri6
	YRrCKRbeqLwyx/wkj0dWquMC9yAeKOJWCRV398drtEjV0+9mG/i5d7lfQcN/JIKyOiZCsSmjYGJ
	bkkrCNHBhLnUuwfyuzhlAVunu8tJxJUlc+MKV65qfR4kH/dckdECmYO5NIDlzJpvQdxew+46640
	AS+ZIs9jG6KmkQtd3ytrT53fCjCrj+8CcoZo1s8W8FsQsoRa7HDVIVR32DEpwRKeKi5AtjaF9zi
	VSdB5/PxHrALyRE4MoNd4efB7/mckcE0/L2a41oOX9rvYFmtaVq22ISLJpxKi9Qxrf5MqnzY93e
	FWvF9fE+8D5J3i4xft7FDT4rEt4JidZyQOd940hH7m179oLPKI52Zw2h/uh6SjaCjnzCWlZFoKr
	4gLpFu8YvdWVFAYDypR5ksNZk9bwZMPWAGggK2zx5n
X-Received: by 2002:a17:906:7955:b0:b97:6a2a:405b with SMTP id a640c23a62f3a-b976a2a48dcmr951610866b.37.1773767926595;
        Tue, 17 Mar 2026 10:18:46 -0700 (PDT)
Received: from localhost ([2a02:a03f:b7dc:2b00:a97a:8551:7733:cb60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13edad8sm23641566b.6.2026.03.17.10.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:18:46 -0700 (PDT)
From: Olivier Sobrie <olivier@sobrie.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Scian <andrea.scian@dave.eu>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: pl353: make sure optimal timings are applied
Date: Tue, 17 Mar 2026 18:18:07 +0100
Message-ID: <20260317171807.652642-1-olivier@sobrie.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_101849_344133_4FDB4B0B 
X-CRM114-Status: GOOD (  13.52  )
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

Timings of the nand are adjusted by pl35x_nfc_setup_interface() but
actually applied by the pl35x_nand_select_target() function.
If there is only one nand chip, the pl35x_nand_select_target() will only
apply the timings once since the test at its beginning will always be true
after the first call to this function. As a result, the hardware will
keep using the default timings set at boot to detect the nand chip, not
the optimal ones.

With this patch, we program directly the new timings when
pl35x_nfc_setup_interface() is called.

Fixes: 08d8c62164a3 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
Signed-off-by: Olivier Sobrie <olivier@sobrie.be>
Cc: stable@vger.kernel.org
---
Changes in v2:
  - added Fixes tag.
  - added stable in Cc.

 drivers/mtd/nand/raw/pl35x-nand-controller.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 947fd86ac5fa..f2c65eb7a8d9 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -862,6 +862,9 @@ static int pl35x_nfc_setup_interface(struct nand_chip *chip, int cs,
 			  PL35X_SMC_NAND_TAR_CYCLES(tmgs.t_ar) |
 			  PL35X_SMC_NAND_TRR_CYCLES(tmgs.t_rr);
 
+	writel(plnand->timings, nfc->conf_regs + PL35X_SMC_CYCLES);
+	pl35x_smc_update_regs(nfc);
+
 	return 0;
 }
 
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
