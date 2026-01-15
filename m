Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A363BD46604
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgaaLnQ57bVKACbb8Yr8Dfws8hQ1BtPqIpShT3jOSuA=; b=YR+fQngorNGdjv
	8jP63Yb5fDISedgG1V77k5LRhEG7MF0wefkqoIcvrZHwggZ37B2nDoBIQfGaMqfvOquq7SeT062zp
	tpjFOI+jODQ/r6+m3jVf2mcAfFvDbYZeY7Oj8wUdWMXXRIh6Jis9KdwA869SH3HfBGmACS3pAiRa1
	olvKe4syyyN18RKeQNvI44Wvi4YXz4M2/TKw7jauL1YCOALELkNTmTwY7nou2MMgpCCdJB/OA66XQ
	IOsHS8dIlAPESd/N9HLbG5Juw+uxdnjLUYmChsVIPgAkUHHNp00dOkHCY1vpBjK4eDRkPirvhSI1X
	JrxCSOrTL92It7JM5BDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRV9-0000000Cu8p-0n1f;
	Thu, 15 Jan 2026 17:51:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRV4-0000000Cu6S-3l40
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:51:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DD7B43830;
	Thu, 15 Jan 2026 17:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28E0C2BC87;
	Thu, 15 Jan 2026 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499474;
	bh=3Lesog+saJIE7fVwXxIqzocDbbL7seXSBVcQWCAEylo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g7YSb1/TODzXkcIP6p9/wwYu2DGdEGs5A1xNbEaa6YXpXHCkZo75dKOhpzbEnke70
	 tFl/wi+2L9R7juokN9RrAO2hzFkzOo1UolYG7PTrgtqycoumg6wuMYanMSAiGEcL5+
	 rrebzmnse1W5h+gJbvvkGvabjn0w4tpVTl+YkKEq2+zyxzqIIVNGyGxTNWXPGgnVDI
	 yas38IdE9VvF4iPsPwJa+4aGhd++bDzX+ryoJ+6LAed16KiFtr8ZpWA0uQW4o4J8uj
	 O85No7vo/UQXZUte7vVLWFrrfWkgy2ib31R9cgJpIQxJgqj9Q4vVS5rQZcE6nkgtGB
	 bWbKRQtHDsekw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:48:00 -0500
Subject: [PATCH 29/29] nfsd: only allow filesystems that set
 EXPORT_OP_STABLE_HANDLES
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=3Lesog+saJIE7fVwXxIqzocDbbL7seXSBVcQWCAEylo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShL1IWuANGZmRgu17fA6ieKmPdFRTw+kdOfE
 T/UW6Eb7tSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSwAKCRAADmhBGVaC
 FVMKD/48eycQzLl5j5B6HkE8L1FfwXraMaTibRGf1ZUUO1tdf5xaliTxEmmTz245juQt2kJL6vV
 t3v0tmVInLOvhNl5Gml0VNKIfoY4DHYYDMqab3/BhWW52OAXYuFC1OHvNjVSOItR8sbZ+iJfdmP
 cpCABU6fsvW2RanNoGDQLVF2gHpTCVktYbUOx2fTqCClkLlPc7eyiG53QS9imf2Af1jR9/MObU2
 UJC8aPGoFg29JP+VBrJ7+K+uG/qCZ+4Lk8yD3Hb0EdyY0XHb70hMV4VEfQq77MoCSoVGAWAYq+b
 sydLKAPVS0MlM6fWB5A+y37+o3lo+1bVTlGmwslQVeTQiyGkKAYNQNCMygOJQ75i8hJBaJ3Ui0r
 wPpANaw1oBzTALc2orq3uIyZ2m6Kc8WXMOVdDcT86U6pBRMdATdTLzeEaNV+i+eRTrA8gCkrAXq
 JtaYC4ihJzgaSo8BPtxAJdlyFFkmEA8kw/Eg1fhJwl9r88x60VPSbw53L7sBrhYiykB4xsS0Yn0
 hW4FHIe8yJXugnlD+0XpRgz9ejnjAuydomhlSsmB109/2pn9NyuzvVEW6QO6oIhAsH8y+nYAm2O
 zDhKSTd453A4Zb1cz+XkXonK4dyl1yN7vyzDar6cQ/2BJVoC+1C7e3OSHy/2knx1Qt3EFlycS5s
 GPaWvnhRUrWOAkg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_095114_990684_8BDBBE19 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Some filesystems have grown export operations in order to provide
filehandles for local usage. Some of these filesystems are unsuitable
for use with nfsd, since their filehandles are not persistent across
reboots.

In __fh_verify, check whether EXPORT_OP_STABLE_HANDLES is set
and return nfserr_stale if it isn't.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfsd/nfsfh.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
index ed85dd43da18e6d4c4667ff14dc035f2eacff1d6..da9d5fb2e6613c2707195da2e8678b3fcb3d444d 100644
--- a/fs/nfsd/nfsfh.c
+++ b/fs/nfsd/nfsfh.c
@@ -334,6 +334,10 @@ __fh_verify(struct svc_rqst *rqstp,
 	dentry = fhp->fh_dentry;
 	exp = fhp->fh_export;
 
+	error = nfserr_stale;
+	if (!(dentry->d_sb->s_export_op->flags & EXPORT_OP_STABLE_HANDLES))
+		goto out;
+
 	trace_nfsd_fh_verify(rqstp, fhp, type, access);
 
 	/*

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
