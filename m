Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C045C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:16:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47B28217F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YBHEuVx6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47B28217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1k+CsoccBxg5MvQ0W9dx25hCXdyF20RVTlGVbidyPg=; b=YBHEuVx6Tza1jj
	ymnHPlxdU+b6Hgmy4ucLkAsrnjg/O3FWSp01Rmozeod4H8/HXl1ZOXUOEfDp8aYqCrk2uYmpVQ0BW
	P2GyZBIk4Uly0EAqeP+aZv9t8tgRt2czvg9jzIy1zOtP3/0skn6+O5nh1XSNVEqybGWo4LShacrPv
	S9cjJaGIOcZxphb/XqmhH/zFCfDmfjboF0/nJ7RmbLEXiWgsbFfJxRwjW9As1qsGMOaPKcVRYQEOa
	AxvUQWW7SMflxlS9x5H38f89hSHHeljo7fT616N8IwxEczPFklvVOyIAc6A78K5K2EoYxTN1cqTig
	lGQTsJmH5EL9f3DcQX7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4TyM-0001Hw-5r; Thu, 14 Mar 2019 17:16:50 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4TyH-00016m-6z
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 17:16:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 06E4C1802DF6C;
 Thu, 14 Mar 2019 18:16:18 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] ubifs: Simplify fscrypt_get_encryption_info() error
 handling
Date: Thu, 14 Mar 2019 18:15:58 +0100
Message-Id: <20190314171559.27584-4-richard@nod.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190314171559.27584-1-richard@nod.at>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_101645_827481_A6D94552 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: tytso@mit.edu, miklos@szeredi.hu, Richard Weinberger <richard@nod.at>,
 amir73il@gmail.com, linux-unionfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, paullawrence@google.com,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

fscrypt_get_encryption_info() does not return -ENOKEY,
there is no need to handle this case.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5767b373a8ff..b0cb913697c5 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -526,7 +526,7 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 
 	if (encrypted) {
 		err = fscrypt_get_encryption_info(dir);
-		if (err && err != -ENOKEY)
+		if (err)
 			return err;
 
 		err = fscrypt_fname_alloc_buffer(dir, UBIFS_MAX_NLEN, &fstr);
@@ -794,7 +794,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (ubifs_crypt_is_encrypted(dir)) {
 		err = fscrypt_get_encryption_info(dir);
-		if (err && err != -ENOKEY)
+		if (err)
 			return err;
 	}
 
@@ -904,7 +904,7 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 
 	if (ubifs_crypt_is_encrypted(dir)) {
 		err = fscrypt_get_encryption_info(dir);
-		if (err && err != -ENOKEY)
+		if (err)
 			return err;
 	}
 
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
