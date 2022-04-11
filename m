Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C7DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GRFaZu7nnqsaiXC0phvK/2NJfMK3dlnBqZvoP+cOdks=; b=gZ+n5Sz5LpaqIs
	yYQCic8A0zTFQCgp//mmfKJr7RqFDfOxtb955BroEU9wQyufwhDiI4n8hZZkS6yJ0VgS9IgRC0n7J
	E7hYQtLGnI+fOjGteWAHW2ah9+KZNpPGxF3aZ0lOFuXn8hbJohVXrUooxra5T2mr87+eKfs0hYkQJ
	qXhnoIfgMOpgR3/gReW0hjDX0dvyedxBIRLZqYc6DNaV53SH5fJXwgkY6N52MgqdGVZjnf9yjB73F
	EzX53diVt/8KCrPkr8z9X+W7U66FqLPP4ny8/0Wdtk/NiyNSrCJuLxIzVf8I9Wt3PL5dpcj1Y0/aa
	jfB7l2jgwZHrhg6pukQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndta1-0093UL-Og; Mon, 11 Apr 2022 12:55:41 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndtZy-0093Ra-0A
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 12:55:39 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:b509:6862:2557:437a])
 by baptiste.telenet-ops.be with bizsmtp
 id HQvX2700U1G7NMJ01QvXyl; Mon, 11 Apr 2022 14:55:32 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ndtZr-000ARl-6C; Mon, 11 Apr 2022 14:55:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ndtZq-009JJB-OB; Mon, 11 Apr 2022 14:55:30 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] memory: renesas-rpc-if: Simplify single/double data register
 access
Date: Mon, 11 Apr 2022 14:55:29 +0200
Message-Id: <19358863deae03b1b26f473e878305a1c6e40d19.1649681638.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_055538_201190_743EF2B7 
X-CRM114-Status: UNSURE (   8.18  )
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

For manual write and read, factor out the common access to the first
data register by keeping track of the current data pointer.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/memory/renesas-rpc-if.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 019a0822bde0e413..fb2a507ca2badc70 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -488,7 +488,7 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 	case RPCIF_DATA_OUT:
 		while (pos < rpc->xferlen) {
 			u32 bytes_left = rpc->xferlen - pos;
-			u32 nbytes, data[2];
+			u32 nbytes, data[2], *p = data;
 
 			smcr = rpc->smcr | RPCIF_SMCR_SPIE;
 
@@ -502,15 +502,9 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 			rpc->xfer_size = nbytes;
 
 			memcpy(data, rpc->buffer + pos, nbytes);
-			if (nbytes == 8) {
-				regmap_write(rpc->regmap, RPCIF_SMWDR1,
-					     data[0]);
-				regmap_write(rpc->regmap, RPCIF_SMWDR0,
-					     data[1]);
-			} else {
-				regmap_write(rpc->regmap, RPCIF_SMWDR0,
-					     data[0]);
-			}
+			if (nbytes == 8)
+				regmap_write(rpc->regmap, RPCIF_SMWDR1, *p++);
+			regmap_write(rpc->regmap, RPCIF_SMWDR0, *p++);
 
 			regmap_write(rpc->regmap, RPCIF_SMCR, smcr);
 			ret = wait_msg_xfer_end(rpc);
@@ -552,7 +546,7 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 		}
 		while (pos < rpc->xferlen) {
 			u32 bytes_left = rpc->xferlen - pos;
-			u32 nbytes, data[2];
+			u32 nbytes, data[2], *p = data;
 
 			/* nbytes may only be 1, 2, 4, or 8 */
 			nbytes = bytes_left >= max ? max : (1 << ilog2(bytes_left));
@@ -569,15 +563,9 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 			if (ret)
 				goto err_out;
 
-			if (nbytes == 8) {
-				regmap_read(rpc->regmap, RPCIF_SMRDR1,
-					    &data[0]);
-				regmap_read(rpc->regmap, RPCIF_SMRDR0,
-					    &data[1]);
-			} else {
-				regmap_read(rpc->regmap, RPCIF_SMRDR0,
-					    &data[0]);
-			}
+			if (nbytes == 8)
+				regmap_read(rpc->regmap, RPCIF_SMRDR1, p++);
+			regmap_read(rpc->regmap, RPCIF_SMRDR0, p++);
 			memcpy(rpc->buffer + pos, data, nbytes);
 
 			pos += nbytes;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
