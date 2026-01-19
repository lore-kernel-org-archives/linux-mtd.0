Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC179D29C46
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3naQ9rzOSxl6yHO7PyPpOHtKfwFTeCVcfXooltohik=; b=jqOXIteeNlD9AB
	ohrPiLKsPuP0lPYj/pvnu+YtQt/GUm1v1YWcepsKyWDRq6QHEi5XDrBuKFEjfAdfdt68wfR26/Ebr
	h2VtE2kWMFi9zb6GncX+z90ku9LCSklgXjvAHGqwHLDjst4pPOinQeqVzC6xUIbLjCm3/EFgXEEV/
	gaa3AD0ddVbKOoEIVcmG5n9z98aoPMBlDWiIcN19h2NYhaCeg9DpZCoLF8Unr1Z5U39BS0ayvi8zn
	ukHWEM6/ps42VRTeDUE8Tpbox9UPgjulxybCaZF9GwTMzJfyvNPLtaY75sSI8O18zBHP8irOEE/QQ
	l1GnxFM/zhMs9Fizr+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs6T-00000002TH3-1CSH;
	Mon, 19 Jan 2026 16:27:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs6Q-00000002TFM-0rUg
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:27:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3F3D444E6;
	Mon, 19 Jan 2026 16:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DEDC116C6;
	Mon, 19 Jan 2026 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840061;
	bh=0HPdHuxiDqTtA0YywSuVWS43ZS3BgDMq+Pvu7w00t7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fhdBn2dBdU8qsd9fov0W3cRwBs6xrhJwrMmju42vZTu0LzeOcag5Mdd3r7MGvyvhc
	 YG1QDMIXTVtBeBMOaWEDZkVVxwZu+EAfat7NXseb7Li2I0zzhNkCQy7u7LTQqy4eQ0
	 yFx3dacO6OxpJ+t20CfGLKs+fb+h+fjlnywsgqy1yVtebczKM3mdOFE/4kZavk2Q+r
	 UnXmGW0DAKOqCQ10ZePYNiGtJT1Pxx1s5rOAc4Z7h8dPo4CkiHrhax+111awiCI+n2
	 vSLb86fZMTxXENHYCelmDQ1/Gd/cB5QhTtutKl6phJthJ67CysXayb7i1Qe9n7+pWC
	 oI/oX14JZ9AWg==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:20 -0500
Subject: [PATCH v2 03/31] tmpfs: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-3-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=0HPdHuxiDqTtA0YywSuVWS43ZS3BgDMq+Pvu7w00t7Y=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltZJI9z4X2wT98SLfDh2LLMCfOso9BJWBaSl
 4V78G5vaYuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWQAKCRAADmhBGVaC
 FacVEACaj9MFO0nJvhnrbzJlVoaITK++8XVR/P/SlqYInzb6OApdrLCDaYj4o7clJSxoyY2+YXy
 nufOx/AFKfqW2S6FzC3wk0Amea2TLDHxNelOCx/2SIff9t15wvQiA4ZLxpYQVPPFLVxQK2GRK1Y
 GYWpk4R5NQjW8pI6fmnlB1C0Up+pudUOErMNmSgrXnGknVVaCMzqt2Wmc0wQ/KnpYYRDjqWzc9Z
 4aPzlAGV0DjDnRr7i1ILM6O7+x9H1+oqvDf5uPli/I699nETR/nnfhRR9ydxu2O/Y0BcZIQi4L8
 DWiDejEGM1IDAXwNfYeM2L24B9rzknRun4ykATk1QAYlBA8sjY2hW5RA1rtsopmXraY0wgLM+v/
 GF/ZzduMVkxw2L7+3SfIwl9IF4v8+vk8svrrLK2aDrvbA35RDe0QC55Z5Tp+7RGh0S9AL5Tpgz5
 RFL3t9hL/j+ejpsxX+/cYTzdyMe+uIzqVubH4KhniotJHOe3U+wPHnwZXvvfOu0QOutCllL4o4C
 pl735gbPZcgpGxib1cuKMRukAgWC60c2w+jfYn3Vb+VyhwXLbEh8Vg9K7yMsSHYubjYw3a+MP8B
 2PdQ1JkgTqMvc6gHLGaQrzIftI9HQBd8a3otzqg3wULPebh48F1QRniiGaGou9fA4+pe0fcaGK7
 9dnB8OyYRbW/VrA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_082742_864091_61074192 
X-CRM114-Status: GOOD (  11.00  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to tmpfs export operations to
indicate that this filesystem can be exported via NFS.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 mm/shmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index ec6c01378e9d2bd47db9d7506e4d6a565e092185..c64c4410b4fd9961599a5ea768b469d8184e713e 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4477,6 +4477,7 @@ static const struct export_operations shmem_export_ops = {
 	.get_parent     = shmem_get_parent,
 	.encode_fh      = shmem_encode_fh,
 	.fh_to_dentry	= shmem_fh_to_dentry,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 enum shmem_param {

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
