Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA5BC433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:33:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B052226B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:33:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5XiCjMF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VsE23OLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07B052226B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vo4bd1Kjv3Ozp4WX3v1T1uXFJjyR3kDbruk6dt3Dcc0=; b=g5XiCjMFxay2SfkVzvYI9v0sT
	VNss9HdA0TgV5c+AXqCEKiVOz4waKVGv37sPyBq9OLA+Dlw59B5GU6Kn3izp/e1BQk8/1JHLC3mVf
	6RzL4GxQB7DKYdCjePBo1N9jvVG+XFKmXg6/Cy4A8wf+6lngRT1BxA5gkWptFNQGpzPWSFflnk7Z8
	k8whZUlqboy0tzEso8IPTUZEJnqChXaV342RbkRaaMgWTiEzqEzQ0GMAAy0l7EOWJFXXf7P7rd10v
	/Ze6BIc3XEfV1qKs094oAhh7cFQc3dpepM1lT8B8CDX9CHlu8EC3Hxwe4xOVc/3g5bEdawRw3oy0T
	xc7CyWgoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtRr-0004BO-Gs; Fri, 09 Oct 2020 14:32:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQN-0003Mi-6p; Fri, 09 Oct 2020 14:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RIb1gQ+A64FbhPeJkfhHPdkd0Jjt6Z+sspMIve+fcDU=; b=VsE23OLOrUsnE7PhGHwfx4AvQD
 ZxkA8063qfbOb72uym0CvuEdjOdRn7oO/of7SRBBhcxjg9XTVL1ic5NG9xyRTX+fd2YtHU6noe+tR
 uEp06xjPiOqssHfOpiCZbZjqG05aMT4oOo9biqN01offaQ9iApy0o0e4MMkooCZAHQAeyjeBIDN8e
 KJorn95GK3/JkF8UaucM0gBtV/Vb6J3DVeBdt7Q6Dy7Pz7UU0qxP6J4lpYi/+bz+kDQ9hjZSAe76U
 jlZ6/O0bb9U/qtqCLSWlYuFcsp/+4PYyUSBphJDs2Y1Tzrf2WkgaY0Ow7NhEPSzbvdY53XI8klRju
 ymkLE0qQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQL-0005vk-SX; Fri, 09 Oct 2020 14:31:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 11/16] jffs2: Tell the VFS that readpage was synchronous
Date: Fri,  9 Oct 2020 15:30:59 +0100
Message-Id: <20201009143104.22673-12-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201009143104.22673-1-willy@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
MIME-Version: 1.0
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
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The jffs2 readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Richard Weinberger <richard@nod.at>
---
 fs/jffs2/file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index f8fb89b10227..959a74027041 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -116,15 +116,17 @@ int jffs2_do_readpage_unlock(void *data, struct page *pg)
 	return ret;
 }
 
-
 static int jffs2_readpage (struct file *filp, struct page *pg)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(pg->mapping->host);
 	int ret;
 
 	mutex_lock(&f->sem);
-	ret = jffs2_do_readpage_unlock(pg->mapping->host, pg);
+	ret = jffs2_do_readpage_nolock(pg->mapping->host, pg);
 	mutex_unlock(&f->sem);
+	if (!ret)
+		return AOP_UPDATED_PAGE;
+	unlock_page(pg);
 	return ret;
 }
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
