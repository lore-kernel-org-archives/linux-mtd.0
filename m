Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17DCCA5FE4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8l+Iv5OsQHh+MHzLDtRstEjERzLvA6AyJMz94nGrGS0=; b=dqnfmD5jekRbU4
	0dHZ6sPi+h7yaUKjzM80jW4jlQP1bSE2FU70khFdu/IIM0AQwqr3/qzC/Uc0T8hXpImxsP6HjGm/Z
	aniyV95mjO4LBoEl1aysOgP5y/schWfIGsvS42c2cj49R31QiCl084pggWyHIkZiZmgoUF1DgonJz
	wo7uP9nIPQqD1Maq0+lK2ywdZtzGTM04247qUyDv/1LX1wqiMMvBMp7QEpRqf29+cdfuIZ8x7oPvp
	IVk9qWkF/RxHou1AGOVHniSnCOIqkkGgaOD1surgp+8eJhodYqpa/y6ax3jbAofcubk+rRvkKGoTc
	CgPnUO/UIgo2kRDnjLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGo-0000000BYao-3pXW;
	Fri, 02 Oct 2026 12:21:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGm-0000000BYXh-1dxY
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:21:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E3B4D1A10E3;
	Fri,  2 Oct 2026 12:21:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7E3E603DC;
	Fri,  2 Oct 2026 12:21:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0462103281F4;
	Fri,  2 Oct 2026 14:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+2pH0Z17Ub41pMWE4R8R4Z0EeQ0P/zy8pfaxz32ykdg=;
	b=EwbizyCmlOqkJoU8IePStuE+wdUZCplb8VZbR9wj2UpE+Ny5J9onfyUWYA3CUnhopHCjrx
	2yxfzzb4C9H4D8XeGXaLK72U5vUyQXGNzCeXmhEcL/dUe++fo/r4HJQyoHPcRrlJk0zyom
	TtyCFC8JQSZ49ROX7JuJBb0lFkWPtl5b7tR4Hc2o2l9la8XRFymNe2sZxbSxPqoZgr9Egd
	+2FkS7ktdFIvxq9DY10mpvTUWpwMU4U+OtlrWyL34S606WQdQt7L9EGYAaiJZJJnsQFctr
	49DwPNTvdoMd4Az1L1FAHjqdwyVzgNFKWwNA9U5eG2vrzgy2NMtfPdcoDUCJjg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:19 +0200
Subject: [PATCH 06/15] mtd: spi-nor: Fix WRSR with ODTR chips
MIME-Version: 1.0
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-6-a22a2f95c26e@bootlin.com>
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
X-CRM114-CacheID: sfid-20261002_052144_579686_A9CBACA0 
X-CRM114-Status: UNSURE (   9.81  )
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

The ODTR interface requires an even number of bytes in each section of
the operation. spi_nor_spimem_setup_op() takes care of the opcode phase,
but we have to adapt the rest of the operation ourself.

Inspiration comes from the spi_nor_read_sr_ll() helper which faces a
similar case.

Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2bbec3feda39..6e22342361c3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -791,6 +791,17 @@ static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 	if (nor->spimem) {
 		struct spi_mem_op op = SPI_NOR_WRSR_OP(opcode,
 						       nor->bouncebuf, len);
+		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+			if (len != 1)
+				return -EOPNOTSUPP;
+
+			/*
+			 * We don't want to write only one byte in DTR mode. So,
+			 * duplicate the buffer and write 2.
+			 */
+			op.data.nbytes = 2;
+			nor->bouncebuf[1] = nor->bouncebuf[0];
+		}
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
