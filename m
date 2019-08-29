Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE96C3A59F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 04:38:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2C722CF5
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 04:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NRBCa+zU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ad4yH+QK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E2C722CF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4vWLoTov4dXhdv6qv0FbQZfGMiUqISofyTxg+FnFPfY=; b=NRBCa+zU1hhS6i
	zqJOFDZMNahuQtCKeseXFF8dLclxjWSHYsEtRZy8kEbmKbJtJCDjG1KZjerUcoC3I2xtqCO+5yjxH
	IU24tP9CF+YisJbFpyEB7Jb5Rp4IySwtkDcrsRuGKyiuLCL0LPpTZwfYrKE1tLVR1BBqDehwJkQ7n
	wMhuEIG6gcWlmucqPfC6qmLlb0Mna54UpnrXrrKp6iPl8odpG8HQ1mVMr5Xi1DfooC/TdyZ4mn4K2
	UR4kQ3Y55KXCsb8CVnWTufg0S5Qq1cg//rplMP3XVKlJU8WOXEWWENmmSC/JzW9Hovkl4R0lE1MGx
	EYHvTX+PMtuG5isQysCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3CCS-0002dG-AX; Thu, 29 Aug 2019 04:38:20 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3CCP-0002cl-1V
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 04:38:18 +0000
Received: by mail-io1-xd44.google.com with SMTP id x4so4124149iog.13
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2019 21:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ph2TDX0t8VD1IALiSLotxXSH3Hc7LzlyzCWrbeW7KEM=;
 b=Ad4yH+QK5ygrblSOoyxD0tbvjV1ue9nzyr8wf1rjkD8nTQtAUxNZJKQHZoLxHgRk2B
 TEAoeI524dxNfHCqzBGvK8fuiw+bAamqjZzPjGzpO4q1JaVUUDD9ax94jSI09AwQIEcQ
 WVE9Kk/mYHro0Fu7Hu8WrE90Mi3tlpvW3ZwrAo0k7GoHIwwQC60Y8Y9lhWHQ2x0r9tnz
 jSaqwnIO0Z4sBYO3fglWtXsmzhw2k5YPG8bbqxvl5SmNtQPBiiKKdIu9pdlVPfuYLf7e
 1REmXyzixgNc7NV2Y7fqiRSpx+wDxIJjwki+5Yj33Yn9bHcHOqns04S9V/iNntVln4qf
 JFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ph2TDX0t8VD1IALiSLotxXSH3Hc7LzlyzCWrbeW7KEM=;
 b=QhfbS642Lu7DqWJV4KZLZdyw45s/q7vXwqSaGGcrgM7pypJKqPZ1O4LOGavqE1QUf6
 5lGJsyBIp56gaHrn5pWZNKnROlf0Qxs+1MAVko5L6KFKi10A6eJt1r4dtkJrkKtDaTqe
 XvZupaLCVDSPfZ8EjPfyMd4pMKL49EizRRoUXNNbQHvxA+i/g25YnX07zJgbnL62gXvg
 4jCbo6GVqth83ThxYKQjx+hrCLO2yr+GBmx4E85x1gy0gRoaaPdQhSRFFFMAxgXp+LvP
 b32ZUAmr+Xh6L93tePnWdkfLIHPnB1QTtHfGE6uu8U120vzZX+24ZNBixD+SH2ZYaOtt
 4LnQ==
X-Gm-Message-State: APjAAAX8m3QkudRthdLhnDjx2Jy8LFS66Yzn/+4LREBWcp1KuK0yMEvn
 0nNLT1v8ee11MjaUUYJKAJA8FI/RtjMXDGwDqGs=
X-Google-Smtp-Source: APXvYqxGcrhx04qhhiztO9h7tEg9eaTJ/omReFf3uThdfVv9L98okzDLYj6+TF/LNCwbU0Ps8hWzB+I1empnbI4Uys0=
X-Received: by 2002:a02:23cc:: with SMTP id u195mr8401832jau.136.1567053495481; 
 Wed, 28 Aug 2019 21:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
