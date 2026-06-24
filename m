Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F308CDE001
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2026 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84dw/nc6krvxzEo/rHPthTQOJx18CWZ/SiQDvKCMAoA=; b=VczU5iRCaal7ke
	syszyy0zTxnQRki1Tty4dpuYMpTZBJ8g4mc+7eEmgeOeZSbB7CxbYGQsKRL160jjvvOfxmiKZTbkR
	GsKTogADgMO//51ZnZQ/Fl8BWIPN9D752MmloM2bzL/bi1dywktclO62pD8xFckN+A2Xe7OpMDVjJ
	uAnQumaTB3khOY7mZ0TnJ4CzJMqNK1iIF9f2tUiH6fLq9EIOiV4Ek9VexzVFP2zuKBrt7GC3xDLUa
	+rHwexLRAwoBKlTbTBUJgbusbBpolD6KpWFGpvqhSHEsI7ZoRcgcHY55nGawT6lxB2bY/oMPKALKX
	6o4WVKDXYHQeO/NhYW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHvm-00000007IjK-0Y3m;
	Wed, 24 Jun 2026 07:21:54 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHvg-00000007IYa-3kcA
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jun 2026 07:21:51 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9C63A2C06DB;
	Wed, 24 Jun 2026 19:21:39 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782285699;
	bh=asKY6VNYW3LIBgx/CjOCZ8ye4EZb5PzwlkugqA0sNEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OUm1TxxA/SI/XxW+DjtgRF9ChOx40d3GYU6EljvPCDHXj48IV8tViPD1ESnmcH25O
	 xDDEUj+t2JBB/rU0FQt3pInHeFeMJ90DkjtZeLyG80NfvWv8qdBimymDqTgmreYZyZ
	 9RSRJlhTEXqCUQoMzU6D/NRdjIYc3uWyfCAx8XNhjRcpYwR94SqqQOLcNDzdCjFRiM
	 4oIl/Yc7fra7NHyXns96TkC6nHhTPXzHa+X2oPMqm0ZOrZDqMn+igoRPjp8mOXVajI
	 SyyUwxHNuBT/mOGm1W/7B3eDn2t7uFwFQ6mEdmX0dcxbaDq0sZhGdC2lEC6Ep378Fe
	 E0ineKtASqA1g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a3b85830000>; Wed, 24 Jun 2026 19:21:39 +1200
Received: from ronand-dl.ws.atlnz.lc (ronand-dl.ws.atlnz.lc [10.33.12.18])
	by pat.atlnz.lc (Postfix) with ESMTP id 6DDCC13EDE9;
	Wed, 24 Jun 2026 19:21:39 +1200 (NZST)
Received: by ronand-dl.ws.atlnz.lc (Postfix, from userid 1930)
	id 6AE574E10ED; Wed, 24 Jun 2026 19:21:39 +1200 (NZST)
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
Subject: [PATCH 2/3] mtd: spi-nor: fujitsu: Convert to new flash_info format
Date: Wed, 24 Jun 2026 19:21:05 +1200
Message-ID: <20260624072104.1123580-4-ronan.dalton@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624072104.1123580-2-ronan.dalton@alliedtelesis.co.nz>
References: <20260624072104.1123580-2-ronan.dalton@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a3b8583 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=FelO9ux0wxsA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=bUQKSiCPAAAA:8 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=_lpqCosG3ISib3apQjMA:9 a=3ZKOabzyN94A:10 a=1CNFftbPRP8L7MoqJWF3:22 a=-fHZXUhsFbuwFN3fwQAr:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_002149_093818_8671014B 
X-CRM114-Status: GOOD (  12.70  )
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
