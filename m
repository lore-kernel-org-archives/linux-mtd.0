Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E450D29C46
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QSr7cPWLYeYSV/Uq73sL8kBDij70U24nDmqCs6N9Gk=; b=WO6n7VcPaHpsp6
	E6zrCnDayDY+YN8Op8GPozIhp52G0aPQ8D0jZKhR1G7OQieEf1LtG0wTad6HjC0t+zrnBrnn944Rq
	MOZ0zE7T/BcpNeWXwcmjimLu93nF7w9NGkAjtCne29x73xjN0nj3ICi2HDyFAoPz2VQlqo1PMbAn3
	k4Eao6EJOH4s60bVKTj+MHQSRkL2SgoqL+XL98pdsrLtLuP7JMESNvDbtJAC4S2ExAREXTJmfrdbd
	cp3leyX/J2a1LkYXB1trwcTAdEjn2Kjg/E+R1sv8w8OaSCYbNN+IAqsLeM1+NaHLn8DNCC37EUpEV
	Y12XwGInWc8BL+995CxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7Z-00000002TqC-1SZu;
	Mon, 19 Jan 2026 16:28:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7X-00000002Tom-0hHA
	for linux-mtd@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hIUiCiYvj4+PQCXeGc2dRPv9jWC04oKwYnr+8nkAWKs=; b=Lu6smQcanurs/uwK74DF7IdSzA
	HCwJuplg9C5TAu2qWRE+twhPG5E+2PEth0tNJXtmLcOzvGs7chmhzMdCrMblq0JlDrjQQtrSH9rsy
	qgxywDajhJ9FlDyPGj43QyK25iufH8b1bz3tkBIxciMlQxgwwuC5Nfmp423FsgsyfD7rKbtFlugjd
	jquHNfF3RggcSLlc+M0lR6yYFNLulz2RG4pMPaDcIQTco/DvGmFJeCVFKkHu7ZJNgBejMFoiIF3W6
	FkRSxLgyhVIbruRs1nQMibahnJhkt2TBPQnGfzNwVvIlaBj00qmFUMe0IlUKwt5X0e2cfXpSE6NWQ
	haKqFmlw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7T-0000000CWC6-2ELN
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A398444E6;
	Mon, 19 Jan 2026 16:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D33BC19424;
	Mon, 19 Jan 2026 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840125;
	bh=ttUZbbEr4qNvBmzcmWXht/0+Ro1g2UQElLV80PGUEuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ule0GqUZw08XdIdQXdwy8YF/nQZodPwE+3Ap+rnwUArUvUqLP17fDeYXRDi2IiJSJ
	 HElLEOqGF8Xtj5odBgm9/xe2Fz8Lpg4CQVge093nGn4xj01wGTq2ovDCqHyWi3whi6
	 GiA7vqdnJNtVL1EejI20NzzJ8W3JehC438yl3lV9CColr9gUKT7C8Gess01Bet1SrQ
	 PrQr6QQdWmaEfrtIG3pvYB570DREtCmV8GhL9h0FkDCPMA6q1tkaEv2Ke3A6GDO2bF
	 U5S0zkEUQzmWWKRbsGGvLtUiO3iuk83JuTbFoFx1FOKcFkMCOPVXsSh7hBRH5E9yC4
	 +L7N+wmfPdx7Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:29 -0500
Subject: [PATCH v2 12/31] ufs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-12-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=697; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ttUZbbEr4qNvBmzcmWXht/0+Ro1g2UQElLV80PGUEuE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltcC/d9PP4aKa1xZTIbsY8CXA+EgyYZnzp6u
 eqLCl6YoqCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXAAKCRAADmhBGVaC
 FcT3D/90eYAzQC5Ne5cbyw12ND7qM7cfJyie2ZHptiKyfxnrDewCraAH2ILNT0v39bZUSzit5Gs
 Dp5q4Xuq8NV8sm7oeyHsAsvfrB0u5QB3QM4VXZcrkXJ0ErzuiUa2Tr+cq3pQ5pq2gCIQW5z/Sv+
 LcW01jSHo4HndfR9FeCIg0wJ6nykbVpLEItP7xqwBtoda8oVtuolVChc9C+1uSm4O7O8mkccJMI
 UufpLPQb0K/tczA2KhXXQ+lJsW6GWXxIlKymNU57VfW0P7dsWrjj6cw9SZ1JSlLRZGHjpShbfaO
 cPXNsIxonKRlx+AgvCq0scgb7hsdna6caMEyA35No4+7Gk7rLbjOo7vF0Q38piD8irZS+7nDBmv
 HzGjOL+7GtCUUOLuVIxhNq+iP/45+G8zEyg9nAA4e3C3amjEnCFWG/KPszGPgRO2CV0ckSNxCxk
 dSMgIVWYwARpWcBPwyMJh9tzAIuLNmQl4WkxQ6H2j7KE+ormAsK7xTHyxJBEFVc6nPSyDnSEX9W
 LY6mTb62j1OHP8s3CsAjsMyeBpffAO7JIwboIgy4g6m3Z6fb1a6hXz7o3R5y9yEZmZzey9GSbo/
 G0ji6Q00W5ZxB3zg7itpWnOVS1npMB/HvC0SwP+JLcb2i6uiA0+Zw42RyX/lbDLVzkG5PMY8jGV
 CxntFIUPzGwJI4g==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_162848_000271_BC56D4EC 
X-CRM114-Status: GOOD (  10.82  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to ufs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ufs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 6e4585169f94bb9652aac29a14b0a64a7bb710d8..9cd9b6691849d52701058973f6b684f101df2634 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -141,6 +141,7 @@ static const struct export_operations ufs_export_ops = {
 	.fh_to_dentry	= ufs_fh_to_dentry,
 	.fh_to_parent	= ufs_fh_to_parent,
 	.get_parent	= ufs_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 #ifdef CONFIG_UFS_DEBUG

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
