Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBDCC27C52
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 21:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LKkyQ39N5iIGlv/wg77XYBW2SVZF0edeBEA0M2dr4Mg=; b=j0lCGOZuruEVzM
	KfY5Ah+hZ/qpWc06hE6+06DdgU6xnovF2olpWzWZIgVGN9BQ7HUX6+J+c9Ah+I4b4mcbmoi5x4/lT
	4y6q5D1zclgBIYUQ4ZCGB0938iPR0r334V4QEz/rQFmlO2a+9m0UpIr7HdUcjxmp+69B6llASgTr8
	RQawlIaPnZfRx5QyaCMhdQY7YVC6M+7w2Jq2s/cUIOhlORqMdvBJ/hJzKKpMPQQwP+zbtEh142ZFX
	xs5sJ+Z/M2Ju8h5f/jFdij02z9zt9lOG/jjE2d09o7MiDJRvDs6QFvPehMYQbZeqpELSqkgu8SoOI
	X3PF1WWUjcTCC0UXCBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEbiu-00000003rJ2-0Xhb;
	Tue, 04 Jun 2024 21:29:40 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEbio-00000003rCv-3a6D
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 21:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=LWsYD8EI4ECNkK
	uHeAZPt+ug0/S0KoVB/ZZVlAu0SMU=; b=ZdJZDbBc22cv9m8UWoeg3yme/4+yOz
	5SvA0tZgBV57Tu33GOr7OtENrx14IZG2qyt7+YVjdxZc6Tibo4FcrqP+TMNOCH+3
	puOvlB6M4WHRhxot2aZMyXpF+HwWSL1rvvp8rqhl5ZO+Wb/z4N07sfYImA0w2og5
	0Laf7IZrs5TfuHuIUvQTippQT6rNZEZW1P74P+3GFsEVigZ3S5I42jSl5tQwNNJx
	ficrJSiBkB+AUfdOb96FCckH4fRl05EujAq9jwd2P6dWcH5qecH76TgyEy/qB1xX
	mtSVl5TXqbpQJi2A1rlN8V4y1Y/E2/Xgb6/o/uoEMsLo5gfLxfk+QAZw==
Received: (qmail 2450878 invoked from network); 4 Jun 2024 23:29:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 23:29:25 +0200
X-UD-Smtp-Session: l3s3148p1@yqDgJBca7tlehhtB
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 0/2] mtd: use 'time_left' instead of 'timeout' with wait_*() functions
Date: Tue,  4 Jun 2024 23:29:19 +0200
Message-ID: <20240604212919.5038-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_142935_219573_017E4D72 
X-CRM114-Status: UNSURE (   8.83  )
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_*() functions causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
obvious and self explaining.

This is part of a tree-wide series. The rest of the patches can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, I audit them before sending. This is why I
will send series step by step. Build bot is happy with these patches, though.
No functional changes intended.

Wolfram Sang (2):
  mtd: nand: mxc_nand: use 'time_left' variable with
    wait_for_completion_timeout()
  mtd: rawnand: intel: use 'time_left' variable with
    wait_for_completion_timeout()

 drivers/mtd/nand/raw/intel-nand-controller.c | 6 +++---
 drivers/mtd/nand/raw/mxc_nand.c              | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
