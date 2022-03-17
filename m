Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC10C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xlB9clFNwU6vzxS4Djk2HgjAhWBayZzca3g8FLaCEpc=; b=nHRZi+TN3hnlbR
	AEkfil0AS/aOYUJ6iY7LzLBXOwbh54C1uftsuyVUKTVOjYrALjXJy8G7D+U9XXie3z4f+WEynNVDl
	iwUGTOqk/IIUBr54LNb5jJTR01s+ncOc8grIeXinBnd80tHKHzAPng+FuQxoD6T3O5v0uC06Y+DeL
	aCq2OrSBRKtGmx9pnHMpVNbhHt+pL9DnEckZjI9Xdu5QWLq2Fb9oqMQZXU7elD362tdC27LCe/Q04
	xd+515ZDzfu2OBG/cG88RLhBQf/uuw6GlmRDl2QsR/iRkowOf7TS9UbE0PpQ5h5FmKNGNRjMJmYAY
	X9SXZsv15XxMVALeE4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUnSL-00FjcJ-7U; Thu, 17 Mar 2022 10:34:09 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUnSF-00FjZa-Uy
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 10:34:07 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f500:58f9:d953:424b])
 by michel.telenet-ops.be with bizsmtp
 id 7NZw2700P0M4NNo06NZwKe; Thu, 17 Mar 2022 11:33:58 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUnS7-004wS8-P1; Thu, 17 Mar 2022 11:33:55 +0100
Received: from geert by rox with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUnS7-005Bf1-9H; Thu, 17 Mar 2022 11:33:55 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dung Nguyen <dung.nguyen.zy@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] memory: renesas-rpc-if: Fix HF/OSPI data transfer in
 Manual mode
Date: Thu, 17 Mar 2022 11:33:52 +0100
Message-Id: <b409ea3fae4a6778fd6b44815ad17c9e8e10df87.1647512831.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_033404_189960_3887845C 
X-CRM114-Status: GOOD (  15.89  )
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

HyperFlash devices fail to probe:

    rpc-if-hyperflash rpc-if-hyperflash: probing of hyperbus device failed

In HyperFLASH or Octal-SPI Flash mode, the Transfer Data Enable bits
(SPIDE) in the Manual Mode Enable Setting Register (SMENR) are derived
from half of the transfer size, cfr. the rpcif_bits_set() helper
function.  However, rpcif_reg_{read,write}() does not take the bus size
into account, and does not double all Manual Mode Data Register access
sizes when communicating with a HyperFLASH or Octal-SPI Flash device.

Fix this, and avoid the back-and-forth conversion between transfer size
and Transfer Data Enable bits, by explicitly storing the transfer size
in struct rpcif, and using that value to determine access size in
rpcif_reg_{read,write}().

Enforce that the "high" Manual Mode Read/Write Data Registers
(SM[RW]DR1) are only used for 8-byte data accesses.
While at it, forbid writing to the Manual Mode Read Data Registers,
as they are read-only.

