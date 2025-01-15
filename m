Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4A2C02183
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yraBlesSht/tuG65Sy6Y30gTzZrAbOsGYSBNH7ZOqgA=; b=jovZ9zJkWA+a4m
	fbTMlRieShkvDI+oTJ4o/B8cUic4cZmbcPcTvS4arp+baT6hWhaygcBd6r7vlusa/viFuCvarGhlm
	OQq7vNv21do4o512W8+WMD0C9j2Y/4uc0fqBWX2Q+WUjKbCcVV+ycKCYMKL6jxWMQqFO2PWXyZsfi
	rtrtfACDICCViKqnwzur/rDr8/lUQLZIbgWJQsTps5J/RhWzRo3L0M96AwbEiQf8Cgu7faDRw8qUY
	f2oA3u8GXTmVFOJGAdt/7THPfs1m9QnW8fcofivdKHCscO9Zz9hxPh3+mL+HOsJIZr/fUbAAzr8Wp
	i4eNhpl3/aRUaUHi1Hrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0St-0000000BSPl-2ho6;
	Wed, 15 Jan 2025 10:17:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0Sr-0000000BSOu-2Xkj
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 10:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5F31A41B18;
	Wed, 15 Jan 2025 10:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA206C4CEDF;
	Wed, 15 Jan 2025 10:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736936252;
	bh=S08ExAXa20SGQ/rudOb5j8oKW2KeqlRexrLWwGdLH1w=;
	h=From:To:Cc:Subject:Date:From;
	b=lJ+tLSBtcpbIIhom1mBZ9KrtmZjRZYllZc8UPr26wEHc3rKviGLeuqk9DD3WpLDEd
	 yimET+xWgCDf3jFs8hPZ6cN21RYB9NaVM9U5KESQ35x78j7lCn4dYY38ra6GQFjHsf
	 K4qWM9fxN8toCP14MShR8yP/VU9vjgdeMiUrllb+/ja0dPx/gj1CrIzHm0jCsysNgt
	 uJht+S9X8C0Dtk0teQoqU5zWYo8kwn6BfaL9SWACFTOJtsDaOlnG/WsgAIZADIBISG
	 TuKhA5mgBQdDLByDjY6u8U5Wf7EuThkV5DSFkkpiphk5olUrDHqS/EsiJ55Ia1Epq2
	 wk8UFoRAoIl8Q==
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
Subject: [PATCH] Revert "mtd: spi-nor: core: replace dummy buswidth from addr to data"
Date: Wed, 15 Jan 2025 10:16:52 +0000
Message-ID: <20250115101659.55882-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_021733_856685_0750A696 
X-CRM114-Status: GOOD (  20.76  )
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

This reverts commit 98d1fb94ce75f39febd456d6d3cbbe58b6678795. The commit
uses data nbits instead of addr nbits for dummy phase. This causes a
regression for all boards where spi-tx-bus-width is smaller than
spi-rx-bus-width. It is a common pattern for boards to have
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

Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/linux-mtd/3342163.44csPzL39Z@steina-w/
Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---

I have only compile-tested this patch. Alexander, if you can send your Tested-by
it would be great!

Miquel, since the bug was introduced in v6.13-rc1, I want to have this patch go
in v6.13. So you would have to send Linus a pull request before he likely
releases it this Sunday. How do you want to take the patch? Do you want to apply
it directly to mtd/fixes or should I send out a pull request from a
spi-nor/fixes branch?

 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 66949d9f0cc5a..b6f374ded390a 100644
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
