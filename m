Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11A1CA5FDD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/7yCxbK2z0UxOIFiyUHXg6eWHnGmRApq7soW5vTIYI=; b=TVp3y+RYYdvNye
	ILg4taCMLCecdR5f6B1LvYFJdGjUHyLjMz8GZphvgntr7TQzlGVJ7BVT2Ry1fDuLGrtccMVCHa2f+
	ZJJN/ejiEP50BZJ5hgzH8TnkgBtUul2QoPHhpCEaDWX47e+6foyFZWJjVhmU/cTlqUXuLa3+dVL60
	HKBvbiBY/o94/tJKTnoZ4bqYwADc4UyGZntkiic8Dw7VPMV1zuxoyS0UHx53Lx6wG946s1Q7h/j3Z
	fgcIBITGYtS9j7vXVRfUXV0MAlFRREBLEy0bK0b1sI0CNPIuDkERhWi9q0d6iAasjKjPAQ1/2kMU5
	URWoaZnHH39bb30sB+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGi-0000000BYWh-1v5P;
	Fri, 02 Oct 2026 12:21:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGf-0000000BYVF-2e5M
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:21:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 198F04E41110;
	Fri,  2 Oct 2026 12:21:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1E6C603DC;
	Fri,  2 Oct 2026 12:21:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F70B103281D0;
	Fri,  2 Oct 2026 14:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3rH+xtaEE72c/dMWl13TrWCqgtJCjAS6ZGNblkbLQAU=;
	b=xeyxf4iXt3nbfBRYOCbX/iRVRaF/v7G6Bxr2i5BWBr3kzeJ5/Ung5uhGWmtg8PWpKr8DHF
	T6t146fG/nQJTpQrzNJ4BdNhf0UGZNSFhxsA90ipGhzewvBBGk5FbGhoW9nKDaP6vc71W6
	8M0FECULZp+y7+eTYeORGeZXFId/U6d987BHFIY7d6OjnJitcBz/9ZydkA4b1uy/wnAx97
	3CzIog4kf5JYQ+LU4bUEVspjPoobIXie2g4EmaAJ7DBBRjQGIHbmFs9qRWuMKLlntLhJmb
	UJVFX4pWgOY+sJDEsVc3qHYug4iFR8SvK55dZ4sm7BP3pH8t4cMSJIR5LZHwYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:15 +0200
Subject: [PATCH 02/15] mtd: spi-nor: Fix spacing between arguments
MIME-Version: 1.0
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-2-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_052137_838428_6E273E20 
X-CRM114-Status: UNSURE (   8.02  )
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