Fixes: fff53a551db50f5e ("memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Lightly (read-only) tested on:
  - Salvator-XS with R-Car M3-W ES1.0 with HyperFLASH,
  - Falcon with R-Car V3U ES1.0 with QSPI.

v2:
  - Use rpc->xfer_size instead of SPIDE register reads and
    rpc->bus_size.
      Note: Alternatively, rpcif_manual_xfer() could bypass regmap and
      use {read,write}[bwl]() directly, cfr. commit 0d37f69cacb33435
      ("memory: renesas-rpc-if: Correct QSPI data transfer in Manual
      mode") in the BSP.
  - HF dirmap reads are confirmed to work on R-Car M3-W,
  - Drop RFC.

On Salvator-XS with unlocked HyperFlash, the HyperFlash is now detected
again, cfr. (with DEBUG_CFI enabled):

    Number of erase regions: 1
    Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
    Primary Algorithm Table at 0040
    Alternative Vendor Command Set: 0000 (None)
    No Alternate Algorithm Table
    Vcc Minimum:  1.7 V
    Vcc Maximum:  1.9 V
    No Vpp line
    Typical byte/word write timeout: 512 \xc2\xb5s
    Maximum byte/word write timeout: 2048 \xc2\xb5s
    Typical full buffer write timeout: 512 \xc2\xb5s
    Maximum full buffer write timeout: 2048 \xc2\xb5s
    Typical block erase timeout: 1024 ms
    Maximum block erase timeout: 4096 ms
    Typical chip erase timeout: 262144 ms
    Maximum chip erase timeout: 1048576 ms
    Device size: 0x4000000 bytes (64 MiB)
    Flash Device Interface description: 0x0000
      - x8-only asynchronous interface
    Max. bytes in buffer write: 0x200
    Number of Erase Block Regions: 1
      Erase Region #0: BlockSize 0x40000 bytes, 256 blocks
    rpc-if-hyperflash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0x007000
    Amd/Fujitsu Extended Query Table at 0x0040
      Amd/Fujitsu Extended Query version 1.5.
    rpc-if-hyperflash: CFI contains unrecognised boot bank location (0). Assuming bottom.
    number of CFI chips: 1

v1: https://lore.kernel.org/r/27107f2d578b198078df841ee2e4d7b71b183898.1647017136.git.geert+renesas@glider.be/
---
 drivers/memory/renesas-rpc-if.c | 56 ++++++++++++++++++++++++++-------
 include/memory/renesas-rpc-if.h |  1 +
 2 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index e4cc64f560196d55..a8c7abe1cf00be65 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -171,18 +171,32 @@ static int rpcif_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
 	struct rpcif *rpc = context;
 
-	if (reg == RPCIF_SMRDR0 || reg == RPCIF_SMWDR0) {
-		u32 spide = readl(rpc->base + RPCIF_SMENR) & RPCIF_SMENR_SPIDE(0xF);
-
-		if (spide == 0x8) {
+	switch (reg) {
+	case RPCIF_SMRDR0:
+	case RPCIF_SMWDR0:
+		switch (rpc->xfer_size) {
+		case 1:
 			*val = readb(rpc->base + reg);
 			return 0;
-		} else if (spide == 0xC) {
+
+		case 2:
 			*val = readw(rpc->base + reg);
 			return 0;
-		} else if (spide != 0xF) {
+
+		case 4:
+		case 8:
+			break;
+
+		default:
 			return -EILSEQ;
 		}
+		break;
+
+	case RPCIF_SMRDR1:
+	case RPCIF_SMWDR1:
+		if (rpc->xfer_size != 8)
+			return -EILSEQ;
+		break;
 	}
 
 	*val = readl(rpc->base + reg);
@@ -193,18 +207,34 @@ static int rpcif_reg_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct rpcif *rpc = context;
 
-	if (reg == RPCIF_SMRDR0 || reg == RPCIF_SMWDR0) {
-		u32 spide = readl(rpc->base + RPCIF_SMENR) & RPCIF_SMENR_SPIDE(0xF);
-
-		if (spide == 0x8) {
+	switch (reg) {
+	case RPCIF_SMWDR0:
+		switch (rpc->xfer_size) {
+		case 1:
 			writeb(val, rpc->base + reg);
 			return 0;
-		} else if (spide == 0xC) {
+
+		case 2:
 			writew(val, rpc->base + reg);
 			return 0;
-		} else if (spide != 0xF) {
+
+		case 4:
+		case 8:
+			break;
+
+		default:
 			return -EILSEQ;
 		}
+		break;
+
+	case RPCIF_SMWDR1:
+		if (rpc->xfer_size != 8)
+			return -EILSEQ;
+		break;
+
+	case RPCIF_SMRDR0:
+	case RPCIF_SMRDR1:
+		return -EPERM;
 	}
 
 	writel(val, rpc->base + reg);
@@ -469,6 +499,7 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 
 			smenr |= RPCIF_SMENR_SPIDE(rpcif_bits_set(rpc, nbytes));
 			regmap_write(rpc->regmap, RPCIF_SMENR, smenr);
+			rpc->xfer_size = nbytes;
 
 			memcpy(data, rpc->buffer + pos, nbytes);
 			if (nbytes == 8) {
@@ -533,6 +564,7 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 			regmap_write(rpc->regmap, RPCIF_SMENR, smenr);
 			regmap_write(rpc->regmap, RPCIF_SMCR,
 				     rpc->smcr | RPCIF_SMCR_SPIE);
+			rpc->xfer_size = nbytes;
 			ret = wait_msg_xfer_end(rpc);
 			if (ret)
 				goto err_out;
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index 7c93f5177532f187..9c0ad64b8d292d49 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -72,6 +72,7 @@ struct rpcif {
 	enum rpcif_type type;
 	enum rpcif_data_dir dir;
 	u8 bus_size;
+	u8 xfer_size;
 	void *buffer;
 	u32 xferlen;
 	u32 smcr;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
