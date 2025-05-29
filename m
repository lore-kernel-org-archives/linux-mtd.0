Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1E8C5AD49
	for <linux-mtd@archiver.kernel.org>; Thu, 29 May 2025 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3z8FIRC4W70cdB1jw6cuW7cg5AdSKPgwAQGNDWPIb8A=; b=UeTsifOOIV4HjB
	Zy3JmOvfw8WSbJ/6n0WPLXX7mYNWutSMnoKnm1LWuJDTZnC1xEwIOZEiplV6fX2E/nWZau0Xk+nCq
	MyvlXudGVSPHSEDQ0y7/t80YM0TVSJPnK2F/3vaAutSvN5x9428ClN8cGxOW4qfJJyAyrCiIRcVL5
	RzNVAYksojSlD8erQHmC3yq+kcTQCbtQkSuxfkqvRpo57K2YiCkNyRaS0kXG8ukQ5od9ypOjW9x6n
	mwbwhqRN0rWK/4Dl0NLwPrT5MtKfArJQx3SAaYVuS3YYzE2mmI6VQFHrQzTnovoY2Zz4s5S0cq1Lw
	JueeLtEX6vSObkhNAeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh2W-0000000GHac-3uAO;
	Thu, 29 May 2025 17:27:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh0O-0000000GHKh-0PY4
	for linux-mtd@lists.infradead.org;
	Thu, 29 May 2025 17:25:25 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad88d77314bso219590666b.1
        for <linux-mtd@lists.infradead.org>; Thu, 29 May 2025 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748539522; x=1749144322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GdNV2oKT/fQvp43ajW0Lkwa3+TyZyp+QXrIA3Ktqto=;
        b=nlJj03DM6EUMb3AmirF52LS4hTWDa7TjBOrjtiV9lEr0L+BFUBXndxKYXauQdzKk+0
         ooudJ1w4VjLAXtrnjuPtNdLEIhOqtkMFeOdGGdlUWO8tp0tjW4UbAwyimPNZTRgVkYv4
         v44b9JYn2mKWtxVJJ52iV4iySj2+NMBnpumnFivXKk5ej23n8xxDGFmHWsq04vjhNjDJ
         Kzg2A03uGMe4kc4+E4gR4/l58yNYRzQztWfzPurPr3gVzTVPUFsUZ3qEecCMYQHxF5lc
         hndHcp8h2ZEot+mGDP1SinJt4JeVIO+viEAJCgpR9cXlHH+OUJYI8Z921fAgpqpZQBsE
         VeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539522; x=1749144322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GdNV2oKT/fQvp43ajW0Lkwa3+TyZyp+QXrIA3Ktqto=;
        b=MnD47dfIAyUMbh8M9lF67Dvpl1gdF/RKGgts1bMxb4UW0/jvyuEZD1ng9zSJAL64mU
         Ed9VyRPrQZ9kOo8yPekCpZfxBgcEN7Cr/pFwmTi2JEyz4qP/qbypCe4fRaKSTPgaoFNb
         ZIysHYbDkUbz3dKR5h9BWysDNzGRoBUhZWOvhG0OH/URvVUa+/Lj8na1v2MmAGOkJI+Q
         6o1gKtFtuguEsECNPa7alaNbnuurm2q3CjnuGtv/EoLCOT9tXsE5OmD4JWdsB3jeaEoK
         5GxWpcIvI6q364OTKvfirP1hlSO+cZusQk+O8lMZG2AGy88a8jD4TvHCwa/xgyHxFP+F
         ETYw==
X-Forwarded-Encrypted: i=1; AJvYcCU64+istQGd3+qdMe+AAv5jLXZw31/Q0rHk37JofIDph9uTlSoVnpC0GE8YCE71qoLcYcJ2jrffYr8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZnMHSytBHiHYL9od0trQYe7W7ZtlD5xPEXnbE0qHRIiJv6Whh
	qDxgQxuTu2b+oicGk/LsrWkDaRD2eGAPqcebpThUV+igHDkHhsO+rp6x
