Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB4DFD9E10
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 21:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aH3irk/nnXxgOmITa5P42+g4ig8ff20O4Q3Wsm+04DU=; b=25cgCJQAmU5/e+Xy3WenoPB2hh
	ePK3nl/YKvlHdshIr1u90y/VxubXQcwKM/5RB3NA8oYCWR2OdFSSnHpFQ4bPInTYRdLXatlQvPaeq
	hVyMy+8p/MwSJel5V39eGa28OGZBlsjZTjVR9z3QLXCa5KlQGJ7Qh63jK6y/4s4TC84sDSXSJJb3a
	dpbdEzM8ghSjmG5Ey10T4E5OFKag28PiKkHKsdupnuv/EQIhwMih6fGlWK1BtlP/kvtJUj8OSFh+p
	yoj+2YYZqkriM8zduKYJWht3+HofkYBE7ehPq5fLpknMxgdx1RSlYWLXuC9FAmcpQA5KclXFvOlMw
	TQvPxeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviYw-00000007CKA-205D;
	Thu, 26 Feb 2026 21:06:22 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviYt-00000007CIa-1pO1;
	Thu, 26 Feb 2026 21:06:21 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8F3C528F9E9;
	Thu, 26 Feb 2026 22:06:12 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id iWyiIX5CRUJd; Thu, 26 Feb 2026 22:06:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9FBFB29859D;
	Thu, 26 Feb 2026 22:06:10 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cwbgIi8mwQ6r; Thu, 26 Feb 2026 22:06:09 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1868E298580;
	Thu, 26 Feb 2026 22:06:08 +0100 (CET)
Date: Thu, 26 Feb 2026 22:06:07 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Jeff Layton <jlayton@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, mhiramat <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, dan j williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, tytso <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, anna <anna@kernel.org>, chuck lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, raven <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, chengzhihao1 <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, sumit semwal <sumit.semwal@linaro.org>, edumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, pabeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, davem <davem@davemloft.net>, kuba <kuba@kernel.org>, Simon Horman <horms@kernel.org>, oleg <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, mingo <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
 nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm <linux-mm@kvack.org>, netfs@lists.linux.dev, linux-ext4 <linux-ext4@vger.kernel.org>, linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>, linux-nfs <linux-nfs@vger.kernel.org>, linux-cifs <linux-cifs@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>, linux-nilfs <linux-nilfs@vger.kernel.org>, v9fs <v9fs@lists.linux.dev>, linux-afs <linux-afs@lists.infradead.org>, autofs@vger.kernel.org, ceph-devel <ceph-devel@vger.kernel.org>, codalist@coda.cs.cmu.edu, ecryptfs <ecryptfs@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, jfs-discussion <jfs-discussion@lists.sourceforge.net>, ntfs3 <ntfs3@lists.linux.dev>, ocfs2-devel <ocfs2-devel@lists.linux.dev>, devel <devel@lists.orangefs.org>, linux-unionfs <linux-unionfs@vger.kernel.org>, apparmor@lists.ubuntu.com, LSM <linux-security-module@vger.kernel.org>, linux-integrity <linux-integrity@vger.kernel.org>, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, DRI mailing list <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev <netdev@vger.kernel.org>, linux-perf-users@vger.kernel.org, linux-fscrypt <linux-fscrypt@vger.kernel.org>, linux-xfs <linux-xfs@vger.kernel.org>, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org
Message-ID: <909001762.1963.1772139967060.JavaMail.zimbra@nod.at>
In-Reply-To: <20260226-iino-u64-v1-47-ccceff366db9@kernel.org>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org> <20260226-iino-u64-v1-47-ccceff366db9@kernel.org>
Subject: Re: [PATCH 47/61] ubifs: update format strings for u64 i_ino
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF147 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: update format strings for u64 i_ino
Thread-Index: W1YwJFGUiVxHsVs+FtVDAklXBDhaRQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_130619_760558_192A9145 
X-CRM114-Status: GOOD (  10.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkplZmYgTGF5dG9uIiA8amxh
eXRvbkBrZXJuZWwub3JnPgo+IFVwZGF0ZSBmb3JtYXQgc3RyaW5ncyBhbmQgbG9jYWwgdmFyaWFi
bGUgdHlwZXMgaW4gdWJpZnMgZm9yIHRoZQo+IGlfaW5vIHR5cGUgY2hhbmdlIGZyb20gdW5zaWdu
ZWQgbG9uZyB0byB1NjQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25A
a2VybmVsLm9yZz4KPiAtLS0KPiBmcy91Ymlmcy9kZWJ1Zy5jICAgfCAgOCArKysrLS0tLQo+IGZz
L3ViaWZzL2Rpci5jICAgICB8IDI4ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiBmcy91
Ymlmcy9maWxlLmMgICAgfCAyOCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gZnMvdWJp
ZnMvam91cm5hbC5jIHwgIDYgKysrLS0tCj4gZnMvdWJpZnMvc3VwZXIuYyAgIHwgMTYgKysrKysr
KystLS0tLS0tLQo+IGZzL3ViaWZzL3RuYy5jICAgICB8ICA0ICsrLS0KPiBmcy91Ymlmcy94YXR0
ci5jICAgfCAxNCArKysrKysrLS0tLS0tLQo+IDcgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9u
cygrKSwgNTIgZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNo
YXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
