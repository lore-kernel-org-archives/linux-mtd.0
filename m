Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A1AD46604
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrCKP3y8Jl8ODqfVCCxf8ehYYeB+IPUbVRTJ2di649w=; b=GyPt34BZzXhGMM
	SqnnxDvq2Jo35AJFvCgDQx44qJcsYlqD5DQdEx8biGN1dTZdHgt/cp0mDrcWImvcqXPhtl3AeEPmk
	Ju7S6px0BIKnl3HcMefaGYY007MYEH4M2cfHdyeb4nudzqrOIphT1pKinbu7HzRJDAWyT4jgxhgYt
	Swaun7VW2BSqVlWwkDu4Uk8OYJtqxrlGDRXDhj1OIoPxyG3NmUOYuRnC3J/8rtjkvgCgYv9a9eqHJ
	0IEWnCJXUj3ZakBdouttENc8gLbQ4UsoehUG9/U4PJjqK1B4+8G4iEERpsV9hCQp+6AyboDEAX8Ec
	2wUEi+ol1k2Pg3zanW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRUt-0000000Cu11-3Y5h;
	Thu, 15 Jan 2026 17:51:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRUr-0000000CtzS-2eF7
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43ADB40ACC;
	Thu, 15 Jan 2026 17:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EBEC19422;
	Thu, 15 Jan 2026 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499461;
	bh=Zmo+do6HqZsZlZXVQKKSsmbSay6qOtqCBcv8Ip3ODxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I4ocNczYItMV4PCO+hbSpubXFxTOOvRwelQ5iEnGP+dxJfSBdkpaS8BgcPNjtQo+0
	 13X39dc3sCfjz7ZMXaPaDIvAVfQvYuD8rsBiUUssjnbn+CI2LeXh9lW609XNO9pJW4
	 RWosIVWkPRVb32nDlMhCWWWWcgwSn5dwcfPmFsSOyDc8tvb8bAksTdZfwJieQuT+2W
	 oaeOsUCW736bb7SBCyxDve76M1+gzPkiVc2w03g+s5JUvg1tzkRrCMNi0uG2DxZ8OG
	 VNeaPNWMgyHbFRSgKK2V3mYG38tOvn1l0448Syr6c4z7fJRlqPTqYQWDN8yvnUIlt/
	 GVi49NPoqT9NA==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:58 -0500
Subject: [PATCH 27/29] fat: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-27-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Zmo+do6HqZsZlZXVQKKSsmbSay6qOtqCBcv8Ip3ODxg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShL32CLlH4882Enb521JW8XT+IGMo129fioR
 FwAWlYbPrGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSwAKCRAADmhBGVaC
 Fb/iD/sGhyoeoGw8wPKWzF+cMfVdCztiCASS47/vMz0oiXGV1gCEhqTG9CMIze18Tl9Pk0p+mvq
 lwQsBXayjGP3BD7Enz9ZTXdz7FGGhaKcQ7elWJ6NnDpTqPG61yQ3iPz2tocRnByahbNXFGRT01B
 bDDG4/0lRFn0I0s8tvRGH2GA25WUCRHpQX2sqaeq3HUDDN0AO+NiX35P8nmzTYTIn6azTBEJvqt
 i7m8+BV+qB1SQJsg0wSgcn28i3v+spVZ035ydFW1WchRNsDB/B3h6MvxtR5p7m7ILVITniiPuYv
 3AjUCweM/5jRt5ND1mLrbJrbHRve0L6jhiggdidkpMJ0bZlxgDKXuNiUntjwNb/KzO0f3RYobnK
 R01fL7cRrHYRgu+sda+g9CT+vNULB2SFSivuqhJur7e1BvLo4eO63/TJwnrBm0yi2XuP/C3szYC
 pOGS0FbFrydrLRpRqO/D1JVnhNWaZqp/mJGTH3DdHE09OyqAP6gDvZoCE+ARb0ivdfwKTCf22fv
 J6tbdw+dZNehkFAI9rOCQJvJeTc9RQCChrSxoR2jiz8ROuCCHx6Nh0Fth2yHiCQG0Yu4PgjOzPc
 cMpnCsz/LNIjdu+gfSKzdmcuPlCllwpeWoDOn3Ya0O2qhbEWoKGtgYAnca8FuqgEt3DtWrex0kB
 sG0+GJPuZUBNXZA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_095101_717847_990D7EFB 
X-CRM114-Status: GOOD (  11.02  )
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
