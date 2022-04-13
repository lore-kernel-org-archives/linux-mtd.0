Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7204EC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Apr 2022 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YpBt5rcaPP4n+mLrb7g9pcu+XYHnQtm0noViy9uHML8=; b=2zFUsuxAQqiqoF
	mNcqj+vmG7iV9Tb12fTg7XGIutScAeqiGTlofkprNXRzz8EgYxCVShjdyHaqyoX7jNYB/SMDfZtjQ
	bYHgGkcNi8LhOizJAIhNjmoRuFoOkU5YUIvMMcjMa2+T5FkRGCKrX3XsZgyinFpvu4GTmkKENGJ+s
	Xvi5L301jnMV1Q/6GHE1IF5q8IWNmHg/4SaaMiAvJoTzD+C+zMkIa1l3NqFe4jVo9Ca7Kb3TVET1V
	2gBmTG3l4IW6gcNM/cDRoK+vPfReBgp5l4DyBG/uGj3ciNo1g/6PKz+5r200lLTChCKCyjBvwDJu0
	VtwB94HRLXqDjXtFBLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nedNH-001GHX-T2; Wed, 13 Apr 2022 13:49:35 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nedNF-001GGP-Gb
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2022 13:49:35 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
 by andre.telenet-ops.be with bizsmtp
 id JDpP2700S2t8Arn01DpP2a; Wed, 13 Apr 2022 15:49:25 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nedN4-000Seb-Up; Wed, 13 Apr 2022 15:49:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nedN4-00AjDf-Fl; Wed, 13 Apr 2022 15:49:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] memory: renesas-rpc-if: Simplify single/double data
 register access
Date: Wed, 13 Apr 2022 15:49:21 +0200
Message-Id: <c3b2a8d1a69f1b1e8d1a460148406cfb83e52eb4.1649857740.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_064933_729633_46066CDA 
X-CRM114-Status: UNSURE (   8.66  )
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
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
  - Add Tested-by, Reviewed-by,
  - Remove unneeded pointer post-increments from final dereferences.
---
 drivers/memory/renesas-rpc-if.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 019a0822bde0e413..ba9c526833c0f4da 100644
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
+			regmap_write(rpc->regmap, RPCIF_SMWDR0, *p);
 
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
+			regmap_read(rpc->regmap, RPCIF_SMRDR0, p);
 			memcpy(rpc->buffer + pos, data, nbytes);
 
 			pos += nbytes;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
