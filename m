Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F0BC0015E
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jul 2023 03:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t0VArzr+vtHR0VUeTzxvz0b3anxh6gvwDkP8gz1GNp8=; b=S/gVieXQzCtuw5
	jZMerykv10xKMUV/eUKbBxmgYrPYL/AQRPiZKh7sA9Oqm0CzZdF1fXMtEU7DRkKx6lUGI40Eg3i1v
	9r4kKsT9Lvn7OAeIv13MGCLiw/GrOjWhwzz9MHYxINa78yGXtmNLKZKpDb3PFQ5YDm+TLcHC0S4SK
	iT4uhr5VLYc9nGa74mx09Xrj5TPIfZvzHuO6V6aASTwYGOetQ1qlzIVBNz7SoC5FvVf4Fj4ugUAYh
	oA2G+EWnlBQ0GjfeOCNuKq3gBYL7O45JoBnBOK7in0Q4kD1OSKkuK+jZM9pnnhSKUAV4+b1Wl7GxW
	6n2vN4ABpp5I0xYoftuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAai-009CgT-0S;
	Mon, 03 Jul 2023 03:51:08 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGAaf-009CdQ-0K
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jul 2023 03:51:06 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DD9612C0191;
	Mon,  3 Jul 2023 15:50:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1688356248;
	bh=1xCbsbTLGy9beD3/PSY5qz1J2AtdPls2UXJzcoYemB4=;
	h=From:To:Cc:Subject:Date:From;
	b=EFuAuww7qGf0rBKw/+pQPO+G/t7UYsttAjWwVjrdvH08k2w++XMWDb4bJ/tv0PLkp
	 wNJL1hzzxFAdUkiUx4VkVpPa2f0xs6eF3KIUkaqlEa6Xl2VG7GyYmTIPACK4ZpjyHa
	 RSyknsVjn2SzqtNAO8EEiFUuwm74+xFcs9GCrpxWR0KRbpVR1vCvy2pz6xcjz2Qsaw
	 mjNl3ypqb9JGlmA7luBOFzw6BF+eHo4Ye/IXEHH3AtFsYIzMF5+S7RB3wRN5BTpaHI
	 avvxKppg/osijkO6j7qXtSKIWGyLVbwTDRW+Uc/Osb6cFXJdfUik4x9amy5HHG5opL
	 uONCeERF42bZQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B64a245980000>; Mon, 03 Jul 2023 15:50:48 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A0A1E13EE32;
	Mon,  3 Jul 2023 15:50:48 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 9E7C4283AFC; Mon,  3 Jul 2023 15:50:48 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/3] mtd: rawnand: marvell: add support for AC5 SoC
Date: Mon,  3 Jul 2023 15:50:41 +1200
Message-ID: <20230703035044.2063303-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=ws7JD89P4LkA:10 a=PnpXwi1vBEG2Y57vC9MA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_205105_315082_563B10C4 
X-CRM114-Status: GOOD (  10.20  )
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

This series adds support for the NAND Flash Controller on the AC5/AC5X SOC. Its
dependent series are all in mainline now so this should apply cleanly on top of
that.

I've tried to stick to the minimal changes required to get the NFC working on
the board I have (AC5X + S34ML02G2). Marvell's SDK has hard coded tables of
ndtr values for the different timing modes but so far that seems unnecessary.

Chris Packham (3):
  dt-bindings: mtd: Add AC5 specific binding
  arm64: dts: marvell: Add NAND flash controller to AC5
  mtd: rawnand: marvell: add support for AC5 SoC

 .../bindings/mtd/marvell,nand-controller.yaml    |  1 +
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi    | 16 ++++++++++++++++
 drivers/mtd/nand/raw/Kconfig                     |  2 +-
 drivers/mtd/nand/raw/marvell_nand.c              | 16 ++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
