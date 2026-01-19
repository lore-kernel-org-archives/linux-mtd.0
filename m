Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91327D29C41
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJdKLeEiQsa+yw8r0dAPpcFi9gOAyHhIxcNOQQzD5qc=; b=nzigIZ2Td/39Zq
	otYqWGA0Um0TpM0L22ph7thjgRoUk6uUADm+DD58KnjrLbJ1og06ZvSeycvgChtNAbHxAs3+bEoKN
	cuAwQxbU8Y2Nr9qVaR3BJPdjvxxsAcsZJ5YwqBqYV9iqLHO+bzby6Hwl/Vkr2V837Jzr+4XkgwP2D
	2pHEkvUgZoIdrkKTV0zF5P2bprtGBKtoYe8BOZdKWtOgoK9hcFNwQ7tHgZonrtKZd6AvPltkwTjbu
	l6AIoemEl8rbJ9mqORztQRObT1keQLnNyCQTRC4XzCq7Du8T1CzeigX22+M7LLEupjlzHDioIXZ03
	a/Qj3c7T2dnukcVHgy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9I-00000002Un2-0FlB;
	Mon, 19 Jan 2026 16:30:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs95-00000002UiA-1Z90
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0479143394;
	Mon, 19 Jan 2026 16:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD2BC19423;
	Mon, 19 Jan 2026 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840226;
	bh=Sci10TD3wPs0X/nu0ytauQ8Ud8Tj5YY+K+HKIyo6zgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z5mgImMYuu+vDaC5OsfyoFU4eAFJAkeUyQjSB6CRWktgD4KibfHiZ5CUg7Ays48l9
	 EjX1kGAqQQ+zZZ+UE7TUs/w3PWzjdeI3SjHaQUfxMbdJQjJNZGwYgqnowTGdH9AvHx
	 HdNKl9RxTyhrRJRxujGvwNkZ/Ifho0GuYndVwdirg+j36y+QMn0GE/ZUUpUPsm/s53
	 6Q3Rt2Tm7RurcqvI08fLVS7BsOgFE8BKgiHmQBA4X/eT+4hE4wfXAxn5WbcVQwMCyX
	 vSUrwRUb76V4rU/VmlnCa1I+cPShEEdWszkToxnNVTYZmhAyoHZLsmqagjwkUUQ9IL
	 vBJ2dSWQ0auqQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:43 -0500
Subject: [PATCH v2 26/31] gfs2: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-26-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=670; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Sci10TD3wPs0X/nu0ytauQ8Ud8Tj5YY+K+HKIyo6zgs=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltfAB1NrPj6vyLXaIZcARRV83kUQ0X6tnkqr
 rSH7KQc5nWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXwAKCRAADmhBGVaC
 Fc8YD/0T6/loL/0QUUXJpbqWAX29+wqZxsSH2ChHCMfmatnCljrw6rJW3ydd07PbCixgYxwa7dH
 zSI0UF2LvqlhJ4mr0JxiBXQN7XS8u4Lo+ji3M/Bdy7P9S2bcTQ01P8NbN7pWDALsXrOr4UwH/O5
 eIGCDRIvfIgg/JtilUi5Xw9J+WnBRW2/K6XL++bUEq7yaQpKuM3ExrBRnr/pLhRRW8KEbhOaXjk
 niizneAenTAevWvDRARxsjp4DCTlaVlWjnR5NKvqzsWbG8yNALPj3vH3g7tXi/JMieDIoovTugr
 zXQbQCushHy74btLy45zEvS0yxgoctX+LagcmgmtXgvYi7tksxbpXuTkNIpjTVPubcoN1wK5lVG
 0f4yqTtexJUdRyM6ZQSxbaCuvTulJy9+m/X0PvdfOBbH60lbjJfdkrY0CPVfwbzPiGqA7MzVo5u
 1is7wiL/+kvOlN4wDqKpE5hDJGZ7rlEOp+CAjjGKBYuWUsfMEcZ2aNC7ux1WmiW9qSjYbit4/Ua
 qnexquVoCAxIWVeOuXSEcbt+cpR3DW+9+uBYKgAINDiLSKyVAZvtG0z4IyOHVSCZ8BqpFOD1OEd
 pYVBEwtKLQpy/jKqBhtFB4GzhRaWAE8rKVayjBX06AYj+r+wYbEdOiHXCjjVbuo0EaMrsZrTArA
 /DiBfK7BTM2dyIg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083028_999744_E522CD02 
X-CRM114-Status: GOOD (  10.66  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to gfs2 export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/gfs2/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/export.c b/fs/gfs2/export.c
index 3334c394ce9cbe26969809874a94e79bf068b11b..43fd2203b34fb0894d2b71e50278e5cd68216ce7 100644
--- a/fs/gfs2/export.c
+++ b/fs/gfs2/export.c
@@ -190,5 +190,6 @@ const struct export_operations gfs2_export_ops = {
 	.fh_to_parent = gfs2_fh_to_parent,
 	.get_name = gfs2_get_name,
 	.get_parent = gfs2_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
