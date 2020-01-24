Return-Path: <SRS0=Gzls=3N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561DDC2D0CE
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 08:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276D22070A
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 08:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hq0hjxCD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 276D22070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aT0yfE+tohx7s9sYCKhYAaHpuqwA7br+v0rzGIWAipU=; b=hq0hjxCDfq45qf
	jIJ824UwTajEARtYVgFCdtrnv+bH4E+Z3JVYgmaz6oZ30PqLdam24ePNBgeEUpvNltAKLAvI2Z8XV
	L1X2JPaJFPmTcwbw8AaEE9ib6YJhhSQnFVN7zhOKAsYqphXXnYMHV6jC3QCN6DzjChqD1BGd42vry
	8bcpxTlRb48lDEtUqp8Fq6djQOSZXaHPOt6bZPr5iR/QPzV7sUJfp2qIWorC9Og/QEHIsqmcVzM6m
	1Pd7tph4z4ZyJ6Lwv1FBV3cmltmxuP2X8GR6puZc+JG1Om0Qgt8aDN2b7x3KAro4FuwDms2/TsEgW
	ylMpA5wUG+ESNiaR9pSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iutyX-0003CB-5A; Fri, 24 Jan 2020 08:05:57 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iutyT-0003BI-EI
 for linux-mtd@lists.infradead.org; Fri, 24 Jan 2020 08:05:55 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iutyN-00049D-3i; Fri, 24 Jan 2020 09:05:47 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1iutyI-0005Sy-Tg; Fri, 24 Jan 2020 09:05:42 +0100
