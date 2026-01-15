Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E88D46607
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rP/169+aXOzjI72NsF3a0o5urus9uW6sAGODc9HGLQ=; b=sepy42zOiuzjEt
	0/2gaaBWsbbiHUMYPdDcdjlTd3H3Ia0m7GTNzhqVpbYEHcTf6wVsK70VlWwMCnDxqIx8csEf0dKb0
	yVCJpmrngfxLRHoHDVJuVPxa0QA8KR9Enx1jv0P/B8nOPjr6340kCUr+JDI+wKmhhIBPDZ6yDj1rx
	Drtfh0aOHIVMSBTgs+apXAtypowfvFdNXlcQeYiY/Fn30xvvsxwZKKuDcfk6WuYnKg70nh8G9tCLg
	qAH4jPEZEF09YTgtPGFiNl6aLBnNjImy4spDX+AQKWJCcflgXFj8VQva/ibOdQ4Yo9FouRZfgH199
	Bju4RqmZP2upVUxrWDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRUT-0000000Ctjv-2h9l;
	Thu, 15 Jan 2026 17:50:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRUR-0000000Ctia-0lM7
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB46A40DF2;
	Thu, 15 Jan 2026 17:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3889FC2BC86;
	Thu, 15 Jan 2026 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499434;
	bh=Ehx/fY8sKADLaMJl7+FCvLMSAa/U8OqMGXINa886kwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=il/VdfDB1LkGOpRnPQvrFUwdx0K2JPqnFGRJntiUMVPnRxs5PHZsfMSValtvlYy4j
	 mP/J05iJU0gPS64R8GEMOhjWoZHTdcqWYKm1Ogw222ideGX5ipm1oSmIbMKQDoynXi
	 UP645amY6X6foCDNx121QYUsH6YuE9qBLm2QyYpgyOtDMDTtrSfXKS6vvYfzeGVlpZ
	 NBXNHO0X6RoEWOVoNemGaYh4g8Rj0kVFicUqGBtTiM+GOp9CM0/rmo3WVap7u4Plx9
	 iF1KhPCMNTJlYXtmOpwM4F52XhDOSltoNylPFsa9HOjQ5jMxePli3mEAGzckJ3GyvS
	 POj6uKKk9HrQw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:54 -0500
Subject: [PATCH 23/29] jffs2: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-23-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=695; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Ehx/fY8sKADLaMJl7+FCvLMSAa/U8OqMGXINa886kwM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShJPTKQVJtR38HPlADggm6IpGXuFgpgP+f7i
 KyE9A2oIKGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSQAKCRAADmhBGVaC
 FXW6D/sGkS32C0CvjQ+A3ll9zy6dfI2gSXvXs2ERkXcQcsSsv5r/hSiEtw2RyBxQyx6rumNm5mE
 QyUFWXbdaTwcwSGobqehxKp5MKzzcfp66q/Zpo2jAaY7Da35SD3PyLH2KIbv+fiLrBBo7g4tDXn
 mkyY0E5I7NyoHgkD7SQ01nu7bbMi//dbuZJ6f4swfTGiZIdiCkQdMPdK8Ab1nXZBTmGes/5vUoD
 tGaMY27xGBCoU1OH0XNfDeZDjCmt0zCV1GcU2M6s5qytJFpPecsCi3g9XTpKEPAiuUVohlmUH6Y
 964nITE1D+6aDlHH/n8fXWwBcwAvWaUEd0zjh33SwdeUbgGGtpFvVIY5jZvo7+a1zqLkm/v02PD
 i8nD3PIVvfzsAadwDV0ljzI9h1nNV0XB5gAA0NYuiq2KdbpspRl3AwFGziplhIc2IfOUFi4pqEx
 SWDLkaRbFUSzetyFiUM3KqyYHrJFY7y1lO0+Rteb0YEfr2HVYP+9wA6e1xFpmUVrxVQCszE9tzS
 qbr2AirzqRv4ThIptuA5w3v8c5ZPCJiKva4Jx3gS8TT2vj8MZlBxl9rywDy5WyKKUPnoFelofEp
 giBXGcbgNMLDfX7iQ7xtrMTIY2WQNMzmLb0/QRyfr4yue/WVp+cUchExc+2VVPEi6eH84pgNfcg
 n6TOjJhVwZKiTNw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_095035_271888_4F397F76 
X-CRM114-Status: GOOD (  11.01  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to jffs2 export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/jffs2/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 4545f885c41efa1d925afc1d643576d859c42921..80ff5a0130603f94c9bce452c976753c85314c3a 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -155,6 +155,7 @@ static const struct export_operations jffs2_export_ops = {
 	.get_parent = jffs2_get_parent,
 	.fh_to_dentry = jffs2_fh_to_dentry,
 	.fh_to_parent = jffs2_fh_to_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 /*

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
