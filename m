Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45AE606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=scOhYsyI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvtZX+De
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a/bP7AbEOCbRQwi2Jp8ztURCjHzrRYWEX9Y3CsM4jIY=; b=scOhYsyIevGHCt+NsrzFFuc5f6
	Rczn+giEbjc99P4oz4nRKc4VKOUoZI8EEZGQ4IyGaYbUA0uQ7mW8IE/mPJlc14WiCYj3cQjjTMIYG
	c4C3wdzhJy4w3+TqK2BhgOkhY2ZtTbO0mPzcjItYF7SHB3HEkYMSMGXu0H5hwjMND5vkC/UiOtoVb
	SoM/PwX9CrnUVLAAWVtUP2OYCGvpxFLBfHVLhmAFtD2K5R7PxN3ggKNgwzj3YpzC3vSDLogzP2AGi
	uxdZU3zOzR0viJbDVHCRCTooqCORqXLGB1xD45D/WSEzdUfktR87YSzq/JUKjMh3hstqcHOPsYud1
	QwQi7GTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO7C-00000002QoX-0rcH;
	Mon, 23 Nov 2026 07:05:26 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO6g-00000002QlE-1U8K
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 07:05:01 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so143457a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 23:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417492; x=1796022292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRG8jEi/eAqiUU37mzrLl9nb9M97yHGqajx0LyJX7Po=;
        b=GvtZX+DexyS0n+RmkpgwIuiRtbNnOplzaKUiqwlorcXw1YioJiklUWdhHq5KHKs5bD
         0Kp5Y3XjVHsae1IB/vDRZhXu3eTlscNtsdCKojFDd7bM1vfAUIQBSQGvj4XL5Y/tyfzO
         spukAZBv5CodzdvU+3q6OZr56hyg9WZI55gJaS7SaaLpr+1+8xx1OiBXEYDmI1+x84x0
         ex0G3sVcfZtBQ1fc1fnKKhjQJGrC/Fb5w1nFxOSyhbaHJFg0gOSsZOQSGzNWdMXrsbbm
         D4ANWOMbEhQtuMU/q6PktKBXK6b8eXFeo/K0x5XZ98X4hTGw1198xIdazdYbRXQaHjWR
         SQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417492; x=1796022292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRG8jEi/eAqiUU37mzrLl9nb9M97yHGqajx0LyJX7Po=;
        b=yhxJm1Mr46J97JFOdjgStEZaQM+irYUSD2KZERRHAj99heCcw6weisQfoE2h1BiaRe
         NniXyY6H2WlwZYGpQVB6nHJU55yEikRwLok+cA8Q/La3H3g7//WNIrV4hiw4d5Rg7CFR
         WaMCZCYDmGVtYYVLt4M7LrPEoaPVNUsQj6MwvXUEzbOHoMrcalhTlHQ+B1Kp7j/SO3h2
         poP3WbXlNt5PZSyIV3CVBtStHi+55mr9rBRa3/qydiu52YA4OLBRY/grXygbMVUbHeFH
         ynSoxOj+2Cn3E8xU5xHBtpfNg47KpMO8TEpZjPsKOvI1fHeTAr2XsKjjig+YC3tpWi9y
         8SVQ==
X-Gm-Message-State: APuU4Z8MuAQb0ozYfkbRSP+klbG5XipQWr1ZSzcEq5T9+28SXO4gszQQ
	HQoabxplmiZxd96cu2bbcdLP8dzcZ5IAOD8OvIlydFLtX6AjOd0M+cRd
X-Gm-Gg: AZFdTZfaGR5lQC5jajrScYmrHMukYDYQMrlhHyqovpTh31ZfUQ99lBrI6dCItWocqoe
	SM3qQP0oDbmJ+zkOMOhOgBcjtQFyw791CTAWVqj1jZ45Ls8zMChCOLl2hDLnifFtV0bJmi8iO9k
	43dLeLKTiqiy8A1Ot4Yhv3+CDTYdohbGqxEWuPaCxeZKhIe6R5sQVjFyzMd8dIsUKxrTc9vlzcA
	fYiS7J9VaqeR/BwTFRL9djCS6hLhnKZq0K2kw/w50HFMMXd0ohDuPUgVGyIYeb6VzN9xtM230OD
	9UYfP6UVQcM88VHeP+C1/dQ4iymXZ2QJZPo4zIn8uy0VTOpoun552g4NMpehpU55ayeJynapprM
	CadiPqvycWeAH5156HCa1exqACtvGd6REyPd4AIFYl62/8uwMe3Ih4V1BTv0HqJ/6EcFroq8boC
	vpJHHTTtVsDNWy46AW3y8NMJPk5msPm79Fh88aCibXcaUHUrUZ9LCbu+CXAyEcYSjO32ENx/B+y
	Kdmi8Zly5kUTcGz7CXvufsd+8V0FmclQGfAHHMNKH601GXPmRXxZ2ldKOwylYFdcJ3H1i01fJ9k
	I9/PF6xgvtKoBAQAfMTs1sXTg+35LFhLQGzSSVW73dw0uGGf9HipotM=
X-Received: by 2002:a17:90b:134e:b0:3b0:a7e7:68f5 with SMTP id 98e67ed59e1d1-3b41c7b638bmr8045337a91.7.1795417492356;
        Sun, 22 Nov 2026 23:04:52 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm19763094a91.2.2026.11.22.23.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:04:51 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 1/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Mon, 23 Nov 2026 15:04:38 +0800
Message-Id: <20261123070440.3060882-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
 <20261123070440.3060882-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230459_373011_37EC3525 
X-CRM114-Status: GOOD (  11.13  )
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
