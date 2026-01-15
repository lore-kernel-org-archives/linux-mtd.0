Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA60DD4660A
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6Hj8wM+RPmrDdnbzqqTLE/sP72pczy3Xti0Dw3PPzo=; b=ni/Ginvx+N/9wM
	GcFDr9Rd/V7iVnqqM0M2DlDmJuihot2dFDxjrqA45v91EoAMPFLK/xSXvWsmEtxx809f8C8t2CpvU
	aNOPR3VVTeICx9IDGfRyNSS/FpiuwlyD1bTFSwZ1H7VLBvytritKSUr+m3fpgPn0u6ZTPif38tgdX
	QZl7UrEERnpiDL4nTxdUKUYlv0irPrZrwIpl8OqJ8oFwZJQu+cha5yUlZgdofe+j/DA7+2VfiaQh7
	2CFmuIiGDQ7LbwwL2qiWp7juVwFj6fmsRDVESU73+auZ9ELCdUKg6rwxXNcnx6RkS2OGG7aioQiey
	PrinjLfCz5MbXdcoAm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRUO-0000000CtgW-1LOK;
	Thu, 15 Jan 2026 17:50:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRUK-0000000CtfT-4374
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44C146016F;
	Thu, 15 Jan 2026 17:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C287C19423;
	Thu, 15 Jan 2026 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499428;
	bh=5qGrvcoNEaqzKsbFBudRQKuxZ92uiJhY9hmL8JYVNwo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rR6P5MqpIlAhNzf8XuUwzeR0k2ADAPvlltnRtEUjrMxi0Zo6/8Dt3CKUWLqfaVqvV
	 maTTucLjmIvOZJyMtOcHtPzt6gfk4sFH0sIVdzS4AOjzTwdHuJW2+NNgGCEeGGbUIP
	 xc7iAujPGz5+g2OVzeGgRMIgHvoijHlHKpfBOdlpOLRHePm+BIhlb8/Vo8w3rmKm1t
	 vk8WW1Fc3rJyG1JzmOsyAJU1y/vEW7lVmeFFbX+4Wv68qN8/jR85ltMp9LCmeh8+ki
	 /R6lpmzQU6cIvNz1eR/VUPClQqtbJUSUkqmxN7SiK1wm91O0nOO0CL3G5RkpSnrTo6
	 Xb+1xdin+Tpmw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:53 -0500
Subject: [PATCH 22/29] jfs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-22-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=757; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=5qGrvcoNEaqzKsbFBudRQKuxZ92uiJhY9hmL8JYVNwo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShJ6gzq/GdauLk+afGsy7jPLT6yVwaC0xixs
 lrpnTh5X6uJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSQAKCRAADmhBGVaC
 FRUSD/9ByBjb9qL7WUXU7eQFvtHwFTejj7UPRv9G2yA/sCWJnOY4XI4+DT5LXXjPDJ5WfzDmY0h
 1631R1kksFTmTI4TTr1rMQ3DsyUNANdSFEjmbnoMKjUUf0Gb26G0Zhtehcvah6MyRo4hnuEgO3N
 j9fY2jmqmR+Q0SjY+g/ZSFgJieIZJ1bPG5kGaGg9nys+m/JtMDhKFOib64DAQfBEcdBBtMlYe8L
 asyygrgU0nQ7FjX8gT+iV5Q7p8xHDDDQyIQgzC//m6aacF4d5KuNYKHrTyaMSIo4RugSJslAQV6
 +FMpHhadZQqkN7GDghRXcc0YTmgv5dCyjpWHgS/39eN+IVT9aes5hoc/QI+zkvskn/epPcE+tp7
 lbmZFB7ApvXUyeAEy+EogpQ2GX4AVZ4Q7zRb+uU84rdoX6xNMPAOGQ3UfhGJjImDrAXZaskyOTD
 dg/X43DE4ERo6Co6EL65AGek+DaXlZo1bc+y8QfodlH3bQm3dOx+RrveNSGyjrosX/LjBkT1dO1
 HkBNWR+339Wi7nHQTnjmr0x15tUe4rPHVHW41nMi9vwSOprdFNaG/Cx4O6JmaWzkNOVBkTTOGSb
 FnGwyWVBJgq/a+9nZm67mlnZ919xA3ikbxMmTS4jtWnsmR8eQIsuG+eAMLgmGcjgULQ1AJ8OHd5
 KEtt24Sqjm6eBDg==
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

Add the EXPORT_OP_STABLE_HANDLES flag to jfs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/jfs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 3cfb86c5a36e8f0c46a2734a24fba6ffd36c7ad9..ac9b6d754f8c203baa7e91362aeb0dc9b3ce209f 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -864,6 +864,7 @@ static const struct export_operations jfs_export_operations = {
 	.fh_to_dentry	= jfs_fh_to_dentry,
 	.fh_to_parent	= jfs_fh_to_parent,
 	.get_parent	= jfs_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 static void jfs_init_options(struct fs_context *fc, struct jfs_context *ctx)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
