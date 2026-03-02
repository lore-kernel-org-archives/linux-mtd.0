Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB9AEB3632
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipIsP/Wf1/Q+myfCKevjg63h2RLQJAIb67JvI//zfv0=; b=3zSJ/ATd3kkbeK
	ZcQCxTr6IFPcaS/9xRSF/Tsa2Z0K5vu5IqiPKBzdTE6AmDAIFAk04U8sisbpqobjOb4nB9tKnomEc
	TMRJZnHDHFrqAcfVKMfMkHS9UAWNgQHVIDbVuKXXloShVl5t2rE2hLgyI1ct94ubstC9aUyie3qs8
	mNeKTIRxyUtKulqbECO3dB+sMtJR/Bg7hx+xIylZTqRk5BtH5Swoyd+7PucZc5kXR9BVpJdDPnZjS
	93kwAkCQqDNFH0baBYqWsCYN1mANp0x5QMz0vM1BIv7+p7TlMHFVTjcufCFWFImltw43jk14dzeWO
	w0k2er1C1mpNDtFS2NMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9u1-0000000DpLv-3PrC;
	Mon, 02 Mar 2026 20:30:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9tz-0000000DpLP-2KcN;
	Mon, 02 Mar 2026 20:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2903E408EF;
	Mon,  2 Mar 2026 20:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA0EC2BC87;
	Mon,  2 Mar 2026 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772483403;
	bh=1uE6eNgLWjhTlZI5fPcR1cRgfMraDTGbBiD8J29weO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CGd0nv1UP3vmSP2ruwtij3DdWX6we6kS1yCv5d8Uwn1IyqepaaACcY4sa2Fm/3gGU
	 lcmP8KEIZwkJbQn7ko2nkYM9eTo/CgdjJPn9NUNENpvO9vm89SWnb5DZU3GsVEKQI/
	 S+0XyxktJ1xQOqV+6N8tgoT2zm/qaogJK6DnGL7Qwd3gEkh15/VE6rm5edry2m+MhG
	 by7Ny1BaprkSLnDXz0biLhJ6d4Q3gr6W0J84CNVu2X2X9mwYUdbKTKCvAEEk2isYy9
	 dRjUqGMYsCPAzzmsGji2xyuMWelGJ9D1O28EveG6jkhf/Syz4dwVTiCParqHM1ZQ+1
	 kgFfa1QJQH9sg==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 02 Mar 2026 15:24:05 -0500
Subject: [PATCH v2 021/110] bfs: use PRIino format for i_ino
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-21-e5388800dae0@kernel.org>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, 
 Joerg Reuter <jreuter@yaina.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
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
 linux-x25@vger.kernel.org, audit@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, 
 linux-sctp@vger.kernel.org, bpf@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=1uE6eNgLWjhTlZI5fPcR1cRgfMraDTGbBiD8J29weO8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfH02B9pVd+vLI3tsGZcHh6xG/C/hj6NYi2ea
 8V75fnVyfmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx9AAKCRAADmhBGVaC
 FeRUD/48uqnf6UKtVy+aiaLzavEv6LMazv0wx+DEmdHZtpC5rZUxFSrpRomhtWLcFR44QMxvrl8
 9d004fxQI69tc/63aCrpFvuXJ53LUCjyTtIv85NqSgUPBf9LG/Pf0tBKwmKVmk2CC1yH0qAGrqg
 Bui6XcBhwMdMrfLvZACRfwaVDrjwS4ILmolPG4mrsOAOr0ONQgzj6ls8qGZRbmneQJOuyprIN7J
 oaDCIgwUl4o/f35hF+SDoRWAZxqSQEYTWIbNrFesuP0ENF5YCJ7ZEAhUNCqqQbol1cbJoaPufj0
 q2kG95bnr33VscRsxto3Ini818JFDTFe/rEl/6JL48ToHRBgJZm3UYpIVzocW/LkVpJ1qChf73q
 b0F5PuzdQ3nC+ACmvBZwqsYJQosjwdbbK/Uae6L89+pJcDYwA+B3G/DF8124IsWxS0eea6QAZpK
 3ecimadjNe1N8WaAP7CipL6KQxSVrEjNsi3SlrdTacHxnJw79wK7CBtaXZri6nj5ZRdCfKtyLtb
 KX2srVTuZaXg54g9ZIP4cJs7BxeuJHzfjmK5L+R0jlMOEX7c1IlFuRj6enM7pDuqIBWArr/uVZR
 OtGXPtFEC4bUrGma5Q6b5XXy9IQMh5JX9yz7NyIE//JoFUaIBKl9EIEWUoJImSZqt06ldfKs3v3
 s05CS+pS0A0Qmeg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_123003_647511_6128B6B1 
X-CRM114-Status: GOOD (  14.38  )
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

Convert bfs i_ino format strings to use the PRIino format
macro in preparation for the widening of i_ino via kino_t.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/bfs/dir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/bfs/dir.c b/fs/bfs/dir.c
index c375e22c4c0c15ba27307d266adfe3f093b90ab8..a70efe448ee82e9b1bd499abc968cd47271e33ba 100644
--- a/fs/bfs/dir.c
+++ b/fs/bfs/dir.c
@@ -35,7 +35,7 @@ static int bfs_readdir(struct file *f, struct dir_context *ctx)
 	int block;
 
 	if (ctx->pos & (BFS_DIRENT_SIZE - 1)) {
-		printf("Bad f_pos=%08lx for %s:%08lx\n",
+		printf("Bad f_pos=%08lx for %s:%08" PRIino "x\n",
 					(unsigned long)ctx->pos,
 					dir->i_sb->s_id, dir->i_ino);
 		return -EINVAL;
@@ -180,7 +180,7 @@ static int bfs_unlink(struct inode *dir, struct dentry *dentry)
 		goto out_brelse;
 
 	if (!inode->i_nlink) {
-		printf("unlinking non-existent file %s:%lu (nlink=%d)\n",
+		printf("unlinking non-existent file %s:%" PRIino "u (nlink=%d)\n",
 					inode->i_sb->s_id, inode->i_ino,
 					inode->i_nlink);
 		set_nlink(inode, 1);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
