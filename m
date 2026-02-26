Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87770FD8FD0
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osXl8FUDJ2fWCIY+CGfMM5jUGkje74JgAMNzu9IB1u4=; b=KAJuH9ywP32Tfx
	6sTsbQYK0/nUwo3wuKJOARTZHBZWbf/zErXNGhUsuaAoLtsj4Q3d57TSQGC5QkXDh3oR2/J0uGEgn
	eLMpzhKWA0Mrgs+w0dJYb1tt5+uk2mV0gOjGsDagHmnSSvLLcXHpSNsb+giGZagpzS21GhtfvbXmb
	sUha96sNvp4BhYjx7aTWTYsCEuuz+B8YQcF7Iwi4YRAlC2h5aEcTyM7MyfvTlkjD2k+foqOUVqwYU
	MY42GmEqfjZuCges8hFykr0Xu3IMjyhsPymHe+1TzjbQ0NrFBOICqroK2ErA9BZhJWkTcNP0+mUX+
	1mvlIgZSWo1XHaqWHCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdoN-00000006d67-1EMU;
	Thu, 26 Feb 2026 16:01:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdoL-00000006d4k-1Fe9;
	Thu, 26 Feb 2026 16:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B06540527;
	Thu, 26 Feb 2026 16:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43023C2BCAF;
	Thu, 26 Feb 2026 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121716;
	bh=9N75YU8P0Dg8THcxQbWno3cEp0CN0prbaNbOwalVkKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e/I2LrAJtlajRHbmApBBp9GF/jNhQdIGLETvtCEnAzUVUtba8QK0CBGWmV9htCT6B
	 5K6R2idub7svbh/mw9n90uNytkxvJhgBcffgrIRhIGuivq+iId7ayUPqXBP9t97MuZ
	 hkBNExUfd7etzo5lfzZThjHdvIm1YRbUX5Z1AbidHk4Fw4nsbHWhOsKCZfW/M7qyhb
	 hneHLVlhtGFZyUxwo7lS4xi78nN/dh6F7R89m9Q3zlwhsUSWW/9tgRo+NFkkgnzNHw
	 xTOAf1RzdTLGgfXDcrDFUDU0cG7V7OPS3TMg6/ofg5003GN/je1prtytpOmOVqeEG4
	 Q3G+ILuBFRJ6Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:29 -0500
Subject: [PATCH 27/61] cramfs: update format strings for u64 i_ino
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-27-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=848; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=9N75YU8P0Dg8THcxQbWno3cEp0CN0prbaNbOwalVkKM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0LKMgHR3VVeOoTBTGq+UXxZ66ksEq5R7ONd
 Gh23SbI7jWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtCwAKCRAADmhBGVaC
 FVrMD/9TPlMz1avJRvLzXr4XKIEyTKJl0/n8qdLwIZPVmFSra7fQYCR4nDjNAbvq5t7Bj2uG2Cg
 9lPaebAEBXG4NSa817wFHm1WkeiRdg+Dtjx3vXI3h99IhKi7mzJDHs9k8j3+1dVa5Y0uoQXr+w7
 76aaK8JGiMxxskZboMpBrNj6Mq5ZMfcePJwS72FB7z8WeW4PdvpmPIdfyjYi3/VBZ1PcGoDtXfC
 Si/m6S/FBXgCO6Wt6m3vYLyu0S5gjlMbi8Ijjd7wxo/8WsfUGfyDVOLIM3roFQG+dU+tKjRYEhg
 CMdXUOREK+PclQtWurWUV+syJ/U5vnceqvg/4eyRMTCUl5n7Qemk9BkCZhxsQ1+jC9Rxddo+kJi
 f7ntEzDqc3eljeIolbh+kOcaIRldz5wW25WozcEgrP2HsC1+u+kakEE1qvMHnlG8RUhoSYHW7Wt
 GAOX8NuIDfK3uf9Uc+UjIvO6SrZ11bJXx+/P3h1qtq8h7ohU8d8ulkJiE6b5KTC/r3WCw8xl8XN
 8yCBV7Pdm/43xeMdxScGgd1dtuk5ToxVONwc4n3begxzyEurk1ereoUwZKB8PVBeYzoy2uPL2CD
 zSkFIpwncp2hQddaNxedeTnKj06KaFw7WntckzTBbp6Z83UmktCVtZEREX4F8KOhf93jLcVUQeI
 TUYSztb1qSZQgGQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_080157_383116_8DFFE591 
X-CRM114-Status: GOOD (  13.36  )
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

Update format strings and local variable types in cramfs for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/cramfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index e0ba9cd640dcfe86e0976344b30a5b9a0da6b90f..4edbfccd0bbea39a1babd289afb1d8b985570eeb 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -125,7 +125,7 @@ static struct inode *get_cramfs_inode(struct super_block *sb,
 				old_decode_dev(cramfs_inode->size));
 		break;
 	default:
-		printk(KERN_DEBUG "CRAMFS: Invalid file type 0%04o for inode %lu.\n",
+		printk(KERN_DEBUG "CRAMFS: Invalid file type 0%04o for inode %llu.\n",
 		       inode->i_mode, inode->i_ino);
 		iget_failed(inode);
 		return ERR_PTR(-EIO);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
