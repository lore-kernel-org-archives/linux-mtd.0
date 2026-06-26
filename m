Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF6CDE00B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2026 02:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaq8QBR2WlmhUFEYLetSC8+QIpACh6KiDOXKlFvM3vI=; b=n5gjyJA0kuqgmh
	xwZEOwhfe+D7K/OK6Jn2LmmyPEp2seSSn1Jakbmt2UgJ5h4d+mKYknif8tGvZUv4m/znQW3KzIXqW
	ceS8xnGDtpqdvz8oNkWFcdqeOfC4w7QAFW0afYRYoXPYs4gKkngxZEZtlz75wK6Bz+stjSEkbsDuz
	AUtGqfnYaN8e96uzEdLOu/8e2I+zAjUx4u4M0nvIKhqpzO33mdRU/oTJfefZ4RsIVbczG3Rerrbjn
	6Ba3dOuSOmNnFooJHa/Vn0CtzPSeEZL4A6bONTnmmUV67SHarqm3ogGxKRCXdgBnRoqdCTA+PqHsK
	rikerE/F6CrFIQFlv01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwCQ-0000000AGfl-07Yw;
	Fri, 26 Jun 2026 02:21:46 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwCM-0000000AGdC-1B0Y
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jun 2026 02:21:44 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 13CEB2C03C6;
	Fri, 26 Jun 2026 14:21:39 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782440499;
	bh=P8e1yuY8oUazDXtfsFlyrz241KNzd5xnidUuZPQIrus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NTPY66FtIESYD9Hh6WjWRttDIaq5abtl47r9IUsKuNcMXAaLwiO8X4uPjmydatwR8
	 otLSb/ISYHMRmHkeEASPdjz1ZWJv3CcJfEUedFOFT9L4bbvg/h62W6OvomEFZHtXsg
	 jW8xB5hqkNBNseVz8tXAF9lpT7HlcNxa/Wy1mAqvxol11dubpwMSn7ZSIOC/1GTvvU
	 wiApbM3KJX40bMfVrhSwy2vhxb3WPVp5CnqU7sumtiWs/5gPG5+9GpP7Y1girJaKDu
	 t7vrok6XcHC0ygj3tYlnwivPVC01SPnL/cnhdPNQZaYvKddF92keUSUOEcsxGE64iq
	 G/5FJeFN1jnXQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a3de2320000>; Fri, 26 Jun 2026 14:21:38 +1200
Received: from ronand-dl.ws.atlnz.lc (ronand-dl.ws.atlnz.lc [10.33.12.18])
	by pat.atlnz.lc (Postfix) with ESMTP id DA22F13ED95;
	Fri, 26 Jun 2026 14:21:38 +1200 (NZST)
Received: by ronand-dl.ws.atlnz.lc (Postfix, from userid 1930)
	id D8ABF4E2026; Fri, 26 Jun 2026 14:21:38 +1200 (NZST)
From: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	takahiro.kuwano@infineon.com
Cc: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v2 2/3] mtd: spi-nor: fujitsu: Convert to new flash_info format
Date: Fri, 26 Jun 2026 14:21:09 +1200
Message-ID: <20260626022108.1963271-4-ronan.dalton@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626022108.1963271-2-ronan.dalton@alliedtelesis.co.nz>
References: <20260626022108.1963271-2-ronan.dalton@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a3de232 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=FelO9ux0wxsA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=bUQKSiCPAAAA:8 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=_lpqCosG3ISib3apQjMA:9 a=3ZKOabzyN94A:10 a=1CNFftbPRP8L7MoqJWF3:22 a=-fHZXUhsFbuwFN3fwQAr:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_192142_485648_152D48D8 
X-CRM114-Status: GOOD (  12.44  )
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

The previous patch reverted a commit, and in doing so added a flash_info
table which still used the old format. flash_info tables are defined
differently now, so the code requires an amendment.

Fix up the fujitsu_nor_parts array to use the correct format. Also
remove the unnecessary "Fujitsu" comment and specify sector_size for
consistency with other flash_info tables.

Signed-off-by: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
Changes in v2:
- No changes

 drivers/mtd/spi-nor/fujitsu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
index 69cffc5c73ef..3777c80251c5 100644
--- a/drivers/mtd/spi-nor/fujitsu.c
+++ b/drivers/mtd/spi-nor/fujitsu.c
@@ -9,9 +9,13 @@
 #include "core.h"
 
 static const struct flash_info fujitsu_nor_parts[] = {
-	/* Fujitsu */
-	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1)
-		FLAGS(SPI_NOR_NO_ERASE) },
+	{
+		.id = SNOR_ID(0x04, 0x7f, 0x27),
+		.name = "mb85rs1mt",
+		.size = SZ_128K,
+		.sector_size = SZ_128K,
+		.flags = SPI_NOR_NO_ERASE,
+	}
 };
 
 const struct spi_nor_manufacturer spi_nor_fujitsu = {
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
