Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715B7FD8FD2
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 16:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eV142a3jT9H4fceuJ1ZU/hcf+0WncCrPfH+0vtCifbc=; b=o/ij/pROgyJRf9
	TSeeiLhk9DZxplN1vAF+rbg3jAfM9EHFKaneSuXJC9+IsQjfx79ifl8saUqHCslbG79pmBEUFfIlB
	PhBSOgJzWvwPCWvZqqJ8f2+EPLT2+03Ojmluk3y3TmsZZnqtb0+yIAtORWeWqGi/TE2WlfYpwn7f8
	OsAqyrJYGdSn5B6IKFl+Y2KDSQUXYQ4JwNYB7A4sgu+BB+1RCkWImu5qDY6521RGkwxU2rwlSnBM8
	uvSB6er09+PaojYik40MVANBcYrbiaUsFHNyfFTORTVPzfzZv/f3tts2Gu+M2Wl2sh1jQSqRpGGyG
	m9ykKbMsEKokiDHw/VcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdon-00000006dPL-0rFu;
	Thu, 26 Feb 2026 16:02:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdok-00000006dMx-0FmJ;
	Thu, 26 Feb 2026 16:02:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9B024027A;
	Thu, 26 Feb 2026 16:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BA9C2BCB0;
	Thu, 26 Feb 2026 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121741;
	bh=r4NQTMCAdJdTju60BKkzI9ZgcdPji05KczFBMoCN7/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IIeKZc37Ng9MR9i0PG4PHPUvKUs8x/8M97lxx3hpHB6pv6XDnOisZ0nNCgz+ACp6X
	 bBneW9dqcyJmA8N+DzE/wME74yqR5PkAwepfFzbD+XqLAyHNdiia5tZqfdlvjRAwQ1
	 smLKQTnhuV1zmjp3kBX25ZNfa30WPnU/cl80mUs6X+8RJeVBFThXa5OX7cB405ODBB
	 020q3Aryu5IZs4v+b7uNLOH7f+2zOdchH0stYwjryyY512Vr5vj5LljegQZ30ee8C8
	 8dLkD6MWawf6hLtiijiZyqrNKFzSJSQZpHDIcfpMuYNMjJmubAY7lULJU7bbCo9sY9
	 dxMpjBOROvlcQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:31 -0500
Subject: [PATCH 29/61] efs: update format strings for u64 i_ino
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-29-ccceff366db9@kernel.org>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
 fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, 
 v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, 
 ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, 
 jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, 
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, 
 selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, 
 linux-x25@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=r4NQTMCAdJdTju60BKkzI9ZgcdPji05KczFBMoCN7/E=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0L8HIg1mrked5hBecpnNFa4Zl5RR0TOro28
 77DuvubI2yJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtCwAKCRAADmhBGVaC
 FXCEEACs4uqez2OwdNTA8bdFfOCIcaeA9+QQy5AhCZlueauFg4niQjP5FJUQqWj4EBcdYUUgDSD
 9O0MfFdiD55b9s2B2y1C0WprMQ1LAVc3V+c8BGmy0H7ReRxXViINdENWWjrUcGerbCPglhUulBA
 CiwgQKfHNJ6ojEwzWX1KE3GHnhl1ocMC430TV0xpEa0USKFXzhqLcTdHzWdC1sKgtcZhTGjCzyd
 eX0cEv+Vx0LBY81mvN7XaYLRyCcRR6yRMH42/2Q7hS8hWQO3IAvzL1sBV2mnnSmH6TYdvS25kdA
 x2EeCUoLJggmEGF/Q5KZf55MTXLOqgCkS1OiP9zYAkBH6EzgOSnv9X8JCRs62gtX7WNhd/nxJKl
 IKFFe4x+mQ7xnWu9W4IXNyWKrIIQ23TlzZtv361xWzq/2GmHoUNPyxhRPNyg28Z0UB8OO/mtKBd
 o2rv4l7wtdRyby/QV+6G5SC0Ob/19MX77a+4FPGMH8PmkZ2qcwn7t6MouQvthGV+kXJ01bi9ttC
 /5wgOjnQ8vZM1dZzyGhI6phRI8+/jLlJTFXmqLX+ZCfR/ke3hjxf7HmgZ+NjOLyMguXbm6HpDnn
 3+aI5rjLOyX/Rgn+wHYy296J0xSZvRbHMi5b8Qf/GGMH3A85276g/4QHvszZ+XFQyLR6LUgUPSx
 XQpdfsjLgWPecOg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_080222_142194_54015E02 
X-CRM114-Status: GOOD (  13.67  )
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

Update format strings and local variable types in efs for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/efs/inode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/efs/inode.c b/fs/efs/inode.c
index 28407578f83ad5db1b8a7b082fa3e990b6b442ec..4b132729e6385de196e156400d17a86ed04dc2f4 100644
--- a/fs/efs/inode.c
+++ b/fs/efs/inode.c
@@ -132,7 +132,7 @@ struct inode *efs_iget(struct super_block *super, unsigned long ino)
 	for(i = 0; i < EFS_DIRECTEXTENTS; i++) {
 		extent_copy(&(efs_inode->di_u.di_extents[i]), &(in->extents[i]));
 		if (i < in->numextents && in->extents[i].cooked.ex_magic != 0) {
-			pr_warn("extent %d has bad magic number in inode %lu\n",
+			pr_warn("extent %d has bad magic number in inode %llu\n",
 				i, inode->i_ino);
 			brelse(bh);
 			goto read_inode_error;
@@ -140,7 +140,7 @@ struct inode *efs_iget(struct super_block *super, unsigned long ino)
 	}
 
 	brelse(bh);
-	pr_debug("efs_iget(): inode %lu, extents %d, mode %o\n",
+	pr_debug("efs_iget(): inode %llu, extents %d, mode %o\n",
 		 inode->i_ino, in->numextents, inode->i_mode);
 	switch (inode->i_mode & S_IFMT) {
 		case S_IFDIR: 
@@ -171,7 +171,7 @@ struct inode *efs_iget(struct super_block *super, unsigned long ino)
 	return inode;
         
 read_inode_error:
-	pr_warn("failed to read inode %lu\n", inode->i_ino);
+	pr_warn("failed to read inode %llu\n", inode->i_ino);
 	iget_failed(inode);
 	return ERR_PTR(-EIO);
 }

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
