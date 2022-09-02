Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01201C6FA82
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Sep 2022 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PW38JsUyHNVo59Gx91B3iG1MoLuht2wACMyUTIfAn6w=; b=VBL4BiQpRXrHi+
	wkR45xYd1BeoA5/h3ia6K04Zlnjv6/vO56Tej23SDARS3vqWViVr6OaP8zmjpf1VhoZAuQhsQOz3N
	zOwf2nwBbpv2YkR8ExnQH42NiBRM2vRxOr+SFhE/hh2f1A2wgNuYtS6NJ6epmUxSwkjS87kj/5Gdk
	fJMcv9cBrgX3N6OhSPoxyJv6tmSCDUGTwSfFK+/U3tcSkwmCa7/IW8WnmV+O4MBaydSN/RMk4+Pjb
	LHS1OZLnO6JN5Q3BVCPFta0ALmVZrCofIr8Xj4/vEDE+TyQckX/h+8KqwfKH/YR5A+HjYNWff75Jf
	C3fDktV6XBcQ8JHvWjpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6rf-0059FA-3B; Fri, 02 Sep 2022 13:37:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6ra-0059DB-OD
	for linux-mtd@lists.infradead.org; Fri, 02 Sep 2022 13:37:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44407620DD;
	Fri,  2 Sep 2022 13:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D85FC433D7;
	Fri,  2 Sep 2022 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662125854;
	bh=jzG0D03+vxrGLGIs+YSm8b2wkD8dPvpWfTaQQGIfuUQ=;
	h=From:To:Cc:Subject:Date:From;
	b=2ViCa0hSTALym2d7H6yIqIwgR8f1Cxi4K31j+6jsXg+w1JHIOCKWKLXjg1VZvqhcg
	 ftRrqkTVmSIvwGK11JY5lSt1cKLALoA2oxNjjkp7XBYrB0hmbvV9VvaDwxTJgn5oXE
	 O/5IXY5ow7hYMnDanucblQbpuWYVpwLfxi7TIOe0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: tudor.ambarus@microchip.com,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	stable <stable@kernel.org>
Subject: [PATCH] mtd: spi-nor: fix memory leak when using debugfs_lookup()
Date: Fri,  2 Sep 2022 15:37:24 +0200
Message-Id: <20220902133724.278133-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455; i=gregkh@linuxfoundation.org; h=from:subject; bh=jzG0D03+vxrGLGIs+YSm8b2wkD8dPvpWfTaQQGIfuUQ=; b=owGbwMvMwCRo6H6F97bub03G02pJDMlC7EJ2v/4aB/pOcFJJuSPvsO+F/9TH8iail28bPHKyMTx9 VaCyI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACZSdZ5hQevH1PPLlYxy/TfemvtXde 7U2z+8zjHMZMyf/qdsnvzMS3uCPF/bH1p8iOtQHQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_063738_853439_6BB75E60 
X-CRM114-Status: GOOD (  15.83  )
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

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.  Fix this up to be much
simpler logic and only create the root debugfs directory once when the
driver is first accessed.  That resolves the memory leak and makes
things more obvious as to what the intent is.

Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mtd/spi-nor/debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index df76cb5de3f9..3aab595e82d1 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -228,11 +228,11 @@ static void spi_nor_debugfs_unregister(void *data)
 
 void spi_nor_debugfs_register(struct spi_nor *nor)
 {
-	struct dentry *rootdir, *d;
+	static struct dentry *rootdir;
+	struct dentry *d;
 	int ret;
 
 	/* Create rootdir once. Will never be deleted again. */
-	rootdir = debugfs_lookup(SPI_NOR_DEBUGFS_ROOT, NULL);
 	if (!rootdir)
 		rootdir = debugfs_create_dir(SPI_NOR_DEBUGFS_ROOT, NULL);
 
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
