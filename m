Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DCB606A323
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C+lQXbqz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sd2tRlCF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mw+OvizVsRWPC5t/ruE2X5c+GJ5SdoXX9L5oeZwKk6U=; b=C+lQXbqzIxJQfUxFC/BAbtRMlR
	9hHLHzI5sEXM7LkZrvsE1OAtqVdryuUKbufBD+c2RLldKRACKukPsxaK8W5oBDzksl1M27JCs+l81
	Qmn0ERTGmmwLaHZpvXFIRaVa+Duqnb3+wDb4hgQ0buc6a07NkI0cOO0s9NLaIhRhX98EEG2xveNuN
	KNS8qbjfpNJVWOilIDdllx4I3yAs9sWXuu7i92JHqQuLuHQ5nFiyqF0fWYmuRXY+MmlPWca4QIUjI
	aNOI9SykvCBu7Bdcle7SuRHxl+DmVo6WK1Ct4Ly2nMqXRAs5AbklqJNDP0K60W+8a43SQO+2Jskx2
	lbaradgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBX9-00000009j3a-0MSY;
	Wed, 25 Nov 2026 11:51:31 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWx-00000009ivN-11eO
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 11:51:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so3998663a91.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 03:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607478; x=1796212278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=Sd2tRlCFerkp6apQDtk0Cc9j/NJwRCA13NWWURD60h+s3bgueL2WC0ER2CmtrBcLTa
         613ERfk1Zjo6OtAaBWhT8evGMchlaUphNnXznruu+Nub0fSUq5aispYUVPvTIhtv7iLo
         ho4ftKvtVD77M0hDYQyVBkgR+7x4RSHTTy8W5MOydFWHlTK015Go7EnNiO2ux6bwtHsf
         9V3kt38T9p2G+9czy9w3l2FNzsHPnKAFbsCxtfdq5SqHOkEAzNesFVoD6QX/N+5pZwCi
         6N4Jhwy9/HZkjpW3JOMJ58b3M2hT+lkdfSx5GQpQdkIkjb5uPA6UqFNtk4xD/x/+1Vkc
         qYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607478; x=1796212278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=epcBxmAxTqWIY5NZpo+A8RjnX+34aYNs0LJv8Ww0rZA0QZ5MwITpvF7geIBK50sy6+
         b8bkeP2xOpfQBS5wOoYknMpdFV/38NQuAHEBoz++xi0B2uddytpSe+Dyl1eU0jLxDm2H
         /shTigSrAFDy7Rofo2F2BVm6UoBfSoNPcnrvwtZg7VtFrB8TfwTMoZ6pLnyCK60gKotg
         fmi/EhFX7ZpeiDozP1v2MgRuRk15w73+6Jd9yL6J32dmqLekprbD46Qai3zDWhBSvxgu
         0i6U7Cghj6ZS4VOnneJUG+WwGrDKeddf1gjA/AFSTcO522LPCu2XmagcWMHgzt+ERnH8
         BmtQ==
X-Gm-Message-State: APuU4Z8J1kuH7wXlQbj9hwYB8anSwph1v9EHoLXTpi/hPHohvk5ft87z
	7T1So6sib70J0etpOpxElS7HaoThQNGzzH2Zly+P7gK/6hW38osTmuoY
X-Gm-Gg: AZFdTZeTKvKj92Itsf/r1vwPJ+GuyrxxP8MvR94eWDlz6wL4G5eLbh731XYTrVyxf8H
	B7kUlZgoqnr1vqDrKrL0Em4Q+B7f4RNvFA2NhUicLl9FkOymrmsV7JLOol0n+bHXD0UNXQrF+4a
	8ZuEqU1refu+h/4PbXDzV4UODnXGBAmzSSEENzr8oe2j+gYfk1HDO3hXa2cNiGQc5IDk8Ybev+n
	umRBRmcwunUjEZI0aqqm4dqQiFMjZWZpIUdtO4UtXba53znFYD1RWVQTIe1exopfbQja05t8HwX
	k4vEddEn1h2vw4KkwYK1a3r697kpuPiuiF1K32mdczbPOZYawiDxr88khd7xTLlOyryAKM2PToI
	V403fAQILkiNTQPO84gCsS8fwrFVtWwyUzHWPrJWCmiB3BP/FAfl7/t7L+VkzcAd3rEF8PxDiiK
	uyU5ayCcE7OYYTHIuBDx9i/8PHujv3QPTh7xtlKqqI+5FOgy8NkFMlzgGt77D3RIycd3awUK/kS
	j3qFBMCLV9dkDMpa8BCU9JsONW6FByNg2DgpoqKbB2zk5OnZskbo++79g1s2UPtTc99kR5/lep1
	WXyfanXq+q8qRtQFM6GfewJk6ZIxvF3W+A==
X-Received: by 2002:a17:90b:3891:b0:3b4:127a:2bc2 with SMTP id 98e67ed59e1d1-3b41c8d9bfamr15951758a91.14.1795607478256;
        Wed, 25 Nov 2026 03:51:18 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm30569662a91.15.2026.11.25.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:51:17 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
Date: Wed, 25 Nov 2026 19:51:07 +0800
Message-Id: <20261125115108.4147741-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
 <20261125115108.4147741-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_035119_328345_B44CEE8C 
X-CRM114-Status: GOOD (  13.01  )
X-Spam-Score: -2.1 (--)
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

ebu_dma_start() maps the data buffer for every page transfer but
only unmaps it on the error path.  Successful transfers thus leak
the mapping, which accumulates IOVA space on IOMMU systems and
skips any cache maintenance the unmap would perform on
non-coherent platforms.  The error path has two more problems:
when the mapping itself fails it jumps to the unmap with an
invalid dma address, and the unmap is performed with
ebu_host->dev instead of the dma_dev device the buffer was
mapped with.

Return directly when the mapping fails, and unmap with dma_dev on
both the success and the error paths.

Fixes: 0b1039f016e8a ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 1f493fb426d6..5eff8d7522d4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -312,8 +312,7 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	buf_dma = dma_map_single(dma_dev, (void *)buf, len, dir);
 	if (dma_mapping_error(dma_dev, buf_dma)) {
 		dev_err(ebu_host->dev, "Failed to map DMA buffer\n");
-		ret = -EIO;
-		goto err_unmap;
+		return -EIO;
 	}
 
 	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
@@ -346,10 +345,12 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 		goto err_unmap;
 	}
 
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
+
 	return 0;
 
 err_unmap:
-	dma_unmap_single(ebu_host->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 	return ret;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
