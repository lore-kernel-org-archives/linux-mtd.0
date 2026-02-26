Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A34FD8FD0
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5PWS/eb/PsPt5iEY1fpLd9hkfq2hagTduNVvcPke90=; b=TmrNip67LvhbcN
	YOxKphuDcFehDnZQSgtayFix1g+y+5MfAqu8kspSFxZCqytps19qsAgeJPt91vXEVsLVeGqb2FKki
	v5wr5j4mt1mk87Oj6XvHgUK2C9qwUyEEt2NsqVWg2SUk6UlRNNZCpIFAfqefO6rmx6yja9jdk0Fb9
	SyDwbwSPbHYC68T+/WVPQ56bn6KCqZ3Yok2Rxbq6Qqc7ZFMcgQXBc4U+0O72lAU2s5ENtpRt3FIbN
	fkiH6fdfXLuAE1Q6m8bGFGRH5yeo0EAUT1SsGWsdhTwQPVg/DU//uVD+Uop4gW4gLj/DOb0emiW6R
	UiDUqH39fnJYSlPPxPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdtS-00000006gRW-381V;
	Thu, 26 Feb 2026 16:07:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdtR-00000006gQ3-0hFd;
	Thu, 26 Feb 2026 16:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LFIXgRT3H5Z4anGhAZVgpZ1TO17Qe6unr61kib8Wmyw=; b=TXagTH9SjahpKSY/vOog+XUsmk
	nhH2XQkgvkBX6R7/+u33ZFG5IrYw/asEscVcHFYOL4I2H+tdNymPaGWWG+cEU8KpqDDd4toOC2oqi
	eLDrNXh8PsX9rahqq6ttEVwiPhhkwNsngyQlVJxqCq8+CBJXcbbTCxrGsdgyJlQ5DWNvksG/SgCPn
	+ABjT6B3MkzqNE2NKTeBIert5YDVQNLU15IH93hKs0NKBLWeEVLkbJYsd+yKiMYtMKpxW9nCcbMU0
	7COr73mArRW7pS+cSvpwacLVcBg+QfkzYpZqQn1wel67MC3K4xPsZLbxWfDQSbJavGnBFQ6SvKky3
	rNKNKtwg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdtO-0000000BQgL-0w5G;
	Thu, 26 Feb 2026 16:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1EE840301;
	Thu, 26 Feb 2026 16:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546B1C2BCAF;
	Thu, 26 Feb 2026 16:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772122028;
	bh=7K/FmEuDwTdjSg9C4rAKy27XY8EaYM64Jbqxib0imtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MTzuK409usSF/cCRJwKXtZdkSE+7pHi8yAZ9UZ76L5NsHfF5ERt7nC6cuK6PyEV6L
	 wuPk+HwpV4SYjH4tCBsNgiI/678QKspeymc5VXcjQXnq70cN/JUrG+t75ZyU/HFl3v
	 IJlI42/zJZkvI9VmjeDxiHpkaLAsKRxdoGmJ5kZFm2BOFKtZP0fiIPawonOspYjOYh
	 ElsV6nhu1rfvM7+lq9jzj9SzP31ih3vT+/mK4TWTONAfGnk4jDs0Z4HSGmkmhX5MPm
	 l6O6P6KmcK4u8AF0coLoixJNbAxHMZED6GQQ46ntc5J7spZJa0dE7vmlt628I3T4XT
	 +I1+GhJYaCqkQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:54 -0500
Subject: [PATCH 52/61] drm/amdgpu: update for u64 i_ino
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-52-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=7K/FmEuDwTdjSg9C4rAKy27XY8EaYM64Jbqxib0imtg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0RH0BlVgd1hc2ARIapdMesOcS14opM003NR
 0erAY72K1uJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtEQAKCRAADmhBGVaC
 FVkrEACFYDnqY+DXVKQGR0Z58808QWgMd5pKPx2DTRKvHR17M3Hp++u6sixkYKtqtN5Vgtjtves
 COCxrY5lB6ULDLg/YhlBrempWhSvAlbQnsrmNV1Vz4kpbHhknIPakEgxTz1NH2lBS3Gh2z6yTkh
 vq4UOlQjzeLuBVa8St9lXEr6JyYIMYlccfZ6wvlGG32nzar5ePPSRk22lJixkBhqiK2zYyW/qza
 dQMjurfZLFcy0HxoBnoy14C2/TgwvEf+hSykLI5YwCnOfyZnZ9ymGxexwtDoTn5ew7qLwuO0+Yb
 13buCK6sXK6vZDcJqU1pObj+2Q+OhPftmJoGVBwYZhvyb5B7NJsgsFllJ7AvzW519vIYgF/CZ/j
 vwmDwyGT8qiQbeCAeWlK/t7xRN/FFYxTNDN5/aAATKmOCGE/v1TjgrV3Aha7It/M1Yvc/Gp4hTe
 gJdO5OQEF2tRaq/FqrRPOJRWPPqruBbOfz7WyLHAgVBSFcIzU8sl3p9GXiTZP2TYRcLpRQ3m33e
 yhVzI4bWSiqG+WeMlfMvzndN98pBgwCnDN/d5Zr09Jy777jlU4bqCdVDj/L8ryxSWfU7CXDVqUO
 g1hF/vxaNXaMtE4O62LJCjZI/tDh7Uw/IvtWG1FQHdgeWA/PJNtmZnA7jY6iekxKbYCjsmTkZ7k
 YT8fFRkl5728AJw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_160710_622968_43036EE8 
X-CRM114-Status: GOOD (  12.85  )
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

Update %lu to %llu in drm_info() calls that print inode->i_ino, since
i_ino is now u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 1fb95640069667bf731df05990b57c6e0a0d2c16..aaa8cdc122c49ebf0b5b6c55edb3a1db2a4fd710 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1676,9 +1676,9 @@ u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *bo, struct seq_file *m)
 	attachment = READ_ONCE(bo->tbo.base.import_attach);
 
 	if (attachment)
-		seq_printf(m, " imported from ino:%lu", file_inode(dma_buf->file)->i_ino);
+		seq_printf(m, " imported from ino:%llu", file_inode(dma_buf->file)->i_ino);
 	else if (dma_buf)
-		seq_printf(m, " exported as ino:%lu", file_inode(dma_buf->file)->i_ino);
+		seq_printf(m, " exported as ino:%llu", file_inode(dma_buf->file)->i_ino);
 
 	amdgpu_bo_print_flag(m, bo, CPU_ACCESS_REQUIRED);
 	amdgpu_bo_print_flag(m, bo, NO_CPU_ACCESS);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
