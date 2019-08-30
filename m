Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933FEC3A5A7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 15:48:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6770C23429
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 15:48:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DV4AFjUW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7oWCY6w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6770C23429
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ewiC9SQPWqnXeCz3+afncC0QxQ4+U2j1v3qaiPkLYUQ=; b=DV4AFjUW9o1LVCAMK8O+rm84D4
	M+wBJGNZxrEchGPrfpfXvUbVY7j5I+8M0zeqj62uei8Y4HKqT52SWlXBd/+Lio6r8esT5tQ6QjZoQ
	vcDKXk0pJzPSoB9Qp7ETncuBWuORYsGrIkZEz1tskoQ2P3VnxoKXvdiSWMuN+xdcy35mCqdbCkX5w
	fYFUK5vM5CiOwg717TCzPrliSWXSXZFpTpsJU28JlCeXklA+vdcr7rpjznTZiuBe3R7PPgP4xjuIQ
	vmvkYyYCdLHz8Xm1RkfwKCdrCYVmZlXzdU2Q6gYavuOI2QF/9Y2FyIcpw6gtR23mTPtyFSdzxO9p2
	7ruG24Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3j8g-0006F6-Hi; Fri, 30 Aug 2019 15:48:38 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3j8d-0006Ek-Qv
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 15:48:37 +0000
Received: by mail-pg1-x541.google.com with SMTP id n4so3756647pgv.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2019 08:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4oHQ/J6gD7m5a2hZJIzg30k30/iTJHkHY5qB+o+D4cE=;
 b=h7oWCY6wHIupyilklhVw3zKKmS4N6rNYStKFd6M4mXY2zoBod9UZ8VCkDGXpvOwPEx
 y0aASnlb2KjG+wF+/aUT2biKn+NEObcgE8m7DGPrZYueZa0oebuiKl0kXOBZW/YvAFgG
 wiNfxFX1BU+QMvruLmfNr9RwuUgTVgZhni7EzWpQBGg9w69s5GjxRS3CR8rDUkEmFDvX
 StbzvePxJ6JAeogsEcWDy1lOLEazKGBM7XSWMidYvC4oTqL+OIaD7n27qxye/p6T0bld
 MAh4tx6oguKUb4RPv6qhdVfxJi3jyYGLfFoX32P7ntEtN8+5CPxBMCDh7sUKz71y0419
 8ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4oHQ/J6gD7m5a2hZJIzg30k30/iTJHkHY5qB+o+D4cE=;
 b=g9OpvkueNxkx+Pt+98mSjH45Yl9P1xVqktiOjn5q35gtKsfky7WTrwCb+Z0u78UHLz
 n7GinXfSQOTf8hkjruRgKLsucbw8TawuLxSh+sp/aOoRuzboUMBP7vBfbMINo13Jv5Gj
 y0O7B9ZfTHvuaoC5vKhAG6+LNrDAPXZhDdnhgaB45HxEaZTjWdKiTI7c0k78MPgCWVht
 kbPAP3/8SyttYkQ1Vu3AK+WJy8e6mQ9wu6j6QqGMVWRBEmy1zc7ClBxCViyCcPB1Ofpi
 OP+T8gFO6S/pBUqTBT40b54iFkY4AJl3aSvDZCHZL/LtIfW8vaeoTIthrwwDmx2PAm2D
 iQHg==
X-Gm-Message-State: APjAAAXFFJsTN7Z6hw4fEWCkRneXfkxtr3halKw/BKuU8U4xMbiVxKvc
 0zqWPK8L7SvMaWJAw9XkRkY=
X-Google-Smtp-Source: APXvYqw+TTjvl6C13mK+Kx+U+c7BoLzOucbYEU3GqDfQjm5bxaW7IFfh1q/TNPR40tNdaKG3mocNEw==
X-Received: by 2002:a17:90a:c386:: with SMTP id
 h6mr16090687pjt.122.1567180114546; 
 Fri, 30 Aug 2019 08:48:34 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id z28sm8093085pfj.74.2019.08.30.08.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 08:48:33 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: arnd@arndb.de,
	viro@zeniv.linux.org.uk
Subject: [GIT PULL RESEND] vfs: Add support for timestamp limits
Date: Fri, 30 Aug 2019 08:47:44 -0700
Message-Id: <20190830154744.4868-1-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
References: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_084835_896163_3805122D 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: lucho@ionkov.net, martin@omnibond.com, jfs-discussion@lists.sourceforge.net,
 shaggy@kernel.org, al@alarsen.net, yuchao0@huawei.com, me@bobcopeland.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org, deepa.kernel@gmail.com,
 mikulas@artax.karlin.mff.cuni.cz, hch@lst.de, nico@fluxnic.net,
 hubcap@omnibond.com, linux-cifs@vger.kernel.org, zyan@redhat.com,
 sage@redhat.com, darrick.wong@oracle.com, y2038@lists.linaro.org,
 richard@nod.at, sfrench@samba.org, anton@enomsg.org, linux@armlinux.org.uk,
 codalist@coda.cs.cmu.edu, hch@infradead.org, coda@cs.cmu.edu,
 v9fs-developer@lists.sourceforge.net, idryomov@gmail.com,
 linux-ext4@vger.kernel.org, salah.triki@gmail.com, asmadeus@codewreck.org,
 devel@lists.orangefs.org, dushistov@mail.ru, keescook@chromium.org,
 ericvh@gmail.com, jack@suse.com, reiserfs-devel@vger.kernel.org, tj@kernel.org,
 jlbec@evilplan.org, aivazian.tigran@gmail.com, dsterba@suse.com,
 jaegeuk@kernel.org, ceph-devel@vger.kernel.org,
 trond.myklebust@hammerspace.com, hirofumi@mail.parknet.co.jp,
 adilger@dilger.ca, jaharkes@cs.cmu.edu, linux-nfs@vger.kernel.org,
 tony.luck@intel.com, tytso@mit.edu, luisbg@kernel.org, dedekind1@gmail.com,
 linux-ntfs-dev@lists.sourceforge.net, gregkh@linuxfoundation.org,
 linux-karma-devel@lists.sourceforge.net, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ccross@android.com, linux-fsdevel@vger.kernel.org,
 phillip@squashfs.org.uk, dwmw2@infradead.org, anna.schumaker@netapp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

