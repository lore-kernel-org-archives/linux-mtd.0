Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8388ED26D7C
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xtSdkI7xrH7Hwx8KJe/z3NsspG+Qsjy7cIZaMdwv9U=; b=nUtGct0TFyVcZH
	LqCyxArkqbrhtzYYYsVMhCkUe1R25a0rHw5HsARaEg14mPzETRz+b3AXJA2d341bDLOjEDBntMdJR
	Yf1ds0qAUekI5TlM8he4wstwm5nWyz4HxeKOqlSafM9NF9jb4/CNT56xlF+jlhhwwzUJZvZCpe7wL
	Rrti/p/B+fPMUfgHqfYLMJwFsAltqQTgTYy+mLOHzCPlmEvr+1ZtftTXASe7EjynP1buapYqmLsqg
	60uDLbAVdjEFEN+W6Xjj5zhsPcnnYXy5NfyavKUaJBfRbJKtOODAjLWELSwfvVsfRdg3iUf9G8Qoy
	xsFjaOa26InbFUJ2z+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG87-00000002lsc-14aG;
	Fri, 09 Jan 2026 17:18:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG85-00000002lq0-0nDP
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB59F4E4202D;
	Fri,  9 Jan 2026 17:18:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90AD6606C6;
	Fri,  9 Jan 2026 17:18:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 057F3103C89AF;
	Fri,  9 Jan 2026 18:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3fZHdLVT5PZs+GglC5vvX4FQ5Jnb/RN7FPEdbUSBxJw=;
	b=AtRg/7QQnelwa/V+wRQj9SopmraxNZaszEiPYvTqD0ygrJbZIRiwAKsy0r1oAlVclVD/Zd
	JR/rvSvqZqs1z0V6bRAmcaRmtxK5HTTkVerx0k2RPzZiJS2CcGgKfvs0qVgjZTWXPdZIRx
	3yNs5R9mxhK0yPr8iN4Tz7bq35nlGDA4mJUavhfaA3DukYRK87SU2m1wHa2cvMyVPMNzzU
	EMF9N2u9r3kgO+oShf1AVdrxa+jb8t9ChmCaAJwVybEg65DoOnpVARVjNcxRfVLXLV83R8
	xUH95GqE3dkTDkcHDy2opfdu6BB+jxeIJzyAvVY/D0IiA1tvEfDGEttU3ohOJw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:05 +0100
Subject: [PATCH v2 07/27] mtd: spinand: Use standard return values
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-7-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091829_366657_8D3F13AF 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

Replace -ENOTSUPP with -EOPNOTSUPP which is as relevant in this case but
is standard.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8acea0372f21..3abc56e4d23f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1419,28 +1419,28 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
 		if (!op)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		spinand->op_templates.read_cache = op;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.write_cache);
 		if (!op)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		spinand->op_templates.write_cache = op;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.update_cache);
 		if (!op)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		spinand->op_templates.update_cache = op;
 
 		return 0;
 	}
 
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static int spinand_detect(struct spinand_device *spinand)

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
