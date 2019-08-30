Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FA6C3A59F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 01:20:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D98B921874
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 01:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YSq5c04n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=omnibond-com.20150623.gappssmtp.com header.i=@omnibond-com.20150623.gappssmtp.com header.b="FGYyo76P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D98B921874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnLA5TZ3KJ48hhugrxebgxN2qO9DgfMmvKcM32iOV2o=; b=YSq5c04nbEOWRg
	I/RjpKmWkA4+31FXkCaAsCoNQbcBBo38e0kvfKyQwi1oT+X9rElN++P6cNctCL/29ArQY+U2Il3hD
	fB96c8xr8D+Ph7P0Pz1CctOOc6/KiITggxV46/qn8MTWhuIfCTWjN2rT7lkeYCjQPm+zkcROwAOdy
	PeTEpoPFDn2tsK8+mi07S9TQmEii2bqdT7N5k+WlDANLTV/dhpGcbkJgMUiJ358xU5KfgpCjTqkqK
	468Rft0/ijgkPzQ2dGkQVI2NzE4UlvaiFHG/TQbmyp2dWhfy1U8wPhfHat967P6E/cCP+gEY4XrIK
	uLPtA3Ixf9myw90uuZvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Vad-00061v-TK; Fri, 30 Aug 2019 01:20:36 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3VaZ-00061Y-Lw
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 01:20:33 +0000
Received: by mail-yw1-xc41.google.com with SMTP id l79so1828545ywe.11
 for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2019 18:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+IuQC8pbIafmSwD8SbGVAzn/DZ0LTbah8BkBemk6zek=;
 b=FGYyo76P5II4TE0xyyEdll3m2ufcqhN3TwhgI6WWOYj3toWhxeSi1wWMnzOp+D+rYj
 ahd/4sJOU/IaAo7fV5KpR4dy/NEnkI1UPi4BR9HH0itETNn+Hditb/hnVnP9oH/cyNg4
 oI/T5YJcX1gIvRAs4gjgcyFpS6Se90hdq2vCkSsM9WNmJBY7Ycu/Ay47jlkEZ0BEznLj
 bnxVQVgo6gmqDF8OmKQJnD/UyjSMDAyIfFY4B9AG7e1HO4urtYx5HaPIY5KSCwE1BSTn
 LymvSnfnU7tZBJ24uBJnsgaKmzRTtIBHnwqi8KIi0Il9SHJcQtsaNRWzW9wHZdDsxfKj
 tuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+IuQC8pbIafmSwD8SbGVAzn/DZ0LTbah8BkBemk6zek=;
 b=cmKawR3Feaz/PMtr3Q6YOOTvW7+9jNWBko3EwAdXF3W5looOijVHegoSuulK2jdruR
 HDC5DEspNYrXi5bKDOWyMP1cOFS6xycZM1fUbazL+q0DBMByL04cu2x43Rj6hAOnlfhs
 qxL3W8yc3bLoOJcVzRKO6e0ZGhWA+s+0QxOmHappirhALNzbI4EoumQZRuZ9my4tBqHJ
 NNEiZkvPwTsM9+owR0lXpQHj1iInZqws0IYKJGkzwtrAG5nZ1udk9cCGxVsoVUy5V/uG
 AKRRfNcvKwTUp2OMK9Rh/ZOmoaKhrpgX9yv1DwCdeWOs77wZOkZ74borRqFt85/rLul8
 ZAng==
X-Gm-Message-State: APjAAAVp+1BHRs9oW8TM8n/RY8uyQNo4roQtNrL9Cctnq0JpUzcufe3o
 ywYSJKZVAoCFm32Ln9dJCIVlMzgStU8fka2vujYSOA==
X-Google-Smtp-Source: APXvYqxAu3ghLEx4a7gfcA71cO2rSrBRWU6Icj84myb4LlhRF0l0un6rKVRkx0QZ124nnLqeAoTJBmXR1ZEKYdU440U=
X-Received: by 2002:a81:3681:: with SMTP id d123mr9784376ywa.348.1567128029653; 
 Thu, 29 Aug 2019 18:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
In-Reply-To: <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 29 Aug 2019 21:20:18 -0400
Message-ID: <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
To: Deepa Dinamani <deepa.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_182031_859873_FAB0AC8B 
X-CRM114-Status: GOOD (  23.06  )
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>, jfs-discussion@lists.sourceforge.net,
 Dave Kleikamp <shaggy@kernel.org>, al@alarsen.net, yuchao0@huawei.com,
 Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz,
 stoph Hellwig <hch@lst.de>, nico@fluxnic.net, linux-cifs@vger.kernel.org, "Yan,
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
 Arnd Bergmann <arnd@arndb.de>, Eric Van Hensbergen <ericvh@gmail.com>,
 Jan Kara <jack@suse.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 aivazian.tigran@gmail.com, phillip@squashfs.org.uk,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, trond.myklebust@hammerspace.com,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
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
 Anna Schumaker <anna.schumaker@netapp.com>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Deepa...

I installed this patch series on top of Linux 5.3-rc6 and ran xfstests
on orangefs and got a regression... generic/258 failed
with: "Timestamp wrapped"...

