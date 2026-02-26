Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE07FD8FF6
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 18:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyBjH5QhZkVs0mUzfweU87DY2fkqfqnb/6aSpq+QG94=; b=aIf6gVSS9yaICg
	cinNpdKOz338nKrKTmEwyuVyTrNlh31CRgUkiB+RDBiXHx5kR6YqHWDR58xtoEcknmf3u4l9Su14z
	HGBL4qSpiOLdJaRU8JMbjQr2kT9IS4hCzCcG/v2qBho6hWRkNjYUkWzXaUTV/h9uewFBMkPbJQGve
	ktUFcVTPFg0PPzBTNkISxL4NAZLDz11W5UG2TsN7mANGCyKlQ9QJDG75KM8ygcS7Wn8q1TnGcnPzA
	FvIYoN68Z7rIRNLDBvOP19qMGd8dUcRI7ojND1A4lMptWI84lHsQgkWOeJNjOclptRRxZSra0BhEA
	Tgbg1eKRbi0RMFuqbI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfzt-00000006xDA-0Xi7;
	Thu, 26 Feb 2026 18:22:01 +0000
Received: from flow-b1-smtp.messagingengine.com ([202.12.124.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfzp-00000006xCP-43kj;
	Thu, 26 Feb 2026 18:21:59 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 743B91300D33;
	Thu, 26 Feb 2026 13:21:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 26 Feb 2026 13:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1772130108; x=1772137308; bh=Sb7TIp4SU4
	BPQBIvJrSXRMea2RP/1RRExQbDg2XxtlI=; b=mY7eiJfttavlrkoyTDwNdr3mxW
	Yya+Iw3UKA4pbqGLZDUfmlhGyawYCSUPSi+nDDwafb7FT9h6EPhkxS7vBUT895gL
	CnDmfTUJfgc1oaVWjG3Y1iau6+oI+/JO27lXnzxzEYRhz4YfNoox8740SEVZ++4s
	BBTZTkPZOp6HQ9AJfG5KwlTBpXiDSLAB3cve5cgBUIaFbLdz5uyQXSTiIahSPotH
	m1N2lXzy8Iihxh74XQQXYRnr/Dwi8vB0M0bhR+h5i6uX0KteqwydeufZ3dU4SftV
	SzNqqk6Em9aj+vgVUl6JrqNPESwI3T+GdW42gdEHfAduc4Ok2Dp3hiDxwYFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1772130108; x=1772137308; bh=Sb7TIp4SU4BPQBIvJrSXRMea2RP/1RRExQb
	Dg2XxtlI=; b=Wbr6CQoQTXhnL6un9p2QFSFiL0/WjAPgN3Hqu5CGgGnwO4FxUJa
	OmvY30abalkecNj7B20MZ1bpuJh+TEmGBZXYxqyJBkz3A4BfqsOu+C7rioY1Oizq
	Zd2fddNNaIjiw0VbTKEdT9In9NdBg15SPjbI57hQH+5YxYbOH79Eol9nG56xFPk1
	eiKeasIRabf/jG3UfgdumG0CyMN461bE3X6VsQJiOYaNYLPiKx2aS2bwVBQ9AEPA
	IAaqkD2V3JIkfoU0YEHqQLNSdvaJg641+JWTYSnTaSpqnNns0x7Gw5Y6xRmo3qP/
	n4w0XGk8yMxS7HR7c9eOuMmrQsuoDk98T6Q==
X-ME-Sender: <xms:N4-gaUgmHgN8QUT5uqZyoAILKIllC9CSpHs_aa5ApMJdy4TRUZaqng>
    <xme:N4-gaavxRR5FxKAhShwOptBTutlMZMQyOs7VM80awROwu53qi0gUMWnPhMfDsNHbW
    wOQnAjHtKRdhR389hAuinaNTgyNuKGoXkHHRO-W1GYDHnN4n7xWmWg>
X-ME-Received: <xmr:N4-gadynJhJmTysctuxAEb_rcwrEQCCAUTRr_O7lniLd8LGwb0bZ3JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeeijeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epvdehvddttdfhfefhtdfgleehfeeggfdujeeuveekudevkedvgeejtddtfefgleeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvse
    hthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtthhopedugeehpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopehjlhgrhihtohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepsghr
    rghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghksehsuhhsvgdrtg
    iipdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthho
    pehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthhhihgvuh
    druggvshhnohihvghrshesvghffhhitghiohhsrdgtohhmpdhrtghpthhtohepuggrnhdr
    jhdrfihilhhlihgrmhhssehinhhtvghlrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:N4-gaUiDHufb7QDBXtv8zwbIb83B1pheshVwg5ywjfQJEiEhKoV6BA>
    <xmx:N4-gaTYOst36ecB1dZaU-vU3382-pFYnRZALOnlpLPnbipXYkF9QHQ>
    <xmx:N4-gaRZQeIr-umcwUpLlYQH9oqvsne-oBW6cY0EOLVeaTmU3aOAHdA>
    <xmx:N4-gaXWU9S8BXIqIGWB3xu1aNy8XbCWoZVjyGjttFvAIRGT1xRapxw>
    <xmx:PI-gaZ752oPELps33je3r6u6yggqAG8mNBxGDV8jZFYtOdWW7-_mYAVV>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Feb 2026 13:21:33 -0500 (EST)
Date: Thu, 26 Feb 2026 12:21:22 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>,	Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>,	Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>,	Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>,	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,	Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>,	Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>,	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>,	Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>,	Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,	Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>,	Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>,	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>,	Martin Schiller <ms@dev.tdt.de>, linux-fsdevel@vger.kernel.org,	linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,	nvdimm@lists.linux.dev, fsverity@lists.linux.dev,	linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org
Subject: Re: [PATCH 28/61] ecryptfs: update format strings for u64 i_ino
Message-ID: <aaCO9CdY1AP8SM2K@yaupon>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-28-ccceff366db9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226-iino-u64-v1-28-ccceff366db9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_102158_401543_C139179B 
X-CRM114-Status: GOOD (  18.11  )
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

On 2026-02-26 10:55:30, Jeff Layton wrote:
> Update format strings and local variable types in ecryptfs for the
> i_ino type change from unsigned long to u64.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Acked-by: Tyler Hicks <code@tyhicks.com>

Tyler

> ---
>  fs/ecryptfs/crypto.c | 6 +++---
>  fs/ecryptfs/file.c   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 3b59346d68c594fcd7e27bae87849d3e19eff56e..f25c9a49e251a591695a143f64d1a81c5211ec18 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -1313,7 +1313,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
>  		rc = ecryptfs_read_xattr_region(page_virt, ecryptfs_inode);
>  		if (rc) {
>  			printk(KERN_DEBUG "Valid eCryptfs headers not found in "
> -			       "file header region or xattr region, inode %lu\n",
> +			       "file header region or xattr region, inode %llu\n",
>  				ecryptfs_inode->i_ino);
>  			rc = -EINVAL;
>  			goto out;
> @@ -1323,7 +1323,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
>  						ECRYPTFS_DONT_VALIDATE_HEADER_SIZE);
>  		if (rc) {
>  			printk(KERN_DEBUG "Valid eCryptfs headers not found in "
> -			       "file xattr region either, inode %lu\n",
> +			       "file xattr region either, inode %llu\n",
>  				ecryptfs_inode->i_ino);
>  			rc = -EINVAL;
>  		}
> @@ -1335,7 +1335,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
>  			       "crypto metadata only in the extended attribute "
>  			       "region, but eCryptfs was mounted without "
>  			       "xattr support enabled. eCryptfs will not treat "
> -			       "this like an encrypted file, inode %lu\n",
> +			       "this like an encrypted file, inode %llu\n",
>  				ecryptfs_inode->i_ino);
>  			rc = -EINVAL;
>  		}
> diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
> index 7929411837cf5b2e98e1d4288791d2e07c44a4eb..49b0fbe0428a2d202434ce4b5fd7d82d2a63cf58 100644
> --- a/fs/ecryptfs/file.c
> +++ b/fs/ecryptfs/file.c
> @@ -253,7 +253,7 @@ static int ecryptfs_open(struct inode *inode, struct file *file)
>  	if (rc)
>  		goto out_put;
>  	ecryptfs_printk(KERN_DEBUG, "inode w/ addr = [0x%p], i_ino = "
> -			"[0x%.16lx] size: [0x%.16llx]\n", inode, inode->i_ino,
> +			"[0x%.16llx] size: [0x%.16llx]\n", inode, inode->i_ino,
>  			(unsigned long long)i_size_read(inode));
>  	goto out;
>  out_put:
> 
> -- 
> 2.53.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
