Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B3ED29C45
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=957aHEVpKu35PXdfcknpXy2UM4t335qcPfC4fbI9a6A=; b=oXTQN9dNPW4LCX
	UxOvwOr8W4/fmya7PZtmKEGVbW6toSa+yEUXeR8yiiwon7VispyWyXbrklGaU65F7/zQV8JNqdVA1
	aGHmfM2tlX/IpToeR/bE1ksnqf4WPVJvb5g2rPsuytu/tO1ub6+dElnuYFU912cy3Z54NOgGidTEk
	7i3ofhGFgNi8jKDLU7d8V/IYo0SJfjer+rV30k7na64LOMAtUsYWNcX7q5f6Pd7dqt54KJyFfL3kE
	3HKHpSesvACOR1jbrz8gzV4fA8mie3U4qPFHDAKIs5I5gRA9tcpFxJ3cumhBMG2QGtODS0R6jl5MP
	yLzG9ozskxiNj1vGvb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9d-00000002V40-0wsq;
	Mon, 19 Jan 2026 16:31:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9Y-00000002Uz0-0GOM
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A92AD44507;
	Mon, 19 Jan 2026 16:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71889C116C6;
	Mon, 19 Jan 2026 16:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840255;
	bh=XGt/aZzfGK9zJQOZBzNGqpMmieKmh9kJIK51xGoE3lw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aRe9D5Sa7gMB/Ryp1GcMwBIJ0XwKuZ6UClP6Ug45QHAha8tYj9mJ1V510E+A9msBF
	 uIhFQ4ERVA2/a/89lazW/TqRbLmJXCbnATean6EIJEuIz/669usXdDh3OAv3cCVNyN
	 153NxFJ5bXU00TkkzzXLWoUrW/pQLk9vKivAvy3EIK99PwQxTlxQfnsqWQCzOs4xkV
	 djsQKErslPGQtEcNguvZIqh3BSoWwOetopyqoeBHApuQa2uwYZV8JERw+NxlC0nR0n
	 fOEHc48tTPF5j3kPLorwmV32bUWcgE0EFzjrgIlJjLHAtcT1r/8PEQ677OthtO1AHK
	 xGnYGFr1AXgiA==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:47 -0500
Subject: [PATCH v2 30/31] nfsd: only allow filesystems that set
 EXPORT_OP_STABLE_HANDLES
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-30-d93368f903bd@kernel.org>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
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
 Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: David Laight <david.laight.linux@gmail.com>, 
 Dave Chinner <david@fromorbit.com>, Christoph Hellwig <hch@infradead.org>, 
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org, 
 devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev, 
 ntfs3@lists.linux.dev, linux-nilfs@vger.kernel.org, 
 jfs-discussion@lists.sourceforge.net, linux-mtd@lists.infradead.org, 
 gfs2@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net, 
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=XGt/aZzfGK9zJQOZBzNGqpMmieKmh9kJIK51xGoE3lw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltg313cW2t8STVH2Q3f6eFFX8webaAfx8DOM
 GA1WXTggo+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bYAAKCRAADmhBGVaC
 Fd/6D/9j/oMVrJxeP2Mfuffs6X+mbihS90psuLoEJKbrjqZA7FdFGxRNUgHxspeg1JxUtDbEv7a
 uU4kSCajVCH2iOyDZQHDvyYwkkXW1+PdbM5uKZ/7DFLmaIxhriGPZjNE6IzpuJN48O73ngtU1bb
 P2CJLYNkWnxIJsMzVQaL4bwkbCVO8za/peoBtCgsO+8VOphfgjUEt0WDcgBxDOZdExrFOuNZlkA
 yVOd7lxKLAhNKynWzgdAd5sKikhudMp/54M1K2PccQWIGPdcv4xFGVS3GiU/csV9NzJSKjvCtjJ
 /K1MhVCHGVNaobSkaid3Tly/fXK4uha201p7DIspoVEewSSSXnhx5x0x3aBwwrld/gCO/BQlsYK
 5rZ2YOFFh/4TRhu7Gv3uRLHaXPpBIvj1iq70FX22A77FNzSrDm4qhCKISIaOPMyLDSI+t5ru9TZ
 j58AKvcl13B3sxdRak3OQWP4MHJncRuHJGlvXrEQaBf/aD6jxo0U6J/EdF0tJYPIILxRvkYndIB
 QsuTvSgf109v+B3Im9IKplrYJZ1er53jnSi8MzCOscRy3zHvch/igrvKIj0Mqnwjj/FRsnpuadV
 MVNdABzxnuvzbDIRfClDT3ehoVXweeSMvlteptmwg0EHO/sEA5XJWFSZvKdtodlu7Pj5Cn4Pepu
 OBCy4/+aVtv9EqQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083056_145386_9AC4D379 
X-CRM114-Status: GOOD (  14.30  )
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

Some filesystems have grown export operations in order to provide
filehandles for local usage. Some of these filesystems are unsuitable
for use with nfsd, since their filehandles are not stable across
reboots.

In check_export(), check whether EXPORT_OP_STABLE_HANDLES is set
and return -EINVAL if it isn't.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfsd/export.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/nfsd/export.c b/fs/nfsd/export.c
index 2a1499f2ad196a6033787260881e451146283bdc..bc703cf58bfa210c7c57d49f22f15bc10d7cfc91 100644
--- a/fs/nfsd/export.c
+++ b/fs/nfsd/export.c
@@ -422,13 +422,15 @@ static int check_export(const struct path *path, int *flags, unsigned char *uuid
 	if (*flags & NFSEXP_V4ROOT)
 		*flags |= NFSEXP_READONLY;
 
-	/* There are two requirements on a filesystem to be exportable.
-	 * 1:  We must be able to identify the filesystem from a number.
+	/* There are four requirements on a filesystem to be exportable:
+	 * 1: We must be able to identify the filesystem from a number.
 	 *       either a device number (so FS_REQUIRES_DEV needed)
 	 *       or an FSID number (so NFSEXP_FSID or ->uuid is needed).
-	 * 2:  We must be able to find an inode from a filehandle.
+	 * 2: We must be able to find an inode from a filehandle.
 	 *       This means that s_export_op must be set.
-	 * 3: We must not currently be on an idmapped mount.
+	 * 3: It must provide stable filehandles.
+	 *       This means that EXPORT_OP_STABLE_HANDLES is set
+	 * 4: We must not currently be on an idmapped mount.
 	 */
 	if (!(inode->i_sb->s_type->fs_flags & FS_REQUIRES_DEV) &&
 	    !(*flags & NFSEXP_FSID) &&
@@ -442,6 +444,11 @@ static int check_export(const struct path *path, int *flags, unsigned char *uuid
 		return -EINVAL;
 	}
 
+	if (!(inode->i_sb->s_export_op->flags & EXPORT_OP_STABLE_HANDLES)) {
+		dprintk("%s: fs does not provide stable filehandles!\n", __func__);
+		return -EINVAL;
+	}
+
 	if (is_idmapped_mnt(path->mnt)) {
 		dprintk("exp_export: export of idmapped mounts not yet supported.\n");
 		return -EINVAL;

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
