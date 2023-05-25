Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1DDC77B7C
	for <linux-mtd@archiver.kernel.org>; Thu, 25 May 2023 00:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gZjAxm8zLH7vWMWrcKcwJVd9joy+OtfyYwRB5M53GI=; b=bWtTAZSYKDsIYR
	4lzhliEZP8Dq3VenaiEVplcbTgKgsyvHblclsmpn+J2DxbYW+d4Y2zNYGXpddqBcKLlpzARUphb4o
	gozSvhJhLZoyGv7cbd4+DAt+GHHbN2VN7MDWAECQiCKHWePPcWCvldlyQNQ6ePYCR8f2gKaMMe/lv
	BMtL/DZuN0xypsl9GwqQaOrCWs1ZaZW+mRTToMq9vyA7i6ZiLip+kuErmyT8GXdtcXcMWjw6Lqc7Y
	cVGfPi8Akk0nulmpAXvLbP24taNTMT3lbpYeNe9qApyX/esCceT76tugkrHGThHMrczSvU0qtjEsE
	0zdW8RM8zSoa6RBl8nDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1yto-00F58w-2l;
	Thu, 25 May 2023 00:32:12 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ytl-00F57L-29
	for linux-mtd@lists.infradead.org;
	Thu, 25 May 2023 00:32:11 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D03252C02E0;
	Thu, 25 May 2023 12:31:57 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1684974717;
	bh=7T+puFU3hojItCezGhGdpSM/kFMnpHzOFNeluLJHh3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pdYh/THsedCo1aXPzD0qB0J0YhFhlHOo/+1qq/nRiA/HI9y5gcD/kYhTkecp/cTAO
	 jUZ4vGkWoXHuLhOSwqdCgF0gO1wRyK5GEG0tIZ3tg/YJ2sd/8NTvY2dskh7h52YIXC
	 eBCuHS2ki3F0c9SqHC6rO48ZYyeKIiV8PHcx8DDgwd7EuEJ8kkWINI2TA4mbW++cRi
	 EXYcxV91huo4hRMgfzMwwG+py/ibGsWyr855RL+Dpq57BiV9y+/fPbcZHosj+zY2Wx
	 3y4v80GbEGwYWWu8vgixta/XuUyMkTbavzIyNbUogp2RFLI8tHrq83vQubtGZNu3DX
	 FXsoSZLgjtp0w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B646eac7d0001>; Thu, 25 May 2023 12:31:57 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 93CF613EE63;
	Thu, 25 May 2023 12:31:57 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 902C3281CC0; Thu, 25 May 2023 12:31:57 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 2/2] mtd: rawnand: marvell: don't set the NAND frequency select
Date: Thu, 25 May 2023 12:31:53 +1200
Message-Id: <20230525003154.2303012-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003154.2303012-1-chris.packham@alliedtelesis.co.nz>
References: <20230525003154.2303012-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=RTQhOw_aHlkS9OJicTUA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_173209_877980_FC0BE48D 
X-CRM114-Status: GOOD (  11.99  )
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

marvell_nfc_setup_interface() uses the frequency retrieved from the
clock associated with the nand interface to determine the timings that
will be used. By changing the NAND frequency select without reflecting
this in the clock configuration this means that the timings calculated
don't correctly meet the requirements of the NAND chip. This hasn't been
an issue up to now because of a different bug that was stopping the
timings being updated after they were initially set.

Fixes: b25251414f6e ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    I've set the fixes tag to b25251414f6e. The problem probably existed
    prior to that but without the other fix in this series it wouldn't be
    noticeable.
    
    With the two fixes from this series in place I get a tWC of 32ns which
    seems just about ideal.
    
    Changes in v3:
    - new

 drivers/mtd/nand/raw/marvell_nand.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index f1fcf136ad03..30c15e4e1cc0 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2900,10 +2900,6 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
 		regmap_update_bits(sysctrl_base, GENCONF_CLK_GATING_CTRL,
 				   GENCONF_CLK_GATING_CTRL_ND_GATE,
 				   GENCONF_CLK_GATING_CTRL_ND_GATE);
-
-		regmap_update_bits(sysctrl_base, GENCONF_ND_CLK_CTRL,
-				   GENCONF_ND_CLK_CTRL_EN,
-				   GENCONF_ND_CLK_CTRL_EN);
 	}
 
 	/* Configure the DMA if appropriate */
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
