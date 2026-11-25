Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFBE606A33E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oy5WFMqG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGdysc8S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mw+OvizVsRWPC5t/ruE2X5c+GJ5SdoXX9L5oeZwKk6U=; b=Oy5WFMqGLi+seK86jRziMmPkqN
	Tcz1eUSoFsv5bl1wbO7TWBX+iRdRf9yaBFFJyJhfH1Ayz4fBim7+NE/zQi/hS8kzgasa9XOzrVU9h
	3VpvaoOAP384IYqYDKQy5bUTMjoiSuhGM3F6n0cz/8TA9zd83u9Pug2KDHAXxhdsqC0J/hvGaptEF
	rGaS0aD3vmtYoBPJSJ0o/iE91GUpePhQZYtuswMK0D4ItiGUY5HCJRMpZjROy0MIdcJPWiTTVpfJq
	nQXY98Z+z/INdOJa5jrMAplhXpZ/1xmWvJXytctMfH0xR5qxulBYGNiEUS7tFFpRQp+S92PQtGMAF
	IBofKRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC0V-00000009nsi-4C6W;
	Wed, 25 Nov 2026 12:21:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC0T-00000009npl-2XrZ
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 12:21:51 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8b904d10882so2330864b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 04:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609308; x=1796214108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=iGdysc8SRGsC0lwkq9b/rcHoZx5L0JzUZmeJi3mSD6F8koLBly8dMrD4dkw/7Pe85A
         AUXUjYZ5aTmM9TBcsXIzCsJa6QKkdyrKCQp4T+y1pvvU3yg/Rvkb3O5dskPCNH8vijRB
         HpRGgfbXLfa5Lh5hd8JriEUowMBqRCoG9JoWRfsJWBbA/TBktvQS2aX7dtccewTAlH6Q
         a2Yt2iDYE9anfjDlzniin6a6suxXZDRbA/Sz7aeI3w817HHtMk9kdnROwypQUkZWWslE
         CP4x/i1WIa6OnTMjYiKH/Wg3OuGeeSZwBbsMblKnJEVLu4Chxm4Y3eU/93f603YzLpdX
         dJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609308; x=1796214108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=Gru+KZ7RcCB/YfkKCFxOqiLWWUVRpKClzH+rzYwM1yQfzeZ9flEs1/Cyt2csVrFnVF
         6+ZGWMBHVYHq3Kqp3a4saL2x1xvJ4RZ0CUxX/OVzcf1b9+UX1X8ePHkvxCmKs11ASQ84
         Gf9A8iLumTjrr5Pf49FMl9soiyylrnVg8C6sZT4Sp5AXqcAbI4ZqbqUsCmc/xy1p6N5f
         GBdm6+BabUv7y2DjxD4O+ENFfPfekUGlh/5pWtqtQnAKhYSwhtbeClCLz9jjJlvHMNsO
         0GQIVTuZFgFwln54wbRCyTAA8n1UqFKtLdEJ8j8O94+eTu9FHWwZCC+fgqeK2G2zQtbz
         NvNg==
X-Gm-Message-State: APuU4Z81oMpc0TqF6QdIatrIYYpsfOOzVCvmQuyE+qmQlYamBhJsswc9
	Lj8x0IskntDMm3lYShQOBYVOFf683TYRmnJ2G/DXVi7eK6T+tPExgu4Nifg2DR+A
X-Gm-Gg: AZFdTZeNxPmZwm4M3pwYOi9Sggy2CG54ZA7Tm1KGYdyLRiv3khu6star1rZOrC/feYS
	DI6jK7YICZ7T90xWa0j6fmzbh0WFIs9NROW86a3zC13OKnEBBd9/S/n0Ly1QZk/43qRk8HEFeHM
	QpLG0+jsVV0gmHihAYy50lKMqW5/iJ0XKwchvgS/PBKVAhutmT6HH7Yj7Hgy+HgeMJxGzLluUbe
	u8aVwW1VdzJq8wJGWSe4n8JjB8mIdeZQtbqbWejUBvb1Eoxq7pMaHk8+ybL+5GlgxzY8gmFfOAX
	Jw8538QMIcaaKJZh8HSYYCVCyezSvyVWclTSima9X2N6lwEIYYId505AAFBAyPzPDf60fpWjAoj
	qOvzPM6YZej0co4xcQz5IL3Kp63ETZcbWqcTfDNE662y9bKwKdYFn/F2R8mUPC/levcLJSR7Bio
	NciYq1lRMUG6A+foDFny2FPZG3t0PVDakZW+n7NhijSHjsnKK49inrUeIN0P4P8sOct99QGE2SP
	kFIOhy913qWxks3E8M2YVmZXxzLNiCyGZz9aRsxzSnmWPhwbrTJSkz8TregtXdfTUH3c5jUl5nR
	d9zBEdx2XVLa/6M9N9Nz5eaM11GqeTxfBvGS3xrbor3PO+DUMQ/ExhQ=
X-Received: by 2002:a05:6a00:94d8:b0:8a3:7425:9095 with SMTP id d2e1a72fcca58-8c8794b8c2bmr16410566b3a.7.1795609308579;
        Wed, 25 Nov 2026 04:21:48 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm8688656b3a.13.2026.11.25.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:21:47 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/3] mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
Date: Wed, 25 Nov 2026 20:21:34 +0800
Message-Id: <20261125122135.44696-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125122135.44696-1-leeonion.muyu@gmail.com>
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
 <20261125122135.44696-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042149_805114_08F6C78C 
X-CRM114-Status: GOOD (  12.81  )
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
