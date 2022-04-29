Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5512EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O/nZ+lh5nNAJpO178YwD22PaGBSiokfrfxg7CKdGKGQ=; b=uh0quPwaVHO76v
	SVT9W1z1GtJpzA8tcgTDSOmUn60JmYD+p+CGImBCUyAagC37XzpMUnh8rgoopiZfL8Ce/HjlFW3E/
	gwQFmr4ir38afN9c2Z7bSdWtsx+23ehpjl3qML+NnBh5hw6yNNuFit2U6j7t49f7W71ME2elAms/3
	fTOjrm6430eZjEsJHcKlJn4W4OefMEpuKCLWPfv8HQPvUW2Xem9Z90z8t2jUsK/KrhUO5G2Ez+U/s
	EIopoUvmKa3Co3yXFoHrPPzoIpMZ1cDM/Q6AcNBpPQOQPuO7crXEPdA9zrkKemh3o/mXFZNRkP+co
	UWwrXJolw9fACuWN5P4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkNpP-00AmbX-5G; Fri, 29 Apr 2022 10:26:23 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkNjd-00AjL3-Et
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 10:20:27 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 334AC22175;
 Fri, 29 Apr 2022 12:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651227622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=l+V24OcwdobkdB141ZISP+Wg/V3ea1y5pGdeD+L1PAo=;
 b=fP5aB2yKEL64hfkxO8SHzG4MsVoHyjFivkLCQjdr17mFouICf0I9aTdaYmQ4GsOAhib8Z6
 I3vKxVz9P3Pa3sYw8Wa3kz7f69K40B3H4iIaSO8SfNLQrQ2l7PZfrkPnvaD/zMoaLXxyWd
 Bh9KPgQRlkZ2CAGZce090tijdG1iGM0=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v3 1/2] mtd: spi-nor: export spi_nor_hwcaps_pp2cmd()
Date: Fri, 29 Apr 2022 12:20:17 +0200
Message-Id: <20220429102018.2361038-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_032025_730202_22EEA0BE 
X-CRM114-Status: UNSURE (   8.67  )
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

The function will also be used by the debugfs module.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
changes since v2:
 - none

changes since rfc (v1):
 - none

 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a31d7fd45eb8..6f61e97ecd75 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1850,7 +1850,7 @@ int spi_nor_hwcaps_read2cmd(u32 hwcaps)
 				  ARRAY_SIZE(hwcaps_read2cmd));
 }
 
-static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
+int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
 {
 	static const int hwcaps_pp2cmd[][2] = {
 		{ SNOR_HWCAPS_PP,		SNOR_CMD_PP },
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4788e628c335..007ea9896a06 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -662,6 +662,7 @@ int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region);
 int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region);
 
 int spi_nor_hwcaps_read2cmd(u32 hwcaps);
+int spi_nor_hwcaps_pp2cmd(u32 hwcaps);
 u8 spi_nor_convert_3to4_read(u8 opcode);
 void spi_nor_set_read_settings(struct spi_nor_read_command *read,
 			       u8 num_mode_clocks,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
