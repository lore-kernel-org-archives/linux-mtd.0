Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5791BFD4F08
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YyiyDE9ACkDr1ajxYW6IPWkQDzVvTMZ43Aw/yDLlYUY=; b=dlafWwNvW5S+1+
	HrnshdRUPhXVL4oLD+ylfUILiQW+uhcREGeFOO5f2iNaKahvAr3xOvBovmVMPjuZT1obySFIUriKD
	DUCFUwj2lYKgtA8iiUoTXKv6HDC3Ci31oMljVFs1XHrRz/ZIBkDwQBEP0tsa/Vo0vLjpICAFwU9Hu
	RA3rWi+OZDeijcmrMPPKndpsDZwTA4ddCXUAW9OqxQ/IeREozuDB+Ey+295/0IQWj/i6ERecgReVR
	ybRgEAdWinvVygIQld/vHlw2TsyMHvRMU0bBVBg4Izp/rJldsACTRUNCvFDhypUT6gpU4cPLmMH29
	xoeW1dUvfo9+j8fsMX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00h7-00000009xW7-3unz;
	Tue, 10 Mar 2026 17:16:33 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00h4-00000009xVB-27dh
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 17:16:32 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1773162984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YN9NqA2BdcEm2/4Kq3U8fwrpU71hC9cRhN8LE4Av7CM=;
	b=jPFQbXvURFqgN14i6nwVPxl0suSxd7mbCuRxCnx5ZupezKQcOprLAjCLx/O1QNbJi0M6ui
	LPegkccitFg8w40D2oqwH0PhHhGIGaqfB9LmGDYA3iOk7zeUKilw1XHjQTt/8xdGG7PwKL
	f4QtZnpxNLiQ8dw8voEF1CRAFCInTpP+ep8bQ5H8aV8Bqv3iNwa0FxdwhfW+UYta5GE+s4
	qQSulJn5HF4jLGxCzwQMJMonCWQj8j63+m5lgcO37hgf+aXwyOQVf7kJ/+Dm/8FeRbpA+6
	X9KIvd8TmiWuE1ahrmgX5OJcujlUG2uX1O14wDS6QMweS6eKCeCzE3CFTz39nQ==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Dhruva Gole <d-gole@ti.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH 6.1.y] mtd: spinand: macronix: use scratch buffer for DMA operation
Date: Tue, 10 Mar 2026 18:15:44 +0100
Message-ID: <20260310171544.1568499-1-frieder@fris.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_101631_081708_AF9FD46C 
X-CRM114-Status: GOOD (  13.27  )
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

From: Daniel Golle <daniel@makrotopia.org>

[ Upstream commit ebed787a0becb9354f0a23620a5130cccd6c730c ]

The mx35lf1ge4ab_get_eccsr() function uses an SPI DMA operation to
read the eccsr, hence the buffer should not be on stack. Since commit
380583227c0c7f ("spi: spi-mem: Add extra sanity checks on the op param")
the kernel emmits a warning and blocks such operations.

Use the scratch buffer to get eccsr instead of trying to directly read
into a stack-allocated variable.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/Y8i85zM0u4XdM46z@makrotopia.org
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
This backport fixes the following error in 6.1:

[  102.320032] WARNING: CPU: 0 PID: 537 at drivers/spi/spi-mem.c:216 spi_mem_check_op+0x15c/0x168
[  102.328775] Modules linked in: bluetooth rfkill ipv6 snd_soc_fsl_asrc
[  102.335289] CPU: 0 PID: 537 Comm: nandtest Not tainted 6.1.158-ktn #1
[  102.341745] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[  102.347943]  unwind_backtrace from show_stack+0x10/0x14
[  102.353203]  show_stack from dump_stack_lvl+0x24/0x2c
[  102.358280]  dump_stack_lvl from __warn+0x74/0x120
[  102.363092]  __warn from warn_slowpath_fmt+0x178/0x188
[  102.368250]  warn_slowpath_fmt from spi_mem_check_op+0x15c/0x168
[  102.374286]  spi_mem_check_op from spi_mem_exec_op+0x3c/0x3e0
[  102.380063]  spi_mem_exec_op from mx35lf1ge4ab_ecc_get_status+0x9c/0xf8
[  102.386712]  mx35lf1ge4ab_ecc_get_status from spinand_ondie_ecc_finish_io_req+0x38/0x9c
[  102.394748]  spinand_ondie_ecc_finish_io_req from spinand_mtd_read+0x184/0x350
[  102.401998]  spinand_mtd_read from mtd_read_oob+0x98/0x160
[  102.407517]  mtd_read_oob from mtd_read+0x5c/0x80
[  102.412247]  mtd_read from mtdchar_read+0x108/0x2bc
[  102.417158]  mtdchar_read from vfs_read+0x98/0x24c
[  102.421977]  vfs_read from sys_pread64+0x8c/0xb8
[  102.426613]  sys_pread64 from ret_fast_syscall+0x0/0x54
[  102.431858] Exception stack(0xe0ce1fa8 to 0xe0ce1ff0)
[  102.436922] 1fa0:                   00200000 00000000 00000003 b6e1f008 00040000 00000000
[  102.445110] 1fc0: 00200000 00000000 00000001 000000b4 b6ff3220 b6e1f008 b6e1f008 b6ddf008
[  102.453294] 1fe0: 000000b4 be925b38 b6f3d611 b6ec1b26
[  102.458414] ---[ end trace 0000000000000000 ]---
---
 drivers/mtd/nand/spi/macronix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index dce835132a1e2..722a9738ba370 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -83,9 +83,10 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 		 * in order to avoid forcing the wear-leveling layer to move
 		 * data around if it's not necessary.
 		 */
-		if (mx35lf1ge4ab_get_eccsr(spinand, &eccsr))
+		if (mx35lf1ge4ab_get_eccsr(spinand, spinand->scratchbuf))
 			return nanddev_get_ecc_conf(nand)->strength;
 
+		eccsr = *spinand->scratchbuf;
 		if (WARN_ON(eccsr > nanddev_get_ecc_conf(nand)->strength ||
 			    !eccsr))
 			return nanddev_get_ecc_conf(nand)->strength;
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
