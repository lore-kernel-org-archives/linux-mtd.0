Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F730606A332
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 05:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vTqNUI/Y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRcDTQPy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xGB9xUGsumCsX9kbdkN9VGJxNFd7tKTjKvkWKMG1VGc=; b=vTqNUI/Yd0WobMNAOhf/zVrP5r
	7hFfD/33LDYbVb17ocTe/G+pfYHrs4VV0aaJm+xMRYSXIUIO3NGNmc3hrEoSxuAAGjfmjACgO9ID1
	tE5EII7gSAgC9jxE0Hw13u6bIIdnc7EwwonsNSmvzqBKJequ/PAm8mV0GLmnEgQNZ4Lu+hjYP0Bgr
	zTZhJzJqa2LX3uOiWREhy9ejOfTTQUUZOAmKEE0oeCYPdx+Nx2TiCifiuDPHNQZJb/b/Ztvvh5kdL
	FMlGg88ff4AjZ/nzS9nMgDvui+4erATRCMZayAfG7MS1lQJp1PQqI+ldec+Yt8FN15a4uuwRdSWON
	nlA/Wwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMws-00000002L2C-0ziE;
	Mon, 23 Nov 2026 05:50:42 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMwo-00000002L0t-1Hze
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 05:50:39 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so1415284a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 21:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413037; x=1796017837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJIPp/YyH4t38dxL7yEdpa792ArQgfxLDKaGrdyjVJQ=;
        b=sRcDTQPySYU9JZro7aWYgStF19hs+WB+I1t5Ii1uCp/O89y5CsFTWKPQKp3xB4S7mM
         S+GL5SnRhlmmKOktIpytfWN++IapPV1j8FrSCf0gZ7UDVAxQvU/HNePjbqBpG6NGEcs1
         6O1jq0Q/z1KCvwCyRCYCT3gMb1NIn4EN+wkK7pTYnmW6zKEgJFtWYvw2sbxnqtvtWnPR
         WfkfyCWJtE0sdrsCURe7ucTQZ6xRVNENm3jkQjZ7KPguNqOp2guMienqLOXe4gQYep8E
         IhvNutH5W9PgyUy7j2n4tuIaVmdoqTx1EAKqMujz9wTnjCR8URkr/GyA/fnEBmrPMIMT
         DClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413037; x=1796017837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJIPp/YyH4t38dxL7yEdpa792ArQgfxLDKaGrdyjVJQ=;
        b=0wLsbPkyQ58LIyUAbPGVsnllBcXyqNtc6IH2Slw1wC7lNuMU+J8Hctv7ZArpYSMM/R
         iK+6uWNZcNvG/LldLK5yKIo6kRr9KMzgdZ0oQlQbeeOEEXedsz5GS9fBSVkDzXwf5rkT
         dQimp1M684P/c7yfIqggMMELSFKkG+uaS3WFKNhlRmXQ7qI84SXDosXVVDyeasZtRRNI
         q8py7YFyZRcCKcteOLvAYp2LpvXhWv77TQLED24rgCUX5UtQmpuRLyYdUIrf6Tc+vpYl
         eFG+BN8/ulIIzegLJ6ZUFE33IdLl3kQz7zl2hVQKOKk1mRrPVGx1Z43a11bvzNbyMH64
         oLAA==
X-Gm-Message-State: APuU4Z/nMUYqeXvZfcbYLHl19iwxrOXt3w4OCK1mCKx8ayx85enT6P8D
	h1vm/5fW+DOTc4ITK7wSFNHI5k1p8Xhe8p7RV53xU/c/k2sjW2xSR479PKi5Pp64
X-Gm-Gg: AZFdTZf6R7LTSoGzA2RhjlB4V8MBh+7Tc5VYwDyeT16dHg/hpjCqnAOKK5q6EEUPOPH
	Tg4oYGttXMtut5UxhYjdEa+HNdVpvi1OmSDX3HkOA3Y0VoeS+h2nFaFcpgGGQ0h7idi+yWiAbZT
	4liGrpHkj0sJYWMcP9s8XuQPNWY7ateNJSPTYAgxzEsbCd0+u4zk0InF+f3Gl1fvMmWqBLQQJSn
	JxSexiJTpGKGWIGu3BkE7ukyBska/K81lJgmdbKprtk1l5SxAscw1k+EbyvNGGb+BB9ZpGEzAgW
	7NVayd3dSk+SBruYlzQdtqCnBkqmIXe5HlEJqAyH2E3bhnLnGwWs5Vax40Ie2EZBY/qivAN1PRX
	QWLd5r9qKsKf19OD2YqnVA+TOlHtabbwpR5T4lI1J6PZN5cJb/+fND8m7wBuE6RaWerVvai6OGD
	W7ZL98095K/ueLGHE0QIRwpDtcrhvaYXDdY3xBE6U8NjMgVKoHfrgL45E1YvNk70fKJrFc43VAj
	jbwhnK6wzgW32TMknItiudMLHGkpCoIq/XmCNX+0SjxL/utKMhUMANW9hWdR2AnMKDQDV6DvRnV
	FwDDC6kfYMfiMj/XKgRvQ62YPW58Dw==
X-Received: by 2002:a17:90b:17cd:b0:3b3:c998:6d6d with SMTP id 98e67ed59e1d1-3b41c95da50mr8892234a91.47.1795413037396;
        Sun, 22 Nov 2026 21:50:37 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm46486325ad.50.2026.11.22.21.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:37 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 2/3] mtd: rawnand: intel: declare NAND_USES_DMA
Date: Mon, 23 Nov 2026 13:50:19 +0800
Message-Id: <20261123055020.1995251-3-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123055020.1995251-1-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_215038_482500_F077D2AC 
X-CRM114-Status: GOOD (  11.02  )
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

From: Ping Li <leeonion.muyu@gmail.com>

ebu_nand_read_page_hwecc()/ebu_nand_write_page_hwecc() feed the
page buffers provided by the NAND core straight to the DMA
engine, but the driver never declares NAND_USES_DMA.  Because of
this, nand_base cannot know the controller DMAs these buffers and
never bounces non-linear-map ones (see the use_bounce_buf logic
in nand_do_read_ops()/nand_do_write_ops()).

Since the mtdchar MEMREAD/MEMWRITE ioctls allocate their buffers
with kvmalloc(), a heavily fragmented system can already feed a
vmalloc'd buffer into the controller's DMA engine, which is not a
valid dma_map_single() input.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers already do.

Fixes: 83208e106a8e8 ("mtdchar: use kvmalloc() for potentially large allocations")
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
