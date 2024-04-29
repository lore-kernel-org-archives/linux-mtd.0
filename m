Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3DEC4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2024 12:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=88hyslKxS94oLxOfTAXuMG+nq1jIRuuZyvsQfmgZCT4=; b=yBE7rtbd/LAnkQ
	Yka+sqxEQ88Y4zbob2gJ+4MRH5opJNOo1thvyyDKGdEQzwhNLXZEm1YNtyCwdAuQuorBr9FssmP1o
	xYBGvYOtKIDkvnkIcscWhXYBqeON50OJMnizS4GRSAqRPrEb1AuxX0yc+zLlKjafoCLryg+4xZ1NP
	JFVya6CvU++fobr+ajXFQoLMuNTN/pqtWE7CmGAm0x/CNP0X1rbz5w6AK0FK1lR7QH/MpSnh71Kw1
	oPvSqXr17cdQD5JWJSIL7WeJP7AMJkcaDkxQMIKilNrzgs9bM7MBr0dKnf3TdKNwksJ3xjbaZ7nLD
	6h7+eaBTmwLTF6obM3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Pqy-00000002chN-10Bl;
	Mon, 29 Apr 2024 12:11:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Pqt-00000002cfu-2d81
	for linux-mtd@lists.infradead.org;
	Mon, 29 Apr 2024 12:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52B5260BCC;
	Mon, 29 Apr 2024 12:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020DFC113CD;
	Mon, 29 Apr 2024 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714392680;
	bh=X1Qvu63kkY3/b6fxxe2AVsLJHeAHq2bhdDS7GrXYg8Q=;
	h=From:To:Cc:Subject:Date:From;
	b=Ckc5k5lO0SoC2waH5Mm3uRE9/G6jrfXw9PNzLBHvSRMyV341Vm+RlthYwYgCipJIH
	 0E3j9rgXWKj2scNo1w2qh1TrvnXJLSmpRRpI0viX4y2eCYyCJRJf5QWbc4Isd2Rw9d
	 Zi82egH2foL7xEEQJx12SiBOcSAbgTND1blxsrk6/U14zb1Z4TTPl99bxlWtrYlP/I
	 DcSH0u5vWZrdGTZ7x28mtnOaJ9WvfVL9PZyiFI8wsJFCFxTFBpn9O0ufS1vK1jkTbk
	 ctvnCu+dyyE6/MTXmGIFIc/qYZI7TEa60LaSrFrEihxBDd7ubL6E6NMl4WnxxWzHVF
	 dFfkqnELShCUw==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: replace unnecessary div64_u64() with div_u64()
Date: Mon, 29 Apr 2024 14:11:13 +0200
Message-Id: <20240429121113.803703-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_051123_728748_C228B7C4 
X-CRM114-Status: GOOD (  10.47  )
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

Both occurences of div64_u64() just have a u8 or u32 divisor. Use
div_u64() instead.

Reported-by : Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/r/9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain/
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3e1f1913536b..028514c6996f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2893,7 +2893,7 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 		spi_nor_init_default_locking_ops(nor);
 
 	if (params->n_banks > 1)
-		params->bank_size = div64_u64(params->size, params->n_banks);
+		params->bank_size = div_u64(params->size, params->n_banks);
 
 	return 0;
 }
@@ -3406,7 +3406,7 @@ static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
 			return -EINVAL;
 
 		mtd_region[i].erasesize = erasesize;
-		mtd_region[i].numblocks = div64_ul(region[i].size, erasesize);
+		mtd_region[i].numblocks = div_u64(region[i].size, erasesize);
 		mtd_region[i].offset = region[i].offset;
 	}
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
