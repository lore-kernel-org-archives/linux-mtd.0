Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0896D29C45
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5lMvpmygW2klx3IMgZ1YsaPw7s43Q4mGro/JQkpOJg=; b=SW6lz1b3Ie+zIF
	H3Ymyo7UzHTyF8TRirH04bFQKPozFQpRZrhB7MluYU8gSqaL07neVa6iCecn1Pi+tyyb8LNfA96MW
	Q39kb7LYg8fD1T4joxuZpNZHAAhdaxH/TxSafPq60+3FdZ1awpIyzxQHIjMYQZSxLD9qhhCllvZSX
	mWu/OElcC7cwNZ6p+MSJbK3bv5N23ld/VAdawvKC+0vLZpez5Jejo+KHnKeHNzYxH+uRaEqUdcHk5
	hDObtLkL5Sc8Bb8gMzy8pbm12CIGJ0NSVHf/B3ya3JIFJf6qyp/Lm/s+x8NvMJo2BIWFQvDLbmrjH
	eJzL3wfWnNwFY/qHYcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs6f-00000002TO0-2KRs;
	Mon, 19 Jan 2026 16:27:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs6e-00000002TNA-3uP1
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 432DC60135;
	Mon, 19 Jan 2026 16:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24386C116C6;
	Mon, 19 Jan 2026 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840076;
	bh=NlLYDWzXRW6rnfbCFw7xB95B0dQtUpjhcx2qza1jF5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JOwo2Tlf1wQVs4rSpB2cvGoIOQu3++5wLoibt1o6KyCZ6NKRs/dwpL3TtvXLTtrMB
	 tcIaKEiJB0U3JEg62ukqgO+wVVLQYHHpZNPMEnMj2cASfeZPDaFPGaRc7/g2tpJcZ0
	 8LEN/zxj39delP6+H9fBw/GfNqeS2kAbT6wazW0CnxR/UsD6zosr4yvOKKXG9kGRu6
	 4h/YQ+A3NcydJEguRgY5PVyIhfCvfttE6K3brApDuPGezWzApDC+TxFB7SnFWAzMSt
	 Kh15fMfIViRm6TDmNYiveV22yjV/aUpG7PhBWedHMlXAGIDOIzaDi9XFZRhQSvf7NA
	 31z/5XUrmsu7A==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:22 -0500
Subject: [PATCH v2 05/31] ext2: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-5-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=727; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=NlLYDWzXRW6rnfbCFw7xB95B0dQtUpjhcx2qza1jF5M=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltabE2Jm7JAwFuoi4xvjHPIjuOTxYjIQNa1G
 qwefu7ew4uJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWgAKCRAADmhBGVaC
 FUaaEACos0NEKrzptD1SfGjP3BtYKRG+pK3ttXeXq6A9Khy/WctcfkvCNKlgDFmyTKEKtSgK96w
 fzujSdx3zZDxGdKH/+NfIFJWsLGoSjYFRoCEHLoa9JKb507JGYtKM4z049+lfDx/zFh1gT9kCfp
 T7A3LKYI+1JZKk+IEwacJMVGpxciEHIGyd16ecTZ1UXjzMPn23/CbMbugOgyDz+yiq716Rss7/B
 Y0xqLA/b9InbEXlKHeA+TEzc45zeyVJLmqPcVSjw4sVDN2pqtawY3culsHQVOTqQtCI/Ysd/MGt
 Z2oT2COgY9CtFgUnHYwfWuyOGEy2Ct/pKDis48+kr/t2+13V2QZ7eZC39OINqIFttqV2erxtigs
 DxUKY25Ebtr3SLjtdIxPKO9Ae6HtzWe77tux6Yj+uk71h7u4U9wkox2xobuV/erBgRIA8YWhjxx
 nPv8KrXqjz1AugEzDvmceU3KG6j3KaTRuxbDGLbK+0xzj4Rq95qnuvPdcDUCGXLlgdfQEoGBZZn
 BN9cjA9xZ2JHPSRr7Ihx9qp6jKSfdkrObAmq7B1iBkwVpP3nm7htFDPMNp7u9aC04BG9aOdJEuw
 5XYI9GJTUGAorVbchUP0mSCCLwZzDppIbGZZQWY+lr0lTugsXHeG/m5lsFZnn7brwTTaobTfpWU
 AnaMFB6Wxbzrcvg==
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

Add the EXPORT_OP_STABLE_HANDLES flag to ext2 export operations to indicate
that this filesystem can be exported via NFS.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ext2/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 121e634c792ab625d7a07251e572e5844242fc2a..936675f06806d268ded5a3ba5306575c437ca9ce 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -426,6 +426,7 @@ static const struct export_operations ext2_export_ops = {
 	.fh_to_dentry = ext2_fh_to_dentry,
 	.fh_to_parent = ext2_fh_to_parent,
 	.get_parent = ext2_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 enum {

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
