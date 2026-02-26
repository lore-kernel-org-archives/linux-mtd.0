Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D80AFD8FCE
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spKeqxk5nuAPNwdhHHHEzxYw/gzBsmsFDNP/gUgGCKg=; b=SVE5ygg2nvVHP/
	1Qlnw4ozzgunW1sN/llehmmbkgKgBpLoqK8UoV4SfU+9g6w0dFfJ7waNDM9ukIJhNd42Ybwqemtbw
	mI4yeav3MEENhXwhWPYakgjq4ODcfTbZECiuxXNS0tAGx0Dsb4FV33Wgax8Cn72VxD6UH3ulZfyg/
	B2CUkikUtWEeDBUchoH24zHRwBi8kgbc+csjQz66eLAhLx6OPnSxpBanP0sQqkq8ENpQOAT15tplr
	PtjM1xTTF4nt5fXHDtRbR2OJBT6UPSoBqomBL+l/mptCdv1nvLtM0UXkXnr26gHar9dPriS6c1LcW
	XbfTJgKKlkrDQZZ2zQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdqe-00000006eiH-16X5;
	Thu, 26 Feb 2026 16:04:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdqd-00000006ehE-2aa3;
	Thu, 26 Feb 2026 16:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hchX0S9Zk5xgE3BLLxODoDG8quQruUK4nmQnhZUa3hI=; b=ndCb+lUkqmI9p5U6XeV/l6M4dM
	7UBQQVa8SsrkzXyow2uAV4sTHgxaKJVGjG8WPkIjOBwHzz+bPzQBEr6qTq0WJw4CX+h0z0m5YlzFO
	KnDyFoWqW+a5m4RM3r3Ayb1CgYNS7SK+pPxG02EGyxNLkGjvKSvm1wd2WGeUajAo6WRyIZC+ZXjIy
	Q7VsYerHx7lQm/IEckF7QjDaI13/9eOjcUnhmNFz5qkNtU79vngBIZwunlaN1axc/tIV630UwmV5e
	XMYcHW5rO43+0K4fB+bK3hsGeQXgZUYRIp59y/X/yu8MNllakkINu730lE3INBwHeUk1IeblqHlQI
	s+ify48A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdqZ-0000000BQ5P-2hHP;
	Thu, 26 Feb 2026 16:04:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 501F043720;
	Thu, 26 Feb 2026 16:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9546C19424;
	Thu, 26 Feb 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121854;
	bh=AClwnsoOnb4s1w/37/x3Wjk9ZhEATE7ToSrQpKzKnv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JkZASixi554z5yi5ZZIWYqlk1ZbECUEfSqcqGujNjQ6C86T0rhzMLLyX6N1SUyDT/
	 eacDvIi4KsxI6Y++V1V8fXIiVurB4j7z8x6XPih4feH53SmhQygd3QGwtZj3+SsdgR
	 9Ji9p9bQF+sF6AjITALSoY4FIaGaz/s/C0xhEg1Ss/pnQ36ylVw5uU5DlHN4JW/xDy
	 gQ/21wx0xf1lNQOeP5Tb61fp9B8vUf4ktsntXvnHA9wi9AFNfAvWpcJ7gcu7nR8c+Y
	 qvBVMuUomfD7iUb8ytAu02WBsjYNp4eSVaFElV1DgJ1Eg/idnYMgsiC4sh2tI1CrYR
	 fXhCYJ6C0fPQw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:40 -0500
