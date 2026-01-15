Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2FFD46607
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Mt6PfsvSBlYsrLgxFN0oQ98Pj2pHCy+rRs84PTw2pE=; b=ylXZOVfsQaCRqI
	RbSo9uF13K/w4GJhJ7wbhGhOp4dqcNg32b7cet4JOg0RpbO6oM1sW43RULcGyaQkCj4W+7N/0oA9u
	lJhszZW+YqtAGtWDoAx6Clr/X9UyWPj11TREWRkF1LYJDfjByvk9MFdahfLAfFDaJCXhGDuPO6h/e
	8H3Z/wkz77ERm614fylkpbAmr8nW+y9S+eF72ee58sJYvEkfZAyZoA8lTKjVUSTF98etKc7P4fUUQ
	J0PpLim0SyybIC9yTDSCaF00w6ZYtNXtTKKqXZJVY4YA6XlVAs03aNlplkML0TEbyMb5LcyuvABkM
	aobENLbAmfTltZi8lNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRV3-0000000Cu4x-3f02;
	Thu, 15 Jan 2026 17:51:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRUy-0000000Cu1b-1PM0
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D38AD43CF9;
	Thu, 15 Jan 2026 17:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F23C116D0;
	Thu, 15 Jan 2026 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499467;
	bh=htvmJ8h5f0pVu8ImvWNw/JEkkap4HdmaXUH9XULOP2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dneG3VhUX0Ru23kykpC7XajwKkRKVHqAceMX7jvLNqTRePFNaBuM4ayubTkUvny9N
	 P6EMimUbmvqOqRKadRkQ6T7qroO5u9MrJ+DI/HjwjvI04e2SMcpBqTgzoBJXVzCVj8
	 R5V2wa7+oi6y8sxhLKnZsOoY4DX784WY7uMLk4lb4Vc6Kd/4OLd2SC3Kzlq8kw4pdj
	 8cARkudpqQaRPHHhqvPOw9xFFGDEn4QLQufxN7dtMK+XuU9P8Un4FgC8HH/KwF/e2C
	 moyzLlfSM3DumjxHD5fSrAeTyGV8QjhVSQG+YNhDelzpN0HchBhm/5dLFgin2CwyUD
	 uo+ijlmJDN9PQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:59 -0500
Subject: [PATCH 28/29] f2fs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-28-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=728; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=htvmJ8h5f0pVu8ImvWNw/JEkkap4HdmaXUH9XULOP2k=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShL3pTOMCAQjYksxun5CypfXLq0xcfQ0yLyW
 65BR+drKTWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSwAKCRAADmhBGVaC
 FUFkD/96PWmPhmWuooqOKgSLg+pqHnRgUaL7/ZNDUsAhBKEADaxTrSuVXnu5y06MU9W3lXn3Jki
 tJG1xqeTtwFPfjupnxuGii5/cJK3grEucHSsaObz/C/IPgm2RajqPlObTc5yWQzLajH/ZdsmKuz
 iaN++m5BA2rgnLkFTWSjYb/rOq4ox7mbDacV7EnxfZLef3pg4hlNbFjixmHWZq1YxNtv1GM1PKB
 bYlU5nOry0N5MLT5mJJyhUCXgfMSr69UikdXegrkYuuEal8PA7L2A3UO2DuRcocHdchHdO1mIiI
 aPpzI8SRvE1DQ1wGC2Rr0ZjiolVqjHMERqoPeTbmyNDwFpv+OBpjtjiUYOyD3M4aW7gTYR0+cKV
 E++nhLNIBtBmmCSujF5Gfgbm5rpaJOjnUYkeEDI8zW8AKDwmT4OztE+PvBlPE9xUsIp1A3S5Xdo
 envgJF0kLa1c3oxdciypY/zYLzOtZCb6nL3ixs/MEvwxq9rGiFPOjLC7ctPUSdQni2by6qtQPGL
 w2gOWH1cGO52N67mW9gfCQswe2gXtfZ4GWZLWj9tnHRqmUbdUXBRIFYxRZRcu5CTuplDEOB8K2P
 SNqUouDQZv8sR9URZ+uLTShPnRPM48oApHkWHBLVd0u7cElK7NOCQVx+XgJcY4pkTTaS8REV/+m
 9YQ7wwUNgBGz9iA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_095109_505052_B152D8CE 
X-CRM114-Status: GOOD (  10.79  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to f2fs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c4c225e09dc4701f009dec4338f2eaba1820ea7d..260c26771c431bbb36e99be8daff6cde40662751 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3750,6 +3750,7 @@ static const struct export_operations f2fs_export_ops = {
 	.fh_to_dentry = f2fs_fh_to_dentry,
 	.fh_to_parent = f2fs_fh_to_parent,
 	.get_parent = f2fs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 loff_t max_file_blocks(struct inode *inode)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
