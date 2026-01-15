Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA33D46604
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvEZZi+pcsEwSJ9kGKSjJwp0ZeQpJtolhHg6/qgKMzo=; b=4aD3rnybBhWilX
	azGTPVBFcMn09Y6rjJhLEZhECgQ5Jtk1JrGQ5nUyIvht8N7fD/bEomr6ZON6uWMKp4Sd0yhOWRv8G
	xzxnshFERQgrPU6KBMncrcYpg8UDPuYPBCYULK1UgWhy5o+1f7+6lKh/q/rimIPY1l0JHjKWIjdSf
	PWdZJirDkP5MIslZbJwThFZd1jZMFWL0Phy/a7Az3It7DlWDK+a/XUasd3aT+r6RzFMFccMUxTlWC
	QTSD+GUqlqqmEDH85X+cyTGuuEJ+DVPDzlY73+nW+HapTpVefC0mBKnGLlKzGBL92s1JlTSytyot6
	4/bALqgqTrufe/D+9Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRTb-0000000CtHI-0FKs;
	Thu, 15 Jan 2026 17:49:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRTa-0000000CtGn-2gJU
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:49:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED4F9601D3;
	Thu, 15 Jan 2026 17:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA99C116D0;
	Thu, 15 Jan 2026 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499381;
	bh=3GhJ/qRusFZtrc5r83Yz5fW+XL13TprQK4YWfiaNH7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HpFXXnu7ERkPUAIQm1ZPAcxGId6eeLxlE0JRxT5UA4b8o91JC6MhQ6hmR8WhJIGya
	 u0ZPgVTfRojyBSEkyDYI3DwAmQo9WILZExRwe2UwHFCiNlmisjZ+6bSd+aE7ib61oJ
	 kNhQchrck1aUUpJ+OwOj/fCqXIwNg0ZxkdeofNkXA7xP2g7DfotgAEoSVqgkuY6SM5
	 Wpz8EZYj9+4Xj3LStuJyRf3j5Keqh7naAgj8vpr+lOmqqV4kroZVB7N0Bl859ATYgI
	 uzM5fmBJ5J7caSvvjP71MlmxnFVv4DuzFN9zwjzsgrw+/9iNkIATGHL5NAfE8fKRC8
	 k5qPRrxpUVgbQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:46 -0500
Subject: [PATCH 15/29] smb/client: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
To: Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Amir Goldstein <amir73il@gmail.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, 
 David Sterba <dsterba@suse.com>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, 
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Dave Kleikamp <shaggy@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-ext4@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-unionfs@vger.kernel.org, devel@lists.orangefs.org, 
 ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
 linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
 linux-f2fs-devel@lists.sourceforge.net, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=3GhJ/qRusFZtrc5r83Yz5fW+XL13TprQK4YWfiaNH7c=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShHXNqSO0AaJtAQ6e0iebWGL9gXuZogZL4NQ
 nd3994d03SJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRwAKCRAADmhBGVaC
 FcJZD/995y2baNrZV9uOL0TNknTnSY1b+KmL3xbwd6ELV1X5P9GTRow0w8qgNhTp6DEdep17Xnl
 lV5nNz22mRp/8t/3leQwRnNobdVyWDmG+86VPwmUWRp3avVeIoa2Hq0+unljlviLLfMZvqyYy/P
 Kxs6fTJykAgSKjLX6C+rJOV1Mp3siFq7qgMalb81NvBiX9zHp1owHcyMqSQLk6dnRVhBpwvq8Yr
 HCE92A8xDJ3Ip129dtLuJhd2DRJMhmD7P0OezVt522x2tAQ1uGW9+y22/6QjAyty5uFASKCHvSI
 w3UV0CUln2DLh1/ExYGFtAVStJTrIxdzaoVBW95Wv/hqgnHPTA5ZPK9Mb7x6p1hGhTPsJyTJD+D
 ZfwxsjYG9BWi0T9CmUy63xFCzNqUQ2yS/5IVjEWwR90w95fFyvbdRWQqfBLXJR7156JlOwG9lmm
 LvYK/T5yQAN1YkPNeGXb/ojuDS1Qhax9xPuYWlGmJhpq9kmhgnNhCBrmeRxuXoSdsL8s3e0HFVx
 wPMeDrxdnCq4FIgMAjIVmEOYsxOVRowPOzVRxqVmY6La6z0MHQ1RC9VLmEOUHKcW5IQjJLDb2ld
 98lJr3+W1h6zW0rigSWwt4z1k87pChOwiG5A2qRhX7v35TRycTLzvQDQnkxDqIXyxoiRfeYXqGm
 8SLFEajMop9ifew==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
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

Add the EXPORT_OP_STABLE_HANDLES flag to cifs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/smb/client/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/client/export.c b/fs/smb/client/export.c
index d606e8cbcb7db2b4026675bd9cbc264834687807..c1c23e21bfe610f1b5bf8d0eea64ab49e2c6ee3a 100644
--- a/fs/smb/client/export.c
+++ b/fs/smb/client/export.c
@@ -47,6 +47,7 @@ const struct export_operations cifs_export_ops = {
  * Following export operations are mandatory for NFS export support:
  *	.fh_to_dentry =
  */
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 #endif /* CONFIG_CIFS_NFSD_EXPORT */

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
