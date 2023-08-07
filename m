Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C2BC04A94
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 19:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieSP9qw6JvDYEOEn8+CpH1GjbbziUvYHjHx9SKMUU5s=; b=hRjapQxrd2AP80
	NdOza0HadLleil99nmG9htOIpJN6gPs4uiOKwX6lus1sNc7AJZXsmwsRX3vABY332RlEVDkVAA0jE
	EQFZRMeXC7LXPsQB/m+YbTWjZFR6mvPHDUISqhXxUPZywPQaSlFxGLT+Cpb8U4WUOjrfUfOnuQiJk
	snTmrxl7RTMdd6/YMP/s896S5JdFUM6QqUhCthFt+p8hY14h6rTZ8hG96TPMTuD1qsg1/BlD53nTS
	0C1FjR6z+ZtefAZfnxLSEahQ0rDgtlG2P7JgtavBCFPMjw8liasF9KV2TBy6hJC9Ng2VclsxkkgSp
	39t1DAru1gOn+AphFuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT648-000Wht-14;
	Mon, 07 Aug 2023 19:38:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT645-000WgX-10;
	Mon, 07 Aug 2023 19:38:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0DE4621CB;
	Mon,  7 Aug 2023 19:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC784C0760F;
	Mon,  7 Aug 2023 19:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691437132;
	bh=SoSg4hRs/3AF7gmmZ5KQieVLFGATpnVC2zTweWQTdLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KxIu3/cu0khoRWfNJXEJNIHdkniXf13AfUwiYzwbEfIu8g3DBtfZfzYS9IOYy9Gpk
	 Bj3cYzwEKlh8g81NTtaccKy7aMqTEYuSZfyn9SEoQUp7kUA4ckYCfHueh6Qfif9NgK
	 slFb5wQGYXGFb4CWnSXlLxHUkaQKI2w9y4EhGJbBrVFp5aU9fk7DAWfQl7jLSAfqD1
	 UccpkoMfyyMBq4af30lIQ5AB/cwMdmHd6Z3n40C38snUYNYnW8fp27SzSPjzVX5Rmr
	 sneuDS6BTX/Zciu9zoJxNLu+PbQqNw9x3B9TP5CDuF4m+Ww8wcMCuyC78gSMsgXucT
	 7N0lCiWdDCoMA==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:32 -0400
Subject: [PATCH v7 01/13] fs: remove silly warning from current_time
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-1-d1dec143a704@kernel.org>
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
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=648; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=SoSg4hRs/3AF7gmmZ5KQieVLFGATpnVC2zTweWQTdLU=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug9m1G2XKd9FuFQHFpf/xUPtkdl5tYH/twvk
 pTBUT8ItSeJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPQAKCRAADmhBGVaC
 FQz2D/0VAN0+ej/IEUpgqVfQAjQ8iolTJV7E0suDKXij0ebakC68W10jwrlT0yi9VzJjG+zWKlu
 TPi0thiI9CyD/g4niQelv35XmBxU8+fVi3c6QBE+uHc2Ye0nZvMEETJoMoCQ9vWHE0o4DGUU2J0
 26j+6oaILlvI1X0SUof0ithfuve3VLXGJWbNFJiF0l7dGjWrFCmDi1p7+bpTkunQiHaOyb8WO8t
 9XrB4x7Lw8nyVzPkyifucdtKaVzyIgZmBTqfzkjEb4acmJF1j/dKiwiKpIraaYMJEUmwqClF9np
 XnLxTxRAuW/grOiacgsfaNgmBqYN15Sjc04u/Q4I4g2N16lCqkw70LyyWxv++cJHfJPx4W0ZHfC
 R/gn2xIcFEAKBEHArqXew/pH7qG7uDz/b1Tj2mM3gqLV7eTr5JFzSI/7wSktMHXAzgUD24sZiHI
 ynRl73zTIzC6nZMJLAX2n8vToMIHUD3FE7/TSjsZyhMot40Erl6eO12t1dHzizbh3GH2yOW9/Rh
 4vCxMpdrHxu0ThUYFW+V5LTlnES54b+/oIaCI5d+yTMQQ0CzptPaqHEo/3Hn1P6GXDGbu5ddJKI
 KaPeUyTJxHdX5P1JavBBd5+dhqnWjI4y5Jd1sbR9Cl9wKKlVfciVMR5ZT7Ph9rsafHUC49jW/f+
 bi/n8FB4iErM8Ig==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_123853_434638_80710A3A 
X-CRM114-Status: UNSURE (   9.27  )
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

An inode with no superblock? Unpossible!

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/inode.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index d4ab92233062..3fc251bfaf73 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2495,12 +2495,6 @@ struct timespec64 current_time(struct inode *inode)
 	struct timespec64 now;
 
 	ktime_get_coarse_real_ts64(&now);
-
-	if (unlikely(!inode->i_sb)) {
-		WARN(1, "current_time() called with uninitialized super_block in the inode");
-		return now;
-	}
-
 	return timestamp_truncate(now, inode);
 }
 EXPORT_SYMBOL(current_time);

-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
