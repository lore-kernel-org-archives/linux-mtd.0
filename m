Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3FD606A33D
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ssxISvI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLY4lG5V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wxejGhen10M7mVm3NURc8HoJP98C4yVYHf6f79cgCl8=; b=0ssxISvIhmF+JI5Sq752FBD6ep
	nJdmZtkS/pibG3NXOMBGNMzUvVUWG8B8DWfxSMCJ6t8hA58lEUV0zoDqBMwVkVEP/EWShrlPHPCPN
	XFrfgvS9AYcvjda5NUhNdnwKB3RdeBGaxK4fUol5Oyus/+pd9suPDTSKe018BdWft+wfqtMnUpiTX
	6Picz5JI9yE/J9X/dkxtJ+ZW1HG2Ae6uj23eTaloJ4wVXRr4gJEKDjtb62W7Vg6c/xY1XD4MwKBO8
	cNyfP3C8wCryxg9I+pEZ/ytvItJ/G9jZiQaPKanAufFHnfB/IF4nhGJRzfAXS7ctW4b0D8y/WvfK1
	6dcKoSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9GE-00000009HBP-0cTX;
	Wed, 25 Nov 2026 09:25:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9GB-00000009H9K-3SQb
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 09:25:53 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2f02f04a426so44696705ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 01:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598751; x=1796203551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X58yRtM32801RbbTP1Ym4v2U/VBocOatJPea1zyP738=;
        b=uLY4lG5VhWtEpKFGdNTHUBbVtQE60OiJr3ZSNqNEup7x/UQCO5aY4k4Nrc3MM5cCGL
         X55oBsjQsfQCI0NlQ6lAnscFLtvNP0rsCXwXnwsKM3wgFfJQFUMIvB01leRN4k87NPNj
         MYh0V7C4GQDXWpRImsUAuOlHd4nBOx3rCcX9QGpqQb8gmsMnniv2Z+c0NydLdQa3Ih3N
         zv8r6d+9fQFJ2lx9qrZNWjuSH2gIKAZxOAW8Yb2IrBh6Iy1KBxRgS6i5TlixGm36GM8s
         DE0HV2TxSYppuNU3M/6aifaNkcrwU5wHSUDHzVlhAsE/Fxq0+eKx2J3bBLTsfbVYn8ZM
         kRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598751; x=1796203551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X58yRtM32801RbbTP1Ym4v2U/VBocOatJPea1zyP738=;
        b=cRrC5h4Ctq0mxVcuQswtVPSpzJQg8sVMXQgKKeG50b/cY5QlOfU8WGg/5uds+pZmQ2
         Zj6yS432gFQ1Q5JRK9KCThyO3ybE3Lw/Yfl1E6r4VigpQK94frHBRhKmY2ucjIOUAYOD
         tWHiPFhQYfa/s4ZW77R2hu4DE38C3wHYcRnOJkRY2mt96fdA4keLiMMIFZcu36fUdQYS
         TV8384jQSNPpafj8YdWt7AagD67F68ZscYhnITAtaRNZeYRaI3xh+bfUhttTYKRR/Aaa
         MsNUmBuwNRlpKuRQKYBtAvVZbkDIMS4rNiiCbiKpLF6mQ1LgsWja2SSYMe++P94BSnNh
         Hhog==
X-Gm-Message-State: APuU4Z8uIQJkUP0LTDSq04WejSEj/pE+FXQgqe4lALORDDwAmDir5o4A
	/RO4prxk4QqBowZhdGRoMN/wj7N/n6mHAwbFgZHnkxCJtYQwWWatDIzf
X-Gm-Gg: AZFdTZechyWzrJwZXC48FVUGi4nv5IZhdx0KulcqnpxkcWaUHV2ml1lXaygt755XFgD
	0sHQ5TQg/2seL//JOFI9X/sov07KFQ1tADuer6BmsqUnpY2sOmrsAR2P2I65Oz7uoFAqKE/7mKz
	OrUwsla173dF1fta8psHg5TGikA/xepRzyxLQBdqzMHZXg0YFldyhIZ2HccEnhYAo7Wo7W4CJ+5
	1smb+WQ5GywRTtbwVK6f0qqUhpYTQALgVgxHbqyPh9JFjgsyv7GO3Xv8X77fGiY8AmrmXFW/Q5f
	KmPNuQAbKa2rx/VmJ2yb6oK19shlSNnuFrUiMDE+BqgzmzzIrPKZ4/mpu/Llx0cxpPaAA7M8LKS
	PX7+lz/kPZRQ4nxnHtEZKQoCOl9S/pY/2L2CRAkC4mGGr6ilS/FBno1tGQY5cGd0x6veMdHCexs
	6TDLfdpZJVoDHk/oKB6Uw64eZveVjK+mjFBw7ac6IwyBVZPOxjRVWiRW9u970Sxs8sQDrKHjGv8
	7eKrt0rGKT74IqJCgo6H6/Tugc8HIELDXrE1sZaGJJd0zU2I9vKBAzRZzmTgRCz5rcMbYd97jth
	lvN3eradCfp1LkqHO01uxlaT0N91Z7rlgw==
X-Received: by 2002:a17:902:ce82:b0:2ef:e9df:2422 with SMTP id d9443c01a7336-2f03f1cf4e6mr174997205ad.16.1795598750820;
        Wed, 25 Nov 2026 01:25:50 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm80883155ad.70.2026.11.25.01.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:50 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 17:25:38 +0800
Message-Id: <20261125092538.1938516-4-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
References: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
 <20261125092538.1938516-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_012551_872887_7800C8DB 
X-CRM114-Status: GOOD (  11.45  )
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

r852_do_dma() feeds the buffers provided by the NAND core straight
to dma_map_single(), which is only valid for linear-map addresses,
but the driver never declares NAND_USES_DMA.  Because of this,
nand_base cannot know the controller DMAs these buffers and never
bounces non-linear-map ones.  Such buffers are not hypothetical:
mtdblock's write cache is vmalloc'ed and UBIFS passes vmalloc'ed
LPT buffers.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers do.  The existing local bounce in r852_do_dma() is
still needed for the hardware's 512-byte alignment requirement,
which the core condition (chip->buf_align, default 1) does not
cover.

Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..f930e8cc80e6 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -640,6 +640,16 @@ static int r852_register_nand_device(struct r852_device *dev)
 	if (dev->readonly)
 		dev->chip->options |= NAND_ROM;
 
+	/*
+	 * r852_do_dma() feeds the buffers provided by the NAND core
+	 * straight to dma_map_single(), so ask nand_base to bounce
+	 * non-linear-map buffers.  The local bounce in r852_do_dma()
+	 * is still needed for the hardware's 512-byte alignment
+	 * requirement, which the core condition (chip->buf_align,
+	 * default 1) does not cover.
+	 */
+	dev->chip->options |= NAND_USES_DMA;
+
 	r852_engine_enable(dev);
 
 	if (sm_register_device(mtd, dev->sm))
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
