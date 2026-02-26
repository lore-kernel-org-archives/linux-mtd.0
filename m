Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBFCFD8FD0
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zporu/0QSaEALQk2lSy+eH9K5NnAdtWYI33Iax9uPzM=; b=iOL7PTmVfJZSQR
	xA0GN5vw/QVikNz14juiXpYHuMWRXlngB+DyHd8IsTfRN3v/GPu7HiuXDezxggFwouFF/+mzrKZP0
	5TFmc3aUrcJPwtkL3aYny5cqUCgMDdrmHekIMX0GmGZzjwLGYZLzALnlUF9TNX4pZNzjSVoUb+v3H
	XSTKRCd3sO8mTvkkgX7G3FynPVnzBNxKBsaE9oqE9vgG+hgE5tiZpR6kRUCnzXi5+g2uVo2vaz72v
	iKcYe67yV6zWPjoFPCLdcius7MqgK/p5IzvwAjIg3xGv3YXe+8x9w4ue2spJ8AM6zAY4BDg4XWzoB
	vptbEZoxh+alWF95QuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdsH-00000006fpF-0IoF;
	Thu, 26 Feb 2026 16:06:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdsF-00000006foO-2KWM;
	Thu, 26 Feb 2026 16:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=632Oc+/xQ9ATwp0eW/zLiAhkamlJnV+MujUlnjodaZI=; b=g27adxdwkPED2lrdlGhjo0HzO+
	WqHetYbzTAhxBuKBYPxLwmK2bw+cejPnrg4t9nhsiF2N/qT3FT0xZZKazQ4dVWeB121FVIirZuFV2
	Whl1C1h3WVewNpEo/wuHxgKEbBK53v514nXMxSR3dMjebvgAz6L7KWrPE987glgKeR9Xlz0Z9st3R
	2/Bbu6ztjSlQsMo9Wcejtg6XhbF3RviLgqir9DdVrn8f65nWgT7LV8n9BEfEeV1GArQV3yjiruqiB
	OdbzbEbetRTYkkvRhlC8WUER2EVbtEfHc8GJYUKpEO4j3YVVGG3vA6Icv+doRCLNkJlvKFmMPa8JK
	ifTMi3eg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdsB-0000000BQPC-13sf;
	Thu, 26 Feb 2026 16:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8E1A40284;
	Thu, 26 Feb 2026 16:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B825C2BCB0;
	Thu, 26 Feb 2026 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121953;
	bh=NT9GoCKrhJHxzJaFVzYs+iwgpSzcQsNFzrkjPRxmI4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TeEU7zeUNxSpMMkN46e9L3j3aOlE0vDkwCXGq1PJj/CHTmYVutZnXL5F8MKin4JrP
	 A2G7qUafg3ehXB/Blk5az8FIg9TANb7MNemEsXrYya0b5Fvst66jtyIF6YUJ7v27VK
	 z3EYy1wCaHSO5b901ZxcnOkCEAbffwTCLfaayIvm7hBm7inmuRzrEp8G8PGlf7TbUl
	 iQJDbzU/9ZKHv9IW/GHirGk7LZ1m1u23z3/nlVfBjjNaKKqYUxY3x72+ZQPhCC4a0+
	 ObSwwws+YwOg9yQP55KRghBkVnGX8DhzzxIwaxbgZGpifL5ay0WcCfXOGZzl3mHLfb
	 GCRq348a4qFaQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:48 -0500
Subject: [PATCH 46/61] qnx6: update format strings for u64 i_ino
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-46-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=757; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=NT9GoCKrhJHxzJaFVzYs+iwgpSzcQsNFzrkjPRxmI4A=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0PPx4vgLzFRyqyCgx4J34+XZiyaw/sSPdij
 GSRivfac1mJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtDwAKCRAADmhBGVaC
 FbT2D/9FjLqJOuCZ/iHUB6fXfFS0PRvj7GjtXh3TEl7mBaBqwoKn2tiJVhj8uIoLDInua9zDarS
 kj49CPCKVHUju5nyjzd4AYbAyvz+bLNRXpkiv+wwBafITWWLDAUBYHd3khfRwC7Zf2/GsbtOqra
 G0PjEIwc+ggLzHWlwJkaatzkAnwHg5mOg4skMPzKOTrAesBH0B/ud00dXWV41oUIPXO/zVBKa5j
 HlgW2VN0KHdXbenXBNwgZCva8rq2Yk0gvoe4F+hxSCKC6jVrstMcij8oTQRe4XdYBLW6j93GZ1l
 Bz+pZzyG/BEAqMQlDpq02p1pUK3Iq8wVtspVp+kenzKWBcRFzQzrgTze7VnpKUlLX/zqVduXx5+
 I31MduvitvhgUpJGk5SMbjgZhl650TRGucqbdCl51NzVhjfbT2ynMIyUE9lydocd6jRa34VJ4lV
 8HsbsnPB7bZvLUBGy9FSb03giKnQ5Af6PWhWgr/PZU63A9s3GhqIyla4lD3Bv/7vZ3poxaSpFb0
 UZOZoc19F0oKz49lInvML8oh0Zc+DLugGv49Fg2/DhdKc/ZNcLda4sZOipoNBhNkB5PhTVKOi1M
 Undibt3NU51UZyvlBAQGdE+ZbWo/s/gnPJPNhUQcUFSn86PjjdYzZ1wCSODoogl3UhmOdIQbV9R
 R0VSmXPaEkSynww==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_160555_663928_F0A817FE 
X-CRM114-Status: GOOD (  13.16  )
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

Update format strings and local variable types in qnx6 for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/qnx6/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index c4049bb8bd60d47f9edd3d724a5d5be6b5deb5ee..73c9c456ecdfcbecee677877e9b1d5dc65071d43 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -75,7 +75,7 @@ static int qnx6_get_block(struct inode *inode, sector_t iblock,
 {
 	unsigned phys;
 
-	pr_debug("qnx6_get_block inode=[%ld] iblock=[%ld]\n",
+	pr_debug("qnx6_get_block inode=[%lld] iblock=[%ld]\n",
 		 inode->i_ino, (unsigned long)iblock);
 
 	phys = qnx6_block_map(inode, iblock);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
