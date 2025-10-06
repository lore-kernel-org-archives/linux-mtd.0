Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CEFCCA471
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Oct 2025 22:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=el6Vb0IY1RdZegpWQqh4zARF31KxACx9VNjB+FjZ6Wg=; b=mTmpL6Snb1uVSy
	FhHfeuMPk5RXnFE3CctAcjsUZShTMXzmaKrLjotiKQ9YWVSCQoKj2+ZYjaZ/jhd+xXJ9budHlydeT
	ekJ9qg8JolVi6dMDqbQzqAAzHQLm7F2M6V9l3BFeUDHbhDwb0Q2EQFhcH+KfXiF8qvSDYHgFQe8vN
	bHU42wrQrdkgKbZMILmJiRj78A4G++kPqatutTPhp0+VLE4sV2zdOnaqEcPUQjW50E7y4pZmBoDmG
	J13RvcI12RqokKPXtuvi/rkje409Gtv6i72GJaL4muaTrQREZtcucJX1IS8N6P3Sb85u7o7ZmQaaL
	8drwe7kM2R/W7sBIzIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tmr-00000000vcu-28wZ;
	Mon, 06 Oct 2025 22:34:33 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tmo-00000000vcQ-2E6H
	for linux-mtd@lists.infradead.org;
	Mon, 06 Oct 2025 22:34:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759790064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vbof03f6Ib9YXQ4zrPTewbQTGhlgNiHtdjRceVw2hVQ=;
	b=qRWz16nj7iH2hsriDj3R0GccK7SV/iGasKinv1qnndYNugEjOCp0y/to4zW4qx0O5b5Hv2
	2E9gXIBF2x4U0X0hlRC9U/0oa8SfwxSmt+kXMUM+Bsbjman97LBjuG0veIZUoUbZTiiyYy
	yzSKIhyHCfdtyqhtqrLNAq777QT/U3k=
From: Sean Anderson <sean.anderson@linux.dev>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] mtd: spi-nor: Enable locking for n25q00a
Date: Mon,  6 Oct 2025 18:34:09 -0400
Message-Id: <20251006223409.3475001-1-sean.anderson@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_153430_982040_D4D98BA5 
X-CRM114-Status: UNSURE (   9.42  )
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

The datasheet for n25q00a shows that the status register has the same
layout as for n25q00, so use the same flags to enable locking support.
These flags should have been added back in commit 150ccc181588 ("mtd:
spi-nor: Enable locking for n25q128a11"), but they were removed by the
maintainer...

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---
Tested with a mt25qu01gbbb, which shares the same flash ID.

 drivers/mtd/spi-nor/micron-st.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 187239ccd549..17c7d6322508 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -486,6 +486,8 @@ static const struct flash_info st_nor_parts[] = {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
 		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
 		.fixups = &n25q00_fixups,
-- 
2.35.1.1320.gc452695387.dirty


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
