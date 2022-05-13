Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAC7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eg0yUeq7atw7efTiy7habRW1NdDHFoAkqAOeBAz/1hs=; b=fxcmzVurroDV12
	ozWNxECwZM5T5kwbJWZIU91IN8piFfbLATaOvIjHLZYFhHCR/R9a7r5gCM4EzjnRoL/3AuUURTx8f
	B885Pr+cfJcFLFw3NwTDBMdM1scHkGHImPbZJO7D00tE44dGYrOcOAlc/TifS+HPBfdCznzaL80Sm
	jvrqpr5PK4JPxDePYqf2TrUVXu+WQZVap5HWUjYuLA70C7EPhoqMpwwFcCfXuJh9hf6dcRjFNOy5K
	7Pg9pTlc+kyZ180Fe/4y66xJ8Dohf8/TOWsiL71t2yjsKQif/HIwumzCHL4CFrDVwasxZKBUnxfYU
	muf9GsGBlocHCcBry+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npVSM-00GIJA-JZ; Fri, 13 May 2022 13:35:46 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npVSD-00GIDB-W7
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 13:35:41 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2B11822248;
 Fri, 13 May 2022 15:35:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652448927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9a3C05i3H9s2knOEOFTZJX5xBjffmFcZg9b98Yc2nfA=;
 b=crrxnZQZKwp9DDY63NSh2FDstmTvQeAH7hOpYpu8dSdlKV4P6+gMSEyTgiTLWYPfZ6CHy6
 N/p+hBI9XxtwsZz1VVTK15O8CcBIckWxtq0xOov2/C6FYxzsjCU2wbGtIgqLplomaBVGld
 R69Mqc80A/4RwkBPyGm3uYMuwIrqjqM=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 0/6] mtd: spi-nor: generic flash driver
Date: Fri, 13 May 2022 15:35:14 +0200
Message-Id: <20220513133520.3945820-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_063538_247647_3E69DD40 
X-CRM114-Status: UNSURE (   8.87  )
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

Add a generic flash driver, which is used when we don't find a matching
flash in our database. All the basic features of a flash can be discovered
by SFDP and most (if not all) newer flashes support it.

Michael Walle (6):
  mtd: spi-nor: hide jedec_id sysfs attribute if not present
  mtd: spi-nor: sysfs: hide manufacturer if it is not set
  mtd: spi-nor: remember full JEDEC flash ID
  mtd: spi-nor: move function declaration out of sfdp.h
  mtd: spi-nor: add generic flash driver
  mtd: spi-nor: sysfs: print JEDEC ID for generic flash driver

 .../ABI/testing/sysfs-bus-spi-devices-spi-nor |  6 +++++
 drivers/mtd/spi-nor/core.c                    | 18 +++++++++++++
 drivers/mtd/spi-nor/core.h                    |  3 +++
 drivers/mtd/spi-nor/debugfs.c                 |  2 +-
 drivers/mtd/spi-nor/sfdp.c                    | 27 +++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.h                    |  2 --
 drivers/mtd/spi-nor/sysfs.c                   | 20 +++++++++++++-
 include/linux/mtd/spi-nor.h                   |  3 +++
 8 files changed, 77 insertions(+), 4 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