Subject: [PATCH 38/61] jfs: update format strings for u64 i_ino
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-38-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=AClwnsoOnb4s1w/37/x3Wjk9ZhEATE7ToSrQpKzKnv4=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0N0bOtgyDQKaoCMzeyS0ybevShKonkEMhhg
 xIfs2vXiaOJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtDQAKCRAADmhBGVaC
 FUduD/9bWKVRqNRryYhi0l3hd0bJfi5zi+Bj9b4Sj/rCTi1/ZWGN+g6mAnVnDqVIuEH3AFFqMe9
 +fddP4rH+hcmqrP9r5WtAB/nU3loLKCARLtrCaM3soW+zFwYqLn93Fi+6JyQ3kymejEgcCqDcZr
 +3mk+sBp5Iw9ESn1KCeZtzTeOkm33zBsof+00D1giQ7aaQOZ20MB36AXTN+KZrrU3Xc98770MnA
 7nL3DXPmK10Bo79Q2Gq4DmDZXUtD5/k4lsbxY6tTxxeUPRYR1Q8Pwq3Xo3DxD6wfB5BL+EwsW8/
 gZ0ZCKZZV9lqnJmddoSGuHSnFVbUEiTpwCpzRP54ZgTt7UtgO2UC9lSetosy+vDbZRhBGOhtYBB
 ZSAbin8hCUWXz6iZFk76OfxwbtJO909PLKTRDONCnLPVENtd52CoSFcph2/SW/0lWTUaS74T2j/
 FeSqJknU0HJ+CnR78eCFGQkv5wj3iCU3SOL/a2ue5aQW2PdX3W0JbgRTkndzs1jfPagy0SKH9Yq
 /84UTImr7g/wQS017LZvRC9TD+ucIWeddouDutL/dAVIQ8cv++OMp0JgZRxI4DgIYNvuYCAmWI6
 7bt3syz64DH8VZ796/EN1ThA9UfFbxxopX0VvgtC/CLWkc4LfPiAre+P7cro8zSixCwN3LFIPKY
 rgBiRzZP7A2Nh6w==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_160416_299917_465138C1 
X-CRM114-Status: GOOD (  13.24  )
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

Update format strings and local variable types in jfs for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/jfs/inode.c        | 2 +-
 fs/jfs/jfs_imap.c     | 2 +-
 fs/jfs/jfs_metapage.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/jfs/inode.c b/fs/jfs/inode.c
index 4709762713efc5f1c6199ccfd9ecefe933e13f67..c7914dbc91ed97e200edbd114e2d4c695b46fb7e 100644
--- a/fs/jfs/inode.c
+++ b/fs/jfs/inode.c
@@ -64,7 +64,7 @@ struct inode *jfs_iget(struct super_block *sb, unsigned long ino)
 		inode->i_op = &jfs_file_inode_operations;
 		init_special_inode(inode, inode->i_mode, inode->i_rdev);
 	} else {
-		printk(KERN_DEBUG "JFS: Invalid file type 0%04o for inode %lu.\n",
+		printk(KERN_DEBUG "JFS: Invalid file type 0%04o for inode %llu.\n",
 		       inode->i_mode, inode->i_ino);
 		iget_failed(inode);
 		return ERR_PTR(-EIO);
diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index 294a67327c735fb9cbe074078ed72e872862d710..3d714fff09992173dfe6c9c74980f034ba4e1a72 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -302,7 +302,7 @@ int diRead(struct inode *ip)
 	unsigned long pageno;
 	int rel_inode;
 
-	jfs_info("diRead: ino = %ld", ip->i_ino);
+	jfs_info("diRead: ino = %lld", ip->i_ino);
 
 	ipimap = sbi->ipimap;
 	JFS_IP(ip)->ipimap = ipimap;
diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 64c6eaa7f3f264ac7c6c71ad8dd0d59b63f15414..714dbf34b7ac17f82ee9ebec2f9a5b4c5e6f7356 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -692,7 +692,7 @@ struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
 	unsigned long page_index;
 	unsigned long page_offset;
 
-	jfs_info("__get_metapage: ino = %ld, lblock = 0x%lx, abs=%d",
+	jfs_info("__get_metapage: ino = %lld, lblock = 0x%lx, abs=%d",
 		 inode->i_ino, lblock, absolute);
 
 	l2bsize = inode->i_blkbits;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
