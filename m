Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED93D29C43
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSP6cRnlmWWm//aJ9HTgiRQMWCctMzYlhSeHU1HHRbQ=; b=CwO+a8o8KZYdsX
	McQLv+bdLcNq42xWvmctPSZZt0OZaSB00MQzC4qqbxwNI7D8raimHwZGMmPL+W9gh06RDO6YLd17Q
	kvKZskePCOKBlC4CCzFFZk0pzZgexTnh7ut4bUZLA0Ky7CjRbXgy7X4xFcdCmljznZiHqSRvcavSt
	F7EaXSyzfsKyj1rG/QMiPH+SFz6kNCgXHoRxsIDi2Nyv3ULxR+P5t9CGxG9bZrVO7b2AW26smGLj7
	2j8KO6npxLFYCB2TJIkdbQk0EguyDQOLUxuim/h6iHlXk5YREUNP1CDB6NhjPTRIm+xTj1otHMiNc
	egLFq/3G4UiHr9TdtiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7x-00000002U1U-3SPu;
	Mon, 19 Jan 2026 16:29:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7v-00000002Tze-1N5i
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:29:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A16B26014E;
	Mon, 19 Jan 2026 16:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4ACC116C6;
	Mon, 19 Jan 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840154;
	bh=o5Frh9Jas0eQsKFwc6fvb8GEIHx/ysO3v6fDYVnQinY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lqyE8RmGZSejzsOQU0MO1ISUcONtsmxikVAGnuUP3SkfDMQ3Du8mM81jZl+aYhVuB
	 Ahn33iMXaUsrrtOpeVjyWwYyKouJkXrEAahILxno3ID9CMj64h5u/UalJZy5oqVgyZ
	 8qWHLcfOhFmYBRu6IYevN+88h7qyQw529L1Juby+udKOlj8WypkXar2wrvwFoOVhnA
	 K7H7Vre4b+VLlU0bHBrNO1jGA6nmVF/nOA8lUtw2Xqq5NotuPvNB/yoj6y2uj88HJC
	 ELMxRaczdd3rzjuNa2h8KNXBV5hP6Fe5ZlTEdVEBaKpIZgflUX0lW18A7v898UgNl8
	 UgMZBpoYTa0FQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:33 -0500
Subject: [PATCH v2 16/31] smb/client: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-16-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=823; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=o5Frh9Jas0eQsKFwc6fvb8GEIHx/ysO3v6fDYVnQinY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltdaF1cThL9y/0XwYSNisksrkVKsW/AB2P05
 5IbY1gx72iJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXQAKCRAADmhBGVaC
 FZXcD/97dgCRFTvF92HsNCtcdMvHBW9NPsmSKBBjqVDufX8MGZ4/VSQkMX3HxFlI1V8Z0AmjBGz
 lepo+/QvxuI983RYiCoBo5QKyaqD5/LhYdLwVB6zL2YcgcVUabFRo/0cPkUTEfYkqb8V/vkFI6Q
 BGpYkOdXPXNbCnjqJRHdjPS6VtBDFXHqdYnLZq1U6/+qNniAioZHs5rk/ceAoybjzHeSqa2bWy9
 yW7UK/oLbatR1sXkXVW4s7a6exqOIK8LxdhjYq6ANlZWAtrum1SWW4nEeByKZQNRAH10bdF3xoK
 kP+kkah34mombElyQofkbwoeLokO09lPBuz/i8S7AlbPqTLSEduAbi5+usEtscs8lcqf/5GeqkF
 3cNT3AVl/M4F5ZSRnPJ3HE3vnIRcLE8WVCQ/iVgjQ/d/Jbrg/iuzYvdTdPxAUaIX9hU7+44HaXx
 Pl9JVlefKdZ4EYPVs+13QPDPsW6+rGzkr06LyGnGx10hzaBWxV8NGBGExK17p7P92SiS42s9/Wx
 qZBUU6XIMmZf8uHh4znogNDhhcm33486WnkQWR5sLhrUEPwQTtno+8U/psXvsmQmBMyNP/ud70/
 Y5W9N5xJcynuMTUHAhIG6VqPezcQlvq/glcZk1dYpz9wOHUP7ThX4OUQyTlCDU9q44iBIV+KYKB
 2PU4LQy2kgFCM1Q==
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

Add the EXPORT_OP_STABLE_HANDLES flag to cifs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/smb/client/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/client/export.c b/fs/smb/client/export.c
index d606e8cbcb7db2b4026675bd9cbc264834687807..6dfdba9fcade9e4d7ae01fd107e84956f2f9b82a 100644
--- a/fs/smb/client/export.c
+++ b/fs/smb/client/export.c
@@ -43,6 +43,7 @@ static struct dentry *cifs_get_parent(struct dentry *dentry)
 const struct export_operations cifs_export_ops = {
 	.encode_fh = generic_encode_ino32_fh,
 	.get_parent = cifs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 /*
  * Following export operations are mandatory for NFS export support:
  *	.fh_to_dentry =

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
