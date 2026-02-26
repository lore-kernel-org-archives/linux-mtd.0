Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE76FFD8FCE
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 16:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhKgqVGXgKvNZ49EqfyqwJtt723OxNL/89mutn4HIs8=; b=00SpRrqya62raJ
	R+q5TlIUYgdKGBwlO8rghIclV/iXTfKdGiob6FkoJjLK4xdNqEiF0EstNrGhPcNx5rBvC/N0Mb0UV
	dLR6hHAuQNplR4QLdNTwhsnCI8O9Pn5Tsf73eYH81wfuIvj3/oSWbOoUnWZH+pMihTjqCYFw3OXeX
	YWGIzo2q4waLpHkhCDj2SGRNqjE0txz8CFMROMePKlYDTWw0ct9vX8Sb3C/iXGHt0yPh8wdVc9v9f
	9LRIcdTS8OWSgdJftosmkd8P7/gYJfEgaf1thKUHqxfEsn+DbBtn5R2WqeCz+sRhkJiktegWX/Qo4
	bx2+zrZLvoKWZvHgLU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdtg-00000006gZ1-2FHh;
	Thu, 26 Feb 2026 16:07:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdtf-00000006gY8-0gdO;
	Thu, 26 Feb 2026 16:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QEXuDubfu7DiBE0tJWHgiTQReW95Jv4vi5dFz2+AqoA=; b=iTpyzSks+6JWwQw2pB8il11LFX
	BG30rvaSCOxynjnG4XensQc5IGy0oTwYJ3QQWal3GpBFR3BrZGAi4Ki8bmR6wva07amIDJ9aquMSU
	UALRajULMq2M8NdBOwIQjjDDEibttEZoFuBVhVXm7Mrp7mJE3toM8zdF3oXezCF/4dcpgayEliklW
	s+25Vbd3HgAIDIY60T2YH9B6GvmNtNSRn7VowqKUzCVOfVwcRIEzEFYNnyB+CTEp7yrrUgq3PyPKV
	7dMCIksuSIX13/QpsPqTldCKN7U1MCVa9z7PKkEaKnvbgumUpbGLzKG74nyVu7kDvNQYp5Y7Wg1UV
	1gC7gHuw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdta-0000000BQj4-3Ne6;
	Thu, 26 Feb 2026 16:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8501341902;
	Thu, 26 Feb 2026 16:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A8EC2BC9E;
	Thu, 26 Feb 2026 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772122041;
	bh=guIyR8txAyswD3hV7ksTPOwKgOC5jl6K3IuEHEeuazY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oP0XhNxch+g3ihBD0nKGKJbH8GWy25UibaNuGneJv2vKAKAvpBXyRRyDQAh+7r/mj
	 0tj5DG3z5WZiIBo6ukSqM/xNVCclXpalBC8EnHMcepR/Id/T8kJiYvdIQoz/8BGD+Y
	 4cX1i9xUrbUhQ+qs3cT3KBOvXfScQAVx40mJkk7zu90aUJRfq+6vndvqiubk6S8UAG
	 OCdrgWUILGd8iCGxzF5Tuo4w70SkeQb5LvixBFHRHfCw72oXu4u5HmxqEEHaHjD2N6
	 t3+5KOuAMEvXLdKEXQyTsMsboXwEHUiapjR7XM+/H97N0pDnM4Kh22dmlU6WPmD+fB
	 s0fHo8dLgp/hg==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:55 -0500
Subject: [PATCH 53/61] fsnotify: update fdinfo format strings for u64 i_ino
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-53-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=guIyR8txAyswD3hV7ksTPOwKgOC5jl6K3IuEHEeuazY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0RiY9iQ/WI9xzF8HjuSF0msd9z65XTS1K3v
 W0Jme2yHyeJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtEQAKCRAADmhBGVaC
 FUdXEACVy0RSg//ixaXELfj5UYiV+H80XbKRqlys8++/J+rh+FUyeqvaKy3D8aWpMOzazuduA4H
 N3+TGxw3ybpjbHT/F94iC/Lap37RUxYODHLoirg+hdONUnX3UiWOMmm7EGl+D9lEionRSeK59Ud
 NYqDJgfaYqg4ElQ8kkK6Sj/OCB4DF5OVQPsO7ajqz59MBYDNWIORf8StRcDgClB4jfSdtU01Lfs
 3VMa9eqaG2AoO6jUI7XdX/CyvsbaIcrCvMvlNmpAJcd/My+rWY1ePJdybAmHaSaQHEhNbFTA74A
 dl0kZP5lWE2a+5Xjb0BjiviDEua1jaJQ/XXhjoITYssXmchunqi2XGiG8CSkelRfXV+Dj/iUeoX
 2jWkJg4vtYV74oCqJ7EQkNuV8DckUTxePz/vgkmjiUC3Rouj09LGiXtdgz/L32fL5qm6qq/XKZn
 AZ0b47pHHvLrz5+2ZcNK97YTeScVVL1ksJrPodgioUmRwdjcxSrbQxXs4anUPhlfHCfc3AjRqFi
 LRk0kVjY2MFBuYmha4wXPXmzs9LqGEl17305Fak20VPYzOSMV8mbJeQPCi0WqrycFSf5qvjZl4n
 Qv8ymGVAGxz2vIrWx8CH0jaVxPfGKHp3HESyfW4gBjmUvw/KMOtBn1LJ1WjVsBnInM68bFVVzO2
 sa5ABNGi9XyWjug==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_160723_268781_7BAC0970 
X-CRM114-Status: GOOD (  13.07  )
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

Update %lx to %llx in inotify and fanotify fdinfo output for printing
inode->i_ino, since i_ino is now u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/notify/fdinfo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/notify/fdinfo.c b/fs/notify/fdinfo.c
index 9cc7eb863643774b83da8b6228c38db16d0dbed1..0f731eddeb8be74113361f45aa4fca2943395e9d 100644
--- a/fs/notify/fdinfo.c
+++ b/fs/notify/fdinfo.c
@@ -84,7 +84,7 @@ static void inotify_fdinfo(struct seq_file *m, struct fsnotify_mark *mark)
 	inode_mark = container_of(mark, struct inotify_inode_mark, fsn_mark);
 	inode = igrab(fsnotify_conn_inode(mark->connector));
 	if (inode) {
-		seq_printf(m, "inotify wd:%x ino:%lx sdev:%x mask:%x ignored_mask:0 ",
+		seq_printf(m, "inotify wd:%x ino:%llx sdev:%x mask:%x ignored_mask:0 ",
 			   inode_mark->wd, inode->i_ino, inode->i_sb->s_dev,
 			   inotify_mark_user_mask(mark));
 		show_mark_fhandle(m, inode);
@@ -111,7 +111,7 @@ static void fanotify_fdinfo(struct seq_file *m, struct fsnotify_mark *mark)
 		inode = igrab(fsnotify_conn_inode(mark->connector));
 		if (!inode)
 			return;
-		seq_printf(m, "fanotify ino:%lx sdev:%x mflags:%x mask:%x ignored_mask:%x ",
+		seq_printf(m, "fanotify ino:%llx sdev:%x mflags:%x mask:%x ignored_mask:%x ",
 			   inode->i_ino, inode->i_sb->s_dev,
 			   mflags, mark->mask, mark->ignore_mask);
 		show_mark_fhandle(m, inode);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
