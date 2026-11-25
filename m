Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD51606A69A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QMFa1gO1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJUzvd3j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B/0bSh+aMPD6y3HpcU+MKyFGs9iyTRleBlU0ZDdzexc=; b=QMFa1gO1bEY1EjduROVfEXILYY
	BIiHwVLsGCCtphRFenFKeqSc0NRplPxsRbrPVjsNR/2vFqFPT78R/ZPGia5nG9cIvypP5fKI+1uDx
	P41/AyMMwOIG/BchsV8YV5Iz9vr8qXnZNDxeXEUIjfejPvxBMej/iBH/FRhYhxpj2Pn+A7xy+mvZz
	hXJgzA9ZfeWULm6RyBbiLGguHxXkL2Ik5lfCjVpUrPnUNGMQ9ax7Y9TXlVQVbYA6eIwFwvfRXfd3D
	B/PrsG5PdT56C1B6Ve6M8cApEbecOqrtPZUhsDnOyqE/0l6q9h+WLsImAngISwAbeQoppxyGwSf7M
	gIMED18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9G8-00000009H7Q-40PT;
	Wed, 25 Nov 2026 09:25:48 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9G6-00000009H5n-0neU
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 09:25:47 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cddc250d815so2171655a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 01:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598745; x=1796203545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=AJUzvd3jYgYDnE9C79+80vWDxIW0j+xKZAwtaETvhb2BpqsgaOVz9yfPJ6YKbQOyIE
         cMt0RVSR+CcQqksZ50Mb6Z8rFr3yQBqOMIx9+xBxU7P0nayL2ePJgN+z5nb8z6RmsXF4
         uIP8Fx2vFHHhyUZRbfTYKk3i5w9zmJZidJYObMYViJjClN8rejJrXAjv5ZeTuFpcJhvq
         Gjo4BkEPNCW7YlFy0rSF9tfrW3vgqjOkleDZxxxvnP0p3IHgU5TNtwrtHlgIsP6mDmGT
         K61APakhT7AbSAmuAjh/dPM+QPV5bKQAZueO4nXKOEn1FUINjvRg2vlVD3pYVUl6Ey8j
         MnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598745; x=1796203545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA+Kx+uKQP6OM3muhrQQ7gMLzt5UOS5UjDB/PUfvv7E=;
        b=vJSYxkuwdA770N2337wlbJpj8Yugxp72RSf89JWq1rRfWKnnAjUlnXnL43AJKUBFcE
         ZfJRO+kDq5qOUKL9MiLGXvLU2eL55uWcFg+uOgnDjLcw3PD/Ki890qAz8t5WFNEwGOy8
         1THMNEB+MzGT5IQHaMn0BCFqWuBeISU5+DneZV3XlE5o/kGiXyyb6MAYsBSiBbqWKX0r
         LUKwWDl5pNPtYQ+4/YLD3BJaLUHWstTRkosoKeNNfJuEjR1YguXvStZMk2HDgYnzAGmJ
         Tr+ZUnNAWiC1bzfQ6W8KFHWSxUkFVRkZxvCRhKwV9uLJXLjpbrWYoKngKbBcL8qZiyjM
         VREA==
X-Gm-Message-State: APuU4Z/l309LYkztKSkXVNJg3Ua6hzcyMFDWejy7Ciwm87E852NWyLlW
	4cKBVZ7kKC/WAYjghSRFygxUGvoAKEihyiVi8SdELg+PSIoUiMpEsapgUnrhxeRE
X-Gm-Gg: AZFdTZfOg/HVZFah5dCbiTIQoqr2v1MRO5v/TLSeM6pYj+9Nwndm+y1P0mFJ0hqjRi/
	/XggnfT+9aa+uxHiMrd8ET+iPKBHFgCh6yECrVA0G+TxxhBufN/5Olzo3r4h+0EO7wNttzV5QV6
	QLwGjnuDKv+VJoyyN/J/7jgasjxggNEiPreETbtI8LDDqDian4VJPM7OwvgdL78J8Y3+LNzyeW/
	t2qMqTDF28+WSChpsiTD7tLSARZNyFoZ8vs92gVwoAikoPF9D5IuAGy23hJV6Z1wF/1iiJcfS4t
	K56LpeB1JXg8NVluf62pErAp//2jH0HoCKZCwV3f57s2G8PkKYA/BuY4wn3aJqOv01APvi06Gc5
	xNZxISFHqYNoL2/Zyv0FBTrw/+nFbjE5C6YGhKTfLja/kjfKUik32cw2yfrytgWkQlDcCuksg+W
	LZawLUyGMjCdH8V9PeMxQ0ii8d+VmkYX0bFspNEir819vQOh/QpiMeCkZkNS+pL06HZIsbdWI6J
	UO5MQmjCDvWDpHVelfKZZNkjAWKjPF7v84umcX2Yh9+N/agcE/gAuNivZE3t3w0OKPpj5dwW+zM
	8TGaFNnHM/XkztB4wqTdrLfl2mDUO5A2pA==
X-Received: by 2002:a17:90b:2f0e:b0:3b4:fd89:5f97 with SMTP id 98e67ed59e1d1-3b4fd8969ffmr544920a91.33.1795598745341;
        Wed, 25 Nov 2026 01:25:45 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm80883155ad.70.2026.11.25.01.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:45 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 17:25:36 +0800
Message-Id: <20261125092538.1938516-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
References: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
 <20261125092538.1938516-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_012546_388375_CFDEE136 
X-CRM114-Status: GOOD (  11.92  )
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

ebu_nand_read_page_hwecc()/ebu_nand_write_page_hwecc() feed the
page buffers provided by the NAND core straight to the DMA
engine, but the driver never declares NAND_USES_DMA.  Because of
this, nand_base cannot know the controller DMAs these buffers and
never bounces non-linear-map ones (see the use_bounce_buf logic
in nand_do_read_ops()/nand_do_write_ops()).

Non-linear-map buffers are not hypothetical here: mtdblock's
write cache is vmalloc'ed and UBIFS passes vmalloc'ed LPT buffers,
so such buffers can reach the controller's DMA engine, for which
they are not a valid dma_map_single() input.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers (arasan, denali, meson, mtk, nuvoton...) already do.

Fixes: 0b1039f016e8a ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index cfb4b231e067..1f493fb426d6 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -688,6 +688,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	nand = &ebu_host->chip;
 	nand->controller = &ebu_host->controller;
 	nand->controller->ops = &ebu_nand_controller_ops;
+	nand->options |= NAND_USES_DMA;
 
 	/* Scan to find existence of the device */
 	ret = nand_scan(&ebu_host->chip, 1);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
