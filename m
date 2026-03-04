Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD45CEF8FF7
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2026 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bpqi5ceP9Ofrhu5+agSHg2MVC9nZXDU4PDufructV48=; b=AUUqUiBGGPAT8f
	bSYAwCU0zBGyh1BdIvwA4GJT4DbaKQQ47yytXmmz9T304Sv28U1nO9LoLXFpmMFrEDABFhrDRPy9i
	qlAXRVLS+U26HpPw5dzBvI2I3VTxDVgGv0k4+ckWWymHxQR4v6jGo2tdhQySgaIkdK+hYfBHzrUIY
	bJ8JQUzSA5wykZnfslDFYJoGzzeW4XxZoY2tuiIu9M3H4o5J1mwgotYKCPW9bBB/UFdu8ORKe4LQt
	jwX6GTr1hkdV6Rp+uATNQnHAqI7d6WLUzOLxJRFbA7zyDCU9X4Smk+kfhohbCDnrUdLtPGBbcvR97
	84OuyDPSJKB29MDdpxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoGT-0000000HaAo-1q4h;
	Wed, 04 Mar 2026 15:35:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoGQ-0000000Ha9g-2Vi7;
	Wed, 04 Mar 2026 15:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BCD4404D8;
	Wed,  4 Mar 2026 15:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CBEC2BCB2;
	Wed,  4 Mar 2026 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772638554;
	bh=HNYyRh7uJihRjIsYnqg9vR2rg+YDBytXVTWJLsChpBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jJJZJuOWKhzm24HbRxXeYH/65v/yOXd3J5JeaPVpFEFHYCIk+4dI8RfwfOSUGeOWx
	 1wp0BVEDUhdVwfxuISed9ev5wqFzfZBSXvHUDpSQDH7LdZQV8LqsoA3S7HSPWWSIOS
	 q0zFPMue3eMREgGV2olfWoBJ85YhdTD+86QJA4JrqsDAypKCf/Fs0V5KoxG4qVZJty
	 ZHH8tVkHlwp57wEI2ERBSF6F3702iYCYBykR+h4S0T4gaLEOpYVyy5DjwzbNP9mH+m
	 8mdOGnCCkrpD5DzxE3NWsGzH9XNum7DQaX5HC6gb7/ZJs73mWVq/mG/j0amdjIFZjt
	 SfBKgFBpfKv5Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 04 Mar 2026 10:32:41 -0500
Subject: [PATCH v3 11/12] nilfs2: widen trace event i_ino fields to u64
MIME-Version: 1.0
Message-Id: <20260304-iino-u64-v3-11-2257ad83d372@kernel.org>
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
In-Reply-To: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=HNYyRh7uJihRjIsYnqg9vR2rg+YDBytXVTWJLsChpBg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpqFCpn4jHLr2TGESURidfEFiRx4u3yOkCGmevg
 z8yGIn0bm2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaahQqQAKCRAADmhBGVaC
 FY3fEADG2lZ27yB2I+X23lq+iIwhnlF7pXPPYkX0oxn/MGtoloSrlLv/JlUE0rFS7OLEDmEFh0v
 7Msy8JGrmfcwp1mYgS9BHGKB08wHoUO+/UBe39k6qMASDJIty5gEZjqBQBWvDq/CBQv2+zbPmja
 v/XxPZ6UwR1/kBugt2FWO2bsX4XYbtCV7/rKeVgXYeVOjSEHUhOidxAg0EliqhPo/X1GMHdDpVh
 hlxhOEt2rn82p4aiYJvdaGZJ+Cvvh8ZHZYedZtBPbh2XLdI+b4HRjxoriFnvYkreDBHrhJaFYQF
 mDP+BJqPcTuoiMXgpEyByaON06H+tY2i2mtFB1ZxI2eel7Kz8SQMKLK4cb8mK7Czlwq/SwLc1m4
 FOICYEN2snlvZbhqRz7dLB00X4MHWwwH50CiofjSP6O3VMhimuiWG/e8wg/4H1gm5sZYTKUCM6/
 hbEME9qYhPsCqNagzgowu9/Ly7cNebcIrg6NuudFPojMAQGNOux1bGLLEuM1D5mPZqi35+BQDqw
 c+9Oomp2LgByVNzze60tZa2PrkudTHPupcbq8j59Kr7wLKoNAwh9vorVNGFsm7R0rW4k8E6YePo
 Tc6AgYvtiUDzFDOeJAt06CCLgph2tznpvQejcnIWoU+6g2Fm9zEw+sUQ8b97rt1cqbxYg6uxck3
 fFrf+jQCmVJvCFQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_073554_681297_16AB4EB2 
X-CRM114-Status: GOOD (  13.17  )
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

In trace events, change __field(unsigned long, ...) to __field(u64, ...)
and update TP_PROTO parameters and TP_printk format strings to match
the widened field type.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/trace/events/nilfs2.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/trace/events/nilfs2.h b/include/trace/events/nilfs2.h
index 8880c11733dd307c223cc62ee34ebeff650ecb12..49efbd209585b294f363e950e8ab266f533a9eb6 100644
--- a/include/trace/events/nilfs2.h
+++ b/include/trace/events/nilfs2.h
@@ -165,14 +165,14 @@ TRACE_EVENT(nilfs2_segment_usage_freed,
 
 TRACE_EVENT(nilfs2_mdt_insert_new_block,
 	    TP_PROTO(struct inode *inode,
-		     unsigned long ino,
+		     u64 ino,
 		     unsigned long block),
 
 	    TP_ARGS(inode, ino, block),
 
 	    TP_STRUCT__entry(
+		    __field(u64, ino)
 		    __field(struct inode *, inode)
-		    __field(unsigned long, ino)
 		    __field(unsigned long, block)
 	    ),
 
@@ -182,7 +182,7 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
 		    __entry->block = block;
 		    ),
 
-	    TP_printk("inode = %p ino = %lu block = %lu",
+	    TP_printk("inode = %p ino = %llu block = %lu",
 		      __entry->inode,
 		      __entry->ino,
 		      __entry->block)
@@ -190,15 +190,15 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
 
 TRACE_EVENT(nilfs2_mdt_submit_block,
 	    TP_PROTO(struct inode *inode,
-		     unsigned long ino,
+		     u64 ino,
 		     unsigned long blkoff,
 		     enum req_op mode),
 
 	    TP_ARGS(inode, ino, blkoff, mode),
 
 	    TP_STRUCT__entry(
+		    __field(u64, ino)
 		    __field(struct inode *, inode)
-		    __field(unsigned long, ino)
 		    __field(unsigned long, blkoff)
 		    /*
 		     * Use field_struct() to avoid is_signed_type() on the
@@ -214,7 +214,7 @@ TRACE_EVENT(nilfs2_mdt_submit_block,
 		    __entry->mode = mode;
 		    ),
 
-	    TP_printk("inode = %p ino = %lu blkoff = %lu mode = %x",
+	    TP_printk("inode = %p ino = %llu blkoff = %lu mode = %x",
 		      __entry->inode,
 		      __entry->ino,
 		      __entry->blkoff,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
