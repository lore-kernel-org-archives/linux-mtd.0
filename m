Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EE7C71136
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jun 2025 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDVgBXSH303QZ6NsT9cUaIPe5/XQ/T3fvIe7l+FOOXA=; b=Y0ATbA4wawNLh8
	4sKxrB6bqTPA8EMAppI7o0o8CbBtPMb7UU3gEGWpvaYqqCuLweFpO40icIahMl0GoDBPrZH0JglRk
	85Z4w9bBe9uEyASOQ3HMv5aSdU4gP+iGPdpgmDrXVbLmiRh7AXlTzJFtK52fKwcusMbqdP1PqBjV3
	26lIqy5MBKTGpIpxvGc6S3yeRnqqwFMV9IUSU6csgfTm7drWA6H9Xef9HMSXfF7AtDxyMpk6l5Ao3
	iLyfs68PQSk3rrfdgO1I6pYDcv5v8V7oYuRHkVRJBlIFWqxsBDPS3L2tLjlv3d7ky9D/5P4vph+Mf
	sTp7qXS9XQCExx3hbcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRG0u-00000005QW7-30r5;
	Mon, 16 Jun 2025 20:01:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRG0t-00000005QVv-3Rwy;
	Mon, 16 Jun 2025 20:01:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87714615F2;
	Mon, 16 Jun 2025 20:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC77AC4CEEA;
	Mon, 16 Jun 2025 20:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750104061;
	bh=63g4BFyDRQ9zPpgQi+aKRKc8QZqr403zshqDeyAnLYU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=MIbLmxFkQvDlWahGwOzhitZt0cSzoXdhWUHu8g8OkqZLAupve4SlpvOS2uS1ZEWmj
	 UwQ2s8yA8tAesX44zSYXdwSfJqH8TXAO82zH05g97Z/1UOjr1700+pmtNnzQBgsvl8
	 4ex7UC260hPMrrevOuoNx+ItcoPEWmxAHO8kKS0LskJGXsmB+Lw+lBdLI7AmEbxTyi
	 Xaylvf43oG7bbuZKo2MFBbk3fvcCNc7E3lsmsbzOnTEhXlMNNdjS9szSMRmncYZuuz
	 cV+XE+08Pnq5bgJ/0F99pB6Ea9gbVg9z6nnYTpH3+D1YHFBxVujigA5wdVTvZ/xroj
	 anLaWnk5pcMew==
Date: Mon, 16 Jun 2025 13:01:00 -0700
From: Kees Cook <kees@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
CC: "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jens Axboe <axboe@kernel.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Benjamin LaHaise <bcrl@kvack.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Amir Goldstein <amir73il@gmail.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Yangtao Li <frank.li@vivo.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Bob Copeland <me@bobcopeland.com>,
 Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@manguebit.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>, Carlos Maiolino <cem@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-aio@kvack.org,
 linux-unionfs@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-mm@kvack.org, linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-um@lists.infradead.org,
 linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, nvdimm@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_03/10=5D_fs=3A_consistently_u?=
 =?US-ASCII?Q?se_file=5Fhas=5Fvalid=5Fmmap=5Fhooks=28=29_helper?=
User-Agent: K-9 Mail for Android
In-Reply-To: <b68145b609532e62bab603dd9686faa6562046ec.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com> <b68145b609532e62bab603dd9686faa6562046ec.1750099179.git.lorenzo.stoakes@oracle.com>
Message-ID: <E0284B4E-A675-4855-87C8-CD13979710D6@kernel.org>
MIME-Version: 1.0
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



On June 16, 2025 12:33:22 PM PDT, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
>callback"), the f_op->mmap() hook has been deprecated in favour of
>f_op->mmap_prepare().
>
>Additionally, commit bb666b7c2707 ("mm: add mmap_prepare() compatibility
>layer for nested file systems") permits the use of the .mmap_prepare() hook
>even in nested filesystems like overlayfs.
>
>There are a number of places where we check only for f_op->mmap - this is
>incorrect now mmap_prepare exists, so update all of these to use the
>general helper file_has_valid_mmap_hooks().
>
>Most notably, this updates the elf logic to allow for the ability to
>execute binaries on filesystems which have the .mmap_prepare hook, but
>additionally we update nested filesystems.
>
>Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>---
> fs/backing-file.c     | 2 +-
> fs/binfmt_elf.c       | 4 ++--
> fs/binfmt_elf_fdpic.c | 2 +-

Thanks for the refactoring!

Acked-by: Kees Cook<kees@kernel.org>


-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
