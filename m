Return-Path: <SRS0=ENrU=G5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1C0C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 09:26:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C70A23109
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 09:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C70A23109
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dOLi5Q7payLkMB+vLg9MwLd1RIou0quAC92Sc834LXM=; b=zcuFqZMYeJ4dmci6UmYfu0+qec
	m1fQF569BlSbFY9UioUAXp8+4mjBw69YqECpOUvlHGVvt2pZbim7nP7aKEXqs2lr+zkDsGkyccGix
	SSmg2Aj2OprTOTBGT06Pz6ZDZTSO3hpeamrI4ulhEMBompRnc5nfJeH2mMgCTG0d7zAGexGHlje5d
	taRJOF7obpvH4z7yqiaLSl3pjXmHEJ5679qj8FvJr/q/DFxUxdjpBB9Klj1tPrRW5bjGAq+YPYGfK
	w9A3U9KviXSow+mvNCY8H0/5BfkLsS2rDyMozNYhTlZ8iu1YkgqK6R5ODQdeSNdAaFg6F5fWN/RqE
	RRSybcKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4KbK-0006SR-9g; Tue, 26 Jan 2021 09:25:30 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4KbG-0006Qc-Nj
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2021 09:25:28 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 6.5.2) with ESMTP id SG000732223.MSG 
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2021 10:25:20 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 Jan 2021 10:25:18 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 26 Jan 2021 10:25:18 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>, Jonathan
 Neuschaefer <j.neuschaefer@gmx.net>
Subject: [PATCH v1] mtd: spi-nor: core: fix/remove references to spi-nor.c
Date: Tue, 26 Jan 2021 10:25:16 +0100
Message-ID: <20210126092516.1431913-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F22.600FDFFF.0009, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_042527_382194_0486C58A 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: Flavio Suligoi <f.suligoi@asem.it>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The old file:

drivers/mtd/spi-nor/spi-nor.c

is not more present and now some of its code is
contained in:

drivers/mtd/spi-nor/core.c

This patch fix/remove the references to the old
spi-nor.c file.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 Documentation/driver-api/mtd/spi-nor.rst | 2 +-
 drivers/mtd/spi-nor/core.c               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 4a3adca417fd..bf2db371d3fb 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -61,7 +61,7 @@ Part III - How can drivers use the framework?
 
 The main API is spi_nor_scan(). Before you call the hook, a driver should
 initialize the necessary fields for spi_nor{}. Please see
-drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
+drivers/mtd/spi-nor/core.c for detail. Please also refer to spi-fsl-qspi.c
 when you want to write a new driver for a SPI NOR controller.
 Another API is spi_nor_restore(), this is used to restore the status of SPI
 flash chip such as addressing mode. Call it whenever detach the driver from
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 20df44b753da..6ae7d4c2d2b6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3701,8 +3701,8 @@ static void spi_nor_shutdown(struct spi_mem *spimem)
  * encourage new users to add support to the spi-nor library, and simply bind
  * against a generic string here (e.g., "jedec,spi-nor").
  *
- * Many flash names are kept here in this list (as well as in spi-nor.c) to
- * keep them available as module aliases for existing platforms.
+ * Many flash names are kept here in this list to keep them available
+ * as module aliases for existing platforms.
  */
 static const struct spi_device_id spi_nor_dev_ids[] = {
 	/*
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
