Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD3DFD7070
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=em54FDtyWXZ3eUAIcBQJBMIxYC+DTK/XNp3cnG0VPSA=; b=viI5rYHhuOsNJ6
	9ucCC+OL+9V2eL18ZrMIpkCfJRCTHC2GPKaHljAiHXePDGNhLn9NkiXRaJ9qGQxC9wyNN45nQUpL3
	ulZmtCWlQW0LYa8VSd0TKMHmfdnLbOJ9X299hceLy3t36dm9Njm1/GXL9Dr1g+r4USNp51+zpMER8
	Fx6a0cHNepC3ub8JNt2pDP0AFPlC+8g3xPqkEnuWrfQ6NU2CxQzdMZnsP09FyxhW3+IYFZmsNKdSQ
	9x4gOZLkhfVN6ZZ5zq7lQsdhaqKwDi9lz0iYINFNgZfGoPYHP1AezlWyuiJsS6jQntsGmmwbW1vbS
	GMWqA+ShTbGjisigra5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RVs-00000005yOc-0fEy;
	Tue, 17 Mar 2026 10:19:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RVp-00000005yOG-0HxL
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 10:18:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5B1FC55055
	for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 10:19:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A8A095FC9A;
	Tue, 17 Mar 2026 10:18:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2620104503AE;
	Tue, 17 Mar 2026 11:18:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773742732; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=4431+403VgIMOFb1WnJXNwOIWwdeLzJGBbwjHIdj18M=;
	b=fkCP15LEhQo8MK56RIRXFqlDzhkbVTelzf1BlfscgR4iwwc5mdRvPbItLYg9/oUJF7it5a
	H8JeGJMpAdgida0koLDGy3aoxq1hRyJ0msVJ17Xap7ZutsO8ayh2+q/vVyj/wm2hcleW0D
	Uf4ZrFNso1jSQA6/BjmQqMH8H+fl/GdpDAj+CQfVqKd3o3f5OWrlJT0n9mTisQptEOnfJw
	OIboTUBBoHwV4VzXjrmn/RmzHz7DTut4kavbgBM5ZjH7KJKMihAxGLaHhWf9yp53HwIt/E
	mcWAVqpqHl/Ea/rn5h/BEaK5xr3mAje7IYC5eWSyPp2jfoml0Zjps61oW/WGgw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>
Subject: [PATCH v2] mtd: spi-nor: Fix RDCR controller capability core check
Date: Tue, 17 Mar 2026 11:18:42 +0100
Message-ID: <20260317101842.319656-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_031857_283929_CB36BCC5 
X-CRM114-Status: GOOD (  16.29  )
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

Commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support") adds a
controller check to make sure the core will not use CR reads on
controllers not supporting them. The approach is valid but the fix is
incorrect. Unfortunately, the author could not catch it, because the
expected behavior was met. The patch indeed drops the RDCR capability,
but it does it for all controllers!

The issue comes from the use of spi_nor_spimem_check_op() which is an
internal helper dedicated to check read/write operations only, despite
its generic name.

This helper looks for the biggest number of address bytes that can be
used for a page operation and tries 4 then 3. It then calls the usual
spi-mem helpers to do the checks. These will always fail because there
is now an inconsistency: the address cycles are forced to 4 (then 3)
bytes, but the bus width during the address cycles rightfully remains
0. There is a non-zero address length but a zero address bus width,
which is an invalid combination.

The correct check in this case is to directly call spi_mem_supports_op()
which doesn't messes up with the operation content.

Fixes: 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Acked-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
Changes in v2:
* Add precisions about how it fails.
* Collect tags.
* Mention reads/writes instead of page reads/page writes.
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8ffeb41c3e08..13201908a69f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2466,7 +2466,7 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
-		if (spi_nor_spimem_check_op(nor, &op))
+		if (!spi_mem_supports_op(nor->spimem, &op))
 			nor->flags |= SNOR_F_NO_READ_CR;
 	}
 }
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
