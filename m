Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7673DECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Txc86njfXoO5McqM0ui+/W/t/AGLroV7Ni4rg0CN9Jw=; b=TfiLq2A2TXZ+yA
	R2Xa8p9ZFj5MpNfiEtbbBquRF0xBLL96m5PT6agVfYa+q0sutMXuVTbb1pj+3PgWJzP65r7ijMz/c
	K1TJpfiW2xd1eYqTxy7I+lHFyx29+BA9bvMiJmovqmC4u6lvpdQAGMt1/VeIr8uozIUWoygOeCGNV
	OTR1l/Ywrtj6UOPY4H8AA/oznZdHqsccdfq/pH8+v8PWksqJeGBIYEvut1u2EbKe2twOk200xgmL0
	5o396WiRImgv6+xBSNdGmpTbPWFEphGdvYuwuvTl/tbP+4tWNmHwiaItNUHBgC+2rSIZN2VyOAnje
	3GiBbNOGOWegF03J3UzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtdw-000NIK-KP; Mon, 24 Oct 2022 09:21:12 +0000
Received: from tartarus.angband.pl ([51.83.246.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtdt-000NFM-Ak
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2022 09:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl;
	s=tartarus; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Wq8J078WnKbzaZr7d4VxEHJxGv/MIkll160szlpG16c=; b=vypeQ/u7l4vOQDhNyHVxOgcMzC
	naX4z99oN/t8N6d3nwaqQlnJHsBStEnCg7YV0Vqrs2Ht+zFP62cerp8y7TmhsX08ga50gx9CZnwCb
	O7V1su10J1V83mJsqYWzbkaoGlLUuvBbYzHaLy/U6Tc/jQA3HLjBrTogwW/5n3xNVSsM=;
Received: from localhost ([127.0.0.1] helo=valinor.angband.pl)
	by tartarus.angband.pl with smtp (Exim 4.94.2)
	(envelope-from <kilobyte@valinor.angband.pl>)
	id 1omtdM-00AMIC-KG; Mon, 24 Oct 2022 11:20:36 +0200
Received: (nullmailer pid 47403 invoked by uid 1000);
	Mon, 24 Oct 2022 09:20:34 -0000
From: Adam Borowski <kilobyte@angband.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH] mtd: rawnand: placate "$VARIABLE is used uninitialized" warnings
Date: Mon, 24 Oct 2022 11:20:26 +0200
Message-Id: <20221024092026.42123-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kilobyte@valinor.angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_022109_660828_041EDCCE 
X-CRM114-Status: GOOD (  12.09  )
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

The compiler is not smart enough to notice that it's impossible for
them to be actually used uninitialized.  Which exact variables trip
here varies depending on random surrounding code; none triggered in
6.1-rc1 but 6.1-rc2 fails on three of these five, despite variables
declared in the very same line having identical flow.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/mtd/nand/raw/nand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 33f2c98a030e..c3cc66039925 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5834,7 +5834,7 @@ nand_match_ecc_req(struct nand_chip *chip,
 	int req_step = requirements->step_size;
 	int req_strength = requirements->strength;
 	int req_corr, step_size, strength, nsteps, ecc_bytes, ecc_bytes_total;
-	int best_step, best_strength, best_ecc_bytes;
+	int best_step = 0, best_strength = 0, best_ecc_bytes = 0;
 	int best_ecc_bytes_total = INT_MAX;
 	int i, j;
 
@@ -5915,7 +5915,7 @@ nand_maximize_ecc(struct nand_chip *chip,
 	int step_size, strength, nsteps, ecc_bytes, corr;
 	int best_corr = 0;
 	int best_step = 0;
-	int best_strength, best_ecc_bytes;
+	int best_strength = 0, best_ecc_bytes = 0;
 	int i, j;
 
 	for (i = 0; i < caps->nstepinfos; i++) {
-- 
2.37.2.609.g9ff673ca1a


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
