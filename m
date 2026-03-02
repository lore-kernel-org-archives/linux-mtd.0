Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E414EB3632
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2026 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUhj5+Pu1r9eYfivfaKEppDrZvj70GK4EFp0uyS0MIk=; b=kikkjKLK/Fvgl/
	j0pzA9htLXGNmGVC3uTvu3nro/qt+7BGvfurom+UD4wHs/VeCulHS8SdwvRxV3AW9CqsRfiuY2WVd
	aCY4Ec/za2wva4Uks4wFf2pT4Z6gbHz3D9kaNOiZ1JxRajDFvjGrIrBxl7xz2bvvUODoewDKLW56x
	D8T+V83rvAKbkKytGInjj+jtKUe9MJNFwhAc3d2muYrr42SGBxhej5x+XZYdsQWL6DrSqwE117txZ
	tK2qZaCHgJ5fS+iTuKRIPb9tXQkELrwjxuU4M9cuJTLhwGsJ1sP8GfKIkPttTWx4/GxxqyBIwMLDJ
	Egz7NuxhKCxZSQ1eS6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9yC-0000000DrGg-4AY2;
	Mon, 02 Mar 2026 20:34:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9yA-0000000DrFZ-3G3j;
	Mon, 02 Mar 2026 20:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 083F56133B;
	Mon,  2 Mar 2026 20:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAC9C19423;
	Mon,  2 Mar 2026 20:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772483661;
	bh=9vOORhA9m+Cr2DfixXDJ8c/2SDQAvlb5ujFFzPjzDlc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z+57nIPb+bk9zi1MjrJosbkn0fEdK3CorLwsR0v6ukr/wnxc2efBPpczQ602ZCKGC
	 z7p/vwb/xRQdC63uq2tnxlejzgMl1TpFX3nXcclQBK+AFWIp0SDBT5qqwuZK+D6Pz7
	 mRqRNzvHf7HlkXaqphW33b/7nPkioKJ5VPplLeCLO2okSKOLt47oiwWkoYr0jAabk8
	 J8SojMzvb4PfpcYJH6Glzrr+Cy+bcL5EkHFY1UgXQ4xbI1+sAppFKh/JJPnnqsFrRi
	 TBC7OjKJ6OmwSlm05TD857yF975y2YZ4Q5sWIl5jpRkUS/GVtZViwwM4E6Q8hl5IyP
	 PcOkhImYnSTpQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 02 Mar 2026 15:24:23 -0500
Subject: [PATCH v2 039/110] ntfs3: use PRIino format for i_ino
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-39-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=9vOORhA9m+Cr2DfixXDJ8c/2SDQAvlb5ujFFzPjzDlc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfH55egcRR4/mhYfnDyqBlADGfqgvIRt1PCN4
 x+gMyWmMCCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx+QAKCRAADmhBGVaC
 FdEmD/41M/JHEs7IP3sfe79Y0dcvJeMl84jQGbpG214MGAeA/jtquJXDxncE2gWgJIjMsvDQ8g0
 C3mWf/U5TfDjdFFUx0T4a4Ut7VzCiw6oZ/KlqDMJFJqbui7JZFTyWwIc3FD3s7iMncRlChMLZPp
 q05zf0ttbgtIHWawPfZu732vWozbRo6TqyCT7RYqor8fKO65yquJqUD9sBuwLxRPz7VLijOr7sn
 qUh97KrpLnoHZ3HchUw7dE6yR5rTd9dOO7izjatKYI6hATXuN3CAbZnT5kxcXB7Y5Ubd/49n553
 xbS6DR6HfR9DTweBVmy9gz4J1S2ML9hAn0i9hEoPMM6bwTfnGnirO2MbqsnxjSmKtg27t4NIPZ/
 LGoVO6MVj/BUGAfrAzR/HhoQXt9z7TRb6Ka8msUIfeL6LDAxcrk2sPoVbs+9ZLIL2Ql7cL6e52o
 PT0igEsHZ/hNIjPCPFYO53UYOCyCoSapxCnKhSKzojC6DvcA0nL6oO6kHv/MvjHI2a+th9gNzgM
 Re07vU50RULgKDmWkrWZowfm3su2IvZpZKdEd5YtCd+UbjB2IxJdHyDxcw6DbqQyX29Ohh7yNQi
 ZJeSVNN/CgV37dmFdJKjePETW9gfpjtphDsPGE86Pc6iRKaB8gn8oYsRC7PkH7yEBPCDbPPwip8
 UQ17gyzCLJ44b3Q==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
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

Convert ntfs3 i_ino format strings to use the PRIino format
macro in preparation for the widening of i_ino via kino_t.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 174a7cb202a08c550b3b8497cdf6105192be2e43..f32227750d6f569286fd973a5ca745a655a470de 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -153,7 +153,7 @@ void ntfs_inode_printk(struct inode *inode, const char *fmt, ...)
 	vaf.fmt = printk_skip_level(fmt);
 	vaf.va = &args;
 
-	printk("%c%cntfs3(%s): ino=%lx,%s %pV\n", KERN_SOH_ASCII, level,
+	printk("%c%cntfs3(%s): ino=%" PRIino "x,%s %pV\n", KERN_SOH_ASCII, level,
 	       sb->s_id, inode->i_ino, name ? name : "", &vaf);
 
 	va_end(args);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
