Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AC8D1D480
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XoiCF/5yC7/quDKFZB/g9aM3uIVJ77XgWRpL/jPcts=; b=mauhG2a29UoZRL
	BmbY2JaoOFjQJ1GIIDl/fvWiZgKit4E2TwQ8v0OzZ83H1TG2xZORbfashUQISZ988cBVPU1/TsKeJ
	rfboGNV4isWHYRJV6vj/uVIiuGHsCEkj+/uUNJZqGcnYyCzxLRhmyIOvwegAtuP52mAZknPtw3QFz
	7euJYYPlIhtHN1BveNypgi/fuYl1BsbP5lgo5EyGe4nX6AOJ4NaiI54ZN3s7xQBFfNIE3VclEeP7x
	OZk0TTaLBr6podnTYfZLnP4PdwoBlnBFhP+2wjsPxcYTx/rBnRR4WFpli80+lBpInmPJqVzQquhw+
	mFHgEEKgw4wcupi9AEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcc-00000000LXS-43mY;
	Thu, 08 Jan 2026 17:16:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcU-00000000LMm-2rRB
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3859A42BAD;
	Thu,  8 Jan 2026 17:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9066C2BCAF;
	Thu,  8 Jan 2026 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767892582;
	bh=uKAoYiUzb2k4mWk3DPDn1qw2MlMadC9ZK+Ro0COSfEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N+KAwUSN5aLOeh58U18x1Ce3wnLpBZV5zhe4kxwBm8fPRX5wOYoSQkrqxYodHIYXJ
	 aw/tNdkO6s3F+xmbKKmGdGwZPQ7OcAFF6cZu+pkYIBzXkHIXu/l1HGZ9m9oVzb233T
	 pb1QsAcwbdSOEG0g3hYn9b8h5rMA3FQ1auQxixaZPSb3Gnid38yhHfa7DN45lRpFNy
	 HnYLVP3j5rN6nuQ5tFXKqOBNLvl4XnhrEDVD/oaSpKYeACD6sLQ5WeBkAwtRRf89Oj
	 Mszb3PGelES2eFWGjjvA1vTJCZKTNjzsErMgOooBsTzqIDIIX6sREpum3rJfPfbZjq
	 ncrWyVUiaiNNQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 08 Jan 2026 12:13:16 -0500
Subject: [PATCH 21/24] ufs: add setlease file operation
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-21-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=uKAoYiUzb2k4mWk3DPDn1qw2MlMadC9ZK+Ro0COSfEk=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W9x3bW7J65LYqA4RAoS8vIXUjkwwPn2jjsp
 UmXLATAbCmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvQAKCRAADmhBGVaC
 FSNEEACZcBsWRq9qFYTe80h8vRRw2k3rdL23HiT2BsxfSAAZFyBsEvwK9+kuhY3wgeDrU4j9WnH
 /GIsJmvdTFgf55rZbEZRkM+UjSpTNkca8KYJYfCKqOUpyDrGNxHkRKAibGXOuEhKan0kUm3i96K
 UpbDBsdke1UPupTK3TAK6QO1LnUpZROD/waUOPEAqTpxmgOGUircRjljFXwTtS4WNtwDpwaw9/v
 59rhsifvhQg50TiVS3DGlyav9p3uOTznw2pu1n016JFbPDKtUHQQTKWCFllVRGBBN0SrVjUZCvZ
 ysFLmyL6FEXsBc06lpevB/4OZTOHEMAKH6GCviniXzi/Q9mNaGzw7SywSs2UpLRuBEl1F0o2nC/
 gSEYJYJtSUyPrcLRO+sqctPdB0z0c9N5ja1qbzwPysDOGONbqHHZRAwl+/fAm03pvjcgj+Ek4y1
 z4l9I32yHoGA0elIfZ94CnUbSLjHhHp99E6+gneCtLeJNF/V2UdqW8YbC7syjZmYsL9/32uBR+F
 Y05Bwybcvu6omNnCSV8mOat6qwJVat/Xp9cczO7bcMz5ufYYpeQfx8tSA4zKqAhTV7fCQ+3WbrC
 B4bB30ktO7leILwAVHcE6hs0zFGzhxVYBn5+WP2mhpy5Eq42GL6xsEhdCeW6GB9eJoBmuml53dB
 1zKY0MNAGgIkj8w==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091622_887244_BBA47ED8 
X-CRM114-Status: GOOD (  11.85  )
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

Add the setlease file_operation pointing to generic_setlease to the ufs
file_operations structures. A future patch will change the default
behavior to reject lease attempts with -EINVAL when there is no
setlease file operation defined. Add generic_setlease to retain the
ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ufs/dir.c  | 2 ++
 fs/ufs/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/ufs/dir.c b/fs/ufs/dir.c
index 0388a1bae326ba41bc03471fcb7ed01098a707d8..43f1578ab8666a9611d4a77f5aababfce812fbe4 100644
--- a/fs/ufs/dir.c
+++ b/fs/ufs/dir.c
@@ -19,6 +19,7 @@
 
 #include <linux/time.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/swap.h>
 #include <linux/iversion.h>
 
@@ -653,4 +654,5 @@ const struct file_operations ufs_dir_operations = {
 	.iterate_shared	= ufs_readdir,
 	.fsync		= generic_file_fsync,
 	.llseek		= ufs_dir_llseek,
+	.setlease	= generic_setlease,
 };
diff --git a/fs/ufs/file.c b/fs/ufs/file.c
index c2a391c17df7f34d9961973909d1985f5f786e92..809c7a4603f863025caa947b2e08f0c2922ad619 100644
--- a/fs/ufs/file.c
+++ b/fs/ufs/file.c
@@ -25,6 +25,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/filelock.h>
 
 #include "ufs_fs.h"
 #include "ufs.h"
@@ -43,4 +44,5 @@ const struct file_operations ufs_file_operations = {
 	.fsync		= generic_file_fsync,
 	.splice_read	= filemap_splice_read,
 	.splice_write	= iter_file_splice_write,
+	.setlease	= generic_setlease,
 };

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
