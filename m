Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2E8D29C41
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0F5XT47KQhplZUYjHxneZgZ/5KNxwdVOV3705C5FFFg=; b=dHqzMjqvRRCt9I
	Zp+O4wziCwTJSYgao8CrY1wihoGWykyLxjFLKGLjlFq98KSx8+RcbRJwBrYP70cAIUolrlvyj629c
	JQ+4FOMI38n04F//mKhGPMqg8ylTaclVy6FPlBI97Lcy5Ta0TgmTk3L7vF8wwuxS/RHvuf5ceVFGx
	meBKw8R3HGq4glcHdq0XuxlrzGNBnfFJCT+UQJMRlLL4qew8FrMdPxYkDm0Lh98whWtT4HHL5PO5U
	7UbpIMXexx2l5Gj0/j81NFdB/dddYy8WrHMnCvo+YMXjmTdC8yi2Nnt7JsPS2mckRH0HslUBQ3VIN
	a1eiVz8zo9LuxI0KcYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7K-00000002Tl4-2zUr;
	Mon, 19 Jan 2026 16:28:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs7E-00000002TiZ-11yp
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 16:28:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB4E643453;
	Mon, 19 Jan 2026 16:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE048C19423;
	Mon, 19 Jan 2026 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840111;
	bh=EHb6P72K+L3+Sb6SzLJj1rhREwGw2p+u8b7kNcs5wTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TrsKMHXT/sCWcPrmeChQ8L/OZ+Si/PDQhiEM7iDesj6YXekwxdKrB2xnkwdcu92LL
	 HH/uxP2Msg+8sIyiXUDu8w1atUCsdySf5qfsTHdm+lDQKjVYfrF+7BwwTaiLvAFkVi
	 oNHfCi5olIFqrV9QNTwZBWASWLSU/z7pcAmrYhjYdcfvqgE5hKzR5qjswFtp1V9bMc
	 KRNymkwYKSyw01Riv37C0HKrRLEJ2Gi54kMPoML5smsTL5Ikh3az7wic4eVrgz0B29
	 3LAsKLmZoGRnwr4Lgl99QwOiGnsrsk4MrbjL2Z/tqXBta7oDaQAd9r6pLPzwRrSPZB
	 Qh0o/kHlSIPaw==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 19 Jan 2026 11:26:27 -0500
Subject: [PATCH v2 10/31] btrfs: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-10-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=678; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=EHb6P72K+L3+Sb6SzLJj1rhREwGw2p+u8b7kNcs5wTw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltbvp2orig7d9mXjeoPXhSVy0pWJJMG7Y7qq
 gRF3d5VdAuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWwAKCRAADmhBGVaC
 Fe+RD/0ZkSh4Nai0BmaiUEvJICbcRTV5b1Lv7WJEwq5JjPI+bTHc3LovjfczVEaYuoGRdG2abhd
 cgg2Bl7HM09V6aZVbhZsyMZIlhRiz9fjdp3BB9kZiBv8QXIWFumRTxtwe+JYKsg33sqzi8iERMF
 s+4mESToF7z7l3CEFigwLlU3h/bDOCbXa76NM+5xsUih79xFHx5c66J/Qpy64Pvxy3SXF2ff+Db
 pYPfkSfWUHFBL0aKVLTX+KO5PJkCQKoAz/h4ytqpFX/swD3YLbUsT+oAtZ+X0fzMqTiYn49Xb3L
 jNYiGvi+iKzQfSf0QFEcNjhFA44Dpu8BmAsuH27BcUkRSbW5XuFrv+SzmIhhSBhhlyrEjqTSAB1
 h4u0eUui+5shxh2+EEhoIoJzAtQ0nhCGs5ixlvEvsekFglUy/wV5aCaKbscbejdIuwgB9SOwBcC
 NaffoK/cGpZB+fBU05w6C0t+4tKDn0S+u1dKfJNSzffOcB27eVll+IR2cI2CH0zNzDvkDVyh6Hc
 tsoqRTfn8CtdfoWs1mYVN/bqJVe9yE25LuB+hvEZNc52LywejSC4iD2wXfw8FkJ8dIf2fsRQgT3
 aaQQFsS1FLzw3naxtye9sdQ4gzqutNjtMU3JZTh8aLQhhnOlMc0MHNgUdEdvHDYBHLPJ0wyPxGt
 Sb5dYA/LEaVyd3w==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_082832_933627_494ECD8D 
X-CRM114-Status: GOOD (  10.66  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to btrfs export operations to
indicate that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/btrfs/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/export.c b/fs/btrfs/export.c
index 230d9326b685c4e12dc0fffd4a86ebba68a55bd6..14b688849ce406b2f784015afced2c29422ab6c3 100644
--- a/fs/btrfs/export.c
+++ b/fs/btrfs/export.c
@@ -304,4 +304,5 @@ const struct export_operations btrfs_export_ops = {
 	.fh_to_parent	= btrfs_fh_to_parent,
 	.get_parent	= btrfs_get_parent,
 	.get_name	= btrfs_get_name,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
