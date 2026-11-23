Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA14606A31E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=axLuuT1O;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0okMwxKA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Fgn+p7KQpYgJiJOJ3gkWYbmjPMbYFg6S6bhkDZw+kU=; b=axLuuT1OaXgtss4d3yv27GZBo8
	1HOjxQ4kk9gnv6XYLRu/Bmlmj62YFleBQFvBTg2ADd36BV3lo40f5NHxXxVamXL02D/q5cNismtRF
	ft97Kgxwq2/XP0IwcCVcagAbhX1ghuFQG++WT1p8rBCXqy8F4+Kgulf3ifkpPdbmlMlh8szp0it7s
	ErzfTUZ2KLDE+HhOmkvPuCdxrJDzd/+QklhWPdifu+5C8XyDVHngSKAcT7gTFSueC85WQl0hVdVd6
	6CVMsJvwYBbugHgoH+piGRjnUsiPyl0BxhIpHcqS2cNP++XLs5A9Dg9Z5rLZ4sjf80QEM9C9Y4C+k
	0LLF5ytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO7H-00000002Qsg-08F0;
	Mon, 23 Nov 2026 07:05:31 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO6r-00000002QoK-4Baz
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 07:05:25 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso1632235a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 23:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417502; x=1796022302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eT8QnuufkN4rAqAjynMD8IPwDRm8B3Z1LQZ8ZX2eiyE=;
        b=0okMwxKA4/00leSL3WJm8VNTjlX+szaa/u7lEYNSYqyfMYTMRbFnWVyUW5LBn5D1NO
         gGZyc1LH/0jT+S+dcyzekpI8pymYJZf+wj1lSPcdtAH2TA+4NiTN0SgG+WHpCgpef0JU
         38z8BxPR2QDuyBfUti+cbGbcHpyENErVFLxYMccq485Qp4hjWA20OCYovsUX0z5WwJu/
         ynluFdRm4tfeo984qI/oGUGXUuhXsNT2My8JagxN8xQ1xhoOgaN1zvLD+R+pQsGmEHmn
         dTxyeHR1wG6kfd5zqA1hjL62ngpn/W0QCymN79p/pcclFXyhKTleXkT/a756wVw6zoLh
         xXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417502; x=1796022302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eT8QnuufkN4rAqAjynMD8IPwDRm8B3Z1LQZ8ZX2eiyE=;
        b=WoTYQGg6WXhGvhz8L9TTYp2iz9+a8SZH/cMFsTSxn0LuwtuU8YBAzVmYtq7Mt2CvLj
         VQiRWc3kner8tzBTR/HWWsbuLuOd4YzLHrDbdDogBrmCpULXLOAL1aOEBtYJZbgOPlpH
         cL7R6GDJJ8CJo6E77BB2jxWg785s8MigRh3tu8QYMPE9vNmSHruAjzOSCN/LlEI/UOfc
         eImkousqzebSIwG6LiyRNUaGDgJTOEfvidWvzpTOdCs6aN7TttzsppuFCD4/Ue7GC5Fd
         /AyVGifjn/r8JfoHYi9wXwXFZXMzK3x0oIZRFlQRzfwdM+Kp+BdX0FvBVizoOHeVKo3y
         82LQ==
X-Gm-Message-State: APuU4Z9J9IzzOZaJ2GFwqnJ3IiFL7OmzcZTfJO/EyrX1Lbjs8MN8N3N8
	wNovIfVOCKn2aCfy9tIuVHqVUZSRFkvVx6tnnSwac2FYscucIYjmN54h
X-Gm-Gg: AZFdTZdOT0deicmJZgF11Q5BCB/dkq6o9iVj7H/ALpmVom2zw2PMdt/yZ9+wTK1uTh/
	mDLROYRSd+Fiub3w3x5OK1oE/cKHtAnL6jNkfHUG0mog7jUV8mkYbn/ElcmoM4HnB5suxoJZoVJ
	hPXhARaXcn9pviYpXKkgP9BhxL3XwZ4Y9UUNeKLfboY5anPmcWzed3e/OOK7LW67XL3tOf6b4Tn
	lVo5P+SgYXoUy8sGwDQ2PlHSk88Vg5gfwE+IzjEoA15tMSYVfh62svLH939f8ES9j7aThSlsk6s
	td4+kRhwgx4dAEKtQAhche3/Y0hOLvnuF7wdQhk8Ozu6ex39G3/bM6o4bpzyNq94/yaMhF7wYcv
	+IWZ2J5lUEMACnDOAXJg5A6eK+MyY5pq5f7Cyt6Ucht5qp1ueETSb/jXbhh+aGCsjMWDeGKPps+
	OY+aKKXzOtkWghDnEhwI3vtT+e0xcUGgTKvilvfsEROUkuV977aUBl8kkMxuGanFBgIsj7Sujos
	7YZPfR9kjuyERo4VnCxF8AxOFX8a2s2mvTncxKjBtBwOwj5wfLDYgtMwT+7Zlt8ddpqYa5Q7rcO
	yxpk4Zt/SfAXBDHlN463Efwo/kwBF00SZw==
X-Received: by 2002:a17:90a:c10e:b0:3b3:b0f4:1bf6 with SMTP id 98e67ed59e1d1-3b41c8ff7b3mr10083555a91.22.1795417502578;
        Sun, 22 Nov 2026 23:05:02 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm19763094a91.2.2026.11.22.23.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:05:02 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 3/3] mtd: rawnand: r852: bounce non-linear-map buffers
Date: Mon, 23 Nov 2026 15:04:40 +0800
Message-Id: <20261123070440.3060882-4-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
 <20261123070440.3060882-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230516_069636_016250AF 
X-CRM114-Status: GOOD (  12.00  )
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

r852_do_dma() only bounces buffers that are not R852_DMA_LEN
aligned.  An aligned vmalloc'd buffer passes this check and gets
fed to dma_map_single(), which is only valid for linear-map
addresses.  Such buffers are not hypothetical: mtdblock's write
cache is vmalloc'ed, and UBIFS passes vmalloc'ed LPT buffers.

Extend the bounce condition with a virt_addr_valid() check so
that non-linear-map buffers go through the existing internal
bounce buffer instead.

Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..4dbfc053fb21 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -188,8 +188,8 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 	  from device, for writes first fill the buffer  from memory*/
 	dev->dma_state = do_read ? DMA_INTERNAL : DMA_MEMORY;
 
-	/* if incoming buffer is not page aligned, we should do bounce */
-	if ((unsigned long)buf & (R852_DMA_LEN-1))
+	/* if incoming buffer is not usable for DMA, we should do bounce */
+	if (!virt_addr_valid(buf) || (unsigned long)buf & (R852_DMA_LEN - 1))
 		bounce = 1;
 
 	if (!bounce) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