Date: Fri, 24 Jan 2020 09:05:42 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 5/7] ubifs: Add support for project id
Message-ID: <20200124080542.inus6uk3wtrhdrkg@pengutronix.de>
References: <20191106091537.32480-1-s.hauer@pengutronix.de>
 <20191106091537.32480-6-s.hauer@pengutronix.de>
 <CAFLxGvwfjokR=O+=EiC-6SkEsVSnwaNfxPOS_=7SVdSqHX6A=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvwfjokR=O+=EiC-6SkEsVSnwaNfxPOS_=7SVdSqHX6A=A@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:01:33 up 200 days, 14:11, 80 users,  load average: 0.86, 0.51,
 0.44
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_000553_643548_A1FCCE93 
X-CRM114-Status: GOOD (  27.67  )
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jan 19, 2020 at 09:09:10PM +0100, Richard Weinberger wrote:
> On Wed, Nov 6, 2019 at 10:16 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >
> > The project id is necessary for quota project id support. This adds
> > support for the project id to UBIFS as well as support for the
> > FS_PROJINHERIT_FL flag.
> >
> > This includes a change for the UBIFS on-disk format. struct
> > ubifs_ino_node gains a project id number and a UBIFS_PROJINHERIT_FL
> > flag.
> >
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  fs/ubifs/dir.c         | 23 +++++++++++++++++++++--
> >  fs/ubifs/ioctl.c       | 34 ++++++++++++++++++++++++++++++++--
> >  fs/ubifs/journal.c     |  2 +-
> >  fs/ubifs/super.c       |  1 +
> >  fs/ubifs/ubifs-media.h |  6 ++++--
> >  fs/ubifs/ubifs.h       |  4 ++++
> >  6 files changed, 63 insertions(+), 7 deletions(-)
> >
> > diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> > index cfce5fee9262..db2456537e6d 100644
> > --- a/fs/ubifs/dir.c
> > +++ b/fs/ubifs/dir.c
> > @@ -56,7 +56,8 @@ static int inherit_flags(const struct inode *dir, umode_t mode)
> >                  */
> >                 return 0;
> >
> > -       flags = ui->flags & (UBIFS_COMPR_FL | UBIFS_SYNC_FL | UBIFS_DIRSYNC_FL);
> > +       flags = ui->flags & (UBIFS_COMPR_FL | UBIFS_SYNC_FL | UBIFS_DIRSYNC_FL |
> > +                            UBIFS_PROJINHERIT_FL);
> >         if (!S_ISDIR(mode))
> >                 /* The "DIRSYNC" flag only applies to directories */
> >                 flags &= ~UBIFS_DIRSYNC_FL;
> > @@ -112,6 +113,11 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
> >                          current_time(inode);
> >         inode->i_mapping->nrpages = 0;
> >
> > +       if (ubifs_inode(dir)->flags & UBIFS_PROJINHERIT_FL)
> > +               ui->projid = ubifs_inode(dir)->projid;
> > +       else
> > +               ui->projid = make_kprojid(&init_user_ns, UBIFS_DEF_PROJID);
> > +
> >         switch (mode & S_IFMT) {
> >         case S_IFREG:
> >                 inode->i_mapping->a_ops = &ubifs_file_address_operations;
> > @@ -705,6 +711,9 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
> >         ubifs_assert(c, inode_is_locked(dir));
> >         ubifs_assert(c, inode_is_locked(inode));
> >
> > +       if (!projid_eq(dir_ui->projid, ui->projid))
> > +                return -EXDEV;
> > +
> >         err = fscrypt_prepare_link(old_dentry, dir, dentry);
> >         if (err)
> >                 return err;
> > @@ -1556,8 +1565,18 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
> >         if (err)
> >                 return err;
> >
> > -       if (flags & RENAME_EXCHANGE)
> > +       if ((ubifs_inode(new_dir)->flags & UBIFS_PROJINHERIT_FL) &&
> > +           (!projid_eq(ubifs_inode(new_dir)->projid,
> > +                       ubifs_inode(old_dentry->d_inode)->projid)))
> > +               return -EXDEV;
> > +
> > +       if (flags & RENAME_EXCHANGE) {
> > +               if ((ubifs_inode(old_dir)->flags & UBIFS_PROJINHERIT_FL) &&
> > +                  (!projid_eq(ubifs_inode(old_dir)->projid,
> > +                       ubifs_inode(new_dentry->d_inode)->projid)))
> > +                       return -EXDEV;
> 
> Can we please have a small helper function for these checks?
> 
> >                 return ubifs_xrename(old_dir, old_dentry, new_dir, new_dentry);
> > +       }
> >
> >         return do_rename(old_dir, old_dentry, new_dir, new_dentry, flags);
> >  }
> > diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> > index 533df56beab4..829e71d9c9ae 100644
> > --- a/fs/ubifs/ioctl.c
> > +++ b/fs/ubifs/ioctl.c
> > @@ -19,7 +19,7 @@
> >  /* Need to be kept consistent with checked flags in ioctl2ubifs() */
> >  #define UBIFS_SUPPORTED_IOCTL_FLAGS \
> >         (FS_COMPR_FL | FS_SYNC_FL | FS_APPEND_FL | \
> > -        FS_IMMUTABLE_FL | FS_DIRSYNC_FL)
> > +        FS_IMMUTABLE_FL | FS_DIRSYNC_FL | FS_PROJINHERIT_FL)
> >
> >  /**
> >   * ubifs_set_inode_flags - set VFS inode flags.
> > @@ -66,6 +66,8 @@ static int ioctl2ubifs(int ioctl_flags)
> >                 ubifs_flags |= UBIFS_IMMUTABLE_FL;
> >         if (ioctl_flags & FS_DIRSYNC_FL)
> >                 ubifs_flags |= UBIFS_DIRSYNC_FL;
> > +       if (ioctl_flags & FS_PROJINHERIT_FL)
> > +               ubifs_flags |= UBIFS_PROJINHERIT_FL;
> >
> >         return ubifs_flags;
> >  }
> > @@ -91,6 +93,8 @@ static int ubifs2ioctl(int ubifs_flags)
> >                 ioctl_flags |= FS_IMMUTABLE_FL;
> >         if (ubifs_flags & UBIFS_DIRSYNC_FL)
> >                 ioctl_flags |= FS_DIRSYNC_FL;
> > +       if (ubifs_flags & UBIFS_PROJINHERIT_FL)
> > +               ioctl_flags |= FS_PROJINHERIT_FL;
> >
> >         return ioctl_flags;
> >  }
> > @@ -106,6 +110,8 @@ static inline unsigned long ubifs_xflags_to_iflags(__u32 xflags)
> >                 iflags |= UBIFS_IMMUTABLE_FL;
> >         if (xflags & FS_XFLAG_APPEND)
> >                 iflags |= UBIFS_APPEND_FL;
> > +       if (xflags & FS_XFLAG_PROJINHERIT)
> > +               iflags |= UBIFS_PROJINHERIT_FL;
> >
> >          return iflags;
> >  }
> > @@ -121,15 +127,34 @@ static inline __u32 ubifs_iflags_to_xflags(unsigned long flags)
> >                 xflags |= FS_XFLAG_IMMUTABLE;
> >         if (flags & UBIFS_APPEND_FL)
> >                 xflags |= FS_XFLAG_APPEND;
> > +       if (flags & UBIFS_PROJINHERIT_FL)
> > +               xflags |= FS_XFLAG_PROJINHERIT;
> >
> >          return xflags;
> >  }
> >
> > +static int ubifs_ioc_setproject(struct file *file, __u32 projid)
> > +{
> > +       struct inode *inode = file_inode(file);
> > +       struct ubifs_inode *ui = ubifs_inode(inode);
> > +       kprojid_t kprojid;
> > +
> > +       kprojid = make_kprojid(&init_user_ns, (projid_t)projid);
> > +       if (projid_eq(kprojid, ui->projid))
> > +               return 0;
> > +
> > +       ui->projid = kprojid;
> > +
> > +       return 0;
> > +}
> 
> You return in every case 0, so this function cannot fail? If so,
> please make it of type void.

It can fail in the next patch when quota support is added.

> > @@ -531,7 +533,7 @@ struct ubifs_ino_node {
> >         __le32 data_len;
> >         __le32 xattr_cnt;
> >         __le32 xattr_size;
> > -       __u8 padding1[4]; /* Watch 'zero_ino_node_unused()' if changing! */
> > +       __le32 projid;
> 
> You claim a new field in struct ubifs_ino_inode and add a new inode flag.
> I fear this requires a new feature flag.

When would I set this flag? Lazily once the first project id is set or
explicitly somehow?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
