Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90953D1D484
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfrmyiACDSUiY067bNYspLY7jzsj6rK3XXnaxs2Rl6I=; b=Y92cGDG4iQStK4
	zMQ3uTrHizjllrKJPykmNrYTJrsn3nOC5e5iOTUkoTruNMu2aZBwWYM5/NKh0++E1/a5/2cMeqfkE
	ccJ17wWaWC95cTv5yDIhzGXPr1/69333kgBGMGAVL3MraGvTw/H9gEhF38wIHeWgBWJffZ50JQmZR
	BQEbuqcGTdHutkTurW8mxh++I69Cs+nt0zTy0Dp33E/KrxMzIQatkjlBRO++pwnE+DWGsag3Siod0
	HzQhZQTGEJARaQX8VCm1QciyxeW1zT99gVUoGl4sMloHRQlh/0HGN9z4juIY5aJRNVGmBiBGXtw9U
	HSdSPKpUTtwI5vPl74jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtbZ-00000000KdW-2Lyf;
	Thu, 08 Jan 2026 17:15:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtbW-00000000Kc1-1bQG
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD24160132;
	Thu,  8 Jan 2026 17:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0906DC2BCAF;
	Thu,  8 Jan 2026 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767892521;
	bh=7K9p85kQBsPIELLrgo6Fwt98n+8PhfeVVaYWOCIPo7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U63CS+2SID+lavsOrSSCUalQh3m7FJHBSbAoGL/RmPqzsfFEPGFZGbdZsU6eJQ5v9
	 uneS5gyrpM9Fep8UdIeYQSvBAiMRqLI1WFUiyh3FHuYXqE5c1vvwxIG3liIMSCIPf8
	 k/ZHusqr8jROTU2Z1TsxDbsUhK1LNDoWdcbKukPO67MY+LMNXUGLVwQU5GnQewNeHm
	 X8r3wm4rHE1ZGLA11pFy8vFE4Y2MopFN4iwY1VLCL2ProgfDnPQLN6cYI4h9KECtyI
	 4AKCxyPsXPB5f/spy5jS1w48yjld5OSFSYK8tN0A9KP19ZVyrDG+PNFqwz6ggoTPcC
	 MV+xGBiu4K4UQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 08 Jan 2026 12:13:08 -0500
Subject: [PATCH 13/24] nilfs2: add setlease file operation
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-13-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
To: Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, Nicolas Pitre <nico@fluxnic.net>, 
 Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
 Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>, 
 Chris Mason <clm@fb.com>, Gao Xiang <xiang@kernel.org>, 
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <chuck.lever@oracle.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Bharath SM <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
 linux-mm@kvack.org, gfs2@lists.linux.dev, linux-doc@vger.kernel.org, 
 v9fs@lists.linux.dev, ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=7K9p85kQBsPIELLrgo6Fwt98n+8PhfeVVaYWOCIPo7A=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W76g8a5Sef4VJHMu/SBiKGJBzYZIYBEvZM7
 sa7pofG9vGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/luwAKCRAADmhBGVaC
 FRefEADUL6yifXH4F2LGUNkPDbna2fKnDcbKePeGEDTBWN1hhn9ngEJTm7fpEqb1YRrtPcDp5vE
 +1R/Iwq0TMu23DexViJFHvvST4O2zdxNMDAkI59v1YOXOc2iiFCpeYa3fgo4CrBcHdGbeHnQ1TW
 yLKsPs4Hiey4j+/QdTEm0FCCPpA6W2TAZ2tca3zdwPBZ0B86QYT7n0rZI6G4MQ312DG9n9OmrLW
 wzsMlQIz3mgqAXM/1h9TI3qFLLveP+r9b0eOfIDhTQdfWAqfMCWV7gtBSkEsucAHzGQpD/UmBcu
 1lZrlIEoJTfx2Ds54BP34C/fwPGQ5QBiZAGis4Lo0luqIolY2PA2Ea+BN1LWsf/ygZKWQ50jdcE
 TTddRZkGUgNqpIjWoVl4CetGS/X21/t+55U4WcKz2YOxhxlLBxbvpU+x2jQDf/tFtiPYYA1G2OX
 ctASop1n8K3jd/MYBIGR7Yl7pitBvV0VNOK8wWSbW4xa/EfjZQq7aU7LBwwyNDRzuSl0+AO5WqR
 oAIyaiX4gXhi7PAAbr12kT0TRMF1RVN6pPjpz+ibo4iAsep4JsVSnnpWIuTVRS+iIUwB+gCgQjm
 RZr/YvulgvvUovmoLq8+3kMR2IrDBkO81sWpr19hA92feWIURvJq5Qylyfi8CB5rW1ebshMTKz7
 XusXaUQHgsa1/Tw==
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

Add the setlease file_operation to nilfs_file_operations and
nilfs_dir_operations, pointing to generic_setlease.  A future patch
will change the default behavior to reject lease attempts with -EINVAL
when there is no setlease file operation defined. Add generic_setlease
to retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nilfs2/dir.c  | 3 ++-
 fs/nilfs2/file.c | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/nilfs2/dir.c b/fs/nilfs2/dir.c
index 6ca3d74be1e16d5bc577e2520f1e841287a2511f..b243199036dfa1ab2299efaaa5bdf5da2d159ff2 100644
--- a/fs/nilfs2/dir.c
+++ b/fs/nilfs2/dir.c
@@ -30,6 +30,7 @@
  */
 
 #include <linux/pagemap.h>
+#include <linux/filelock.h>
 #include "nilfs.h"
 #include "page.h"
 
@@ -661,5 +662,5 @@ const struct file_operations nilfs_dir_operations = {
 	.compat_ioctl	= nilfs_compat_ioctl,
 #endif	/* CONFIG_COMPAT */
 	.fsync		= nilfs_sync_file,
-
+	.setlease	= generic_setlease,
 };
diff --git a/fs/nilfs2/file.c b/fs/nilfs2/file.c
index 1b8d754db44d44d25dcd13f008d266ec83c74d3f..f93b68c4877c5ed369e90b723517e117142335de 100644
--- a/fs/nilfs2/file.c
+++ b/fs/nilfs2/file.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/mm.h>
 #include <linux/writeback.h>
 #include "nilfs.h"
@@ -150,6 +151,7 @@ const struct file_operations nilfs_file_operations = {
 	.fsync		= nilfs_sync_file,
 	.splice_read	= filemap_splice_read,
 	.splice_write   = iter_file_splice_write,
+	.setlease	= generic_setlease,
 };
 
 const struct inode_operations nilfs_file_inode_operations = {

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
