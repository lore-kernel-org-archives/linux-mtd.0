Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742FCD29C41
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDJ1nLgGXdJoZmKwQvglF59jfsfbt8Gae1PCkrUOdGA=; b=PLQCDvfkN3sQH+
	VGDFQPG+Q62wSOmahJe23ksMXild5iIWWcf4egJ1ueI6PXEC2o+1l4n7BoXZx5ez748JuxxsVuG56
	MT6LN1P9/Sc2bdJ1MJH/L84g5MT5KEHOqdaF3CjjwgEPX827VJIVeHfE3CWJTVfQPVCsuOqivC8hT
	dEqmnQr1sNi2ckQFJ/feQr280YyPm8p/qIumTWCUZ4/bD1ZLHI4ju48czCMWxSIAIBYB2aFhIaMfY
	ORII1+ekDd7i8XproUEgh5U08oXhTNOTp8xcw+4bB3eIs117oRq0kkOu9tSa9I4XANM3/iMcFCKIZ
	24McwJOtWCzjDOq0GOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8J-00000002UGf-28ZG;
	Mon, 19 Jan 2026 16:29:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs8G-00000002UEj-0t52
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D049C432E5;
	Mon, 19 Jan 2026 16:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A2AC2BC86;
	Mon, 19 Jan 2026 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840175;
	bh=wU0i80DF0FPqjAJHIRj1jzTtyUWnKNMBQnZ9bzzbTDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CQhJYRGsl++lczxBHEt0XaGrxt4g+6vUAYPrRcw73aIRch0FVGyVATEdpccesSqs9
	 URiwqrosG0CP1irk12+e/p6RW108GpwftJnbPgTyy2fk2ZtHaWu7YwXKfTUDCT7YYj
	 habn8bLFMPil4Fo9jX+sOzecRJ5OFTjN4cW2L+RT/+8p/XIBqiQIMLfoTEAaz/wSHh
	 doBGze5VI89ZR4tztzP2HdKsw/to1rJmbiB4hBqqDRpYdgi+Dj6yOzMVJaPZSCucM7
	 DQJ25RKNsgdm2ZepzIPIGXX2yldRuLVlW7b4p7/LwXoa0VcVJA9Oumg369d6XFDOIa
	 NZm1zFyOw6MWA==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:36 -0500
Subject: [PATCH v2 19/31] ocfs2: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-19-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=wU0i80DF0FPqjAJHIRj1jzTtyUWnKNMBQnZ9bzzbTDU=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltdFQ9b2g6zsfezKJIAwvxbngmwk5KhwfiY8
 +38M8QDAHqJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXQAKCRAADmhBGVaC
 FVVbD/0SRJlTCFiMglDJE7H/jWRUflYuMXEi8SA2hCybpcjI0Lzhq3Dftiwn56jC0/slUH9eZYc
 9ZXJtO5rQMFFiob97e8ROh5R8oMwf9IvoJEgVnpO/91D+7bdk4yz4p7St+51XuIrbzvSEgdGEAr
 1/Ox4Xs2wr1PzX7Nv2qi516wzYN8pn8Mk86h9xYIqx/eEsKln5byAJOYF1JtQ5E+VtXf2hQ98va
 1yxfDCOCcAxWwPhsjwmXIVinqlwfejZj9y0mBOdaJTScAIB9E55sGMOQgTQnqr4rwl2tvvE77+T
 LCr533OwnRhMTIIoQSiysB24g6B8Q9WsZiKtZDZ2FK5VM+7+hGjBnj7WuU5akAKL0Yh+lQlq4wb
 f3Jdhocl0fC/LsL0xJ6Z+hm+GK3AavJw2cOREDtGmzE/+Gm/okWTQBg28Hfn1rfewYRsEUNryaB
 7NpT7W7kYaJB4F0KZJHEpQyidU62CBjmpds4LOuqg5dUwlyf/Cz41R9qEPolEWuxH9vIrOdcjSW
 KY6o65R+9LmUB5hnJ2ZB7baC8zppQdPF82yaEOO17NEB2Z9O755Vwf2eMRV2kyVz+/olzSvhG+v
 RRvie1TZQrd1n31fdwJYNIrYSyQoDqWTEJSqbkLU2i0JJRAjOJ5sGbimADbV2dyDswLBJTKrBDB
 xyY5rmCt0KvYE2Q==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_082937_874395_373A9899 
X-CRM114-Status: GOOD (  10.97  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to ocfs2 export operations to
indicate that this filesystem can be exported via NFS.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ocfs2/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ocfs2/export.c b/fs/ocfs2/export.c
index b95724b767e150e991ae4b8ea5d0505c1ae95984..77d82ff994c86037c14fbf7a1d9706f1dd2b87ac 100644
--- a/fs/ocfs2/export.c
+++ b/fs/ocfs2/export.c
@@ -280,4 +280,5 @@ const struct export_operations ocfs2_export_ops = {
 	.fh_to_dentry	= ocfs2_fh_to_dentry,
 	.fh_to_parent	= ocfs2_fh_to_parent,
 	.get_parent	= ocfs2_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
