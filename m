Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F0BD29C41
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8iyUX8LYjMJ4Os8tsQNeakpAI0nrEfVTkO8zuzfR+Q=; b=YyOWRuKNqw9a1J
	iKKPrIzxHy8bdHwbZODlsPy1s8Pvtuzg3FzF9PVmbozv6B159PhAqHwW5u+6pQxCpIEz99ywC9+jg
	6oacVd9FGOiC9vL/iF9cu9Q76T88Wp1lN9LhY85q8umARWI6QbchZzAGu6Zf5BNRMfNk91AclgKa1
	cJDnWQa7noRjo3UW3otDe80ej6/DF1yBNEe9IMgVT3TY3urO1os6owVTxJkeHxTtouCWTsjDrSOVN
	Ssrumc7GiWwQ9TUpIov4ZLHm/OoEbiUWyt7hHGAVVaEnE7Uh9e62kVxvUPBBNhqjKuK3TMUh//sJK
	qq/p/JiLxvTSbh0SLbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7y-00000002U1h-0PQo;
	Mon, 19 Jan 2026 16:29:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7s-00000002Tzb-3vU2
	for linux-mtd@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Re6nnZH5SOOtweYNC6i0xBdtjjagVEySFsoYsbDZ7kY=; b=pi9rYiXin45XtIgzPWMQ3rX9zz
	WnYV6AnF2EkwMvo945hR7dpuUYcrsmAkvflKEhYrayUxa4P7tWodwmI+9Qi2jXAdFOz4srEGmM9zc
	AiSm7J72szIlGc/Ww3foen9Ik34CQJuNDVgyxc7jXdG6WwwJS83PrwLFm7PjAkY6aCcVOC5lMSW4p
	cwuFXtJY/KXJuOdATTfDjJSaC9BmMbE3u0jpk6eh2+iek4wtpD2N3ZzLq4eBBBUXU7TqSY35TWoBf
	gweretAoyT9n/imYICcUQQAgnEm9Vg0OegnHbK2XvY7MSCvDmfTRnivoArGw1eIW7R+ETjgzjikOx
	Md8hHX9A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7o-0000000CWHv-3ZDm
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D1C74450B;
	Mon, 19 Jan 2026 16:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A54BC2BC87;
	Mon, 19 Jan 2026 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840147;
	bh=AZAjr5blB9svvv4iy5pFFBzbvOqXSLNmipoZVSEtwIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JRT/TJNWCbMyt7yIyaTJly6FUhnDZuUxeZSzJVjN/nYS1ps9R0rsJvuhvNTrEk+la
	 1UOENFRaQ+Za0kHHt9AfFI6lZT3tyk/oWRcUSErofVbPjhO/YFqxhdt8WsPnnCiwPM
	 ItMD9tD5V3IaN6AvbQDQ94y0gWWnR60KsH+Y4szRkrmWQvAvN3aoV3uO1I2xGnFTjV
	 bb/zy/OjfmmKh+KLGE1ZQLzascQk+/6G4j0/cFuJri28/kIMIdJDY9BFUEXUnxNhAi
	 KKnnokIJ6qWsyghLwik29BZabKbpjfWWO9IBNOAfp2xo25sBNbzpzF0uEGAuTYvmFn
	 ruklEykJbu/FQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:32 -0500
Subject: [PATCH v2 15/31] squashfs: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-15-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=811; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=AZAjr5blB9svvv4iy5pFFBzbvOqXSLNmipoZVSEtwIs=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltcugWXdJNtlW+RKXOXYTtYGJsG/ZI/Kgn62
 QwygZmbY12JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXAAKCRAADmhBGVaC
 Fa7bEADGBiSWRROuSs8J/91dJopWVmzh98rAZDg+3UJE7SHjCQVSwc1En6E7AttfsLanh4BPsdh
 Ey7dJYDTjb3KJReJoWtnBzgjramNeksgxA+e4U65O6gESkPKGSPLVEuByheDKvRtZxmYTtiqgzQ
 Mq2wEtjCZaCAWDVrRQDMllcwjxwnnBpyGy2HIUVdgPO33orBwlEUy5KumpmMk2e+P8fDAdOdqmW
 McggNOU1g1zZKrHp5rGDw/zrD58y7ffoAo0LgxBIwRV/PXjnMWNB/qD9ShCqpQ4BTly2NhUdW9h
 vle0WG/ufE0iU82wXme1sD/eCdiyuDlzLr0gcz/A6spq6D3CzkOznL6gAdqAk2wy39TD8KxPkYs
 Z9/zAlzaWQamQps1uwnyUrZYX7AkWLLLxdX0RYn4XKio+Uv3rfn0hTkvaETy6U2dpjRknebcsJR
 IIRnE5cqH7Z6CylksCFnlCxHsDjnnrBGr2HOdEyX7vZAv4lawkMEFUbd4NnnJC99Y90W1T4O9sM
 lz0DCW67haD9hC9Htrx6MMplYEzK08RQaRhpP0rgNkN7e9hP4YyIFLMikzCI3X34Rdbegi4sDxv
 BV1chOMAWIlFLNKsUt1oXQPpErFamRzH7s+wD9wS+rtnGDO2C95CtPLHJywk32fbpo7UxFjaRsT
 NPjT8Wxn0TBT9Gg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_162909_225780_7115BE3F 
X-CRM114-Status: GOOD (  11.68  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to squashfs export operations to
indicate that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/squashfs/export.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/export.c b/fs/squashfs/export.c
index 62972f0ff8681c798f0b11e17d501373b2145bd9..c6c4d8f1f115c65b6dac29582bb5b447b823d3b8 100644
--- a/fs/squashfs/export.c
+++ b/fs/squashfs/export.c
@@ -176,5 +176,6 @@ const struct export_operations squashfs_export_ops = {
 	.encode_fh = generic_encode_ino32_fh,
 	.fh_to_dentry = squashfs_fh_to_dentry,
 	.fh_to_parent = squashfs_fh_to_parent,
-	.get_parent = squashfs_get_parent
+	.get_parent = squashfs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
