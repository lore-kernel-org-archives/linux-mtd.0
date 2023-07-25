Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D972C04A6A
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lT7mhkSt2gTF7zz5N564kCQwQQzvIwqL4bS7SLwxRKA=; b=IcWNegOorMN8GP
	yOfQS/aSUwHTPjMI9s2T9L13ig2VGnXHNYtOO7nd5W8Qr//Jy9zVk0UgZbb/dXamT9XwI/wrajGCa
	L9pGMHMH24fTUcYFPS0iuZTu7gJCEilY7qQ85VXJDqSCYShnpdC5A/VEI5w7WjZ4PQMwoJA5UUIuf
	Sra/IgK2TBDJZpZF0zOISUbfo/yxJslzoDzzbCBnxtuBkZJGHezO22ph6xABkNbIBUbGc/O7mZ06a
	v983cakvQ//YZUy7xodFc3ZcQZ4YjVMUY/Le2j5AC2ZAx1NHPVZjbxlBpIrmi+3g7y1YpbprEJDUu
	/vqlGoxfWVnVipkvaDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJVe-007qRM-1g;
	Tue, 25 Jul 2023 14:59:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJVb-007qHu-1a;
	Tue, 25 Jul 2023 14:59:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0026561789;
	Tue, 25 Jul 2023 14:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A85C433C8;
	Tue, 25 Jul 2023 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690297170;
	bh=kIvw1OVi/OYz+atwIBCynX0q88XJ1zU1WapHn2pYQP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G4lNe8OgwdzIy+DkoO8bA4V3fq2HfOynEvqBH0FZcXI5mjKRSEQ1SVjY1pHApZqUk
	 LmVSxl1WUBGP7yGLH/ATsMnAnQMEPU+QAPGj8qdwUCRyUhAcUv0FTDqFlH73mrgqZw
	 FzXbD+KfSe8VN284suFEL1YtHLX5tEg7JJkEkQGz0MGrxMX8CR2SkfzChxuDfyTNeS
	 ZXRDShsOopX0jA288qfXuKjqRRyiZ1CyY3mdX/g1AczrOzezsb6EzZ2F8AGwPXdDYp
	 PORRSahQS9CPN8wTXE5yLGawxDIeRTErDdxD6OfHFhzLgjKl8kPDh2mkBPRjnVLKHw
	 ehvrosoKitaHg==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 25 Jul 2023 10:58:19 -0400
Subject: [PATCH v6 6/7] ext4: switch to multigrain timestamps
MIME-Version: 1.0
Message-Id: <20230725-mgctime-v6-6-a794c2b7abca@kernel.org>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
In-Reply-To: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@kernel.org>
Cc: Dave Chinner <david@fromorbit.com>, 
 Anthony Iliopoulos <ailiop@suse.com>, v9fs@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org, 
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, 
 linux-xfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=kIvw1OVi/OYz+atwIBCynX0q88XJ1zU1WapHn2pYQP4=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBkv+MkANALyeokJ5uPYYXrLhMbqAMD2+dQLEEeI
 3QOMYBSSseJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZL/jJAAKCRAADmhBGVaC
 FecsEADEGQ4YyezueKIIr3iE+LoOFLQ0lVcEMPslgKBrcsoHAYDw4xIHTfiRLmJTS/QKl6qdQ/d
 FSIkPrBSo4busWekGlohEMVxhED8IPediFhHYC1BJu3i2vSmxv2wo9z3DGJxddYsn1yasB7Jh8X
 V82bCE/S8+YwWBe/sU9UHYXIA/E18x/9Ut0FSPmZUwXbasPrZoaYGahxEDFFvONFPxKYVH6MIwn
 K4eVmycva/cc9eg3aJ9IoKpjm2lHJ6SlHwQREAxcyQZ+Tz4LAI9NG4I0N4mft7VwVj05wY4iuMV
 lkaoxH/4D3tYZmIldIJ9HahAnA+IlU9dZ/4YPR7iaTlZNdGssfn5cvsTHNjvp00H6KNNnr3nKEg
 JOy94wl7Ir1GrUPEDT1u+XQipTMQxiFjTQLc+igYmNNY+nLJu1edF6ewi3eMTP81b6gmzOHenud
 CQ3qmNNoiiQu5pItfIvt0j+K74oTiUZzOqrMqtEgUQ3flSJL2acI1UnY4m1h0JIEygBAMmXN/Ga
 6TPHXNSLdiIKa44+muGKEdIXTv22lvk6eI3L4mwE12/sKh5INo3rOJmQKNhtubYrUtLDSvrLCQa
 a/tcAz4eG/zd6PdcWTx1yg8GKnXbxqwHniAFlSBVM+ziSpqGTe2fxM3iHanHqv1hysy6sBXln6X
 HdxNyY7YiReYS0Q==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_075931_623655_2E0F9324 
X-CRM114-Status: GOOD (  14.55  )
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

Enable multigrain timestamps, which should ensure that there is an
apparent change to the timestamp whenever it has been written after
being actively observed via getattr.

For ext4, we only need to enable the FS_MGTIME flag.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ext4/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index b54c70e1a74e..cb1ff47af156 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -7279,7 +7279,7 @@ static struct file_system_type ext4_fs_type = {
 	.init_fs_context	= ext4_init_fs_context,
 	.parameters		= ext4_param_specs,
 	.kill_sb		= kill_block_super,
-	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
+	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_MGTIME,
 };
 MODULE_ALIAS_FS("ext4");
 

-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
