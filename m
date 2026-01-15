Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C8AD46609
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QSr7cPWLYeYSV/Uq73sL8kBDij70U24nDmqCs6N9Gk=; b=sI5DXHLDaSAJoY
	CCiiEuVqUsilgFLdOTp52XZbghdB6a8GpeZ3n2hNyhnh43gULDwMShfQGgdjlooU1LTaZH2dA7pif
	yQ19O7qrJMyJhR8TNKweGgJioSFh/r/lfQJLW7bhCXYk5xKBuHbaMmjwu7vzI3xUxCDjo/CfKbowA
	lnryUmO5U+FBDLt9eOz53DCJuSv8gkjwxAqHQcvftvA1JOYRKZCQ1Qcsaf/ITFYTRxnQ0/aIipRcT
	Uc/vB19JEhZvzMZbN2jtzrvaec1+wvcSNiZeme4B96s6cZRBgU3nTTEVYknxAZ2lhYo7mo02ao2cC
	Zc/Fq/zAsweRGRLAJoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRTC-0000000CszL-1V2a;
	Thu, 15 Jan 2026 17:49:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRT9-0000000Csx3-3Dmk
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50A474446A;
	Thu, 15 Jan 2026 17:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9B9C19423;
	Thu, 15 Jan 2026 17:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499355;
	bh=ttUZbbEr4qNvBmzcmWXht/0+Ro1g2UQElLV80PGUEuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mDsmjGInXlxUuWrIRrwv5qZQIPlIgwVPfetY5f6z1Occkjrpc3fmt3P3+9xz/ygv5
	 2VfiWGSAHJiML0wE2XpjwiAoZh5JRHcQkW9nveDZvznbd9EFKdttqjkG9YMgGwPrq+
	 PoPKFWCJaCUDUeAtEPELAfNcvWqDJpXekdN0m6t1B1tBOmUbf1l2FPA/pGsDT1qacq
	 TCYMr2c/174ubIgDQ6lN2+7dAM2cYmP/VVGNWJgmk+LQIlVDOPnvmigPMbnwRm6bYj
	 A2aIx6YB7e4mVQjVXaE6WhGbiAOAqKdDIvpfXGwCIV/XYpJIWDH3uy9nHt0CQqDuqa
	 0XnNid1EB16xw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:42 -0500
Subject: [PATCH 11/29] ufs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-11-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=697; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ttUZbbEr4qNvBmzcmWXht/0+Ro1g2UQElLV80PGUEuE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShGDwr1sR2otFzq83UWoMQWbDlnYFlhI0cDH
 jWAJRbmq5WJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRgAKCRAADmhBGVaC
 FZ1ED/46txz5ghIDvc3tR9xaLWo0GlwjYOwsC8m/aAkCADdaEu7da6Oy3D1vM6G2uDHmyabUcOx
 Tdu6BBafUm6ZljC9Exy+OuCvzYJQD9vaiTjprh9kniOU/PxPWTvaUt2VCuNf9SErwzt5728aucJ
 GSNLbDfJN4CbSWtP2bkREs2OrMDgS5Vqho86OgC4Zihzy3QZxeFVBcaAWsruB3qVXWCQHHLj/92
 gS2skgvBG2CxpzZhOyDEJk8jDS5niq4sQ3yIKjxNMlU9c6WqhOw9ZpxVa+gPvx+QVKtlgoUbkaF
 0uK2kCJ20r0TinNvfWM5ix0pgm+Z/nBs/Y62N+shReZKoF6iEK9H5kdwE26GSNEOFgTrt9cWIMd
 8eW+rzCrGY15bvgH6sJ301mMmYI4ffAG90yYsOa71pH4tyyFcij424nC0cXTG6rrJoItJXDlfKL
 IUDkCPRqPzPCCcsfjpk2g06rZIEi8b+vLtaVCgNjscK4HKGvKf9tKauE3ri82pE4swdQlcCFEE/
 4n+jTB5wHzAvRu91i176uz07JhXIlc+yF7jnsVNYCsP7+CGpRNwba1BWSbPAEViu4R/+JdmS8L/
 +pr7mvJn3aZMp0bNqipqZlidXRqUrSGwZk4SnaPs9/ptz7M0sm8z+Stj+/BEWks/d1JjYHVXRWi
 RqD0WGhd5bhccaw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_094915_858334_821E44AB 
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

Add the EXPORT_OP_STABLE_HANDLES flag to ufs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ufs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 6e4585169f94bb9652aac29a14b0a64a7bb710d8..9cd9b6691849d52701058973f6b684f101df2634 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -141,6 +141,7 @@ static const struct export_operations ufs_export_ops = {
 	.fh_to_dentry	= ufs_fh_to_dentry,
 	.fh_to_parent	= ufs_fh_to_parent,
 	.get_parent	= ufs_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 #ifdef CONFIG_UFS_DEBUG

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
