Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27896FD8FCA
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6MDZf4eZpZVHcRnUT7LnDcroC6mU9/E+Whfqzw3OvI=; b=i3RuAcR4UWnhsw
	f7AXH53ICOPs94Vt9WoqmaRttA6KtAZCjYz4PA3xLch8zii+UmoKk0mK3H7xrCta1LbtzEFeN19gP
	cguyC0v+gG+zeX/qptvRYLZtyoZRFJX/3g2Q04VAUiZmiUxC94mLROtxtW7H6XRWqIqmS0RNz2Tv8
	h3gkYIhk8hu8gSJO4iF0gBJIbgprj+nu1QRtBCeA3DnzqynolPF6tL4eIe49REaksiIQhn52Ye6Iz
	AxdiqWwa06t7iaMZ/nl134FJDDx9sUa0Lqhxak267k44U/1e4jDu+a7Hg3ImJyecGwWPE0kVGE7KR
	N7l9/KRd66cXOUnEBb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdr3-00000006eyA-2Ymf;
	Thu, 26 Feb 2026 16:04:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdr1-00000006ewi-3bQ4;
	Thu, 26 Feb 2026 16:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lJ02/y4gZs0zdHYgnvIMhyk8aCHmXoHwnqi8QaUbMgo=; b=m8dRIX/8qNZa1ciyqhqrW1S0+m
	z9Gw+R1qM/iaW9dKOMeYszOp5KfmVh+iiAycDDGBtIHfUr7dIAFsyZw3fCYLkf21nI4EyL8xVyT4x
	JPzKnWfrFUpuH8A6aEapt0h38q78bm6B8MTKrSSbFu6geRSDK+jShU2BAyTpu/8bE/wB5HU2AJsrA
	NIAtgiRtydjTAF3gyUVNpBDNPnlOQuk+T8KgUC3L/xkYGqcbKKtprb2gxApugo5/xfbB0KxljoTJD
	DtPmlMGXfhUSvhJ1JVelVpsEZ206gK2nYDR6txY9TWKkcqaNJQYnP1mXfj7rg1R4IRErp1SUveRn4
	E9vwvoAw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdqy-0000000BQD9-39qv;
	Thu, 26 Feb 2026 16:04:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E91743BB9;
	Thu, 26 Feb 2026 16:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25D0C2BC9E;
	Thu, 26 Feb 2026 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121879;
	bh=/R13WlmCiqf+otA9FtjIvnhA88neDdZ1z3bo46wgKlk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ME/XYMrD0mbvHzirdHMfJIsfdtmPFxCfe6GE465X1RJF3PBm2jj4PJNJPYeT1iDOG
	 LbsRm0hPLRDwtyDoOgB+Voef7jG8Y2KK22baj2rjclEI6wj5ibMesgE2ai+NJ/UR7X
	 6+QUTAooFfBgGcyast5Z94iyXho7rgdTdHdAwiZsKDxD+igqWK/cnx7ELcaU3fYIRy
	 ng9wFCImfGsr/rZxhue+trQ/GIHKbB3bcg6whxFxw1Y2QglSKv4ojDEr74/nb1FFQ1
	 tYyPsAGjzIDRWCtNI5FfKR1Aw/GoyUNOpP4KvVJnARaeqTNjVtrA4JR7sRW9jnU9kC
	 8v15Pgqa22BtA==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:42 -0500
Subject: [PATCH 40/61] nsfs: update format strings for u64 i_ino
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-40-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=/R13WlmCiqf+otA9FtjIvnhA88neDdZ1z3bo46wgKlk=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0O+wdqUvmhdzWRUaf/uRFQdKMMnnQ4hzPLX
 9J0lNA/txOJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtDgAKCRAADmhBGVaC
 FReqD/wINOu58ZOathcZxcR1CK7TMnX0vxSOJoULS3X1jMBCONSGbKTI4Mwm0CSAxlQ98Ny4Nnn
 rtBtuGY3VRIjCSjO47+h7GQ1YV0V6Hc+rMhcOISbfMFy81P+loguWdTSkab9YblDvqIBIo8D6MI
 aeO7eQcn3P3Amz+zf+MJyA4wHMa6kUeyvW9ZKGd0CGk4Nbpc2hWw8vyhzqBOW/Zowk/OAe9T9OD
 fi+nNVJoTHG5Noq62obje8GhGhhYR/s5tI7dhXDVjhEpPGT/sFn5ElbkZwU7xptq2KT4yauQ7/Z
 DicbI1P6DJ50SqUjzuGz935+4TaETa7GtJyOMH5p6f5NVnl9iAPRms08XEOh7yI92eChFW7TmWw
 UWmDE4w7QRmZyyfOTgl2q06EuSTKCXIEbyGz5L/24Gim9RqCoV48oqVEnIg/sAFpPzo5xi5BIXf
 V1O08+55HNciUF+beE4JnOTS0c0eA+gQG4KJKrK/vP28C/zZn1ASyS4G2vPv+b85tystcOOUs2y
 g3wQEGVlU4mGAe1eRf3tPrndsga/Y72dzsCKqLqF9DyeTNT7ZSXa6UQ06Ih334PtgWGBjQP6S2p
 ZL32WssPTyas96P4SaYWACeakyldlGnUtNJrwKQoqVchA+l5uktGdxteZLiNkIHXVwmcaZaU/Ql
 kKqNMyGtdnhOPGg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_160441_271286_EA5F5F99 
X-CRM114-Status: GOOD (  13.70  )
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

Update format strings and local variable types in nsfs for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nsfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nsfs.c b/fs/nsfs.c
index db91de2086456bb9fe0547be7dbbd2de87c97ca7..eac326b85314ac8080248347154d599c953969c7 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -46,7 +46,7 @@ static char *ns_dname(struct dentry *dentry, char *buffer, int buflen)
 	struct ns_common *ns = inode->i_private;
 	const struct proc_ns_operations *ns_ops = ns->ops;
 
-	return dynamic_dname(buffer, buflen, "%s:[%lu]",
+	return dynamic_dname(buffer, buflen, "%s:[%llu]",
 		ns_ops->name, inode->i_ino);
 }
 
@@ -394,7 +394,7 @@ static int nsfs_show_path(struct seq_file *seq, struct dentry *dentry)
 	const struct ns_common *ns = inode->i_private;
 	const struct proc_ns_operations *ns_ops = ns->ops;
 
-	seq_printf(seq, "%s:[%lu]", ns_ops->name, inode->i_ino);
+	seq_printf(seq, "%s:[%llu]", ns_ops->name, inode->i_ino);
 	return 0;
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
