Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75120C04A94
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 19:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCTkJCEH/OQObeQq1HMtQi2XOG6IVXzIjedGdqvX2kQ=; b=Mx4tkLbAUIUxdp
	To6BSzAnUpH9LiFHphtO3OcJIydoUbyev3SbJE4dWE5bsD5/HUQk6j49VRISk1vVSagdF5eQNV5F+
	TS57EL1lK68c/wJaln4NCs368UgfEdEcwUmCCktruJB/TdVdZzvC+tv/KZWVC6FGlHCLiHnmDTR0h
	fY3NJfKDdC8FaPS3XoCVJQMLCvOOBFzfgOQ6mmjATC2kpNgJiSq6OSD7MkhQU/eCi2E5QLnRXlWOC
	/FPRF/W0B0XtM1eymISio5un3ZUboMBWQzXr1Xcuny1NEq5E70+KR4pT5Ukd32PTjWWxc2j/TB2Bq
	VMP9O6Ax06M1y6iEN94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT658-000XOT-16;
	Mon, 07 Aug 2023 19:39:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT653-000XK2-2H;
	Mon, 07 Aug 2023 19:39:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33863621D3;
	Mon,  7 Aug 2023 19:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED32C433CC;
	Mon,  7 Aug 2023 19:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691437192;
	bh=OzDnAOkFvdqmLBbFuJs/CLbN23QVgBEedYg5nk4xP+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cvOqFZBtdtaUZUpcYT8YaLre5p00FbNuCj4U3qnBqbXM0xIZiA7wntOQvtwkVyYsY
	 KzGPHHfNfeSagX//jmohNvYFm+rBns57CsQSi8EBkJHPSRhrZFT/BjhJZaM5mUMarX
	 bymb2xPd0mApBaQcG7sD1IUhckW6N/LCVX49ha2NO5jL3KT5jPvgzVeVTUtPAxnWiK
	 dM7ooX8FgUdfO8Pq4IPDz02iL29DbkONAJVmc5YAAa/XW37auYiCa14sJSBbDU2ME8
	 1Yyd+iGC1KcpMynDMsQYI8CRvGycMoa1dPssmnhNbpjlfyCvisRz0YkztzSP0nrAdx
	 wLRgkNq83WixQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:41 -0400
Subject: [PATCH v7 10/13] tmpfs: add support for multigrain timestamps
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-10-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
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
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Amir Goldstein <amir73il@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, 
 Benjamin Coddington <bcodding@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 v9fs@lists.linux.dev, linux-afs@lists.infradead.org, 
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com, 
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, 
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=807; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=OzDnAOkFvdqmLBbFuJs/CLbN23QVgBEedYg5nk4xP+Y=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug+f9kdguq5TMBwkHk+cBAUTkwGtaz5BtdXB
 OuPQyDsL9iJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPgAKCRAADmhBGVaC
 FVU+EACRHWq/ok8Ci5soDBQDERlUIptXu4lEgbxup7TkwLUNnWrAdD6epDKSNEsW7DCyiz2IdS1
 pGFVdR0NuWmsNAsV4apdFq8utofCuuQXFkShF4CGpObdFNxDJjMvsoXKFeW/E7fgIlv1w8tvl+M
 TZtcYLa5VLnkhenORjC9b3TlE8YCfiuxsrGTC8mYBJrtx5d9p30op1+bDdzyytFLNJLQlLWj14x
 j1oAiR8gG08J92of6XhtGMD0DtCossd3jSeVrC8OYlXA4vCmfZq6JtZhAw+CoNRKb+cOARV+9B+
 SJr5nKCvKTzIuqmy7l7OMNEkKl8S2V9AJAwTild9ZW1Z2NAyOuSAeKhrWBFQMIPlWrhkCWsPn6K
 JuesJK2mMm/FyjTbn/I6u5siqSU+d61eK1yIU1rMkdJoxmydONqyifHcvL1HSrQrWIl2MdAApFE
 sPG4vDGwzddPezBep3zrdQxC6ZJab7utCrvAwfewI5O/GjTDxkX7FpjNTk1I212uzshngLd6djC
 Jrse0kdmFbO8tdzk0ywQY79OHNNTMRCNavw0Op2MIxwOIQ4yfXuQcnlaEFLrYX3pIwPe744NWnr
 cqzI6yqNIe8Y5zTQLAa6eRvH5OhjhgpJax5SPfaimHbaGB73Wa4hwyRmG2bufpcQYrEKNjYr5s0
 glVbeH5wiH7pM1w==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_123953_854939_A488806F 
X-CRM114-Status: GOOD (  14.10  )
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

tmpfs only requires the FS_MGTIME flag.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 142ead70e8c1..98cc4be7a8a8 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4220,7 +4220,7 @@ static struct file_system_type shmem_fs_type = {
 #endif
 	.kill_sb	= kill_litter_super,
 #ifdef CONFIG_SHMEM
-	.fs_flags	= FS_USERNS_MOUNT | FS_ALLOW_IDMAP,
+	.fs_flags	= FS_USERNS_MOUNT | FS_ALLOW_IDMAP | FS_MGTIME,
 #else
 	.fs_flags	= FS_USERNS_MOUNT,
 #endif

-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
