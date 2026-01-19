Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02B2D29C41
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=miWuE2lOJ5VARJodokglmflEQwigK4zck7XeQRu4taU=; b=SOwzjrH3ItQo7A
	61vuYt1XZf20k60HyfzDP6SocjphqCWnbdplLF7lufnjVJDP0O3YhD7teRptfPKqby2DBATGQXq+a
	60HdNMc0JQkdNMi/YS55Y+3g9KjsnhQzrmhSEWjlSoULk60rM2esHyItxniSzquKKsT4t36BxWvrY
	mapLq8VnkCS7aqNlmktTYGuxrq6EL7Rghr1qV3krmDK04t6zQoX2np/PpvAXN3gde88kaWgF+xs8P
	2TO0nfFda+R2YzR7Cm4z6Ilg/q9+VOSF+6e+W6luWXJSHbchHjMJS6Kh+/lZAFKuz5KZKfWku3rSx
	yw7My7/drEKCFgVr+Dzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8V-00000002UQB-3ysL;
	Mon, 19 Jan 2026 16:29:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8V-00000002UP6-0SzT
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C2B460161;
	Mon, 19 Jan 2026 16:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150D0C19423;
	Mon, 19 Jan 2026 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840190;
	bh=Vx1t81IxwVBJSLqIX9vPVWngNZL8liRiNm1RYHvLCvE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s2NIXch1qvgEgJVzeJHUQ/vYQrQNBRHWLVh+5uTV5BK04joiphSTx1rGYkzsL31u4
	 sy/FhwtpHcIaa7AzhWzmP1tuedcD3fA1mIsJbAZaKfMRItyC5XPc0SgEWTOTxw9wSp
	 x9Gbg+hrOA0pd/sDE6jmK9qhWzMpvTNFHG2fFTvutD/erMWglJ3sfK9nQEcmfsdkxd
	 byO8N17f1N+uRU1ccMBcTg89fYHra8qPAl+OamddAUNbEuYWNuIhLhvY7ePZNDr9Ww
	 0bxyA6SjcNDZgRc+BLZh/E871afYJ64+YGs3KB46gQOF5J5UyAGHKPLIlR+1WE9QM9
	 FNrRDOuqBtl4Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:38 -0500
Subject: [PATCH v2 21/31] nilfs2: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-21-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=741; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Vx1t81IxwVBJSLqIX9vPVWngNZL8liRiNm1RYHvLCvE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltevFy1oH+9TGZ4tJg4adzFVAm26w57ZlHqh
 gzds6mLNJuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXgAKCRAADmhBGVaC
 FVk/D/913imOVzFf9dOyb6hCP9vK9aa0EKgm0XGIWuOXDiuJuE8iujL9QyuKBIEz8pjArI6pF6s
 YmQowEsKwGVIOcvA2l5D0cDnY/f1iklQsimK78XdRpHRVsbbjB0dmG9ty+CtlfCQPTf5u2wq0gk
 fTb5+p+BgYd4C1gov9SnxGb0Qc4s1X3PIIbCi6iFVl0e2J41wuqRNY+dYE3SDDNDvZ0i/XeUe2o
 +FuQghmlONCx17pc5ATpLql4aEGf1HlIQsWIlc/zUYlRz59sJC3ed2qWOJc8sXVpRJLv+fBueuw
 ObZYK3AD3rPPmH/K/qkd56Nhauz9J4ubCAJRdsvAyRR8STsFeo+NEOGOI7NtXCQRJl/ChFigFhL
 u3nVj/AJqjqttVBnyBUH6BV2sLtKoJkisZUH5H933q0vje65jZFvfGQJnqW2eUWcjfWMfuA0euz
 yWzMIJwthR6utXHrIE2MQp6D/NJjOLzs7WHdpwPDh0GI5F5lAYljmiW6Vo+gZTrcefXIOl478UR
 kjdq2kHG4hCgZMoibnXQ85diJ4l6S3AGAuqbarYCGwyJ7fboltbKuz/P0yphJTRSTMM3swpMd1M
 P/ZuEbbJhyuSOqzIDCSVviX2aD+SLpGz1vD6vezu8WkPXNdwoXn1mUe67jKXd6KUYm/8yj9I9OE
 /rKaqBOWpNc3NaQ==
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

Add the EXPORT_OP_STABLE_HANDLES flag to nilfs2 export operations to
indicate that this filesystem can be exported via NFS.

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nilfs2/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nilfs2/namei.c b/fs/nilfs2/namei.c
index 40f4b1a28705b6e0eb8f0978cf3ac18b43aa1331..975123586d1b1703e25ba6dd3117f397b3d785c1 100644
--- a/fs/nilfs2/namei.c
+++ b/fs/nilfs2/namei.c
@@ -591,4 +591,5 @@ const struct export_operations nilfs_export_ops = {
 	.fh_to_dentry = nilfs_fh_to_dentry,
 	.fh_to_parent = nilfs_fh_to_parent,
 	.get_parent = nilfs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
