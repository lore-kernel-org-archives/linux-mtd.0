Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA89FD9E1B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 22:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imVyEx6HoReRKLEOpORgxAwrT8QSjqznGaKXw3j96/8=; b=1oYEDDZ/Qh+x18
	czXdZODVgMOkh2F7aLTj5TpYbUrWSdIxlaNEfUJq0glSqCwgmioFlqzD3uVpu6CleVKmhO07QzgAr
	CNe+iAJO9yBdwUw7MoLlNknxTA2Cqs6+uwCtT+67oH1rtEtWGRccLiRzAz6Ot2FUtV/7RMtI+ZD67
	stP7Y/CyQsTKlHrNrIB7DeCDfymbugiXLZN3aBUDCUDyqZp0Lm16HqGXOCK/bA/OULlPW+ZSLejF3
	w7cH4CRPmBBYEKZHCaj0TPYVB6IgaNAN2e/2xAGXM5CuLfrrnh6rREaFG4aAPJXgarerjw+T4r8YM
	h7pdD3vqkdTdTLm0hRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvkDI-00000007KNk-3Fr9;
	Thu, 26 Feb 2026 22:52:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvkDH-00000007KNV-0a3g;
	Thu, 26 Feb 2026 22:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC9B3600AA;
	Thu, 26 Feb 2026 22:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F89BC116C6;
	Thu, 26 Feb 2026 22:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772146325;
	bh=pajDmz5yp010hi/+QMkuQbHFrnu7ZcaVGRjn0wxtp+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EWJc2Uz6oM/U5lpFUSm3GfVgR4cldZrHPbo/JbNPiCo7a9Qet3NPwP5d/g2F9Z/eY
	 PULzCCLSyJn39yRAPsdhfy+RdiF52vi9KQubOdZlNMxkN2YEKcSZEHQQHEwBCv8UDq
	 aUBFV4GAaYKK9ceshTeB/l1Olc+NGJM3RsiAcavnfuqg+7yXrgam32eowwkzRFvJiO
	 netZZv71AIv/PMFlHfmi9NAn7OA57Ds8pdoFOxBLCi6KvwtN5EM8l5UroXTz7+zS0y
	 Jdi0ImLclB5JNz4xYwfY9d0QUSMNEpHwhSScYgT0H9rCBdMCBOXzjYqnr0oZ0b2JRV
	 uc6mB11PL9OGw==
Message-ID: <104bcaf3-42ba-4eec-98c1-fe3afa7fcc41@kernel.org>
Date: Fri, 27 Feb 2026 07:51:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/61] trace: update VFS-layer trace events for u64 i_ino
To: Jeff Layton <jlayton@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>
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
 linux-x25@vger.kernel.org
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-3-ccceff366db9@kernel.org>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260226-iino-u64-v1-3-ccceff366db9@kernel.org>
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

On 2/27/26 00:55, Jeff Layton wrote:
> Update trace event definitions in VFS-layer trace headers to use u64
> instead of ino_t/unsigned long for inode number fields, and change
> format strings from %lu/%lx to %llu/%llx to match.
> 
> This is needed because i_ino is now u64. Changing trace event field
> types changes the binary trace format, but the self-describing format
> metadata handles this transparently for modern trace-cmd and perf.
> 
> Files updated:
>   - cachefiles.h, filelock.h, filemap.h, fs_dax.h, fsverity.h,
>     hugetlbfs.h, netfs.h, readahead.h, timestamp.h, writeback.h
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

[...]

> @@ -726,7 +726,7 @@ TRACE_EVENT(balance_dirty_pages,
>  		  __entry->pause,	/* ms */
>  		  __entry->period,	/* ms */
>  		  __entry->think,	/* ms */
> -		  (unsigned long)__entry->cgroup_ino
> +		  (unsigned long long)__entry->cgroup_ino

Do we really need this cast here ? (same comment for the following events).

Other than this, this looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
