Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4226CFD8FD1
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KM86WajcT+bVNMxDyzCj+Ua9K2qAqypRw5gI7EEEv9s=; b=dReYzq9bYCF70u
	BPDJWn/WXHWvmi1mOi5CoUFYxExOJlJ6UFAYRGEOmIg3I/20eZVI40agRG3p15yz+GKtTUzQTfWAT
	e38prUY9CPOgg1PfAq9C77F8LGZExsp9tHQhhc/uAbFiwrs+lT0Z1s9OW9OwXgpOz0J62gLEZF15v
	SxJHJUq/X3wCNi4Qh3M4GkB3zFCBGS3r87aC9aYd1UIB4WjhTXEo0aHPHm7sZJAmsgZp2Q5rgynqk
	pbfjjZiO9mwD55Wthdhp4ubK3iSNF8AVLlt12fKmAcxsvyTZlznJ26vW5XxfYomMlsCGa2zxO0eeO
	0pPVHVOZM3lvn6HF7nJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdnD-00000006cIh-482M;
	Thu, 26 Feb 2026 16:00:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdnC-00000006cGP-07zU;
	Thu, 26 Feb 2026 16:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vwOkZMjbWRxvVqwrAW2xeF+30SW70eom28ybXT/H+eg=; b=Lg2E/5+rkfOYgQL4KK7Ax1PKEJ
	xmrfHaqqUE1c//8u8NyJrl6xLV2YacTqoOaF+ITvINEPsjyOYlSNjnw+XtyZh26bXhVe1alAXgqv2
	bAHE6V3wUYmg1QaJhuDBcjpSmDO1VXX/BSIVsY4CfYkYvcOjxm2MEEGubCyBryKSiONoc5AK7pIAq
	OcL+4UU+KBa6MrcfqnrSKyzNkqAnCOY8nu8KXVcWfsyVpOrKWk0MGkT3XoH7nt8aTOKLwbUnqfQZT
	hcciI1Mj5gmZVeMRGOHoG3M7PkqFxtV5DXIzSSOZOzx/oHYcRMcRtHaIrKGlrQpQeNddnbr+1axpM
	zhu2HkZQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdn9-0000000BPJb-0CzU;
	Thu, 26 Feb 2026 16:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B38D443E85;
	Thu, 26 Feb 2026 16:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17119C116C6;
	Thu, 26 Feb 2026 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121641;
	bh=xyBw1SwfRMQLBWEgrrkEe2eyZ3OT6lx+HD9fIFZD1qY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fNcUeAC8LfbuX4lgGT7aQTxBgLST+vuvk5mkMds48GQ+g4HSaoCSpDLHLVMnj0NuY
	 1PIGro8PCwCPQq3d9zMOEafCLIMRrO7q/wdYeMeJVFK1Mt7D0/uZ6UZjf3Hfmz1hvq
	 NSIkUALrDVgV83c2dfneqajdJOgd7N/8TlaV6HeAsWHTIxc9KjXlI7XQzmZ4QscjRV
	 3/u5SxnOABmrerXDkqlgbfXbfI6Fqp0zjAGbGpPMO7cPsucvQfhOLksSp9q15b4LDk
	 pyb14314OSLugQNutI8+hTcdKqsNBCsQQiBbTV6yeEJSkS3IHTtjxVol6hFk5iqsyR
	 tq8E55Bv4aIWA==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:23 -0500
Subject: [PATCH 21/61] autofs: update format strings for u64 i_ino
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-21-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=814; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=xyBw1SwfRMQLBWEgrrkEe2eyZ3OT6lx+HD9fIFZD1qY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0JExbzcWBTBp2aNu1vnR04MkNZW/nAdrw5g
 +xITs56jyuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtCQAKCRAADmhBGVaC
 FabmD/9pShbzxgqwMNSMpo5tHg43GuaCxALPaIjR8IddB7ch3WNAsd/XGJhLa/gFoiMUqmCKEJY
 oOUmX+N+T0SzuhTlRRcmphGFEAcGmaqtc+/nhhb2O7N+VDnavu7DGbYPckBO+M/n6B8cIbWekm2
 Zg78DvmVE66hziTYY90oXnom4z/GJU11TLp5+DNQivyMeqxdBOkB5i/uMxpFcI2f9CaoYardgLn
 lk1qAHvHDTrSakJPXNMRLjGeBLMxukrmVWG2eT7tnlHksA+iUaIx8cQRqNs6uyjf18Jcw6rDcPP
 tQDN1RCczCxUVBMehNGK8XoIvVkoP/QbM9sD+XUIaT35RdgskcXOY0JET6OkBHl2Tu6SeeEyE6a
 jvzxl1wM5MSNeic9rAL/3dIle7gnU36ht25+Z//fJY7NMtZ49KxHgNjWTd3DGYWIpbWa+4jPlaa
 7q+oHXxiagWBUK8xCNH3N/Kf85OyQGGUe/oyHcNQnxVsK2doX5Oc+6XCeziyEaLp3iixL7hC8Nk
 phKLvyz5EYv6IfarhlHlPrSvEy2ztw0mlsuV3MHn1m7YpNfnvO8m7Bqto9MD+wqxu90jXl48/OK
 4ktgDLCFT7QMPuGeSB4qNJNvclX6NaeW6tqsHwgFsbk7tMQUUgnX6H2W216RnFB+2nkb+b3TWQF
 uMdBG0nI+CTO7iw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_160043_445588_0C1B1B38 
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

Update format strings and local variable types in autofs for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/autofs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/autofs/inode.c b/fs/autofs/inode.c
index c53dc551053ba53fa7c85ca57eb877fff74a4ed1..87195c5d07fe99076ef962e78d3fef0414fe46eb 100644
--- a/fs/autofs/inode.c
+++ b/fs/autofs/inode.c
@@ -92,7 +92,7 @@ static int autofs_show_options(struct seq_file *m, struct dentry *root)
 		seq_puts(m, ",ignore");
 #ifdef CONFIG_CHECKPOINT_RESTORE
 	if (sbi->pipe)
-		seq_printf(m, ",pipe_ino=%ld", file_inode(sbi->pipe)->i_ino);
+		seq_printf(m, ",pipe_ino=%lld", file_inode(sbi->pipe)->i_ino);
 	else
 		seq_puts(m, ",pipe_ino=-1");
 #endif

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
