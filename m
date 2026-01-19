Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4A6D29C4A
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHBjgNldqBXDdQVtBD7Amw21UNdjuHQ4fN61moXnvYQ=; b=y0OubaNpfLoiQS
	qa+ck2pq1HYq3U8Zznz8dzKXRT9j8QfbqPN0d66Lh9341lpyKxVo72T7Ks2/5YzQuBKV1z93k6bKK
	6Fm3vkS+0h0yzhga3YRyLvjGK++ipFQDAIVdxXz81b3RJVl7TkJzMsUmh6QlNBSJQzKEatDeBH0gX
	BVxMD8GFKwYttZZWp5tEQESV4Wp47hSWfQnm6s01EBj3dfLk+iPH5+HAEBIUVYX0Rer0kjh2WrO/4
	5DWNAVZ6VC1zRzpDOIcziEZI3IkBb8hzRomGFGcpXj+Jj+0Qx+kQIyii9bAPiiEHPu0zXsI1AEt5t
	+pXnXa6qAY5Ie8zSDONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs90-00000002UdU-41jj;
	Mon, 19 Jan 2026 16:30:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8o-00000002Uas-0OLD
	for linux-mtd@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4hnkHhj6VpugZZG6VDwQVVf1Gx3N8PdGnaR3BX2i7Ek=; b=oFi0wo1icGDmSP/vF8LEZxVETX
	U19QDiSRntgSF7aaWo8rzaGZ3sRY0m+D1xJgAZ8lL/O1cTJex0W4iYYSYDIOC4wAlZ0oU61Dl4PnM
	MoiGLn4A8grRwZpgSg9KLmF4tS1VxLxWeEy3B2AQwlKeHWsXvrAHqq8eMzvTjhR1wU2dB3gCe0vyb
	JxEbN769k0UDQrWzQGiuNPyONmkG9Dx7L1/xiNH0gVW0tFzvFJPdZFkj4WS1F5sSIXbFywrRWmQih
	u42ZlT5Pe1wVZxRULFdcN39NxA6AYNuzajP6GXywVRRc09ErMbITIe2rVTK65pMU0x2X6CKAg9qFM
	2DXv6S/A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8k-0000000CWTa-3mWR
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 894E643394;
	Mon, 19 Jan 2026 16:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655B2C19424;
	Mon, 19 Jan 2026 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840205;
	bh=vQTd4Jo5nWm0BtlMXBC/zeTqN+exhfZBAyMeslzDnKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AWFPBI+DGZ6l+36k9cUcFG0hNFFKJ0WMx66O5cEYb4l62RB3MHZqQrMyu+l8KoFc1
	 TGdwQ1vZg0M8ySuA4DCPjGa2HYdhlWYqJglFLc8XmqEPvUHdJxxXLwvvLRoWe8vbm6
	 0aPh3Sk1rMoZ6/5Omzvw5StQLtIn16fGFg9VDhx/A2qqLLjS4Nqm5rKYDXgHs8gK0A
	 ok7XQ/JY5MkIHVzgoTLqIWhH1U/zaKEFZ2BnohVbeU/Hd0P7u/5wSiCw35RX4erZMO
	 zxVhM5nZ8z9dtS9jXJmWWwdhg+pY0UAUbzMiE5GZfJeJOnjoq3NzGXfuvGSE4FaPk9
	 OHv1hYqPynnMg==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:40 -0500
Subject: [PATCH v2 23/31] jfs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-23-d93368f903bd@kernel.org>
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
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>, 
 Dave Kleikamp <dave.kleikamp@oracle.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=vQTd4Jo5nWm0BtlMXBC/zeTqN+exhfZBAyMeslzDnKc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpblteCXSwo2a+8YGLaQolNYDg9J+5h600R9sGY
 lTKG5OkIWmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXgAKCRAADmhBGVaC
 FQ4+EACdlT3kWBo+HI6ruDanrebZFrOPBF8E+b+dbln0HfDwLb6pNFCgmgym+bnP/ZirP+ltIqG
 uJNypDGY1ttctOOFStuOce/RWd3J82M2fSTS4KTePxme9FxgWvfzlPqz43ArAM+CIkWGVgeaGKd
 mHaIKzNzUqg1BfEV3B9neORWkEe7FLYHuRjtd1leg8qBCG7g/NAJnxTEf6IhLFb6zUVI8WbEwXf
 SWw8IxyniAcvvpWPhkQEFgLr0JwYPezris3doWzeAyaa2RJuQcnk/HoA9+0NKyT3hW8nQyO4Fe+
 s5DfgIZe23cBvNTYaSp0xBbkqXcHoOX9oowmU7Y8Ke2Qk/sO3PNoy1GWQUlU7U1JMGB+Rh/80vl
 gzuUVkFpOWWFtTFkUayRdJta8LzXqmKzllI5a6Pi0c73/LLUxESAQFBh6barp4IuMUnmulh/03j
 NejtTplGwWPkizI1bVDryTcbMGjt1rPCpyN7gteUKA9FYFCci2pCBozoV8YVMbcgu8bMO0xSBj3
 g8cdqKbuYMp4kjSkuCkG/rs45okw8w7j/eQ/cStRAbHsUL9+mbf3ALihR7DcksQu0or91YqhDru
 hbkk9t9wwE/tcAokrVSpplMMM9ODfSLZ4IZwKUeWEpvMoVv3um/271BHFxRjaAyh2iKbaAlStLk
 7XhpMkBicI0ylbA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_163007_430728_751E3B26 
X-CRM114-Status: GOOD (  10.84  )
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

Acked-by: Dave Kleikamp <dave.kleikamp@oracle.com>
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
