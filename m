Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC18D29C41
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmJu1bvzSm/8/5PjadwIeRXMzEPhKEudowT78PS7BKI=; b=o2sKFSyp/LOqTm
	ulFZPvxPHFVjxt9+hT04q4hK2xq3/0XJg7JqJjF5vcZOSWGQKiDk4YrjmMIOhF2OfdNRNd5MBEKav
	KM9TKYZdLaKQdAfbTGoKZeUwyIqAe3ejqnaWes2TLpEq4X5XZYGavD8UTnGckR82h5eeIOdnYP+f8
	FBDKzvFcuJ4xaiLnNlDcu1kDsF6DAO59kZEfak9VlHp9x5eWWGKRTMMuoAhLNxHRBwbz0U3F+DH1o
	3FxIETE08O+u52mvgkT91oHJwy8uoZRbLcQ5zSWW6XuLTmzWcdOtoYXtJWmExH1oxSmMFOmhxZFrF
	LuSGrWao7CrPiakjTgQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs6G-00000002TBq-2cA3;
	Mon, 19 Jan 2026 16:27:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs6D-00000002TAW-3eAe
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8487F44514;
	Mon, 19 Jan 2026 16:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ED7C19423;
	Mon, 19 Jan 2026 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840047;
	bh=kHox+Z6m0SGAxt8eN704T4oKG2yhOc62IdYplYhE+GM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EZByvzF31znoQEmDHc3SC4xaf0M/35g4xjcVwooMk1FV61HXxLESS5MiLKX6tWFeo
	 Hv85bBuLMqHqez3qHBscy+CtxbnArxV4QeHTrTHLdSh1NMKPN6CGz094DCBrAFgM+D
	 AjJf/kL6odSToXoYbC0BwY2wXW9BcS3BGnPOFuFUygBqW+EJJ8lAxaO4a8DC3mSQ8J
	 aALSFez2K6qCZWewncoJbLr2GlmdBWTKm66qurJ4sNUMMc6kZedy35j6ubnv3HJVKy
	 Bvebe3CcZHZIgOiFzpF4s1XQUiXn7842k1apwk6XDZswZtqbHhYTTAxje/WAZfxElR
	 uszu+UWz9bfRg==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:18 -0500
Subject: [PATCH v2 01/31] Documentation: document EXPORT_OP_NOLOCKS
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-1-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=kHox+Z6m0SGAxt8eN704T4oKG2yhOc62IdYplYhE+GM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltZnWuxHPCsFVnqSKxTO4m+b3RG7VE55J4gy
 EWLrXp3yVmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWQAKCRAADmhBGVaC
 FVjvEADKTq3x5BhOtt6Qj64fRRaPHGOm6Bc07y6w5GpnNyCiIQM6aVpcn4F9ORvzukxMQVO/XqV
 Gc7pRAymSYI9s+GWvc1x0IU9sGCQpVsndLJ1eMMzaSgzVz8dIezRd7/k/HS4GGz8KNiZ2jDVfnp
 c7wjN+XdRQXpWC2qRBgezSkBBYO58OTuQjDA0xv+b8CbjqBJCbdapflO/lt7ryNb+3XN8JC5dOQ
 YIhjhVdYU3nTYtg8Wq9oRME1R8VCziBOEPSM7OnYvrhhboCQUKPUNwsEEk7C876Ssr6Xwhzg2+s
 rf7n0oAe2dp7xo79Mjf3XuKcCwQcCR0nZmAb0xVbxOvXhbG+BzkFDnwcv6SPu/LgL+Bz3eELxNT
 IvSpL94cTKsI653HKrBxtZAfiJvm/rxot2mjA7pmc+6jWNOm2djCX+Y0VXRCNe8OqjqjcrEnjQT
 IkV/uSXMwte2MxayRUcDLG1rzsUFA2DoS4bR5w6/iwIQIQWtu9+KsQ1oV9LMsta1GV4E2apvumM
 uiSLYCUypySFenb1mq+t71sXvuaLDoDMml58ewc9RqEz+RxUC/4UtXeB2VmTwzcs77p1HyNq6fH
 inBJXCW40vznVwdr14HUSxVYt3p68U3UNWanqZKW2184K08jTVhLuH2KEneZ9ix1b63/moRMZVz
 RNyBzV2Fd0KgbIQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_082729_952524_A7E0649C 
X-CRM114-Status: GOOD (  10.24  )
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

This got missed when the flag was added. Document it properly.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 Documentation/filesystems/nfs/exporting.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/filesystems/nfs/exporting.rst b/Documentation/filesystems/nfs/exporting.rst
index de64d2d002a204c5460980c898d4ec41fd43d47a..0583a0516b1e3a3e6a10af95ff88506cf02f7df4 100644
--- a/Documentation/filesystems/nfs/exporting.rst
+++ b/Documentation/filesystems/nfs/exporting.rst
@@ -238,3 +238,9 @@ following flags are defined:
     all of an inode's dirty data on last close. Exports that behave this
     way should set EXPORT_OP_FLUSH_ON_CLOSE so that NFSD knows to skip
     waiting for writeback when closing such files.
+
+  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Some
+    filesystems cannot properly support file locking as implemented by
+    nfsd. A case in point is reexport of NFS itself, which can't be done
+    safely without coordinating the grace period handling. Other clustered
+    and networked filesystems can be problematic here as well.

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
