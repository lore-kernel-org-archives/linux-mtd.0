Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3892BD46608
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAH74nHbTv0BigdCrLsLXt0SogHRU9/AmnbWy+xfrLc=; b=P9hS/dE7CmC6tf
	IeVySuXv7qF3kiHjGoPJ3hlz8bkzUd/moyFzei82sLZC1Wp7EPlGzrtBtSysDE5GaEoKsBAEFq0dS
	i+ET/wgHgUw9EgHFvhsyTZeedtkdSfZ10dSLoKBYsq8FRBak12YCMpjAF7A29Ir+uNlWtkX9ITvoU
	m46eYULy65EwasOGwEmupAWwNodKczYgRWdqMwzK51Hv2wpoW1JyIPdNKL3UWM5YtyCJNqvAxUFT+
	Qc4evth37TS16r43qX/Ij3Gb1lUh8AH1290bJXcLNWePZIRku7KcnfLUzqNywZ6lR7YlK2GS/W1xW
	7e26q5opab8s8epd44mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSr-0000000Csjj-3rC6;
	Thu, 15 Jan 2026 17:48:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSq-0000000Cshz-0Xow
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C0AE601B6;
	Thu, 15 Jan 2026 17:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EDFC19425;
	Thu, 15 Jan 2026 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499335;
	bh=bjqNmWwoD40Qnk+TzNgJZFwf0QIhVfVk3tp13EbdB2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SM3X45Dk5uYSSa9zWw3XI4I7Ss6sYTSQtClsuuSbca4pRTbsigBy2OSxOWAVI21wR
	 eZ2Fh1LDbYgzQ6voMboihPby2Z1r5nZNmYeAGGwLvaOCqd/5AIKAgWF2Zt58oQCDEn
	 9WuN15JYC7TmHhHEDPO7hUm/HiRvG5zY24QwluGrGzdolaEdJpSPzPJYgp8+EtX1HN
	 j65MdUC0VNymAvQX7V5Bdy9+xqyXvdn1rd0p0de54gL6MLS06X5TAQiqXSFIUW/7R1
	 QyILvgn7ZlION29gYsD4ezO/kSWgzPcuIsJfdl7/fUSbH8RL0iPM5c9vQe2rKPXh0W
	 GMbfwrtSWhKkw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:39 -0500
Subject: [PATCH 08/29] ceph: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-8-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=667; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=bjqNmWwoD40Qnk+TzNgJZFwf0QIhVfVk3tp13EbdB2U=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShGa8nQcABAK5jEXI2cbk8SHUMrCeg06EdMp
 RCwhBgmYRCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRgAKCRAADmhBGVaC
 Ff4wEAC2JupfnsVYXONrdaMqx7Rc1TCYHMpOlEnGJ3bdTPbia88mLGCcKDAI5WggJ7XRzIcKHWg
 650uAma7Bno5Mhk90U6+216K/tjZqXt0pzb4+W1kBELjWr4uFeCBB/pUPuH0S3G0p8T0qGT0/TH
 7gtmc5LBWW13mbYVsuobNKq9/GgvX4cR5cH3j8tbU9EXcoH6fVcRiETTdSysAC2+ne7/IdzZ9rb
 4BwiU9ebeLiXmFO37Y6yMQjX5EOr2k3wTZs/r3XMJhh/Ln/HXNa5w8VaRxsO2XO5Vq2r+As561d
 h1986yPq1624DSdy06ZKpUJiMF+roEU0pm0B9gzRlS6VLTaUM/RJIoq9W9foUp7hx2TEdQnF+en
 6vrSImaQZeCd+yBOkQSIUzt9mHiFSIUvxJ3YCmipafSLvhMzVX2jcd6RjE53mi+W1N6cvjmxxRr
 RcyTfuZWdbBsY91RySpnu9RZCgAz73j9EIJgvltd2CBdJaq6iFblaeKSti2sskXks2Oc8+uH86Q
 BN6MElZwK605F/Q+8CeGnP770IaFbHsiDWQ0lT+TI/5RXwU/E4MJQ+i41xWwu2GcQcCTk8CxAIu
 GCWx27MAOo5ADN/9Bj09FzZbltqCtp3P4+ZKEVUNQSvNSllzlVlduvpsl/bH3/ubLxbBdVYsPBp
 kEcghw8IpuKyeOg==
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

Add the EXPORT_OP_STABLE_HANDLES flag to ceph export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ceph/export.c b/fs/ceph/export.c
index b2f2af1046791d8423c91b79556bde384a2fe627..10104d20f736a8092ed847ecb27030be286c0ede 100644
--- a/fs/ceph/export.c
+++ b/fs/ceph/export.c
@@ -615,4 +615,5 @@ const struct export_operations ceph_export_ops = {
 	.fh_to_parent = ceph_fh_to_parent,
 	.get_parent = ceph_get_parent,
 	.get_name = ceph_get_name,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
