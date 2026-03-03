Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F6AEDA6B9
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUuVGf9jf8UkYxe8yD5AIyU3RD3pBRVHDQ9tD1jzXGE=; b=RngXalVgrQKZ18
	btefC2sxdP7d+r62Bo99XwBXYf9xjbmL1eCn8Vv50EKzaLgdab7wvMN2wDEaiy7LGtPEhv9NyFRXq
	rigvoFeJrs4DI1YdSOoV6TwMbazjPv038NJB7kxNrzavEZWvDC2Q5lR6JTAbWmDz1SQPOjkwxBv5/
	Zmo7dJfmo4R43jmPnB8eZoOAw9F0oHp99sZQ4X6u1QRDSL9PBbZ2a37uC9VYlaQpM8Y7npyIb5fCh
	bGMKELRcaFF7eHk96ct9kmnu9hZJCjDksfHjHnxPHFc1bgOMUyv3aB2SivAgTkk+NRiQrN+ygUBE4
	EmCNfJbH3/wJ2Q8R/Gqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTOe-0000000Fdce-214b;
	Tue, 03 Mar 2026 17:19:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTOc-0000000FdcC-2yN5;
	Tue, 03 Mar 2026 17:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tao3d1V6YUWjQGbciieZF7tZIWM4RPJQYZqAieQGxVw=; b=Dwtx7drrLMoXnL7AZ4mDDb+Dr1
	pHpHIG972dhLGyxzFcAQx+NudbFIcurMxKVq97sQTr1lhz5PGW3hew2GVT9QoeCbheZzl/O82STLK
	vg8zfOueGsejINU32tZqwfKdGcdQbjZuH93Vwz2pTaPZIsUFcvRc5p4xprv+YZmZa41AUiirVclTo
	qxIIHl6PoQ8QMH4z3vU3H3gUflIy+NEXbLJEmvYHKdxOjT+/NqRvilsvA6ZnM/G8lcC5UPT2gBhSW
	z8jZyRc6CCB7fazc1OBmrw5oOtDAXe2WSm0mby/ncmsCi8bS24bckEVTfiMaEfIq2JCGnv34ZS2p+
	wh5wZg3A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTOA-0000000BrGK-29fG;
	Tue, 03 Mar 2026 17:18:30 +0000
Date: Tue, 3 Mar 2026 17:18:30 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, "Darrick J. Wong" <djwong@kernel.org>, Theodore Tso <tytso@mit.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Eric Biggers <ebiggers@kernel.org>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, Joerg Reuter <jreuter@yaina.de>,
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@telemann.coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org, audit@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, linux-sctp@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 001/110] vfs: introduce kino_t typedef and PRIino
 format macro
Message-ID: <aacX5metux-C_xBw@casper.infradead.org>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-1-e5388800dae0@kernel.org>
 <20260303012556.GA6520@macsyma-wired.lan>
 <20260303042546.GF13868@frogsfrogsfrogs>
 <33228005140684201de2ca0c157441d3b6a06413.camel@kernel.org>
 <aabkBadGzo7IZpSU@infradead.org>
 <19e4e79a59dcfc4c61c8cf263af345d0d7026fc8.camel@kernel.org>
 <aabpPQxCTweoTp8Z@infradead.org>
 <1310fc5c09cce52ec00344b936275fe584c88dea.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1310fc5c09cce52ec00344b936275fe584c88dea.camel@kernel.org>
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

On Tue, Mar 03, 2026 at 09:19:42AM -0500, Jeff Layton wrote:
> There are really only three options here:
> 
> 1/ Do (almost) all of the changes in one giant patch
> 
> 2/ Accept that the build may break during the interim stages
> 
> 3/ This series: using a typedef and macro to work around the breakage
> until the type can be changed, at the expense of some extra churn in
> the codebase

4/ Don't do anything, drop the patch series (I'm not in favour of this,
but it is an option)

5/ Do the conversion(s) _once_ per filesystem.  Here's one way to do
it:

-	unsigned long           i_ino;
+	union {
+		u64 i_ino64;
+		struct {
+#if defined(CONFIG_64BIT)
+			unsigned long i_ino;
+#elif defined(CONFIG_CPU_BIG_ENDIAN)
+			unsigned long i_ino;
+			unsigned long i_ino_pad;
+#else
+			unsigned long i_ino_pad;
+			unsigned long i_ino;
+#endif
+		};
+	};

[...]
#define i_ino(inode)	(inode)->i_ino64

So that's patch one.  All plain references to i_ino access the lower
bits of i_ino64, so everything will continue to work as it does today.

Once you've got the VFS core in shape, you can convert filesystems one
at a time to use i_ino(inode).  Once you're done you can delete the
scaffolding from the core and go back to calling i_ino64 just i_ino.
You could delete the i_ino() uses from filesystems at that point, but
why bother?

I'm sure there are other ways to do it, this is just the one I came up
with.  But for the love of god stop spamming hundreds of people on the
cc of this patchset.  In fact, take me off for next time -- I get each
one of these fucking patches four times.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
