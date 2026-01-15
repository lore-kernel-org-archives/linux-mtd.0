Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2438AD46604
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpFvVie/rnA1A9UuL4ylXuVRSKidHg0qSFU1JHL7l2w=; b=X5Ojn8SBi1ccm4
	IR/nSyppQ0CyIigf0kwg/utwEcV2iobdpACGK65R26gskuIMtjCyuJtN3AH/myIwVcDTiIBVp0yu7
	5W2JbdbqKa59Ypb03ai59pSpmMa3CDp+JkQF5/ptExiDMpYb+DZ2XYr0KScvoku794z7GE+QZxeiy
	bTQcbIF8E4Fm9LynMYqzGPSq172E5tB2ahZSR327Nq1h85OECQfg9qwrYtAGZI8BE9xWLC2UuiP1h
	020/TtQcheeSaoOrY9+VF+1zSZuVB5SVUrLEvdMaMg5Cz/nqBquyhcMCyj8eZof8ScJjIcEYQ0B5t
	RRvllUGlYzL76DltqLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSg-0000000Csbz-1bLJ;
	Thu, 15 Jan 2026 17:48:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSf-0000000Csac-0lS1
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:48:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43267601B9;
	Thu, 15 Jan 2026 17:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E96BC19422;
	Thu, 15 Jan 2026 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499322;
	bh=W9kQ6JHsR2ZsjaldNXy1YA0G8roGFhpDKq8DlYvicUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P9k1aj11dtUjVmoJ2JkOIxQxD+Lh9HX+4PP4xeaiCmzMsGQQIofAxmN0kwephynVn
	 jgEFAZdP9VCeEM4+lyDrU9hFKtyTvDnuJcMFOj2OBrjJbruUs2gTh4OplQXmRdPFWM
	 y/WtmfJtSDHkl17CbGZ6JPMJHqPthmUnl/csIzRttoW2UlHIntHlS1E5Rnde4PXZqW
	 PgDdvnrYn47ZyQuoFtbs1ukRa24C8rf+drsvuUM7wKZ4EE6Lql+TCbjhRaZL9EX7ud
	 GXY8NtwMda8Oq/h6MItTeABo+X1ixha9jgKSR1HNVdiLAS/2m+SbKJ2jDIsEAaqNWt
	 Ipbx5URfWOUeQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:37 -0500
Subject: [PATCH 06/29] efs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-6-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=711; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=W9kQ6JHsR2ZsjaldNXy1YA0G8roGFhpDKq8DlYvicUo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShFOGCeudhFSnNU5LrX3LBX+RZplJUZv4gNk
 R+Gwt3h8dOJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRQAKCRAADmhBGVaC
 Fb1uEACvyte6Uvy9mHwX87tjuyi4RsPEm4K1/E8jJNDj5Zi+574qjjwkKsFEVJY/H6jxPn1y4xn
 PbLLYqQrd9EtydaJ4vWQ9843FC3nqO7/SX3eALSNaseH1ryUYgOoGO627HNQRsanv3azVVKGDLa
 G93+OiYF0xM7Sn6aZGD7VGWl6h7R8eaLbMilwCopjF1rdy6+BgSG+X9Anf9cmZnxFNQ+1WbuCy7
 ue7/yrUYG7h1Th9lsN8hPXpJ80IZOZt8yyTtBH4ZTQb+PDWjJV240MAJMixKUhwPLV0rEJh0p3e
 YoUJl40N+SqwcG2HSUH8e5D/DqhXB1mBTLPM+KagG4DHcJZbIfN+MgTT6mk2EgkjMo3zfEvhxj4
 Ic2nlaRs/8vPSb3e+LFh+7m69YyNHMI8cBl+6oqSgvDdeuPHSkVEIqj8qPaYFUQFpbaqzyHwBkh
 GqW1XkAYc6fjjh9BVHmdlfk93kjoGn5Ar2sORFoPWSSO43FP2PVCrZ1R+P81bF8EFaYGMF0+X6I
 azx+Nmx6fMSuwp8IMzaMUoms0XpTf6LnULVjgzmwTbU0FExZk7LbX2n15X1OywAi3CRU1eItkjw
 So8HzuzU+Sio8FHHPHu6CBquAWoySow7mPaViwxkdytHNY8n5Zh1Nw9WTZ6j5I2MkNaAVWRSG3N
 pjvjCBbT7TxDhGg==
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

Add the EXPORT_OP_STABLE_HANDLES flag to efs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/efs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/efs/super.c b/fs/efs/super.c
index c59086b7eabfe93939d06f36826aa91838e41ba2..5e06acdab03b6f30bfa469e48463cb0e8a3b32a1 100644
--- a/fs/efs/super.c
+++ b/fs/efs/super.c
@@ -115,6 +115,7 @@ static const struct export_operations efs_export_ops = {
 	.fh_to_dentry	= efs_fh_to_dentry,
 	.fh_to_parent	= efs_fh_to_parent,
 	.get_parent	= efs_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 static int __init init_efs_fs(void) {

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
