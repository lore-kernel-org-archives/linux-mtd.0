Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A7BFD877E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xUPdRyYYPXpNTg1F+pwD5xBuvmBcf9sQTt7I+wVyAaw=; b=Y4hUvSXgqF0pvI
	4sfAYiyPyyZ7LiBimFhcZtfny4Xv1GVnjtmSZMnd90N7MDzqUYrvOP9niA4/nzBMFpgnSLRWdLz6m
	MkhhyO+bplumPgQwo5mSSF/A/98iqsYb1ZYACTHBa8i9PWBJkaTl9DMOnictt0O22obbXSfLNohyf
	UXIQEImv9ehdMlM9I/m1p+CnfYwDqAv1HK/5137+cUTYeYGfsfpO1GwUj5Tzvbsgn5939iJvChI/I
	sWOyJj6gbqsUCWUaBWUpBv0/r+K07WGW0a3VgHLQHBPVNYX8wBM5wHuAzrEJ79Y6kjr0tvVQ2LLLj
	YuvErXZe3HOjO+8j87eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VLu-00000006Zm5-41ez;
	Tue, 17 Mar 2026 14:24:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VLq-00000006Zk4-3XRJ;
	Tue, 17 Mar 2026 14:24:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8D77B1A2D2A;
	Tue, 17 Mar 2026 14:24:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 604C45FC9A;
	Tue, 17 Mar 2026 14:24:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AE7C104505F9;
	Tue, 17 Mar 2026 15:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757488; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=DN78EL9T5Ru3RT9ZOEzKnpYV80b6m9rbH2jsKW98yuk=;
	b=0Tbm+tOwnWZWD3hVCVLj6+aaoji2FfaYNAfB7ZBgC54xlBT6q26z5NiCypgNpgfJUBT6Je
	2i4WFnjGXAQ6zgGH6GP1fytWGmgMMITuUfG7trg7lwcSQw++OI9wfM7w0k2gROe9LJcrjW
	mn+eH6USQyS4dy7izgnTKSLNB+B/IMGqOEIVSqgANtdrEUyhOPjt+HZ3/swbmGSK7LCsdX
	3tCrLydh46Hae9jqy+t0SCrrLAb8bhaOxfS4UmTyyCQu09+ghtc7UGVRTdmZoX65uXR3OK
	qg4N1w278igbsyzx9C3vNhhSdCbcZTDc4reC7B/NRmtBFPTnrpFTBFjqka0/jw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 0/9] mtd: rawnand: sunxi: Fixes user data length for H6
Date: Tue, 17 Mar 2026 15:24:28 +0100
Message-ID: <20260317142437.580204-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072455_010762_3FEC5B15 
X-CRM114-Status: GOOD (  12.53  )
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

This series introduces the correct usage of user data length for
H6/H616.
If the older SoCs must use a fixed value of 4 user data bytes for each
ECC step, the H6 can have a different value for each step.

In the first round, the behavior was kept as the one used by A10.
But we have multiple choices:
- do like A10 like before (and not use all OOB)
- do like the vendor kernel (different from A10, but not using all OOB)
- use the whole OOB for user data bytes

In this second round, the third approach is implemented.

The first patches are fixes/code cleaning and the last one enables using
a variable user data length for H6/H616

Changes from v2:
- fix typos in commit messages
- add a patch fixing typos in code comments
- add a patch to remove some dead code in sunxi_nand_ooblayout_free()
- add a patch to change an error prone variable name
- maximize user data length instead of relying on vendor layout

Changes from v1:
- gather Reviewed-by/Acked-by
- rework patch 1 subject (more a code clarification than a fix)
- fix typo in patch 2
- remove patch 4 Fixes since it's not really a fix

Richard Genoud (9):
  mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
  mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
  mtd: rawnand: sunxi: do not count BBM bytes twice
  mtd: rawnand: sunxi: replace hard coded value by a define - take2
  mtd: rawnand: sunxi: make the code more self-explanatory
  mtd: rawnand: sunxi: remove dead code
  mtd: rawnand: sunxi: change error prone variable name
  mtd: rawnand: sunxi: fix typos in comments
  mtd: rawnand: sunxi: introduce maximize variable user data length

 drivers/mtd/nand/raw/sunxi_nand.c | 381 +++++++++++++++++++++++-------
 1 file changed, 294 insertions(+), 87 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
