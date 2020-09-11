Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E80C2D0E1
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 14:48:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7639222E8
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 14:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OHNGmFsC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7639222E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qLqbmV52D/83WZEFnct7x+cPS05tqc7A0dpoPQtWnmo=; b=OHNGmFsCyXT3rypswK1a1RPKM
	JFbBcJk5DHjxKEbR4xmIF88dXpGKDtqXquSzFjh7Mx/1iupeF7zWtRNLHI6HFo5gMnfuJMkyRsvVV
	BM/aXLaewdoFzVJFXoVjeWBMDqj//AkrZO9ZYLGwIspZOe6W+3td+T/gL1YPCR/31wnTlUQuTtpWP
	/bA9Ezbep8EXqEQRookccP0JL7m1uO2ttRaAVsWYWXvhGs0OGG/EzEid0WzcF8nqj0DzMJ2AI2qyu
	asc9+0rcKQ14TrBrv/ETbe7jctN5LAwFKKhDe2n2kY+KBk6HqkOMZ6VTesEsKKYt5OXpyzhltoRZr
	cTfiKq9DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGkKp-0006KH-QU; Fri, 11 Sep 2020 14:47:31 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGkKe-0006Gy-CI
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 14:47:22 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kGkKU-0006Pu-NW; Fri, 11 Sep 2020 16:47:10 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kGkKP-0006nb-3N; Fri, 11 Sep 2020 16:47:05 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 boris.brezillon@collabora.com, michael@walle.cc, j.neuschaefer@gmx.net
Subject: [PATCH 1/3] mtd: spi-nor: sst: fix write support for SST_WRITE marked
 devices
Date: Fri, 11 Sep 2020 16:47:01 +0200
Message-Id: <20200911144703.25409-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911144703.25409-1-m.felsch@pengutronix.de>
References: <20200911144703.25409-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_104720_473941_8BB9B121 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The sst write support for devices using the special SST_WRITE routine
is broken since commit commit df5c21002cf4 ("mtd: spi-nor: use spi-mem
dirmap API") because the spi_nor_create_write_dirmap() function checks
SPINOR_OP_AAI_WP and sst_write_second. These checks are not valid during
probe. The check seems also to be broken since the "op->addr.nbytes = 0"
causes the devm_spi_mem_dirmap_create() function to return
PTR_ERR(-EINVAL) and the probe() function will fail.

It seems that the commit only copy'n'pasted the existing logic. Use the
correct SST_WRITE flag and return 0 to fix both issues.

Fixes: df5c21002cf4 ("mtd: spi-nor: use spi-mem dirmap API")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/mtd/spi-nor/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65eff4ce6ab1..31869ac245a8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3289,15 +3289,21 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 	};
 	struct spi_mem_op *op = &info.op_tmpl;
 
+	/*
+	 * Most SST SPI-NOR's have a special write routine.which should so
+	 * dirmap.wdesc is not supported for these.
+	 */
+	if (nor->info->flags & SST_WRITE) {
+		nor->dirmap.wdesc = NULL;
+		return 0;
+	}
+
 	/* get transfer protocols. */
 	op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
 	op->addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
 	op->dummy.buswidth = op->addr.buswidth;
 	op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
 
-	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
-		op->addr.nbytes = 0;
-
 	nor->dirmap.wdesc = devm_spi_mem_dirmap_create(nor->dev, nor->spimem,
 						       &info);
 	return PTR_ERR_OR_ZERO(nor->dirmap.wdesc);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