In-Reply-To: <20190829041132.26677-1-deepa.kernel@gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Wed, 28 Aug 2019 21:38:03 -0700
Message-ID: <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
To: Alexander Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_213817_084012_91DE0849 
X-CRM114-Status: GOOD (  16.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Latchesar Ionkov <lucho@ionkov.net>, martin@omnibond.com,
 jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>,
 al@alarsen.net, yuchao0@huawei.com, Bob Copeland <me@bobcopeland.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz,
 stoph Hellwig <hch@lst.de>, nico@fluxnic.net,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>,
 Anton Vorontsov <anton@enomsg.org>, linux@armlinux.org.uk,
 codalist@coda.cs.cmu.edu, Christoph Hellwig <hch@infradead.org>,
 coda@cs.cmu.edu, V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Kees Cook <keescook@chromium.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, Jan Kara <jack@suse.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Joel Becker <jlbec@evilplan.org>, aivazian.tigran@gmail.com,
 phillip@squashfs.org.uk, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 trond.myklebust@hammerspace.com, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 luisbg@kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-ntfs-dev@lists.sourceforge.net, Greg KH <gregkh@linuxfoundation.org>,
 linux-karma-devel@lists.sourceforge.net, jlayton@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding the others who were on original cc, just in case.
- Deepa

On Wed, Aug 28, 2019 at 9:12 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> Hi Al, Arnd,
>
> This is a pull request for filling in min and max timestamps for filesystems.
> I've added all the acks, and dropped the adfs patch. That will be merged through
> Russell's tree.
>
> Thanks,
> Deepa
>
> The following changes since commit 5d18cb62218608a1388858880ad3ec76d6cb0d3b:
>
>   Add linux-next specific files for 20190828 (2019-08-28 19:59:14 +1000)
>
> are available in the Git repository at:
>
>   https://github.com/deepa-hub/vfs limits
>
> for you to fetch changes up to f0f216afa4c7e4dee9121fde52ccf57f76119188:
>
>   isofs: Initialize filesystem timestamp ranges (2019-08-28 19:19:36 -0700)
>
> ----------------------------------------------------------------
> Deepa Dinamani (19):
>       vfs: Add file timestamp range support
>       vfs: Add timestamp_truncate() api
>       timestamp_truncate: Replace users of timespec64_trunc
>       mount: Add mount warning for impending timestamp expiry
>       utimes: Clamp the timestamps before update
>       fs: Fill in max and min timestamps in superblock
>       9p: Fill min and max timestamps in sb
>       ext4: Initialize timestamps limits
>       fs: nfs: Initialize filesystem timestamp ranges
>       fs: cifs: Initialize filesystem timestamp ranges
>       fs: fat: Initialize filesystem timestamp ranges
>       fs: affs: Initialize filesystem timestamp ranges
>       fs: sysv: Initialize filesystem timestamp ranges
>       fs: ceph: Initialize filesystem timestamp ranges
>       fs: orangefs: Initialize filesystem timestamp ranges
>       fs: hpfs: Initialize filesystem timestamp ranges
>       fs: omfs: Initialize filesystem timestamp ranges
>       pstore: fs superblock limits
>       isofs: Initialize filesystem timestamp ranges
>
>  fs/9p/vfs_super.c        |  6 +++++-
>  fs/affs/amigaffs.c       |  2 +-
>  fs/affs/amigaffs.h       |  3 +++
>  fs/affs/inode.c          |  4 ++--
>  fs/affs/super.c          |  4 ++++
>  fs/attr.c                | 21 ++++++++++++---------
>  fs/befs/linuxvfs.c       |  2 ++
>  fs/bfs/inode.c           |  2 ++
>  fs/ceph/super.c          |  2 ++
>  fs/cifs/cifsfs.c         | 22 ++++++++++++++++++++++
>  fs/cifs/netmisc.c        | 14 +++++++-------
>  fs/coda/inode.c          |  3 +++
>  fs/configfs/inode.c      | 12 ++++++------
>  fs/cramfs/inode.c        |  2 ++
>  fs/efs/super.c           |  2 ++
>  fs/ext2/super.c          |  2 ++
>  fs/ext4/ext4.h           | 10 +++++++++-
>  fs/ext4/super.c          | 17 +++++++++++++++--
>  fs/f2fs/file.c           | 21 ++++++++++++---------
>  fs/fat/inode.c           | 12 ++++++++++++
>  fs/freevxfs/vxfs_super.c |  2 ++
>  fs/hpfs/hpfs_fn.h        |  6 ++----
>  fs/hpfs/super.c          |  2 ++
>  fs/inode.c               | 33 ++++++++++++++++++++++++++++++++-
>  fs/isofs/inode.c         |  7 +++++++
>  fs/jffs2/fs.c            |  3 +++
>  fs/jfs/super.c           |  2 ++
>  fs/kernfs/inode.c        |  7 +++----
>  fs/minix/inode.c         |  2 ++
>  fs/namespace.c           | 33 ++++++++++++++++++++++++++++++++-
>  fs/nfs/super.c           | 20 +++++++++++++++++++-
>  fs/ntfs/inode.c          | 21 ++++++++++++---------
>  fs/omfs/inode.c          |  4 ++++
>  fs/orangefs/super.c      |  2 ++
>  fs/pstore/ram.c          |  2 ++
>  fs/qnx4/inode.c          |  2 ++
>  fs/qnx6/inode.c          |  2 ++
>  fs/reiserfs/super.c      |  3 +++
>  fs/romfs/super.c         |  2 ++
>  fs/squashfs/super.c      |  2 ++
>  fs/super.c               |  2 ++
>  fs/sysv/super.c          |  5 ++++-
>  fs/ubifs/file.c          | 21 ++++++++++++---------
>  fs/ufs/super.c           |  7 +++++++
>  fs/utimes.c              |  6 ++----
>  fs/xfs/xfs_super.c       |  2 ++
>  include/linux/fs.h       |  5 +++++
>  include/linux/time64.h   |  2 ++
>  48 files changed, 298 insertions(+), 72 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
