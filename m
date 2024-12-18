Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB865E77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EL0MMV6B9tQ20ZiYKST8PT+uY0NvkyV2FpRJxaHo66Q=; b=H1MfTi8bSRB32v
	mnR46taQcZ+cjXPnDLHuCbEoZQrfr3UpMUgpL7Z7qLtoNneTTSqukP09afxZMlW4VyBRwgUJVY8lI
	tjVxOKSWFciMpFvY3vGMl83ku3sxjYgaNi/WZgsU3R1H8lHsOcNXM1iKL+z+2wluk5JM1quGbGSAD
	25pyXVEOFSkCllMM78OEGWMeeErdIu1Ipc76lNG4UljviBHQyavQ1Lmeaye3Ei/nNXOI1EF8KfxVt
	37j1RDOjbBrCNE5J7KFZTT4P+YOtvF9S01AdwPUAUY7D362rLXeB2LyIjzTkepvidVdO0QlJUWaB7
	V0qRFB+mSlchb60GOkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNv2d-0000000Gqg6-0w5q;
	Wed, 18 Dec 2024 14:28:47 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNv2a-0000000GqeA-0p8r
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 14:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1734532099;
	bh=xGXEqMcNY90petukqfEUkHDoHfmEdAaDOfjTWMA7e8s=;
	h=From:To:Cc:Subject:Date;
	b=YfL5XQJKbp6FsHaSPSiF/2WDDeUGmd9JqLOpZnzswbeuszRaW142v1gmwiP24DdQo
	 URY8OfnWO05D1sCMlWXJjBuqI+Fdyc/Ws22lGBhh4iOgTC2EFLv2Y3QTjFXLO18N1k
	 cXgRBMWk6i8nDScKbOBWNazkUjcH8ebMhQFvTano=
Received: from localhost.localdomain ([171.223.167.88])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 7101288B; Wed, 18 Dec 2024 22:28:16 +0800
X-QQ-mid: xmsmtpt1734532096t8mlnzxzx
Message-ID: <tencent_1FA1D9D85AD8E448F1B5F349EB5B9230EC06@qq.com>
X-QQ-XMAILINFO: Ms5xyImz3IR/hvkDzhEvsZg1SlxToW/M4Up5m9g6y9d+NcP25gJuKqO6YkUo99
	 c6W9po7b783jHLppL3Bf5lt9NzDgOMU9mw6Ptp8rr722/InnQlZhkhnYTADqJ1jSOs2lO7OPHTpb
	 mgzUbOkFJfmEVPlAfq/MjAtdQsBodqGU204Lffdl1ur+xf6fhMGwBSwgYV+xtpJTFURxltOGLY1l
	 zRxO/cVBNcnnLKuGxWXncNqtd3xtU8c7fMGzvpf/bqbqulPXlHcIBW5ac4P0tsgzm/Fn0rp+doFX
	 AL4KaPIsBd9ItbWFKQIjwpN7HoFuoCCtBLH/jDZMv8fjgTHjdyx8rUOoR6n6ihNiJQz2g7qCBvHf
	 nnU3oWLEnx5uTgn8QuxBCTnY1svgDoS5jKHMLO+80SVhyaH3z+2Av2A5MYKmCJSP/QO9P0pT7X3o
	 U4Y38RI1ezqwPixqWcEDldvsBQ+TPLX4mMC1x21AxGGy3bRbOOPWCJSiy7vsYfDQrAO7+OV6L+1d
	 itG9+G5hoa0FH6GIXURcQsXQp7Xkc0fNcVCWf64qw85DFzLTb2C+hrfO+0DBfHtshpPTUTGdPDYC
	 CGB6l8GmpyNE7wQaS+4x9Ioo4Li+a5+Y9TGiYuVEOgD2JQ+ANF1gRC5EReuBfX3yUaGda00yetpy
	 1SzVP21pWg/kdyeFcQyU2HgGDS95PT/tVS7Yg+MZyDvznFek+OQprqx21XksiiKFdqkORimWczaj
	 stnyXp94DhicJuoNE4ur8aJ+T8fx7RvOXqgUeBl9bcl59FoqlgZrAlqgj+4q754W7QKWsKy31bv5
	 M6kAg/j1k0FIXvW12EPupVWVVdEoZ/2MAUM3s6fStRteO29L3BF3hAJa3/zePr3gw6/sLGXGEq/I
	 Aa7ae/MGMUdJ1QpfaP2B4iFWRjOW+y5KusSOSKg9y3pie0Oi/OcaW8ky/L86vLp7PdJ+EBjr1cLs
	 pdtLH3VnEruhMUKsuklUZf9xceivTi/mXWZMGZuT8uf4MTGJY9IQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Renjun Wang <renjunw0@foxmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH] mtd: spi-nor: gigadevice: add missing flash_info.size field for gd25q256.
Date: Wed, 18 Dec 2024 22:27:59 +0800
X-OQ-MSGID: <20241218142759.6721-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_062844_776136_01DEFF84 
X-CRM114-Status: UNSURE (   8.30  )
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

The flash_info.size field be used in spi_nor_init_default_params()
which assigned to spi_nor_flash_parameter.size as default value.

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70..e234fd2b7e63 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -61,6 +61,7 @@ static const struct flash_info gigadevice_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
+		.size = SZ_32M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
 		.fixups = &gd25q256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
