Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BC5C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:43:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 519CA20848
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DC+z5BgB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eM5+C5kR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 519CA20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bUHHdCBxOiFgpQYWfB9/k4YXaeBWGa2PVBOUDN93C70=; b=DC+z5BgBegKpYXmlu7Oepo/N7
	y30ZqbqYde9AK5/k2SvBqayH81uzVkFsWjxn9MgeheCKEKTzas0JXqaHyxnJ1ZaNEyNF8XW9Nu0bn
	BEiT6L5hNepczQYZViZ9ILhXkDHoDUW+nooWbzWDnWAimuZaNH/sPvNFgFyGcb8gWc7IsdAEEqJ2L
	4kiXwC8OKzRi0dKKHhxAa/2FUVpS7D9XfZiTDvwt1hAFSFMTNeCxALl0VPHjj8eng0MHhHRznsNbi
	nJMLGlnK58FrPeVHj45bTLZS3d2Dr3UDHlcEZAE2l7zdiFVbvlHwwiSUA8iPU14AUicd8OiyUY/7k
	BUxTM/GoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTQ0N-0002TW-RT; Fri, 16 Oct 2020 13:42:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTQ0M-0002Sz-6W
 for linux-mtd@merlin.infradead.org; Fri, 16 Oct 2020 13:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=dVC+oPNA4c4mlsDL++B4TVjVYz10iLER5z4ZQesiGIY=; b=eM5+C5kRXJ1pfqMo0qB9WLz0z5
 8dh75k//TeG5yIjspl6X93BYUz5CLSa9qfBJWZ3ma7NQJPp+xNm67JpmdMICr4sJ6iiQzyl9GD2Hq
 e9iJznKdcEopyPWYwulpYQ5WkxmVm3R/mgbAKqDLvHEMN7M0Tz+jUk3eKNPpUr8PhMekss2oyHOaK
 KAjfTQZDKnfCfoLFl8yLovCOABYZTdEJ7qqK1tXtSdhFMORb0foC6ryu9BS0AeQJSLDwVrGwxStHD
 afpFddoHmlo0aB5QiQWcNjlw3WU6ysnliFXf8taqpAuAXnH62oaEvU21X1FLCncYOZF69wjnPuGuD
 2W5996iA==;
Received: from 213-225-9-134.nat.highway.a1.net ([213.225.9.134]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTQ0K-00042I-JW; Fri, 16 Oct 2020 13:42:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH 9/9] pstore/blk: don't depend on CONFIG_BLOCK
Date: Fri, 16 Oct 2020 15:20:47 +0200
Message-Id: <20201016132047.3068029-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016132047.3068029-1-hch@lst.de>
References: <20201016132047.3068029-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

pstore-blk contains of two different layers:

 a) a tiny layer of sugar coating ontop of pstore-zone.  This part has
    no dependencies on the block layer, and can be used e.g. by mtd
 b) an implementation of a default fallback pstore zone backend for
    block devices

Add an ifdef for the latter so that pstore-blk itself does not have to
depend on CONFIG_BLOCK.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/pstore/Kconfig | 2 +-
 fs/pstore/blk.c   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index e16a49ebfe546d..6eadb538316e52 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -164,7 +164,7 @@ config PSTORE_ZONE
 config PSTORE_BLK
 	tristate "Log panic/oops to a block device"
 	depends on PSTORE
-	depends on BLOCK
+	depends on BLOCK || !BLOCK
 	select PSTORE_ZONE
 	default n
 	help
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index bd4eadfc9bd795..d3d25edb943cdd 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -182,6 +182,7 @@ void unregister_pstore_device(const struct pstore_zone_ops *ops)
 }
 EXPORT_SYMBOL_GPL(unregister_pstore_device);
 
+#ifdef CONFIG_BLOCK
 static struct file *psblk_file;
 
 static ssize_t psblk_generic_blk_read(char *buf, size_t bytes, loff_t pos)
@@ -269,6 +270,7 @@ void __init pstore_blk_early_init(void)
 	__pstore_blk_init(devname);
 }
 #endif /* MODULE */
+#endif /* CONFIG_BLOCK */
 
 /* get information of pstore/blk */
 int pstore_blk_get_config(struct pstore_blk_config *info)
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
