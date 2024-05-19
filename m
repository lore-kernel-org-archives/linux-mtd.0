Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD49C25B74
	for <linux-mtd@archiver.kernel.org>; Sun, 19 May 2024 03:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBIfoXqcP1sD+ETP4MOuL30h9vl6rpDMdQPRkguXrDw=; b=Vl32ay+JG3GejY
	s+s4s8gl6iZYNAcODV5g7y9B1zbxqbds+Nx4H3YDzYufxj0eN+Vrt/5p3tlPfyQAEIVhewiYqqSmW
	Jv94KffHX/pbVFygtVnRaHyf/WTXQ1b07V/1pA35ph6fRsycZLl9aLwtoVDgpMPf3o+aPc7RSjY2C
	TMALaTGAccJSD+91wLZrXa3noyo81y6vlq5JqnLghNC8/a2y5C2BhiRgLJWqtPu01D4t7xTM/ZHPd
	bmYTW8LY3IoSIxS80s0JGU3ecxALCz/+t1qiY5chBQIcfhntb1jHpYwIM03EqM1WTaGoTFttEn+Ys
	uTbBy/Ew5n8J1sW8fKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8X0u-0000000BFlJ-495F;
	Sun, 19 May 2024 03:15:08 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8X0r-0000000BFjk-1JMc
	for linux-mtd@lists.infradead.org;
	Sun, 19 May 2024 03:15:06 +0000
X-Envelope-To: val@packett.cool
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1716088501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQ68eiixPLPA8K8ibwC9Cqzr0rdSmWCBdWf8xU1y1GM=;
	b=RFqSbC2snfhymVSfYyYailtwV2CqggBM/RQHKsrNoV3zW3MCK9cpI1GjMbIu624pm6PfOf
	wMZxYamANR3bImVCiq3rd4Hey2NKzUTdjLZW2TmnW6HxtGiohDrEnlWvPfeh94XTIQmTWG
	RkZ+/kTLV+QTyRJ6fGX6ifWe4SQ9p7hFBBJZEssvD/EZ3yPEymxWItYHBjcEPbz7KXgohG
	BbrN+IVoTm+cEKZ5LHwvSV8y6sIn1qqos9AizSoliMKpVHEuANf6+ot95p8Nr6DcY8FFZ5
	bAJa+9or7pdVeu/zXV1hTt73Lu3vETEgjRXxYBOSnTnEGSBckyFPRw9qptYMxA==
X-Envelope-To: stable@vger.kernel.org
X-Envelope-To: miquel.raynal@bootlin.com
X-Envelope-To: richard@nod.at
X-Envelope-To: vigneshr@ti.com
X-Envelope-To: heiko@sntech.de
X-Envelope-To: sfr@canb.auug.org.au
X-Envelope-To: linux-mtd@lists.infradead.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: rockchip: ensure NVDDR timings are rejected
Date: Sun, 19 May 2024 00:13:39 -0300
Message-ID: <20240519031409.26464-1-val@packett.cool>
In-Reply-To: <20240518124404.472eb60b@xps-13>
References: <20240518124404.472eb60b@xps-13>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_201505_656329_C8897FAC 
X-CRM114-Status: GOOD (  12.14  )
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

.setup_interface first gets called with a "target" value of
NAND_DATA_IFACE_CHECK_ONLY, in which case an error is expected
if the controller driver does not support the timing mode (NVDDR).

Fixes: a9ecc8c814e9 ("mtd: rawnand: Choose the best timings, NV-DDR included")
Signed-off-by: Val Packett <val@packett.cool>
Cc: stable@vger.kernel.org
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 7baaef69d..555804476 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -420,13 +420,13 @@ static int rk_nfc_setup_interface(struct nand_chip *chip, int target,
 	u32 rate, tc2rw, trwpw, trw2c;
 	u32 temp;
 
-	if (target < 0)
-		return 0;
-
 	timings = nand_get_sdr_timings(conf);
 	if (IS_ERR(timings))
 		return -EOPNOTSUPP;
 
+	if (target < 0)
+		return 0;
+
 	if (IS_ERR(nfc->nfc_clk))
 		rate = clk_get_rate(nfc->ahb_clk);
 	else
-- 
2.45.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
