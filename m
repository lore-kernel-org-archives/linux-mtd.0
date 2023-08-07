Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5551C07E8A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 19:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2gmcbFc6dqLnYSkJL8woUW3wkF04tvHPlyny+euedA=; b=tXuTetEycKGDcL
	MmW1Z3TtgU1JEY6tOvbHh/v0wnX6xNlWNjO2huiVLoS8QkQ6LsD4v3eBQcSfiaPdLqAMW9sMQNuCu
	7Wih15Q+25TUL76KfuKXhFG+NO05BfFMBHun31wqVTlnr50wI6xLYj7PBlD1HNIKTTxesoDrkWC04
	s7d1IjSLtDJZuMG6f9QdBAldxLaDcMNpP1LUN2nw5t2OGXUORe1b2jnEjRdFZuFAqo8Iv1xgufS29
	sMZR7ZoTVTha3AEGO3yf6kIhVAzYQsYKycrNmKMupnVGQeTCV+qybtQpBIfVbuh+HOxkWS5xCKzEX
	RwAHTnN9mp7JIq+HBW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT65M-000XYH-0X;
	Mon, 07 Aug 2023 19:40:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT65H-000XUq-0l;
	Mon, 07 Aug 2023 19:40:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99BA0621C0;
	Mon,  7 Aug 2023 19:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82419C0760F;
	Mon,  7 Aug 2023 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691437206;
	bh=PNK9I4izb9aV2MBeRrTkRcd9XlwhZVP5eqLZiAT7h/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M5ROeg5mqDZa/42UL9kRZ08AsAdDHc/tKfuR/gThhQUlMK2+JDTseihwPqM0g9Lnk
	 n7ZTcQslbKZFb1sVkaMh/ZHaChcc386d6k5Eu8WpPpdQpSmQW5n5m1gBJ/s/foOLoT
	 zfyRNEyYgmop5nZ9c6aDUEflodYrjuKHCugZZWgr35mdN0BwR1J56hSMdaQwbSy4n5
	 hZq116WT518No7KTL9GXsyoe6lkSESX60cs2DaFQcpWsalXcKBqPaTZV9w3+RIxAN7
	 1iAfteN5TN7kegFnfbSJb9hYE5QO8Cj9MtqnalQfjy3dVfMI9GKJc0d3RYeNJo1F1P
	 5MfddqcTJi2Lw==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:43 -0400
Subject: [PATCH v7 12/13] ext4: switch to multigrain timestamps
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=PNK9I4izb9aV2MBeRrTkRcd9XlwhZVP5eqLZiAT7h/E=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug+PWT0Vv3ESucnQeEtJyJo2uwO3EuWfrSu8
 hP5a+Awv6mJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPgAKCRAADmhBGVaC
 FUBNEACF8Vhf+Tmi4BAu5Pi/7+eri1QMakefx0kKWYx3C/c1hIuw+oe93XC06WYCXN8uinqEBOi
 yb7GB/eEjEdXpqFk9wHc6A7NQ10DQ+cxx9ywhBK8wokDatJwtmb4ZKcS1wLo3WWRjRW21tmlkQW
 sDvw3UKSUTEcv9Pjrz3Zfsvk8uP/OYnGMsAZqamCasFOZ3tt6etMoTmA0zCWlXfqJO+0Pv3df+R
 YjCvqy8FQeV484LsnlS+cOXpOSf8mvgqmJKhvk0+EDmf88uzdPNEkJ53SdnsnrAQCGl81BvJJq4
 SrgFM9hoM1TggCiGCU9lsBmqYSVHYwZ1vYxmDFON7f+XCQ74GwybMku6vL2h51xx5K14BnF1j11
 QIZJ0zoNexu3UIEzCkBVx9tMqGcR5Y6HT09yNXyOSlL3YUB8HC/MrxcW9BaOq9CiU1vELDHg0ML
 sYASZv5rPrVxM9hYgHX18EFHVu34Exsvbp0xB7O5WLFtscbSiiyH4K5hLLR5bkn3Bl6heNDJT3V
 FQ0I0eT1DuIw2cqH1gHtAhYjcDGlFyuVswfUkIWJ7Nk3fVC7M29zaSBouhv6bRoVg0sJZnMlWUo
 WMo0TwdGwynlnrvNK3LyjgQ1fF27l9ys0jjQY/e455EinK/9/h0TD5RlMgcnL3aS6S392xG2DgV
 /veMDgnDhzP9wZA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_124007_380200_C7C69E41 
X-CRM114-Status: GOOD (  13.66  )
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

Acked-by: Theodore Ts'o <tytso@mit.edu>
Reviewed-by: Jan Kara <jack@suse.cz>
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
