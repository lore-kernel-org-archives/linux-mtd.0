Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B95A1125842
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hvz+qOuJiUlWSp39CG4jsTiX1o00mHl3XZgrbPJTAps=; b=APYw5gMcFh80BM
	J1e322YbBP+C5afnlq9famNNY1wfe/M9KQEQLCkbuNVCNSBeSySWQSnz09awVZfny3daH3muJobEt
	+KFrbsPdlSXt+9egSAa4JY6oAyPs+mTMZeIrEVYEKw8YhwRKrJkBQVm3JP3dLoNhrBMnlk6d8TwZd
	G9fVJBixBL5cyDcsLa42lnpZDFdR3u20SwVDMTt//MOxJKXtQDIlsuyabyxIXvwODOaqL9ahk1kbd
	3Da86WJfQcDhJFqNQk+gzsdZC12bcPUDIzwGY9AcerLHW5Dw98fRFjo9iuMjP81oXCZwnvbtYybbg
	AtjUr6Tx0oPgn/0fBSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LgE-0000000BqRK-03i3;
	Wed, 11 Mar 2026 15:41:02 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lg9-0000000BqQ4-1fXJ
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:40:59 +0000
X-CSE-ConnectionGUID: Z6CYRRAgRYiVZsl0rzEvfA==
X-CSE-MsgGUID: z8/avebfToaQgvOVIyrb2Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Mar 2026 00:40:51 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.22])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 36307400ADB5;
	Thu, 12 Mar 2026 00:40:45 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Kees Cook <kees@kernel.org>,
	Weigang He <geoffreyhe2@gmail.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Benjamin Krill <ben@codiert.org>,
	David Woodhouse <David.Woodhouse@intel.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] MTD fixes for OF node refcounting
Date: Wed, 11 Mar 2026 17:39:55 +0200
Message-ID: <20260311153957.1984446-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_084057_562643_A78981B1 
X-CRM114-Status: UNSURE (   9.08  )
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

This series fixes an issue observed while repeatedly binding / unbinding
the SPI controller driver to which a SPI NOR flash memory is attached,
caused by commit 7cce81df7d26 ("mtd: parsers: ofpart: fix OF node
refcount leak in parse_fixed_partitions()"). See patch 2 for more
details.

Patch 1 is the fix for another theorethical issue I have noticed while
debugging the main issue.

Cosmin Tanislav (2):
  mtd: parsers: ofpart: call of_node_put() only in ofpart_fail path
  mtd: parsers: ofpart: call of_node_get() for dedicated subpartitions

 drivers/mtd/parsers/ofpart_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