X-Gm-Gg: ASbGnctCJ9xTuMuMrux10/JORqwCcBSOPzYFH49fkfvDozt5LWrQgGqZ79kefRXSu0m
	i89Wr1wdFufKWGjPGx9cXvz2x+t37YEl0UNS4zrs1S/EKIbMiYGUVgEV96eXL8vY5Mhj9Ak1qHJ
	l7y4FoiTUWv48K8bf81IrzV/mXiyX69r9ubrj3gxUs6uLkMfLA4zop/AV8yw+dWWB2nc9yTYfL0
	ZphZoGS+SC1EItiUYbWUXAkgEC8rGlviIjcyblBH+AHbJtY8QuDfCjbLOyeTN9enLSX4b0LX1I9
	ifb5nAVnphgk1cM/SLyA0PSgETJ6azIPws/j/fcLPEjmNZW2PDoQ15mjaGbv7r35Z2+a7VFd43E
	8sBtB
X-Google-Smtp-Source: AGHT+IE8AVp2q1GaO5YsqzyrmEI1XXn/yvdzwiz5FsB8zf7Ac5exZX28gfdjzaS4/cLtOgXfHqmbsA==
X-Received: by 2002:a17:907:7245:b0:ad8:e4ab:7715 with SMTP id a640c23a62f3a-adb32305342mr28684366b.37.1748539522213;
        Thu, 29 May 2025 10:25:22 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ada5d82d95bsm177793366b.57.2025.05.29.10.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:25:21 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 29 May 2025 19:25:10 +0200
Subject: [PATCH v2 1/2] spi: spi-qpic-snand: reallocate BAM transactions
MIME-Version: 1.0
Message-Id: <20250529-qpic-snand-avoid-mem-corruption-v2-1-2f0d13afc7d2@gmail.com>
References: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
In-Reply-To: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_102524_145120_3421DFB6 
X-CRM114-Status: GOOD (  22.69  )
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

Using the mtd_nandbiterrs module for testing the driver occasionally
results in weird things like below.

1. swiotlb mapping fails with the following message:

  [   85.926216] qcom_snand 79b0000.spi: swiotlb buffer is full (sz: 4294967294 bytes), total 512 (slots), used 0 (slots)
  [   85.932937] qcom_snand 79b0000.spi: failure in mapping desc
  [   87.999314] qcom_snand 79b0000.spi: failure to write raw page
  [   87.999352] mtd_nandbiterrs: error: write_oob failed (-110)

  Rebooting the board after this causes a panic due to a NULL pointer
  dereference.

2. If the swiotlb mapping does not fail, rebooting the board may result
   in a different panic due to a bad spinlock magic:

  [  256.104459] BUG: spinlock bad magic on CPU#3, procd/2241
  [  256.104488] Unable to handle kernel paging request at virtual address ffffffff0000049b
  ...

Investigating the issue revealed that these symptoms are results of
memory corruption which is caused by out of bounds access within the
driver.

The driver uses a dynamically allocated structure for BAM transactions,
which structure must have enough space for all possible variations of
different flash operations initiated by the driver. The required space
heavily depends on the actual number of 'codewords' which is calculated
from the pagesize of the actual NAND chip.

Although the qcom_nandc_alloc() function allocates memory for the BAM
transactions during probe, but since the actual number of 'codewords'
is not yet know the allocation is done for one 'codeword' only.

Because of this, whenever the driver does a flash operation, and the
number of the required transactions exceeds the size of the allocated
arrays the driver accesses memory out of the allocated range.

To avoid this, change the code to free the initially allocated BAM
transactions memory, and allocate a new one once the actual number of
'codewords' required for a given NAND chip is known.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Reviewed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add 'Reviewed-by' tag from Alam
  - reduce kernel log spam in the commit message
---
 drivers/spi/spi-qpic-snand.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index fd129650434f0129e24d3bdac7e7c4d5542627e6..c552cb7aa80e368e193d71e1826b2cc005571a9c 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -315,6 +315,22 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 
 	mtd_set_ooblayout(mtd, &qcom_spi_ooblayout);
 
+	/*
+	 * Free the temporary BAM transaction allocated initially by
+	 * qcom_nandc_alloc(), and allocate a new one based on the
+	 * updated max_cwperpage value.
+	 */
+	qcom_free_bam_transaction(snandc);
+
+	snandc->max_cwperpage = cwperpage;
+
+	snandc->bam_txn = qcom_alloc_bam_transaction(snandc);
+	if (!snandc->bam_txn) {
+		dev_err(snandc->dev, "failed to allocate BAM transaction\n");
+		ret = -ENOMEM;
+		goto err_free_ecc_cfg;
+	}
+
 	ecc_cfg->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, (cwperpage - 1)) |
 			FIELD_PREP(UD_SIZE_BYTES_MASK, ecc_cfg->cw_data) |
 			FIELD_PREP(DISABLE_STATUS_AFTER_WRITE, 1) |

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
