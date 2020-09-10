Return-Path: <SRS0=L51Y=CT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33593C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 14:49:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F6E21D81
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 14:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FvTgc3F/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pqbq3hLU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0F6E21D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+IsJZZuxfLZlui9B+98/BdXzhmmLnrSInGI1ScNfrCE=; b=FvTgc3F/yDGhZhrjojroIJ5GE
	4PPk4QKGWOni0R2mByOXVPAhFZwwdTlxHqrYdWgoCowvEKJoRlb8/ySB9b+1/nGQ+RKGgQNsighN4
	XI41smd04LR2OR4EPBFauKM+lZQEbtFUwENcN33oP+87OK952ldBKph4N8XL5Lk1xpeMaU9JDg2uG
	/sJwHzh9e76EdOo+k3zxDVnmm3A9KeAH7CwZvrj2Eu7DdY7tjwXl1fce4Ye5sm6HMwBcWby/3F06c
	k4orLRPyhywCuU9yWdjSOI2rP5fQPUC7nRqvgMqtjdNWighXgHOA1+OhVvULIQf+2QMWwVT7kgpDq
	HZ5kAblaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGNsO-00034r-G1; Thu, 10 Sep 2020 14:48:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGNsM-00034Q-6v
 for linux-mtd@merlin.infradead.org; Thu, 10 Sep 2020 14:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=bCMdefcbVNK1n/7kExQP4kHzaTJA1/jyiOiumdm05Vg=; b=pqbq3hLUr/RK0sVYON+22CBoDU
 7iSshg/1l8TWLuQVYMixMDbnZc1Hg5HnvmYUIcilUUJPk0Is/ohirNDQMPb3QGq2IhpRqrYumSJgM
 qZNRFRy7RKH0RISBXjgXQ/6kSMbPIbfvInVxWG5KMegLf+D07GbBvZSsvoHYoWCJBCkj5tS529ttl
 H4dhhGbPsRx08exHjwjKb+Y9W4tkJo0BuuEYRed+LbTrVG1rtVUhVxXBLXfOXI4qJO3c8HFdVJFWC
 TBzwWpycopMcJg+pMD1kfumXoKQ4oHaqbvTG0Ty3nCsN68OEsQx0cQrn9lfxrLzcI+1g0+pPzFHCl
 BsAO6FNA==;
Received: from [2001:4bb8:184:af1:3ecc:ac5b:136f:434a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGNsJ-0006vW-8P; Thu, 10 Sep 2020 14:48:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/12] fs: remove the unused SB_I_MULTIROOT flag
Date: Thu, 10 Sep 2020 16:48:21 +0200
Message-Id: <20200910144833.742260-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910144833.742260-1-hch@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
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
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The last user of SB_I_MULTIROOT is disappeared with commit f2aedb713c28
("NFS: Add fs_context support.")

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/namei.c         | 4 ++--
 include/linux/fs.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index e99e2a9da0f7de..f1eb8ccd2be958 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -568,8 +568,8 @@ static bool path_connected(struct vfsmount *mnt, struct dentry *dentry)
 {
 	struct super_block *sb = mnt->mnt_sb;
 
-	/* Bind mounts and multi-root filesystems can have disconnected paths */
-	if (!(sb->s_iflags & SB_I_MULTIROOT) && (mnt->mnt_root == sb->s_root))
+	/* Bind mounts can have disconnected paths */
+	if (mnt->mnt_root == sb->s_root)
 		return true;
 
 	return is_subdir(dentry, mnt->mnt_root);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 7519ae003a082c..fbd74df5ce5f34 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1385,7 +1385,6 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_I_CGROUPWB	0x00000001	/* cgroup-aware writeback enabled */
 #define SB_I_NOEXEC	0x00000002	/* Ignore executables on this fs */
 #define SB_I_NODEV	0x00000004	/* Ignore devices on this fs */
-#define SB_I_MULTIROOT	0x00000008	/* Multiple roots to the dentry tree */
 
 /* sb->s_iflags to limit user namespace mounts */
 #define SB_I_USERNS_VISIBLE		0x00000010 /* fstype already mounted */
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
