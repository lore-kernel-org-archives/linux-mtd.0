Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C96CA5FF0
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmedCQ+oay0JmsEJy8UneFXYBJllzYG7gMP540OiHUI=; b=ovFOVMlzunGwZc
	geyR8U7QAyrqic0fRxnAhsgVzYjDtRuELnVcEdijJq7h+KgY9AQyAkVkj4AtFoiP3Ol7+kuhweVij
	N7jBGMLr8tkGfIGBL6WFqWB3rXVIqxg/qGgMla5g+xGlWwz+RTFgFTBx1rpI4WXJ50hqsG6Xqvbxh
	G9211kW26tVB8BR/JYavUGbb8XWtx5pU6ZHYG9Y556PhWvkwzHo/Ad/XoPE7JFCFfa3fyQzQtjdiP
	bpjIN8P7MbGjg9S6aYFPKvd3LC8oaHhwdXKWYDTUb2x94YaETDOEFYsUo5stzXhMG1EK41UWmj5Dj
	6LoQr90lAJ7NNC/cmbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTo2-0000000FMZd-2HYF;
	Sun, 04 Oct 2026 21:31:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTnx-0000000FMYU-3Y4d
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:31:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8EC744E4116B;
	Sun,  4 Oct 2026 21:31:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B074604FE;
	Sun,  4 Oct 2026 21:31:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83DAB1032820F;
	Sun,  4 Oct 2026 23:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j/cXexyZ7T30AM1csq7xc9wIhMFboTJ8migmpErDMkQ=;
	b=cdZpn0Suk2175DuOpUoBj0L1farIc0btd1RLCRHK2nop2aFho0iPl5XKYxsytaGfgzGKhx
	6tHotkwk+f091GI1bsBf01EhqlG5riJUPtwUyXhZHpUDmJx4YV7gBHp4oElWqv+PMHQryB
	qP6gfES39Xa6Fm2Y4VoGCsMs8uY2arHG5T5raTKvA9sabAKJVDjWAj8+YKmKl4psfofmGi
	sjZ/wLatCBqm9rel7ltin6+dsEUmAhw2A+yNOSvOPAXCAmRe2tPesNqStFZvFUqvCqEo0r
	tP6ZrrOJIfkQDHjEhLI2V+tpDXnp+ouLvrXQt+8MTPUs4WSO7WzJ3GMKxz6nKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:16 +0200
Subject: [PATCH v2 02/17] mtd: spi-nor: swp: Fix SR2 initialization
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-2-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_143135_770810_5B647C48 
X-CRM114-Status: GOOD (  10.77  )
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

The purpose of the original change was to make sure the SR2 buffer was
returned initialized. One of the goals being to be able to compare
it. While iterating over the implementation of this function, I believe
the return -EINVAL that was initially there has been turned into a
return 0, which does not completely make sense since we already return 0
just below.

Just make sure SR2 is correctly initialized when returning from this
helper.

Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 7e667e4ca84d..6c56fda3913e 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -223,7 +223,7 @@ static int spi_nor_read_sr2_careful(struct spi_nor *nor, u8 *sr2)
 		 */
 		*sr2 = params->qe_mask[1];
 	} else {
-		return 0;
+		*sr2 = 0;
 	}
 
 	return 0;

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
