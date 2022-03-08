Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C133C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Mar 2022 09:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ypC7ftTg+rOpjwWPncy99LrGEew96EAjIGXh+Rujte8=; b=YIgjEL87GCAG6C
	inI98Gy2Np2J++z0v+XAKcBIpS5tNeFldEsc4NjNGxLZI6Osi+NsHS7WHvxwJ05b1A6dWKWQPvUWa
	s0SnVLlQYXakcbUSnKRHmYWWyYUrMx2hgkLqV118IgyULsrW87JIXpACA/FXuRdRU3aT0KW7LCHDa
	DKMijjaCKIpC4ifkmnZWkonTvq3M8dIZEW02YrgxbzZE81CVkMVQUwGdlPltk3JBda3U0UkgpthZt
	HeFP9DfcqYEse3kzoVwSfjHai9shWJohBEAqvCUxYd2Cz8+6Vxo+lrgmSOa2/sGPNNZlwkdqSEA5o
	Kb8roBdIUeFm4HFzWuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVsg-003Qiy-Gw; Tue, 08 Mar 2022 09:11:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVsc-003Qhj-71
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2022 09:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646730701; x=1678266701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dt5nXBEH13ocfQEG1E2enePW6gJAUmwutTqF7/GLjFA=;
 b=l1NWCPMs4oeVSmDZ5TLv8I5DuGnLcnTvYmpRZDm4ig8BUbtOUney4VBL
 71/QjoPCH3M+zxkr5pupZZyMUk+cwmeXBbit1RKZuxm0eCHODpc4So2er
 AvT+Nz7K4ftsTYMTkXpjudACgVhTsnb6fZZmUAcDa+SddIfjJkHxpz8vm
 WfJS6CbhcmiWEl72gDEnwpLMAbeg+SlFkTRaAw2nv4H8R6H+ADnlXV12X
 SJO9OfUI6jTYVARu08+F7us//9RX6Tj/Am6qExu4Z0u4CNbQK4KBqDp1Y
 Moogt4esGmxl7W5vaeuH+irrj3v4piHqlxRCRKY+ZM2ixmevzPy7FvmgW Q==;
X-IronPort-AV: E=Sophos;i="5.90,164,1643698800"; d="scan'208";a="164903324"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Mar 2022 02:11:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 8 Mar 2022 02:11:39 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 8 Mar 2022 02:11:37 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] mtd: spi-nor: core: Skip setting erase types when
 SPI_NOR_NO_ERASE is set
Date: Tue, 8 Mar 2022 11:11:35 +0200
Message-ID: <20220308091135.88615-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_011142_311667_6CFFA943 
X-CRM114-Status: UNSURE (   8.78  )
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

Even if SPI_NOR_NO_ERASE was specified at flash declaration, the erase
type of size nor->info->sector_size was incorrectly set as supported.
Don't set erase types when SPI_NOR_NO_ERASE is set.

Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: stable@vger.kernel.org
---
v2:
- add comment, update commit message, split change in individual commit
- add fixes tag and cc to stable.

 drivers/mtd/spi-nor/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b4f141ad9c9c..64cf7b9df621 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2392,6 +2392,10 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 					SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
 	}
 
+	/* Skip setting erase types when SPI_NOR_NO_ERASE is set. */
+	if (nor->info->flags & SPI_NOR_NO_ERASE)
+		return;
+
 	/*
 	 * Sector Erase settings. Sort Erase Types in ascending order, with the
 	 * smallest erase size starting at BIT(0).
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
