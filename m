Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E76FC73C46
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 17:13:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D2920651
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 17:13:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdDGJwBE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbDheObo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D2920651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7KSkGpbZtcXZhbcvuN2tM92Dn4tGuJmy72RXa8c6N3A=; b=NdDGJwBE7itZNs
	qXhTdNbYTpSi4e9r10caxeaNRR/2TSu7byKI4bYSZ2df9x88GTE6qbHgaZllxD1U9iAa0n2IDcF8h
	CI0bQmXVOI/OdIs3tvsHmHKo1pWstKtJxM8gnnQW2Fxo0L6p1Hmy+4UP5dQsd+PXwSxIe6IYoMCmw
	mcn/gNNjYH1xiiyArlFAdAKWOCnTkTRx42ckX4n3XgmAQlOnWwd+yR8cmfR0GhynH6k7n2hLzieW2
	yLCazVagVzTHlzqOcHzRvgIIE5MuJZa6mzekSq1Nsn+BqsGDgdlbdqKrpFESJqNWJBQcXkormS/0f
	F2VA+kcSu5ZakjHjzffQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hktgL-0007pb-0Y; Tue, 09 Jul 2019 17:13:33 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hktgI-0007pG-MH
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2019 17:13:31 +0000
Received: by mail-pf1-x444.google.com with SMTP id i189so9604018pfg.10
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2019 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4Or0QI3KQHA4FNPnx+FhFQadfE2t1lVdUx9VnhTbKs=;
 b=YbDheObonDQ22dhlbThY2fHOa1Th8cLIfc+GaAfjoyIq9TfqHPSlEI1PfrTGeegEck
 zWr22EllgiHjL0DDeZRUYAZRI538W3NM5MPCQMZqAS9M9UNoB/nxxMNGxjGldJvvISFh
 Vvs/dXSP+kiPskSPXEgUbkH/MpLvkY156IHtVJsF3S4Z98x2S4fuoQeuXBOJxQFRkcOX
 IBgDrHPPjGEKoZtg97sm+SEYtoIU7BrEQvSsTraFCNYQwlJMx4uRNfGJgBBvSJ6NuFT5
 VIgxCowsaxBBLgvQfhdD/TymNU3D7LPw0JJFRYXC3hZnXLVnpqMiUFZeyW7c0tQqRBPl
 B41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4Or0QI3KQHA4FNPnx+FhFQadfE2t1lVdUx9VnhTbKs=;
 b=UP2n71lnuKwtULRYLumIiIqC1FQNO/eQAi/S4toRxiNrmobnETSPPpUzUOFd+ubHHe
 4ICvdDe0UVktqRALvicVAnZG1v/V+Ki1i2CKD0lNB/ayxNOXVYhaFeeNu6YMSj1qK5t1
 G9Y5doJYyIfOnblWdkV1gH4t4tkRoQYKhK90atKrMKaXvobttKvpemUH/u/xa7MM0xog
 CPMc/i5TMwh/WNRE+0Lw8RGws67OUuTPNQYsXjX75ZFv5PKJG0yZ8iIKZFNg2p+keX1C
 eiuSsKa0/yDQnllK2lcCKE2Mx83hvy369m8GIlERGMa3mIlUvafcCMYmng+mg8m06Yt3
 /biA==
X-Gm-Message-State: APjAAAWgAwXxby9qdui21/eniZCgommOYGHOXz2JClleUsdd7G6hwn7I
 bVQwASEG6H4JvIrIGu2OFvs=
X-Google-Smtp-Source: APXvYqxPEnr9OUa2Ph/eh0Z70v+ZgddeTvSSZW6TdIVakJeeZv5JxWZJDOHMPI6H/mjgehPAZz6jeg==
X-Received: by 2002:a63:221f:: with SMTP id i31mr32607941pgi.251.1562692410228; 
 Tue, 09 Jul 2019 10:13:30 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
 by smtp.gmail.com with ESMTPSA id q69sm7358054pjb.0.2019.07.09.10.13.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 10:13:29 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, marc.w.gonzalez@free.fr, mans@mansr.com
Subject: [PATCH] mtd: rawnand: tango: Add of_node_put() before return
Date: Tue,  9 Jul 2019 22:43:16 +0530
Message-Id: <20190709171316.13451-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_101330_730879_0F2C5195 
X-CRM114-Status: GOOD (  10.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/mtd/nand/raw/tango_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
index b3f2cabcc7c0..9acf2de37ee0 100644
--- a/drivers/mtd/nand/raw/tango_nand.c
+++ b/drivers/mtd/nand/raw/tango_nand.c
@@ -659,6 +659,7 @@ static int tango_nand_probe(struct platform_device *pdev)
 		err = chip_init(&pdev->dev, np);
 		if (err) {
 			tango_nand_remove(pdev);
+			of_node_put(np);
 			return err;
 		}
 	}
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
