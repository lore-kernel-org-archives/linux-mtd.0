Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B24D29C46
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpFvVie/rnA1A9UuL4ylXuVRSKidHg0qSFU1JHL7l2w=; b=KmMQ4ADRGBNi/9
	Jfuz3Ic9Zz1+z/Ev5NPPVLbaX5AhLBFCAdoKm6IO5UCDI1F6uCCnVZicuSJOrGxd8kTiaQZTmIOzx
	OrNUyjhUybUF5wcjzf7ud/wZ/010G+G6UHJ0ERbCIVTDuD7oJZg2FvHfeDUTLGmweNWL9kOMTa3Et
	iNyGnhPqG3iebPSF+XfgaceED4uENFibBnmd5ZPU1v/uXLYdwc7BhhDfLeeDD8coXtw1wMK2eojnD
	GZgG8rXli/SvGf301Z20JtLMgV1MlVTAWSwq5LVawuix7Ci9dzBk58NcexF+VBhlkUIB3+ZC8Rkvl
	6J8S6jrUfx1HY3cgS5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs6v-00000002TWT-17Dd;
	Mon, 19 Jan 2026 16:28:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs6t-00000002TUX-0hEV
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8015C60166;
	Mon, 19 Jan 2026 16:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551D3C19425;
	Mon, 19 Jan 2026 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840090;
	bh=W9kQ6JHsR2ZsjaldNXy1YA0G8roGFhpDKq8DlYvicUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k9zcCED3o0/zqDgXmf2Q29FEmNe3cLGAIKoBAvYNMV8yVVR+xpRPHDYmlXWFGrnPp
	 Xx8/4EkYgptjzM971GICg1v/7nSo8lyXbmGysY/ppY1+a4qX7wV9ypwQJ2uWqg5LEm
	 cV83OdEv8Jp8OLq1aq6gX5MPN2eOk5xplswnzRUpFeNSWIT4qmX3TI1tc+qXj4JLcr
	 fjj3xqF+oqoV9Ln9g2ciCb5qev9Q/y16ClfIz4i9GI4/h+i7ycQVfSESjakgis1rh3
	 2FaY5UPnl5tDG2DAe7ozeG/Qngu2FuhMnApy6+GzCJWoy4mttWTWg1+SNSutN7NzR9
	 IGlgvI0Hia08Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:24 -0500
Subject: [PATCH v2 07/31] efs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-7-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=711; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=W9kQ6JHsR2ZsjaldNXy1YA0G8roGFhpDKq8DlYvicUo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltaZVAYq9Bm19m+xxevu0EfeM6niqB4vzX2k
 PN+lbVltbWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWgAKCRAADmhBGVaC
 FRZND/9GjhlnwziGFOfsbRHGWo6zw7qbjpXy33iIwDWofSDCjLiJVF8ZX53k/UlnjSwhrroC1t6
 3vjiDj0l8skSfM1SFzZpPhHCtMaEGoUB8pYDTihSuJHmFOj3JRV//TN1u8bG31GROegUk5f7XlW
 WOEqj3oBumf52k6p18TPcdNuyTCj+4h8TL6x/PM5JDZ+spSGyCYhRxf3VDgdQdNnbvgWW1E1IxD
 NEglh0jOkYTxbZaeJLyXG5/8EBYcwKPBW04UGQgyTO00A+tQo/IKMnoV4kcqpFN+DeiQcHCtzsC
 ryLKRPu9fNDYOEbDBUe3jLs0uZ7i5hPCI8aODvddmdhPIFdL1QlAu2oKOljOxFSNcPB3BqxZEJ+
 XQk9XZyLQSBU755m7W2Z91Y8sd1vm4rkC/knWxgxBLaTEac3uzfoGM6+ioTgSJxB7ibmC6vL0w5
 TGsRj9ezeMGibVFAigZfqKCgFLO4b2RpFK0lEeHCKPsMEFJ7daFLLgNqFlsbci7ZRBcy1/RxkzQ
 GIns2Hr+8m7KzlQLCRsnendzFHsMDYR7dZ0tPvMSdYFBW/fvowAtotdeCC65Sv9/Cwqa7Yh4B3j
 Rzitnk0XLSvRdr314BPJvQR57SrQYugBXJ4/y89+z01QYCauByVGCX68ci65QG64qIWHXrS1Rfg
 L2/R4X6Pt5t0QZg==
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
