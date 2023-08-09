Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DCCC04A6A
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VSPDb2oWhVcHmWoQQ4pkfE3iitKL+UpE6oqt9Ysnng=; b=pMj/AJVnP776k0
	+F3IC+CrBiVlJ3CQTv4adQmWR1bM+lgA0AWez1D2k/U8WecwU78U1tJr5xyI9ZEKluSLSmnnIEWID
	/ymFl7hdkgnjjv0y2u0sBhRhuw56pLKi8WJuvJU+gcCmikzZSQZ8pQeyI6c0vTh76uoTCCLj0isCW
	eue8m4O8Ng6Fu6KzYywtGueaGw6OvJ85QxSxF+hyWs8m2S7R7RVCtGy811VZit93ypYUWA36GFdWy
	SiWyl9FY5wisoq1cEb6Wdl9v/3kebcXc1YFXQ8Un+BplPI84aNjKzGLELYqgucx7HFgqQk3LQA7xr
	rjXE9I67+YbyH22ykd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTiMC-004tuX-2r;
	Wed, 09 Aug 2023 12:32:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTiMA-004tt3-0P;
	Wed, 09 Aug 2023 12:32:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 992E06389C;
	Wed,  9 Aug 2023 12:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4887C433C8;
	Wed,  9 Aug 2023 12:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691584325;
	bh=/49df41xVNblH0My6Rm524Eu9/9yj5IuCd5Ahg49nqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xo6zqoH4tLtpgIRXDvauxCrT9KsgoYcbpb7Q39OdqNhaxst2+pfymQmNTOiDSdYxZ
	 W4BcOUyM7UH4fU7RUavDiPiPYka0t2THfLgZ/sPqj91yNfPhrZU50FqUyuH9VVZDN8
	 UNseWaM1PhSJla0ABVoW32qrrE3Fj/MBlpMY6czSB3W+5SSM8Xhf7kREP8isSlgAPq
	 mRtsepkXMEWgN2zHA9V6nGaEGA60y563M3sOwdLemWTAc2vf9fjCoUS3ya4haU8KNM
	 Rum+AKrje1glVe09hvcM4W9V4PhuNU1t94pbtKl8Th3CMBiN3Fjj5ODwwQE2LnUyec
	 5payJ6yoVc//Q==
Date: Wed, 9 Aug 2023 14:31:48 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
	Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v7 08/13] fs: drop the timespec64 argument from
 update_time
Message-ID: <20230809-segeln-pflaumen-460b81bd2d3a@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-8-d1dec143a704@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mgctime-v7-8-d1dec143a704@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_053206_242730_CF4464DB 
X-CRM114-Status: GOOD (  12.69  )
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

On Mon, Aug 07, 2023 at 03:38:39PM -0400, Jeff Layton wrote:
> Now that all of the update_time operations are prepared for it, we can
> drop the timespec64 argument from the update_time operation. Do that and
> remove it from some associated functions like inode_update_time and
> inode_needs_update_time.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/bad_inode.c           |  3 +--
>  fs/btrfs/inode.c         |  3 +--
>  fs/btrfs/volumes.c       |  4 +---
>  fs/fat/fat.h             |  3 +--
>  fs/fat/misc.c            |  2 +-
>  fs/gfs2/inode.c          |  3 +--
>  fs/inode.c               | 30 +++++++++++++-----------------
>  fs/overlayfs/inode.c     |  2 +-
>  fs/overlayfs/overlayfs.h |  2 +-
>  fs/ubifs/file.c          |  3 +--
>  fs/ubifs/ubifs.h         |  2 +-
>  fs/xfs/xfs_iops.c        |  1 -
>  include/linux/fs.h       |  4 ++--

This was missing the conversion of fs/orangefs orangefs_update_time()
causing the build to fail. So at some point kbuild will yell here.
Fwiw, I've fixed that up in-tree.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