# cat results/generic/258.out.bad
QA output created by 258
Creating file with timestamp of Jan 1, 1960
Testing for negative seconds since epoch
Timestamp wrapped: 0
Timestamp wrapped
(see /home/hubcap/xfstests-dev/results//generic/258.full for details)

Just to double check, I compiled Linux 5.3-rc6 without the timestamp series,
and 258 passed... then added the patch series back and the failure returned...

Also.... when I was using "git am" to apply the patch series, the ceph patch
failed, so I "git skipped" it...

I obtained the patch series from: https://github.com/deepa-hub/vfs limits
today.

-Mike

On Thu, Aug 29, 2019 at 12:38 AM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> Adding the others who were on original cc, just in case.
> - Deepa
>
> On Wed, Aug 28, 2019 at 9:12 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> >
> > Hi Al, Arnd,
> >
> > This is a pull request for filling in min and max timestamps for filesystems.
> > I've added all the acks, and dropped the adfs patch. That will be merged through
> > Russell's tree.
> >
> > Thanks,
> > Deepa
> >
> > The following changes since commit 5d18cb62218608a1388858880ad3ec76d6cb0d3b:
> >
> >   Add linux-next specific files for 20190828 (2019-08-28 19:59:14 +1000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/deepa-hub/vfs limits
> >
> > for you to fetch changes up to f0f216afa4c7e4dee9121fde52ccf57f76119188:
> >
> >   isofs: Initialize filesystem timestamp ranges (2019-08-28 19:19:36 -0700)
> >
> > ----------------------------------------------------------------
> > Deepa Dinamani (19):
> >       vfs: Add file timestamp range support
> >       vfs: Add timestamp_truncate() api
> >       timestamp_truncate: Replace users of timespec64_trunc
> >       mount: Add mount warning for impending timestamp expiry
> >       utimes: Clamp the timestamps before update
> >       fs: Fill in max and min timestamps in superblock
> >       9p: Fill min and max timestamps in sb
> >       ext4: Initialize timestamps limits
> >       fs: nfs: Initialize filesystem timestamp ranges
> >       fs: cifs: Initialize filesystem timestamp ranges
> >       fs: fat: Initialize filesystem timestamp ranges
> >       fs: affs: Initialize filesystem timestamp ranges
> >       fs: sysv: Initialize filesystem timestamp ranges
> >       fs: ceph: Initialize filesystem timestamp ranges
> >       fs: orangefs: Initialize filesystem timestamp ranges
> >       fs: hpfs: Initialize filesystem timestamp ranges
> >       fs: omfs: Initialize filesystem timestamp ranges
> >       pstore: fs superblock limits
> >       isofs: Initialize filesystem timestamp ranges
> >
> >  fs/9p/vfs_super.c        |  6 +++++-
> >  fs/affs/amigaffs.c       |  2 +-
> >  fs/affs/amigaffs.h       |  3 +++
> >  fs/affs/inode.c          |  4 ++--
> >  fs/affs/super.c          |  4 ++++
> >  fs/attr.c                | 21 ++++++++++++---------
> >  fs/befs/linuxvfs.c       |  2 ++
> >  fs/bfs/inode.c           |  2 ++
> >  fs/ceph/super.c          |  2 ++
> >  fs/cifs/cifsfs.c         | 22 ++++++++++++++++++++++
> >  fs/cifs/netmisc.c        | 14 +++++++-------
> >  fs/coda/inode.c          |  3 +++
> >  fs/configfs/inode.c      | 12 ++++++------
> >  fs/cramfs/inode.c        |  2 ++
> >  fs/efs/super.c           |  2 ++
> >  fs/ext2/super.c          |  2 ++
> >  fs/ext4/ext4.h           | 10 +++++++++-
> >  fs/ext4/super.c          | 17 +++++++++++++++--
> >  fs/f2fs/file.c           | 21 ++++++++++++---------
> >  fs/fat/inode.c           | 12 ++++++++++++
> >  fs/freevxfs/vxfs_super.c |  2 ++
> >  fs/hpfs/hpfs_fn.h        |  6 ++----
> >  fs/hpfs/super.c          |  2 ++
> >  fs/inode.c               | 33 ++++++++++++++++++++++++++++++++-
> >  fs/isofs/inode.c         |  7 +++++++
> >  fs/jffs2/fs.c            |  3 +++
> >  fs/jfs/super.c           |  2 ++
> >  fs/kernfs/inode.c        |  7 +++----
> >  fs/minix/inode.c         |  2 ++
> >  fs/namespace.c           | 33 ++++++++++++++++++++++++++++++++-
> >  fs/nfs/super.c           | 20 +++++++++++++++++++-
> >  fs/ntfs/inode.c          | 21 ++++++++++++---------
> >  fs/omfs/inode.c          |  4 ++++
> >  fs/orangefs/super.c      |  2 ++
> >  fs/pstore/ram.c          |  2 ++
> >  fs/qnx4/inode.c          |  2 ++
> >  fs/qnx6/inode.c          |  2 ++
> >  fs/reiserfs/super.c      |  3 +++
> >  fs/romfs/super.c         |  2 ++
> >  fs/squashfs/super.c      |  2 ++
> >  fs/super.c               |  2 ++
> >  fs/sysv/super.c          |  5 ++++-
> >  fs/ubifs/file.c          | 21 ++++++++++++---------
> >  fs/ufs/super.c           |  7 +++++++
> >  fs/utimes.c              |  6 ++----
> >  fs/xfs/xfs_super.c       |  2 ++
> >  include/linux/fs.h       |  5 +++++
> >  include/linux/time64.h   |  2 ++
> >  48 files changed, 298 insertions(+), 72 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
