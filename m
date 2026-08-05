Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE14C55182
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axMPl9tvZ+ETtEFeRaUUCtYUq33F2Gd/ww2rxyrY0lc=; b=UVsG9zToTAk7K7
	bmJT5Stb4gnCOG4uAZEm3LKPTZLSF4lEGDzMd+W1V91v9D1mczcZ931dpLPS+5cWYIHLZsQB4U/pL
	c90U3r/gPp1cwfLdWoL7qiSC1bALYtyw2CwjLQMJKv/rgq8bEJ871AG7kct7aCb/Ut3S8ksrXjG0J
	P/iV3M1uYK4NBW87nAUbB6VxU0qYU8qVWhmQPbT9/gmSrvLsu4lfUAUxSsK92KCiGGzuLcPRi6um+
	pUH3EpQDfm1YgGB+wSfoOaGD9mChBTqlAhBsCtr4ckEO5sU+R4xMtIyU90rZgRPNXsQjIYo7XLOoB
	4nLd/XG+623aK6eSAVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaN-00000003SRg-2HYY;
	Wed, 05 Aug 2026 08:02:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaK-00000003SQ5-1WeP
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:02:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CC70C4E4104C;
	Wed,  5 Aug 2026 08:02:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A06B0602AB;
	Wed,  5 Aug 2026 08:02:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2C3311C3435D;
	Wed,  5 Aug 2026 10:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9DNb6i4S1xGO8QjzjZy24Q/YYS7+OL5/82YUT/XdHLw=;
	b=lxH0psmG1wHe3EvMnsezMi8wZc7yGywF7Ev9PFDmbkuB9FM9MEIxYzhnt/b2k7h0VdsZXr
	MljywUlBcidvNDR1yTB259eTqF3wH9XyzPy/2Ls66hEiG1XPuiLmrdUEt1XFZsbpfsj5RY
	IhAkBs7peTeU/EMMcwz3kvOpLuYX1NVEUBB5Su4uHlvwGINM9Bd3pXBItKku2vQZVp0NG+
	LBsnGTfoni1hZndCsxnTUzjrJkFJxoyQlQZXOwXEFjxwUTb/bg6ulFJCXapyqvlhMnSrDs
	1xXpf7xVJspGlMgB6R4OVsbsPXvk3gZoZNl1NbUhUaKqcncEzMSGHItVhE7PZw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:28 +0200
Subject: [PATCH v5 03/28] mtd: spi-nor: Garbage collection during sfdp
 parsing
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-3-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010244_606347_17025D07 
X-CRM114-Status: GOOD (  15.68  )
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

SFDP parsing works as follows:
1- The header is read then parsed
2- If correct, the sfdp structure and the sfdp content table are
   allocated then filled
3- The mandatory BFPT table is parsed
4- The optional tables are then parsed as well

Any failure in steps 1-3 leads to an error and an early return. The
failure is not always fatal though, since the deprecated will fallback
to the non SFDP definition (in the ID table, for legacy chips). In this
case, the devm_ memory allocations for the SFDP table structure and
table will remain in memory for the lifetime of the device but will
never ever be accessed anymore (since they are incorrect). In this case,
we shall free the memory manually since the device is not going out of
scope anytime soon.

The assignation of nor->sfdp is also cleared in case of failure, to
avoid carrying a dangling pointer upon partial failure. This is
particularly important since the presence of valid SFDP support is
checked using the following condition: `if (!nor->sfdp)`.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

This change is particularly useful for the next patches which generalize
the fact that SFDP parsing will be attempted on legacy chips not
manually advertizing dual/quad/octal capabilities. I don't think it is
relevant to backport it.
---
 drivers/mtd/spi-nor/sfdp.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 6a571d8d822c..cf0e2dc7c120 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1490,7 +1490,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 					psize, param_headers);
 		if (err < 0) {
 			dev_dbg(dev, "failed to read SFDP parameter headers\n");
-			goto exit;
+			goto free_param_headers;
 		}
 	}
 
@@ -1518,7 +1518,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	sfdp = devm_kzalloc(dev, sizeof(*sfdp), GFP_KERNEL);
 	if (!sfdp) {
 		err = -ENOMEM;
-		goto exit;
+		goto free_param_headers;
 	}
 
 	/*
@@ -1532,16 +1532,13 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 				    sizeof(*sfdp->dwords), GFP_KERNEL);
 	if (!sfdp->dwords) {
 		err = -ENOMEM;
-		devm_kfree(dev, sfdp);
-		goto exit;
+		goto free_sfdp;
 	}
 
 	err = spi_nor_read_sfdp(nor, 0, sfdp_size, sfdp->dwords);
 	if (err < 0) {
 		dev_dbg(dev, "failed to read SFDP data\n");
-		devm_kfree(dev, sfdp->dwords);
-		devm_kfree(dev, sfdp);
-		goto exit;
+		goto free_dwords;
 	}
 
 	nor->sfdp = sfdp;
@@ -1563,7 +1560,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	err = spi_nor_parse_bfpt(nor, bfpt_header);
 	if (err)
-		goto exit;
+		goto clear_sfdp_ptr;
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
@@ -1608,7 +1605,20 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	}
 
 	err = spi_nor_post_sfdp_fixups(nor);
-exit:
+	if (err)
+		goto clear_sfdp_ptr;
+
+	kfree(param_headers);
+
+	return 0;
+
+clear_sfdp_ptr:
+	nor->sfdp = NULL;
+free_dwords:
+	devm_kfree(dev, sfdp->dwords);
+free_sfdp:
+	devm_kfree(dev, sfdp);
+free_param_headers:
 	kfree(param_headers);
 	return err;
 }

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
