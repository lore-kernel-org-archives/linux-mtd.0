Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60616CC6B1C
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/7yCxbK2z0UxOIFiyUHXg6eWHnGmRApq7soW5vTIYI=; b=gVuzrXhCNzLylZ
	EopJ+VtZqgMHXdGspGsQj/kDBNJ/ah+ZOkVlmFgE6QQcjjn2C+oQohncbTwGiBLIWGv2IrN4vdHWZ
	UtVUYO7KZxG9vRrb+J8GirEbXvAtnQYhcXcnEwHctnBF89PDbwZ9jFjdqamyguodWaZadKG6uwuae
	PEZul60roRXlmDqaIB0bM5+npWECoFMpTOBCJUQPpA9UVDYsKfItDXlb+vlPYdO6qUwq9U6JJbJmV
	Ur04Vs+Zb9Th85MLCCezAsltwRH+KvmOLcSTSVS8MW2HNKbux/oyaEFi6xUUpRDukGLa8CxtSVOW5
	BAR+uvYxTUkG2YGb9gQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSj-0000000DX4E-2KGp;
	Tue, 13 Oct 2026 16:34:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSZ-0000000DWzj-3DUW
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 94613C653F4;
	Tue, 13 Oct 2026 16:35:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0069560362;
	Tue, 13 Oct 2026 16:34:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F31611D7180C;
	Tue, 13 Oct 2026 18:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3rH+xtaEE72c/dMWl13TrWCqgtJCjAS6ZGNblkbLQAU=;
	b=FYAL9FtvXVAnibUXGPptNV1yQxRNmOeHHxs+yr3QPcKuL8/D5V4jHaRvmXzWUkAXPuR/+q
	TdVq/Sui6GUDp+kFtgpalF7WzJ9RLBj9dVK0e7sRu7eTZ/w2EFQUF5HuO/i2PCpj21Chol
	DSyJWKwVsBlkwZLPiAuGMsb61hcHUNE4QFw0ygfHxkT1RDAXms08DmsyZ11YUPq4bckGUd
	EUBlcyzwI4J2BjcJH8ZCG2Ub3OoXWSH6r+6HhBhsxiNRAUBcIny3we151xHf9HzKTMnDCW
	jmmgCN2tHoYBTb9RhNfSSRethozrh9V7DvBaU22f+woEbELBuYeGHIM0mNvOuw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:53 +0200
Subject: [PATCH v3 03/17] mtd: spi-nor: Fix spacing between arguments
MIME-Version: 1.0
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-3-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093441_991188_19EFEAE4 
X-CRM114-Status: UNSURE (   7.94  )
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

A spurious tab got inserted there.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9c61ff4b93c3..4b9e0410f2f5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -773,7 +773,7 @@ int spi_nor_read_sr_ll(struct spi_nor *nor, u8 opcode, u8 *sr,
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode,	const u8 *sr,
+static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 			       unsigned int len)
 {
 	int ret, i;

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
