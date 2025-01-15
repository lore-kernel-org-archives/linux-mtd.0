Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D7EC02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YOYOZh7tNfUDOhdjimKbZFY5q8qGeZPlLuAU4oRPpLk=; b=cXzjRybyv2P84k
	8wCgISGprdR5YNN+L0K2ILPoCJE0HAADy22LI2eCJNXgGWCo3FtbU16GBwGX7sXB/AK4DvVbzq1sa
	61lo+g5Ok7xmY7JVwOx0lBaFX5h6TGqhiJiWwLytVMttGgpiJgNseYPKfUtgSZkrrMd3GJ2DdkSUT
	gM8QJeh5I3ybFfSGSbIKoRnE187u4NrDNN9tQTMRn9zr1bQkdszv8y4ln7BFIS4VxFdmXTUMgW3Lc
	dZdfMbOE/0mNAvk7vu7v4761taB2cI3MWfyi5xL1NLRTccrut189hR+y4GYySdEpl4V/6m+hdNaI+
	dGbuQbSOyqAYxc8ao5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3f7-0000000C1Ep-0NZA;
	Wed, 15 Jan 2025 13:42:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3f4-0000000C1Cs-2WN4
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 13:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6FA2A418B4;
	Wed, 15 Jan 2025 13:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC458C4CEDF;
	Wed, 15 Jan 2025 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736948541;
	bh=T92rSxsCbibHVE1GcYfXql/KUtyqXXsf7RSMuXZZBzw=;
	h=From:To:Cc:Subject:Date:From;
	b=MNiNa8PStD5CQJFcaCV+mqG09tEWjMDHZd7VEwp7itG2WL1W77aGTQUpnx1cl7/z6
	 pWo0wkYQM+KK6szy/dKuyUSFLoaqR80DrCbkKljrIQWlJpchNVqdsKSZqb5UJ1uzAu
	 E9PwR71m5AITkjyaLWeK/fI1wa+KOREBqjtFtaqNQ/GjQn0z5b0yRRWI6ByEZeCH+Z
	 eJ07ker5b924/Zgqvp+RL2adzz89YiKNzIchkD3m4C/Slm0OEB9kWRd3KeJ7KdoN67
	 oiyrEdIZFzJQnNamrLJ0RLOpIIEUQ8di2Er86euuXu9qgdnX/gcmQh2ZIp9+yZwDS9
	 mefl3Gukxbu+g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Cheng Ming Lin <linchengming884@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2] Revert "mtd: spi-nor: core: replace dummy buswidth from addr to data"
Date: Wed, 15 Jan 2025 13:41:56 +0000
Message-ID: <20250115134158.19908-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_054222_771333_CB12C8C2 
X-CRM114-Status: GOOD (  17.76  )
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

This reverts commit 98d1fb94ce75f39febd456d6d3cbbe58b6678795.

The commit uses data nbits instead of addr nbits for dummy phase. This
causes a regression for all boards where spi-tx-bus-width is smaller
than spi-rx-bus-width. It is a common pattern for boards to have
spi-tx-bus-width == 1 and spi-rx-bus-width > 1. The regression causes
all reads with a dummy phase to become unavailable for such boards,
leading to a usually slower 0-dummy-cycle read being selected.

Most controllers' supports_op hooks call spi_mem_default_supports_op().
In spi_mem_default_supports_op(), spi_mem_check_buswidth() is called to
check if the buswidths for the op can actually be supported by the
board's wiring. This wiring information comes from (among other things)
the spi-{tx,rx}-bus-width DT properties. Based on these properties,
SPI_TX_* or SPI_RX_* flags are set by of_spi_parse_dt().
spi_mem_check_buswidth() then uses these flags to make the decision
whether an op can be supported by the board's wiring (in a way,
indirectly checking against spi-{rx,tx}-bus-width).

Now the tricky bit here is that spi_mem_check_buswidth() does:

	if (op->dummy.nbytes &&
	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
		return false;

The true argument to spi_check_buswidth_req() means the op is treated as
a TX op. For a board that has say 1-bit TX and 4-bit RX, a 4-bit dummy
TX is considered as unsupported, and the op gets rejected.

The commit being reverted uses the data buswidth for dummy buswidth. So
for reads, the RX buswidth gets used for the dummy phase, uncovering
this issue. In reality, a dummy phase is neither RX nor TX. As the name
suggests, these are just dummy cycles that send or receive no data, and
thus don't really need to have any buswidth at all.

Ideally, dummy phases should not be checked against the board's wiring
capabilities at all, and should only be sanity-checked for having a sane
buswidth value. Since we are now at rc7 and such a change might
introduce many unexpected bugs, revert the commit for now. It can be
sent out later along with the spi_mem_check_buswidth() fix.

Fixes: 98d1fb94ce75 ("mtd: spi-nor: core: replace dummy buswidth from addr to data")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/linux-mtd/3342163.44csPzL39Z@steina-w/
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---

Changes in v2:
- Add R-by from Tudor and T-by from Alexander.
- Make "This reverts commit..." its own paragraph
- Add fixes tag.

 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 66949d9f0cc5..b6f374ded390 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);

 	if (op->dummy.nbytes)
-		op->dummy.buswidth = spi_nor_get_protocol_data_nbits(proto);
+		op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);

 	if (op->data.nbytes)
 		op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
--
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
