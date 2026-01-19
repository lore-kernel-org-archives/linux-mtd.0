Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E8FD29C41
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoUKztDrxguoODnAiLjzR+gwo4LiYnNvY6Z0FOLU3MA=; b=L/mOxHXLQSc+Xr
	b99lASZ3XNTimJPkwL50ckjFN4QDbAp6p7LFeodG74/gQTk0wenimmOLT/DaTnmEW14zGTJtQ0IKN
	wgZd8Y8UbUafgLNhx8o+LoSR5Q0cN29HXMXWHRSgjYgnZ8owQFyjPBHAZT7t9kjDY2nQqByurfYph
	Biu3algUqpOpSgd/1kvqJsZIGkcf0KZmzlL+SkzX+0LjOueKRxg5LL/Wg0QEbY2JKb/tfUbNOtpQH
	l2trrBNrJy4wh44TKfjeOxcdXEoUOub+Z/23aCM9djreLvaoYVc05Wif72pt5NR+kj+MUp6S5ssl7
	ZH1xiaephCJeLYrser7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7W-00000002ToP-0BXU;
	Mon, 19 Jan 2026 16:28:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7L-00000002TlL-3lV2
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:28:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1700B6014E;
	Mon, 19 Jan 2026 16:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F5DC116C6;
	Mon, 19 Jan 2026 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840118;
	bh=FgvaakP+KkZTiWPmd/GcmMQL5i/gToOI+UK+TD05398=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wgi+FWvLw0MQ+2HORgz5R2DzsE3xTDpIeJv3h1S0cFNs6i9UQbBFBYRNiA8j8Fg9+
	 KHV2BRMV8sc5hIpryCF11pPiQxFsp5jsFeGRgjvKpjnr50AHMK8gIN85Nf3HliIyJN
	 fVEnoXFDYtI2qYy/Ygj8CYKdqJi8j61eA8sNsahGBpQ1xk2jp5P4+4TfuS7JqNHmrB
	 NIwutz+PXPre13vg54KrR7HlTKnjxB4xKcJY/PQYeRmbOh3hCGCON9Juobo7p2e8vA
	 llAP9XHmK5riLuTYR5uf34R6+LIIkqWX0A7ghO8ELhidE6qt+BMPFR9uiYqbZgi+m3
	 4gFfkEvNqWt6w==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:28 -0500
Subject: [PATCH v2 11/31] befs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-11-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=FgvaakP+KkZTiWPmd/GcmMQL5i/gToOI+UK+TD05398=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltbCPwpzNwYdBr0vFnmbNYzyzE/ZPMcrbCYA
 XY3FvJ2K7mJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWwAKCRAADmhBGVaC
 FXLLEAC5N5AzFG4uvYDzXr4HYnhMSx1oslQeDc2aNn/1b0a0OMrmi86P7CYesaBsl2EI1ujp33F
 OtWIgVKwOCZ0pSCYP3crtFEbaq0Aw+i2Iyap1/h/6lHHzapF70M0725+Adlu3M9tGmo7Bjn9ZY1
 o3g1+ZCSHq7lVtNiYMCk90mQ1RLDIva6G7gisSZ0fNGeM5YvlxzF/PsylbBWHu0MnsIQSKTN08x
 8lcD3ifSkZh+XuXVyuqGPPojdmvdQH2+KTj3ye6IdrjX67X6HUS0cJHLPZZGYv7qZ3zhHIZ4ocP
 S/4ZMNiZoheepK1QszjjTUh6OgEpzWX6wDrw4HIBp5sFA/qKKcltgPiGeItaZGnb1zHxgxKhEta
 6rCEV1Z4hVXYA8qhEdd4mlpJrN8I8crXV7Byc5x1gTg2LAwlNXNqDY/AMBY65Lo1Tz9AEHmByTu
 PIcDAm+N9dxEnC1iKlTmlUoJ1KSXFME0B0IxTb4/5lkGTrgiT3NRCOY53lJ/4kY9QRJuuJUjLhb
 r/b3XrJj5q2R9ASU1G78XzaNpdcTx7XqsTf/VCB6XsMbLtDtkBv5HFeP4Ggahuw4xSJoK3HHhbz
 KtCZVqPbkuk5PQxouzkrY9RyqOAz4a3KbwGRNzNuGfTCJBDAUCM6LBh2uoT33ckjofS0O6ihZ3r
 s+733coP9qobvCw==
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

Add the EXPORT_OP_STABLE_HANDLES flag to befs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/befs/linuxvfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/befs/linuxvfs.c b/fs/befs/linuxvfs.c
index 9fcfdd6b8189aaf5cc3b68aa8dff4798af5bdcbc..1f358d58af8b4de9bc840b9926970340395bc9e4 100644
--- a/fs/befs/linuxvfs.c
+++ b/fs/befs/linuxvfs.c
@@ -99,6 +99,7 @@ static const struct export_operations befs_export_operations = {
 	.fh_to_dentry	= befs_fh_to_dentry,
 	.fh_to_parent	= befs_fh_to_parent,
 	.get_parent	= befs_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 /*

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
