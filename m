Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39813D46604
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TK4+C320ira+v250pcpM4hSCmvjxgmfqpLwcqlBe6HA=; b=mPVxvPYTdkJ1SM
	Ya5c3Md9fapZN6rhs1Br9f4c8x1ZG0ctxSkXZ+x9tFXLtpOYF0KIAyIDYOnFsbZNi0eIJSppUnav2
	rL4iBs5knjg7NgoHWgiTlNx4X/RV4zvhdpHV9x50pqIYX7wrf75csrkCQYHtJeH2xSEk6ncBFcJPE
	lhHrKnijJoJnFUjwAcP41Y4l9UnDRTzvtzxJ8yBjUp9DiFtPa7KpA4xZv3+7cARppNK90SLk4ewbV
	AVzP+fBJE0WnD8zEWcVEiNLQD0bPfhWwmi4Pzpa+KBT72WR0B7Tlx78XfCV5yatJ8riCDTBJOtJ/C
	o8Ha1Rr+Gd+pEhlYYIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRTK-0000000Ct5H-2p7N;
	Thu, 15 Jan 2026 17:49:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRTG-0000000Ct26-1Jcj
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 17:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E548544379;
	Thu, 15 Jan 2026 17:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDF0C116D0;
	Thu, 15 Jan 2026 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499361;
	bh=vIHxhWXy09cxwOBR5jwdqwOPX/LuIGbTAXFi0NJ+sEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aoVPha7RotP93KFonT0uh/G1PEbUfw5RzccdIbFwSWenDBhTkyRjOJtVzv97+g7Lc
	 ey8x9BxnX8OrG87Onr98FCMeeFPvzY9mFFWJ1ymiwRuWLGMXivaI0bR4sGFSYPTABe
	 z+Vl+P07B9BOYnJ46E3xo8EGbkd1+fhpXhG2qNpWFExdd+esO9kHr1jEmpufkm9E+v
	 QPBOflETm5Ydo0n4CF+1YV5V78GVEx8fbCw3C9LWmfF8KAscJIf3WE9nnTzPh/j5c2
	 /UHM/HpXTiP1OdEOOgX2+fDNfZD04sq96BNryy9C3J+VVT7VM40RwnkU319j+sj+i8
	 AkQrkPFtxLQ5w==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 15 Jan 2026 12:47:43 -0500
Subject: [PATCH 12/29] udf: add EXPORT_OP_STABLE_HANDLES flag to export
 operations
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-12-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=vIHxhWXy09cxwOBR5jwdqwOPX/LuIGbTAXFi0NJ+sEE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShHxC/QAhbO7mbVrXH1nVia3Hfviv3SDRtnW
 +y+FMiktpyJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRwAKCRAADmhBGVaC
 FTFZD/9XDkcZd82hmY1yhsac5N/jsQmiIXeuAQ2Mkni6mEVMyB92tEdrk3Gwd8HgDOuWYPHu1Bz
 Z0O/OLUE08CCrAkc+MNTfeih8RKuVwDIW/S8xPrmsI1R7Fph8Qisc4hx8sMoaZ24qkAJ4GU+oMn
 AoBxvXpqJUDPih2yNiXyvrsdIXRJMDr0r+fnffl3Z1G/IYnc+Iom6R8Yi/JxVk1QHyJFKWBpCYv
 5+H1zVkKmg3n6OW7GXXq4boj+hd+YK3lgDgNTmYMKLeKxWajkeJ5vdqoaJwssSQ643uSWl/54b8
 MJa9r1hdHeR0oIUn8ZhMDFeqUZkVaePVRgmQPmPyZPFlmDdXmpw1wXMz9Li4DP6adL8mdtNl3JE
 OuJPSv7VxvmI7hqt5yO3GtdNn0QyNsEkotek1aAPUvSGFLD6P/OcK+JyysT2cxa11yh/iXUn3jx
 /yTeRPDYoqvBzQU97cd2AKrWp8YZCcJAtiwIvjJOO2jmURfe5Yr2sWLS/XF0Fi8QPKJuth76n6h
 mI71FzBHHxE/RE/lFB27XbFser2x53DCRndN6oMxqvDyZrvGJhlCftA/nu60B3fIFvIIiEWHeil
 wXaDHvjkwLW7kGh0gAkcLiqxiq6ba+YQ1+3OimFS8lE6jElkoDn425GmpS4u9OHc26ZNg28lZP5
 lWOj0uKQEFaRbbw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_094923_916072_B2A99180 
X-CRM114-Status: GOOD (  10.48  )
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

Add the EXPORT_OP_STABLE_HANDLES flag to udf export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/udf/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/udf/namei.c b/fs/udf/namei.c
index 5f2e9a892bffa9579143cedf71d80efa7ad6e9fb..7b8db8331c77bb43d9a3c4528aee535eac2bbd37 100644
--- a/fs/udf/namei.c
+++ b/fs/udf/namei.c
@@ -1012,6 +1012,7 @@ const struct export_operations udf_export_ops = {
 	.fh_to_dentry   = udf_fh_to_dentry,
 	.fh_to_parent   = udf_fh_to_parent,
 	.get_parent     = udf_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 const struct inode_operations udf_dir_inode_operations = {

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
