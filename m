Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6D9C04AB4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 19:11:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1EA820644
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 19:11:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="axTRlKiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1EA820644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gGe7jLdGfhTIj01trSdaGtFGrDl59E76Tc6LSu1Iiqw=; b=axTRlKiqbdGSP0CPDOKqaRauDX
	HqllySB2acM7cqbVqfkt04WkhwfUy4zH9pHoenKllPvOrgq581ybZLmqV6zzdrH1HBo0qHGJu5NJA
	EJDj92Lo9Z8J3BWn80VG9YzT/U7dHjO7ReGLBCnyT1/E2bdXmohn9wqOJN8knART4aoL/lCQSSWOT
	3p5XOCaeP1qEvp4ygXrVyu0Ixsn/WCVjmKg6AzmbP6EzNDnX0WAw9cWGePl+YXHTzejL8YJO6ENZC
	q2Dj/Hu4jmhMc0eJavnUNoABMj6VbgTUh+TOPXUqHVCgb+vRrQtZpUvUTVo9AURG1/3FjkhjNeHbt
	cxFdpJWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQcpc-00046d-8G; Tue, 14 May 2019 19:11:20 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQcpS-0003xS-JQ
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 19:11:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 15C951809AD8D;
 Tue, 14 May 2019 21:11:04 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] ubifs: Convert xattr inum  to host order
Date: Tue, 14 May 2019 21:10:50 +0200
Message-Id: <20190514191050.13181-2-richard@nod.at>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190514191050.13181-1-richard@nod.at>
References: <20190514191050.13181-1-richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_121110_855798_E03CDFCD 
X-CRM114-Status: GOOD (  13.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UBIFS stores inode numbers as LE64 integers.
We have to convert them to host oder, otherwise
BE hosts won't be able to use the integer correctly.

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 9ca2d7326444 ("ubifs: Limit number of xattrs per inode")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index acab3181ab35..bcfed27e8997 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -527,7 +527,7 @@ int ubifs_purge_xattrs(struct inode *host)
 		fname_name(&nm) = xent->name;
 		fname_len(&nm) = le16_to_cpu(xent->nlen);
 
-		xino = ubifs_iget(c->vfs_sb, xent->inum);
+		xino = ubifs_iget(c->vfs_sb, le64_to_cpu(xent->inum));
 		if (IS_ERR(xino)) {
 			err = PTR_ERR(xino);
 			ubifs_err(c, "dead directory entry '%s', error %d",
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
