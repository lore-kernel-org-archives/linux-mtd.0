Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0058CD46604
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBYwqnPlsM+bnXdX05HiBXGj9TqcuSpiQXAW5KRoY90=; b=nrRheoOYnqNXt3
	T66+ScBHfFRMLZHAPacI1L1yuIiDUAL3s5HPueXNUT8rEVj1IRuC6dtcnuPw2/Ie4xpIgotw25XNl
	TubHaADA+c3XRCGgyLxLI634jM2kTGNnNaysVPk2J4a9QGmyN3C0g3Lgra1rBHhvRV7xAuTY3feFN
	1Bf0c35/C1jb8c2ElzGANCS4wYCd+OwNCuzi29jQQQNGN+rz+s82xj+oR0JhjgpI3q7K0x7IkkycW
	tc1vjkCpJesonlnF7WSCTLse76pxyg/WzIJ5kKz8IUFXAqBbAZsvMIu8fGBoN7K98/HHQn6zZjMWX
	cSM4a8K+eszRkX13gmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSa-0000000CsZF-0NMl;
	Thu, 15 Jan 2026 17:48:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRSW-0000000CsXH-2Ppp
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:48:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75BD341897;
	Thu, 15 Jan 2026 17:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BA3C116D0;
	Thu, 15 Jan 2026 17:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499315;
	bh=fC2wTmyLrxw3hMRoJZcWwwZeJ07trZnOuWc2J0sqBYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=me7Bh6Oz8yi3rtCvKE31NfEQV3586FDcB9subrRTMuet/g+LjUJ2eN0apKlzh3EHy
	 EZA5I8Cald4Pe5R7q40z0pYJ+IrgezPmzSAotRFzHaHcrQ/RdU/9zaOrAJWfq/d+gp
	 mvoRSdcMbzlJh3Ahip8TzNw4ZxybZ7JtzPKseJsi6FzB6BjxrHP8FHrjKtLFuf87Zv
	 Oxk3GdN3TnzFdcGrmP/M4IUNRiAQCbSXEmduK4aEsRDfNgoES95KukLgmQ7s0Qm/y+
	 GmmmovOi6oy5f6J55yNmRYBZmRkoRTn3DxKDX83Mu5yoFwszUj9Wep3F83P1yJbeR0
	 320NVCxUCVrgA==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:36 -0500
Subject: [PATCH 05/29] erofs: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-5-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=749; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=fC2wTmyLrxw3hMRoJZcWwwZeJ07trZnOuWc2J0sqBYo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShF9i2GSaSPlHSIuC7Yfec4kziAdHH6jdF9n
 v8rm53zuoCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRQAKCRAADmhBGVaC
 FcTGD/wISjKyKX0w/AhoM44k1zgySDfZixa6IbiGISyVcL25s2rWSy0ZGfZJayD/EPpD4m0zcui
 9Bgbta1ta+miyPZ9wOc4v+48+fiNjNvYr47ar/X0f0sQvet+DpTwskwHfwdQppxLgVjKVuMVdNy
 gck+0tCrIxsD4Oup77mdZf2ouvL7KYYRz32YuszzQr48OJ/qjKDCh+JnXb5KnsvwhuQim0CeRN8
 URkz7aAqGpXu/VOl1oUZ22AKHlAWuSrvTvkcTpncPKLu90Oca6NsDTIX/ON3orkHG4rOdzAGc/9
 RQqt9GmbiUBUdhpF5o1OL90v/ZnZPiG2su5SGPIaGIf5DQWHvpStMhLsuEPeCU3sWgdmjPqYwLC
 iXyRAONUm2KR+WThIgxBjqKyE34WHKpTr8RPwywaJZzzGZZPbKDj6psf6+b1i63wqY40oMyE1Ns
 hEZbql0rYeMGFxCjcVNDxzS3kqNDqGCfS+pC2ECWoCeEditYYF4yz/TOqROEqGtnToNPVyznKeY
 7c12ScEV9IdfwSl9r8CDZxKNpoWPnO4Pl/Rv769XSw/XhUxOLkUF1VqRwTv8Hy/Kz91OuWZ9X4Z
 Mez2MQAmmUG7Xr5Ozdu+dpiMok2IcUzuuuqbWxY+Qr0miQd21xwY3y60kPYiqSZKJ91tJpwnlhX
 ZAXGE9C+nE6tINQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_094836_726365_750BD050 
X-CRM114-Status: GOOD (  10.79  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to erofs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/erofs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 5136cda5972a986dece863290d20ab103791cb98..7b43ad2dd3eada8c132b26f851394492dfe4bfe3 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -608,6 +608,7 @@ static const struct export_operations erofs_export_ops = {
 	.fh_to_dentry = erofs_fh_to_dentry,
 	.fh_to_parent = erofs_fh_to_parent,
 	.get_parent = erofs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 static void erofs_set_sysfs_name(struct super_block *sb)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
