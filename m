Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281B3D29C41
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6it6fs/nXQN9UIjZ+qSiX5Fx1Lh3vyXYocWREKSWWk=; b=jqt62J5ob5OFXI
	tOdeLY/6AuOfqywIy/ngztTP3p8ODAF3dRH7r+NAUMy94ls0PEsTQOhxjK9oPnDvyE8zJtNjYqJbh
	QUy0deysos0t51TJeeWmOPmzB/PqLn9vsT92g9br2GO2ceJ/mAZqec7+UsRLUzi9NV8pi2/FqQbV/
	9gOSY/pkmlTvFNcaH9K529t86X+kRWgVwKx1mnslyWl5WKojCg9tWEtJnvdlro7ZV8mbax7x3GwhX
	ViN+CMeqOpX7JSnwoWVIR+c+PHqT/7EUxRJmkEKqq805LdpAXjZQ5uANeZQMvGb1NytUnrBLR3tYk
	GzdbxiDtB8ismmJ2xf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8B-00000002UBH-0moV;
	Mon, 19 Jan 2026 16:29:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs89-00000002UA8-2ooe
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0BF860140;
	Mon, 19 Jan 2026 16:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DA3C19424;
	Mon, 19 Jan 2026 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840168;
	bh=G8L9z3jgn4ZzCiBzdCY6syeE/KUQa76p5EoRG21yt4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s0+VO6sV96AAayqW4HXC57FxZusoD4Mr5w8orM2wKOHjCe4I1o88b2JDzVMiBf77Y
	 pDDjACRlbOlveBnJiQcXYVA5qpw+/sU2t9cL+ik+kbcwUdNnDmXocOzTjFulfYcHI2
	 x2A4unujL8OvOlpmgw2+OIu0I9FPLARZ6mdAINLrqA7eln2pZpKV59z8M/E+gT0xkw
	 xUrOTL9ynJB2DvZABkuZtdOF4x5IHc14IzGdRINZFy5mpXXM/x3ukRBMnStp2InutK
	 CQpw9K34gzMddctLV8apZ7g9I5NucGaI5vYJYjUgfl4BotibidZnZ3y8HmNY931YWC
	 N6Dy2SFiZXtTQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:35 -0500
Subject: [PATCH v2 18/31] orangefs: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-18-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=G8L9z3jgn4ZzCiBzdCY6syeE/KUQa76p5EoRG21yt4c=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltdXD5/4/NEvshZqyvt1InnFNA2XQmYrmnTp
 pyWIY7yRpGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXQAKCRAADmhBGVaC
 FcL5EACKAKVsfzFMfTk2Rxl44MOn7Jxmx0HGw2TNaLjhEixH9/SJUnhSyAZxEqPlwKij9mWLRg9
 egLOfPv4xhcGi23lAB865UgUt64WvqFfyfMMdYy71SNI1xeODPqIf3wifOxvwDu9L+U/jmLnQio
 G5WhwpXxYDtE/CTJQQIlFIhjbwxjo1/FLRxETOlt3wlERGLD+guFUoBS51K0YtAjvLB0UHSsQjx
 JLr1J0KKtVdeSSPF5aie8eA7UzNRko1ECjRTHdljrDg+uyV1//gbZ9Is2UZmJyRBbzlfi5/sIGE
 gwjA4Ud0gOkvn9MVFLyc5IXIvO+GkhZJ5oa++NC1hmG1o+rzBleXhb7KyYc6GBC23tJM3YQicN5
 zzau2UUB0ypQ4uefiOj+ilvYE9bQcyjR9dNPSxO3f52aJOYpLd61ADVfJ2hOSylDBWcJrY/qtoh
 xJ4rCxXYQvqZE4cKULYWIt98FrwfMhaLc0pBN0bWK6V8yL6Epj61iw00IWkT8zRPIVrjGCqdHpV
 KoylaD3lxPgCuGO/e0wwO2wU/h2UFpO1o66DZgVouEhyp8OSQtNZIdkFKLVmACRR+k5YCVSDKdT
 I/cC1UslVadh57kMMm+xS1iAZvb9WWuJ2bMgDRybN1wR9LY39O0TPBVl4/YilWCVBRz26kgARRz
 jQUOMwDTLocp+rA==
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

Add the EXPORT_OP_STABLE_HANDLES flag to orangefs export operations to
indicate that this filesystem can be exported via NFS.

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
