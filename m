Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176FDD1D480
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgnnzUmYniIyjFLx3amqHZJkGvV09OF88bXtg6ONZdc=; b=xpbeucPj5rHG7c
	fiJOylpy5st1n8ZPcD0v4IBMw+8sBAPgG1FH7keg9t5plzWegUTNfSVctzbjPPi6dKCu2H15R4nTn
	/3YTYWqk9ZUWgF0fWDbCv26+lGQdQizhcScUAyShI8thfOPaGJ/YmENa3l44s6rlvdst4YP0kX8HP
	MjnmobV352NSHfzqN+bYRZpLe2xFmg5/sTxsymm8tZHVvRVPWfiT/0WF6K4Y8qxjJcaqAVkuGa7aD
	NB85xk5lwmNUIPD/t0cvaGhacoi6Wka3vhfG3io3RTcmBbLBHB7/I+z1CBvXtvLe77DU30DCR2W1d
	CwpJp7AgHHQYbfzZd+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtbB-00000000KPk-0ICQ;
	Thu, 08 Jan 2026 17:15:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtb8-00000000KNH-2NSf
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4335B44454;
	Thu,  8 Jan 2026 17:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B8EC116C6;
	Thu,  8 Jan 2026 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767892498;
	bh=WgBctrBD8RLFVYdXDqzWSCdo8NzR8JtstjicYPh/U9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yc4/t5loZyezYaHDNXK9dd9JvafuBssh+sDSZ3exryKjh9p7XKLxOnlh0HZwejipA
	 tmTIA9/0xJ8xrgH6Y0t7D/mGDf0AqOx/WxR5blHGNJ28gGiZsD17coCliZNvV/vsQQ
	 6XXHPDcyYcOAYUAUaCsSzNRMecSySzNpEAlW8DnTJpjxE+2aVYhL1ZUMVLMRfcMxTd
	 xcBwALhaSlls70OLDrhfnMlALrjEGcjhs7rFzNgirkNOyZkEjSq0YeHhTjU+YgFGXK
	 0ZdpaO1Q0mxXKVnWoQw6OmB+h27qt7MwfOpTqYoFF0/0bFAfq9Vui9DQor/pHuo71X
	 3yAVhPaaUcVtQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 08 Jan 2026 12:13:05 -0500
Subject: [PATCH 10/24] gfs2: add a setlease file operation
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-10-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
To: Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, Nicolas Pitre <nico@fluxnic.net>, 
 Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
 Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>, 
 Chris Mason <clm@fb.com>, Gao Xiang <xiang@kernel.org>, 
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <chuck.lever@oracle.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Bharath SM <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
 linux-mm@kvack.org, gfs2@lists.linux.dev, linux-doc@vger.kernel.org, 
 v9fs@lists.linux.dev, ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=WgBctrBD8RLFVYdXDqzWSCdo8NzR8JtstjicYPh/U9Y=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W7rGRw7xJ9j9CSSmtKVJzAnrZ9HKw5x4g6Q
 fvlmyGGcu2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/luwAKCRAADmhBGVaC
 FehDD/9tUv+oBi/X1dqLnHkQjWAAqllp1O9XIJiC0Dmcj8NdKQjiIEJoahbDF1BoadzLSTlRIhG
 A4Ia4k0zHK75I3zk36XIzkn0YkeesqfVpCvK5vIKdcZPe4GPp3NEtPgWRDmyc9smykSu9lcxyGt
 o3l+UDqQoHxbqKwJZH9ShVgldb3vOGhWSCMI2sXQdc3CYDZ7ZxCc3YsKa5ZRB5LOjockkEKYWK8
 p6/cCQQ6VrgkzOzR6kcmCg4RDj2xDwpeWdoJT9ycfMG0UjbmiVkiDGAa4sRYDAVvfy03xNezHyU
 5fyokGDABc5UKt/0cGAZdgST7O+ieCGQbEmmqZpU1+cx+UOOG/2pDPs7oDoXS4jukcCWY/H5GGR
 FUVOQ4/6u1giyiF91KGM6VNNqNpV8VEcv8MEgDz/SAyMMSpT4EVfVtQ4CfbKhLzJPALVtAZeUBG
 iSE5FEWPy5iiIR+EC/zcPL87/uOHshC0KlklvrdJMW94IKhSSDNyw3dkrUU9qEuYOxDTa2qfxvG
 /Hejpi55FfCCR0Ha8ZwN9NZvBz7U51fU3QOgjIbntwAC6kia2Na5SdIB9voB+3l3b9eoMRxPGxT
 biskjjTc1jw8WRjwPA9wlhGjmNGP4Vl8Db8cK9ZzgRfrZxP+iZ8N+sFHZS0E5jwImgp2j1lEnZX
 PrqPNklrdm/ygrQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091458_648880_08B1A119 
X-CRM114-Status: GOOD (  11.27  )
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

gfs2_file_fops_nolock() already has this explicitly set, so it's only
necessary to set this in gfs2_dir_fops_nolock().  A future patch
will change the default behavior to reject lease attempts with -EINVAL
when there is no setlease file operation defined.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/gfs2/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 86376f0dbf3a553375b0064c9a1eff3bfa9651f5..6daa96d815e1e30f099938543a0ed19aa90c720c 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1639,5 +1639,6 @@ const struct file_operations gfs2_dir_fops_nolock = {
 	.release	= gfs2_release,
 	.fsync		= gfs2_fsync,
 	.llseek		= default_llseek,
+	.setlease	= generic_setlease,
 };
 

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
