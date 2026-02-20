Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF4AC5ACD1
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Feb 2026 16:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/WHP6JYaW1JMgJR+pphC5Dtou1qlRz4DyW0r+2nHUdw=; b=CQPHkY1BEaDwqW
	ow21uKIFofjT0ZWNYeDGg3ZlPFPR1Cs+45hdFhmdG156hPmzlFlAbITtSygHGVm6mruaA3BVLzpZ0
	HgSAay3ujFm9u6lblqNk4DP2jlpoPfB3EOroh8zG/gi5F0O2ePxTGp5OiCcUMVqHuR+U9foQFopSd
	4yv/rcFcjqunCiNUUpbJZ2Tlzw9fm4giNS7jTES8bPLnAhLE2FFRfZL2CoD3mHqDMvyOcAtiyk0hk
	Jn7lF9vEGsSwuAuMeEXvFetctQc0ylAxfqymdrj+qwtrxNifZRdkn6d81+UqRyVNFMfdZhxngoBtS
	HZoSTB6Y5kB8+52QtaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5S-0000000FBTo-18Bo;
	Fri, 20 Feb 2026 16:10:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5O-0000000FBQV-15G8
	for linux-mtd@lists.infradead.org;
	Fri, 20 Feb 2026 16:10:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3EB201A0ACF;
	Fri, 20 Feb 2026 16:10:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1283F5FA8F;
	Fri, 20 Feb 2026 16:10:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45B5710368D1C;
	Fri, 20 Feb 2026 17:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603828; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Dq+uxH2nK+WQ3kQsH/3znHt6ViWHPx5hXuA0KzxJW2g=;
	b=Isq5NrqsXvgTfqYvuXHenJ3EV8jFMtRfYBrpox2nTb7FYB9z9U8hfBxdupzjzWbjrYBrUq
	touW/QCm5sKgTttudRlDA6OuloJDtWEazV+Wfe5jx25h7oCEZZP6eBj0HLjJRCa3Z69nRH
	9908gISDI6czfT8iu49w4tYA11QMltu6teG7xg6mru59UQATZmg9dPj7DNJSVvgV7rjtaE
	NA2pECuhVYhcWZGF9wrWMElmAI0d+pNkW4UjdQ73SGwe6gi96mXCa9bAzNNRb7rqGE+LtO
	ZAMhD5ILqV1ZmRhf42Dw79GHnPpgXdbW8Q1X3l9V74mWMGI5L9kxojn4o0zBQQ==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 0/6] mtd: rawnand: sunxi: Fixes user data length for H6
Date: Fri, 20 Feb 2026 17:10:05 +0100
Message-ID: <20260220161011.999642-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_081034_429634_08503A69 
X-CRM114-Status: UNSURE (   8.00  )
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

This series introduces the correct usage of user data length for
H6/H616.
If the older SoCs must use a fixed value of 4 user data bytes for each
ECC step, the H6 can have a different value for each step.

In the first round, the behavior was kept as the one used by A10 when in
fact the images in the wild with the vendor kernel are using a different
layout.

The first patches are fixes/code cleaning and the last one enables using
a variable user data length for H6/H616

Richard Genoud (6):
  mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
  mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
  mtd: rawnand: sunxi: do not count BBM bytes twice
  mtd: rawnand: sunxi: replace hard coded value by a define - take2
  mtd: rawnand: sunxi: make the code mode self-explanatory
  mtd: rawnand: sunxi: introduce variable user data length

 drivers/mtd/nand/raw/sunxi_nand.c | 299 +++++++++++++++++++++++-------
 1 file changed, 227 insertions(+), 72 deletions(-)


base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
