Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A04D29C40
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrCKP3y8Jl8ODqfVCCxf8ehYYeB+IPUbVRTJ2di649w=; b=pu/msokcInJsav
	lwGUG4GhxQQ+o2gN/BE6eO9NLbjb9zf1oD1Blb6R39up4CL3ZXXU9pqjkVPfU72ZDZDANMKOnIpSX
	3ZHImNcpIZ0t5QHxa9aMmaM8vO0VtgTpZUKxBFVdBKyZHbWcJtVlPI9bmCsQjFQdkhtQJi5X2EcpX
	DrvajWmaIQovq8jguap9ahbfe1fY03ZwKG/j+itqmV1+Jwg6ClNODhIOwkL59RyWx6e7S+/0A5Qtt
	aR9k3lOU50QMnb7RpaZlXOvj6EjVM2fIRJY/lWVIBlRpqUirkP0JXN23tlz2boSD2DYT+OYtZSkCC
	NlQeuIGN3099limcc/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9R-00000002UrK-0lJt;
	Mon, 19 Jan 2026 16:30:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9K-00000002UpL-0JO8
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 609BF6014E;
	Mon, 19 Jan 2026 16:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B28C19424;
	Mon, 19 Jan 2026 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840241;
	bh=Zmo+do6HqZsZlZXVQKKSsmbSay6qOtqCBcv8Ip3ODxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L1drpzmOZwhS7wO9cwa19VSsy80i40QcyZlAaGZK3Yn+eev1gLy2tMLiqi6zsQpcX
	 g/gWqsJHMJQgBaVzW4ZFeciI1NUhgPlNi5wWsbXGgGL4j0Uv4T4IPHTMt37mKkUYzz
	 UD4RtogawKHmef7uBWR19MHXmO2cT1auakcTOXeY4PVe27C6i68OoaNwBKad8GnDtD
	 d/nyC4L6XNekUDohSQC4guagkxmqlyAdRj+IVSfTfvVlbK4VUGfXBnjpoUTMP39dmf
	 w5jxXL9g7wxExeBthoaxz8pkLK5ytzCmZJipo8hAi1qkrPrOUFFDoHfUqo2F6DW1bS
	 Cas8WWW1oS0SA==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:45 -0500
Subject: [PATCH v2 28/31] fat: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-28-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Zmo+do6HqZsZlZXVQKKSsmbSay6qOtqCBcv8Ip3ODxg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltgaseKc8dYHUYRj77eGOmyavKVHMKU3e7sZ
 sLVNVNiAJmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bYAAKCRAADmhBGVaC
 Fe4cD/49CNUs86PH4v3uTOUHN5kkn9aZB4X8mzMOEw4J/AAiuF0Tml48ByLFtTTwHiqIZrKm2Eu
 x/gkwXTZvO40kPoyN5fIytK8K0yVjl09hrx8Rc9gwq0iGOtxQ7hdMwP35a/JbGT22DLjJONXGnk
 nRgl2lnb1Y2E40m4Hg8msm2FFmpQDusi9gIyl7OLVbIF5BHQ6tF+jnJ0DKHKQDN1MihKoHBbsXw
 OoxRSrcERSMtIY3oqeV9rzbmFmCEeOcFIM5XY+s2aMQE7vgt8BQKML+7avl/HqW+PEZHum4ZKu0
 a96hkWCBzhBniSGFHY78LpqWIV/41RMKi+a9ipC7ltAdNP69CN2VynIyliSsXbKcb85Q5RCaI6a
 iKydYxVLdL3c2SRkPqHe+m9LsbpCzRbOkEuP++7a45+g5/TU4Gcr+zfJ2ZCT5EsA8rU8KaXJBV1
 41BZcMEXMUTK98bUgMNZoBDlYca6mxL0Ldrru8nrqHr6JkrwGZrQFA7i+ztcA8+xSNKoUf7j/JX
 BDHFLN3lZrbj4ksk4mEN/6FV2y6MNHt9vS8x425TyotVmlwlsCG1NOtCndEL+VOZM/PenzdlEnf
 lFXckOYEqH6cS10AeacCinqqkjHbooveZGMvtPbqnMOniZUQv+cdXig9LrFKv+06zxNZikuiFlE
 F3LGgWPUpQR7npw==
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

Add the EXPORT_OP_STABLE_HANDLES flag to fat export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fat/nfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fat/nfs.c b/fs/fat/nfs.c
index 509eea96a457d41f63f04480da32aceae75a8a4a..f6a5c8c4f5e8a14e549b5aad6643d490f1d062b1 100644
--- a/fs/fat/nfs.c
+++ b/fs/fat/nfs.c
@@ -289,6 +289,7 @@ const struct export_operations fat_export_ops = {
 	.fh_to_dentry   = fat_fh_to_dentry,
 	.fh_to_parent   = fat_fh_to_parent,
 	.get_parent     = fat_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 const struct export_operations fat_export_ops_nostale = {
@@ -296,4 +297,5 @@ const struct export_operations fat_export_ops_nostale = {
 	.fh_to_dentry   = fat_fh_to_dentry_nostale,
 	.fh_to_parent   = fat_fh_to_parent_nostale,
 	.get_parent     = fat_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
