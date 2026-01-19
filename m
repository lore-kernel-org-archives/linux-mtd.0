Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CC7D29C46
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LecS/oGTyRuQVbAffWd6e+9lVZSpxrD9bcEPwPKage4=; b=tQfLsHqMF2l6Xk
	MulVMqcLd0dql0qTzNrthPGuJvzOMy4Sh8uT9OhsAuLweTN+L9BhhUH7ixesT6pmROPwCn1mIijJT
	Q9fJIyDgUcUZ5vNedxKIlZtSeDz7RHDc+lFGP4Bd45GGBRUxvXlIB+h8kij0Gh0/R/aHn7EHVRTtI
	4EEXAzRqMRyT/K+zEdadhPU4lLhTbpdbKY0b4A5zWXGQc6w/85zsvbYn3DZvcckidrpAcm6XU2yb7
	CQBYBDlxz3gy14g3rzc0H7EoaH0KYjOViAf2RKUZg/cZIXIqymqAH2/+P62eYerYoMEkzrEiAGXGM
	8IisWHcNcZ2iRPNj1rBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7k-00000002TwD-27VL;
	Mon, 19 Jan 2026 16:29:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7h-00000002Tu1-0KGe
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65B9660161;
	Mon, 19 Jan 2026 16:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF63C2BC9E;
	Mon, 19 Jan 2026 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840140;
	bh=eujLaXiTUgNyjxHmQdWX3y0IvgSLWTxRgF6WqDofLiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GbZu6FSOp9WcyI754uBOhgiC+hjbrXb3PEhujTocCOkmPvnvAp4bCQ51iP9+gkdW8
	 B4a0JL+gvg9zK2migKuOwwdvrS3+/frWzLC3e9RUxOa57kczpOLuGHvF+9UoQO+7GH
	 CS98+DwnQ29MfmcJDLTXTBDRw9pFlkHHKAeT6cQ2crbJry9uJuena0SneoU3gr+yWI
	 qE9fhRj3q5X1Z+wQYlsf0PHhw7hNi2jqRuQMj9GiIBD4pd0zhhzpuoKfcs8m6hwxUx
	 a16UuQnjs7UT6hSVV5xwRLY1Y7ho2OOQUOkxAhejP7/sILT14iJoJ7t8DA1CNNdnx+
	 U9nZaR2wlvxjQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:31 -0500
Subject: [PATCH v2 14/31] affs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-14-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=eujLaXiTUgNyjxHmQdWX3y0IvgSLWTxRgF6WqDofLiM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltcWN14PEo1Nujn8uyUCyf+Ml83lXSAsDawe
 D9CEC+RNLaJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXAAKCRAADmhBGVaC
 FTJtD/9D134+/6m7eqi2XFu1Ldt3x6QxfDXalFHVzNVlyX155Qtn9qZi4UXAEKjVe2ODkcTVGpO
 11UPI11wgMKn6loI94fVibr9SKlYAahySdpRnTFj/gaHvNSE+0XntrP+Wr3YvA8n9z0qPcqDSTA
 UvgajRyM61rTAYFsGEgtMaq0cRaMlLr3lpA09Pj1xLSFMI4kNUW4+WhSca7PAth/rIjGubVUIrg
 o3LTy8kWsW+ssnz/G3HXpjXU0sa8z5kUrFymZvow2N/5DOHQoOOPMz2tYopAhK+wA0WMiHlPYEP
 V7QKF5XNckiHhNp0sVvNHLOWjppYh3i0G7B5YINXh/Gdt4IcBYvJCzqXNcdqzXAxycgZ/J+YMqw
 5NJw7rXYzFjI997ZGd1XI7m6Y6qSX/cpBEHF+RNlLEYs24Bl6WF2B/EHAJdG/41L4XVIYd2XJIb
 00nVd6iFRkEAPdwVvfHBaBhF5wJfx7QlX3ei/4zp/5Lx0u31MQzjOsirPhW0DNwTtPE0y6enzFg
 Oj/GgrylYOHwkrdl3HHAXJpgMynZVpMDPuVtBuMeKYUDE0ZyXgLSPE8/dd0B5zNW77fNX0kNFET
 gLNm9ggSsGI4QKY1GLxYdtW6d0d6wArslnUBsgla+v/Z4YfNSBPrvAKrXiRE3zatrUAolw2mThU
 euoEInqbxcQA6UQ==
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

Add the EXPORT_OP_STABLE_HANDLES flag to affs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/affs/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/affs/namei.c b/fs/affs/namei.c
index f883be50db122d3b09f0ae4d24618bd49b55186b..edea4d868b5131fa69912655879231912ceff168 100644
--- a/fs/affs/namei.c
+++ b/fs/affs/namei.c
@@ -569,6 +569,7 @@ const struct export_operations affs_export_ops = {
 	.fh_to_dentry = affs_fh_to_dentry,
 	.fh_to_parent = affs_fh_to_parent,
 	.get_parent = affs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 const struct dentry_operations affs_dentry_operations = {

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