[resending, rebased onto linux v5.3-rc6, and dropped orangefs patch from the series]

Hi Al, Arnd,

This is a pull request for filling in min and max timestamps for filesystems.
I've added all the acks, and dropped the adfs patch. That will be merged through
Russell's tree.

Dropped orangefs until the maintainers decide what its limits should be.

The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the Git repository at:

  https://github.com/deepa-hub/vfs limits

for you to fetch changes up to 5ad32b3acded06183f40806f76b030c3143017bb:

  isofs: Initialize filesystem timestamp ranges (2019-08-30 08:11:25 -0700)

----------------------------------------------------------------

- Deepa

Deepa Dinamani (18):
      vfs: Add file timestamp range support
      vfs: Add timestamp_truncate() api
      timestamp_truncate: Replace users of timespec64_trunc
      mount: Add mount warning for impending timestamp expiry
      utimes: Clamp the timestamps before update
      fs: Fill in max and min timestamps in superblock
      9p: Fill min and max timestamps in sb
      ext4: Initialize timestamps limits
      fs: nfs: Initialize filesystem timestamp ranges
      fs: cifs: Initialize filesystem timestamp ranges
      fs: fat: Initialize filesystem timestamp ranges
      fs: affs: Initialize filesystem timestamp ranges
      fs: sysv: Initialize filesystem timestamp ranges
      fs: ceph: Initialize filesystem timestamp ranges
      fs: hpfs: Initialize filesystem timestamp ranges
      fs: omfs: Initialize filesystem timestamp ranges
      pstore: fs superblock limits
      isofs: Initialize filesystem timestamp ranges

 fs/9p/vfs_super.c        |  6 +++++-
 fs/affs/amigaffs.c       |  2 +-
 fs/affs/amigaffs.h       |  3 +++
 fs/affs/inode.c          |  4 ++--
 fs/affs/super.c          |  4 ++++
 fs/attr.c                | 21 ++++++++++++---------
 fs/befs/linuxvfs.c       |  2 ++
 fs/bfs/inode.c           |  2 ++
 fs/ceph/super.c          |  2 ++
 fs/cifs/cifsfs.c         | 22 ++++++++++++++++++++++
 fs/cifs/netmisc.c        | 14 +++++++-------
 fs/coda/inode.c          |  3 +++
 fs/configfs/inode.c      | 12 ++++++------
 fs/cramfs/inode.c        |  2 ++
 fs/efs/super.c           |  2 ++
 fs/ext2/super.c          |  2 ++
 fs/ext4/ext4.h           | 10 +++++++++-
 fs/ext4/super.c          | 17 +++++++++++++++--
 fs/f2fs/file.c           | 21 ++++++++++++---------
 fs/fat/inode.c           | 12 ++++++++++++
 fs/freevxfs/vxfs_super.c |  2 ++
 fs/hpfs/hpfs_fn.h        |  6 ++----
 fs/hpfs/super.c          |  2 ++
 fs/inode.c               | 33 ++++++++++++++++++++++++++++++++-
 fs/isofs/inode.c         |  7 +++++++
 fs/jffs2/fs.c            |  3 +++
 fs/jfs/super.c           |  2 ++
 fs/kernfs/inode.c        |  7 +++----
 fs/minix/inode.c         |  2 ++
 fs/namespace.c           | 33 ++++++++++++++++++++++++++++++++-
 fs/nfs/super.c           | 20 +++++++++++++++++++-
 fs/ntfs/inode.c          | 21 ++++++++++++---------
 fs/omfs/inode.c          |  4 ++++
 fs/pstore/ram.c          |  2 ++
 fs/qnx4/inode.c          |  2 ++
 fs/qnx6/inode.c          |  2 ++
 fs/reiserfs/super.c      |  3 +++
 fs/romfs/super.c         |  2 ++
 fs/squashfs/super.c      |  2 ++
 fs/super.c               |  2 ++
 fs/sysv/super.c          |  5 ++++-
 fs/ubifs/file.c          | 21 ++++++++++++---------
 fs/ufs/super.c           |  7 +++++++
 fs/utimes.c              |  6 ++----
 fs/xfs/xfs_super.c       |  2 ++
 include/linux/fs.h       |  5 +++++
 include/linux/time64.h   |  2 ++
 47 files changed, 296 insertions(+), 72 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
