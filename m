Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5999DD46604
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22tpImTEvgZxo0UQR8gmdvalqi8j4MoGV6NlhNcOaMA=; b=NSLM1oa/gUR6DO
	Bhk6aKOaf5g6M32DFEJelHpv2mV3ochyIaXlEz9zIMh0pqrXjOWQsMdHFwVBypCCutZkyqzwiGNeP
	C+lDj/ZoFcbCP7VwPNt0Air9TcDjkjmGDDCISSqrVB82P5GYzoUpxFr7TpWfft+X8M9o0PqjFzVpx
	jdPg+UG3Nw11Qu4SnN6ZQ6kAj5Z3RmPD5OB44yCYYUwM27r58yEjyDg+p+HMm2DxTV7dAYxXy/e9Q
	lRzmsvuknGk9DoEfZvnh6hYf6HhGhGqlbJULAP0Xa70EVUS9W69HWOIy5jXqdyR86ZOKK6BFk2VVb
	gJBE0W0Y9hKJzCyirUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRTq-0000000CtPy-3Fyp;
	Thu, 15 Jan 2026 17:49:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRTn-0000000CtOj-3Gts
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30DCB60193;
	Thu, 15 Jan 2026 17:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BD1C2BC86;
	Thu, 15 Jan 2026 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499394;
	bh=uje1SB5ZiQFb1nZ8cBWe/zh7xTuwWFv4kYXj9kW+shY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PYvNCKEmybxkHf/xhYZRJA1JR3gi7hwzBl39gO6WcRa3q4IORVrO7YuHny7TQpgiy
	 zl17QOknyAtYmsTiWLBB8kQX5MvY5wrTFagloc02WkBy4em6uCkvDjKoFHPKgA23OP
	 emXGk9XryVRw6nf06RD9Jk//mYkLce7bxq8Ap9KaZVFkkVfi2UtR1Ay7+9pJigW2aV
	 gCp0wp4jlq5kzP/U0dF9wDDaTjGEPnvHrsy5L6bYYDJnpDGVchHD6uaUI+z8KRqcQP
	 iGrph9vhwR67PUaiR/AGoZY8mbdpeRYHcNNaXtUEfUA6tSTZqAxqkmZ6b2KyUgQrbr
	 crJ/YdcNWu9Cg==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:48 -0500
Subject: [PATCH 17/29] orangefs: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-17-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=uje1SB5ZiQFb1nZ8cBWe/zh7xTuwWFv4kYXj9kW+shY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShI7iVykyDXfFrTuLTz0reyANBqvVlG7B0Uu
 1Vj+ckj+QSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSAAKCRAADmhBGVaC
 FVnED/9f0D1oqBjCgp3CIeAScQlnoGQ8qajHoqRzOI6pjd4BeqJxdTpgcQ9spfu5wEwf8/uW168
 AsidtnL65hfLo5B2jfzmYVtN8khTkYlu7o+v30HMwhrc+TdP8MbPt5uENZxqhYc6IzHalGQ+sA6
 lO6ebPCT7OSx0kc8KCnNrauxgw0r2yW790BGEUUOd5rdNkOWFNANuL6cCsZ0iGnWS5HgN/IIaXn
 pSuaXSn5yI8kTwKbcq+UQl26zHz2XAH+8XaabHQwV1/1tqbprihc0VIjA9ATuJ3el552cA4P6t7
 +mUkygIX/9E/GK/b2xR7rQdMtzwrMXfwYMKX3Dm9EIeRBKaUAkYDju/jIZ1r7fC8zReSpsp55KN
 nm9vynzH9R1cpP/fVn/Mi47dNwrypVVxyaeHqDW6OWQQthOCT5LIHs2LyeLStN7qpqPQElynuXd
 LyF0nnucvGghbceqM1JJps5jcNg+YM6f7tLgSJMUW2tieWOWIL3y7du3CI3YXeeHcFJE4AVp9Zf
 v8PN25mGlu9MyKpPWG4vF1MEDrCXJHoFgL9Pwyd/UTE88RjgfrbrP4dd6dGwiq04F6Z+Hyy4wsO
 CBxXCdkbZP3HFIUX0kWTbzYM0yKyBotEBElD6owLCSVU9rv0PLz3JL1vHgYObjL5Ke/6POBKGIq
 72Kjn84TseU7iGA==
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

Add the EXPORT_OP_STABLE_HANDLES flag to orangefs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/orangefs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/orangefs/super.c b/fs/orangefs/super.c
index b46100a4f5293576549300ae9050430c3f07969b..140f27f750939cf5538eb68501dd60012bd2daec 100644
--- a/fs/orangefs/super.c
+++ b/fs/orangefs/super.c
@@ -377,6 +377,7 @@ static int orangefs_encode_fh(struct inode *inode,
 static const struct export_operations orangefs_export_ops = {
 	.encode_fh = orangefs_encode_fh,
 	.fh_to_dentry = orangefs_fh_to_dentry,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 static int orangefs_unmount(int id, __s32 fs_id, const char *devname)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
