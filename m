Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB07D46608
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlzlIk/vKoDSktKPgk/0EAw4aeSe0uY+0Mfw7zt9Axg=; b=FU7n0lFD9PzLJ3
	SFueX+LOSwyTitFZhQPz80OKkTEUo1q9vbSmiTR32psm7GJcfzf9s00lz2QvncV4/8b7R3YHoXqHP
	ik/vgEGeRbWRofqRlFVdwqFO54W2E5E8kZFqWxq2ETY52MEFX9a6glo71hCGkeqsmFa8okwcMt+cD
	p1uUz3ViRjOBs+ILRz3HA0u7viI/AO845yDhmse5/a87buHhG6ltY4RZVFLhNVavmDhpq7CQBPk8G
	kHl42UNHF+Hjj+GkN1Slf6MsHB5hsa1KPDHrHL0U4hAgLkzzDg5L4tjWJz8Ykk+yJfBK2BhHb9gdZ
	Ewp8OGAtV+TGM0peYrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSo-0000000CshE-2Tym;
	Thu, 15 Jan 2026 17:48:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSk-0000000Csdv-1SV1
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:48:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A82CD44448;
	Thu, 15 Jan 2026 17:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A39C16AAE;
	Thu, 15 Jan 2026 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499328;
	bh=vuk9Wvyv5ES6VnJs/c70quqpIAbNAzCUaJcxJKcbQlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K6+XHbKxqod1uaKNGVLt+q96dw+BOnbjMcmu+xcP3xiYddgG/sJuefym6nZHrJfKi
	 uH5dyVS/KTA4hRUnraDib1V8YEkjK+G8GVjWdIm826RobU7wYg6pDfMglI8V+Xq9Bx
	 9pJ3DpoKFcm1Eq0APjx7imRbBy13g0E356azB26lJtgh0O5ScUdhZNVC/YkdtYSgi8
	 gmVhqy2XaaZjGGOepgCkNZyeiVv3OKETq63VZjHg0LQALYupnIm4QywOci9P10oDbV
	 pLqK1LQxhagszUU/8zfOn1rer6rnz7Rc+MW2csK90ADeRqcyCjpM3Gf8344us2SQbD
	 qJhmn1Zj47U5Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:38 -0500
Subject: [PATCH 07/29] xfs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-7-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=676; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=vuk9Wvyv5ES6VnJs/c70quqpIAbNAzCUaJcxJKcbQlw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShFUCOUlu0HwA0s7NudpYH2UNvJincQ80Jwg
 sEsHA/DeX2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRQAKCRAADmhBGVaC
 FSd7D/9HhL3CQRq9CDjJOgHiepYVXs1Z9+kqO1P1hOhsl8D7DDIrPttx5CuWUkhGAcKXXvzcPmi
 9TKdrUzG50aTMKrqulpKqOunGLLFir7B3FcVywRapPfJUqx0KLTsBaCdT8xUU3osoXsoeb3CQbX
 1KMKEJ/pU/MqyHNy1iKPHPkElMxX0QKsgVM69UadFRWjn2R3skLcJHutgI8INVYsrewANQfW4uS
 MscVfjtjTEcOZNxyFRYwlsCfSFUpDGunv543PqvRAVyvv0BQ+SFeO6U2aMErnOE7r56FTfvMOl5
 tuh937foFGakhJ8nJP9ZQy45v4wE4+/hQzwc8EVn3HWLC195i1O8tt+ewt74JopOTmYHtw9HWTd
 xpQiYgGhx4/DEAijagS/DXh1DHSEFxfNDJ0I9ale+NfJBNUS+zgavkkntEAPOI45FfOYcw0yIAp
 +JGVnw9DNGE9V/hefG0jVOiPj9uu5/A/hwgV5sHzf/Ck0PEZIPTmxsZbDRGdzyIzdk0Ht3Fh39p
 tYyLDOLZCOgznQbY65l6VAW/cvZI0oARSGpZJRy4OudPobv3MM1rd0m77loet1e8lq+9V7Y1oxM
 Q4C8bVqfBvhIO/ANW/XxX4fqO06IwLdqLVvdgppj/GI0MovVq4ZgjfwW9cKZ2xEQTiqm4AFJg9j
 k8Hn27V6ZD+gXng==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_094850_984914_CEAF9463 
X-CRM114-Status: GOOD (  10.45  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to xfs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/xfs_export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/xfs/xfs_export.c b/fs/xfs/xfs_export.c
index 201489d3de0899af34f0485e00fb8b36842d419d..1be2de3394841a2960c1b2791897067b83cc7763 100644
--- a/fs/xfs/xfs_export.c
+++ b/fs/xfs/xfs_export.c
@@ -248,4 +248,5 @@ const struct export_operations xfs_export_operations = {
 	.map_blocks		= xfs_fs_map_blocks,
 	.commit_blocks		= xfs_fs_commit_blocks,
 #endif
+	.flags			= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
