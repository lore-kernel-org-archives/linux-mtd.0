Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRyoQ-0005JK-00
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:33:37 +0000
Message-ID: <55D43DE2.70008@cn.fujitsu.com>
Date: Wed, 19 Aug 2015 16:27:14 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
CC: <richard.weinberger@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v5] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
References: <1439872825-4988-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <CAF4G-tJSMA3yYJZMzoMs4dk-ypVOdK9DsGMRMmo1dq+n+6RmKg@mail.gmail.com>
In-Reply-To: <CAF4G-tJSMA3yYJZMzoMs4dk-ypVOdK9DsGMRMmo1dq+n+6RmKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/18/2015 04:43 PM, Artem Bityutskiy wrote:
> Please, take a look at the mkwrite path, most of the file-systems update
> atime there too,
> I think your patch may need to do something about atime in
> 'ubifs_vm_page_mkwrite()'.

Hi Atem,
	most of the file-systems are updating the ctime and mtime
in mkwrite path by calling file_update_time().It's a writing path
so we don't update atime here.
>
> On Tue, Aug 18, 2015 at 7:40 AM, Dongsheng Yang
> <yangds.fnst@cn.fujitsu.com <mailto:yangds.fnst@cn.fujitsu.com>> wrote:
>
>     To make ubifs support atime flexily, this commit introduces
>     +config UBIFS_ATIME_SUPPORT
>     +       bool "Access time support" if UBIFS_FS
>     +       depends on UBIFS_FS
>     +       default n
>     +       help
>     +         This option allows ubifs to support atime. -o strictatime
>     is harmful to
>     +         your flash, we don't suggest it. But relatime and lazytime
>     are much
>     +         better.
>
>
> How about this.
>
> Originally UBIFS did not support atime, because it looked like a bad
> idea due
> increased flash wear. This option adds atime support and it is disabled
> by default
> to preserve the old behavior. If you enable this option, UBIFS starts
> updating atime,
> which means that file-system read operations will cause writes (inode ati=
me
> updates). This may affect file-system performance and increase flash
> device wear,
> so be careful. How often atime is updated depends on the selected strateg=
y:
> strictatime is the "heavy", relatime is "lighter", etc.

Much better :)
>
>
>     +int ubifs_update_time(struct inode *inode, struct timespec *time,
>     +                            int flags)
>     +{
>     +       struct ubifs_inode *ui =3D ubifs_inode(inode);
>     +       struct ubifs_info *c =3D inode->i_sb->s_fs_info;
>     +       struct ubifs_budget_req req =3D { .dirtied_ino =3D 1,
>     +                       .dirtied_ino_d =3D ALIGN(ui->data_len, 8) };
>     +       int iflags =3D I_DIRTY_TIME;
>     +       int err, release;
>     +
>     +       err =3D ubifs_budget_space(c, &req);
>     +       if (err)
>     +               return err;
>     +
>     +       mutex_lock(&ui->ui_mutex);
>
>     +       if (flags & S_ATIME)
>     +               inode->i_atime =3D *time;
>     +       if (flags & S_VERSION)
>     +               inode_inc_iversion(inode);
>     +       if (flags & S_CTIME)
>     +               inode->i_ctime =3D *time;
>     +       if (flags & S_MTIME)
>     +               inode->i_mtime =3D *time;
>     +
>     +       if (!(inode->i_sb->s_flags & MS_LAZYTIME) || (flags &
>     S_VERSION))
>     +               iflags |=3D I_DIRTY_SYNC;
>
>
> The lazytime part looks OK, but I am a bit concerned about the S_VERSION
> part.
> IIRC, the inode version stuff is needed for NFS, which UBIFS does not
> support
> anyway. I do not see that we do anything with inode version in UBIFS, so
> it looks
> like UBIFS just does not support this.
>
> I do not think we should add code we do not really need or understand.
> Could you
> please take a closer look to the S_VERSION stuff and either remove it
> from this
> patch or make sure UBIFS needs this piece of code, which I doubt.

Thanx, I looked some more about it.

Hmmm, yes, agree that we should not introduce some code here
to make it hard for understanding, although that would never
cause some problem. I will remove it.

Maybe we can reintroduce it when we plan to add nfs supporting
in ubifs.:)
>
>
>     -               sb->s_flags |=3D MS_ACTIVE | MS_NOATIME;
>     +               sb->s_flags |=3D MS_ACTIVE;
>     +#ifndef CONFIG_UBIFS_ATIME_SUPPORT
>     +               sb->s_flags |=3D MS_NOATIME;
>     +#else
>     +               ubifs_warn(c, "full atime support is enabled, which
>     may wear out your flash faster");
>     +#endif
>
>
> I am not sure we need to print this warning. If I know what I am doing,
> and want atime,
> why whould I see the warning?
>
> We made the default to be the old behavior, whoudn't it be enough to
> just print a
> message (ubifs_info()) about enabled atime, without the "which may wear
> out your flash
> faster" part, what do you think?

Hmmm "default behavior to disable" makes sense to me. Yes, if someone
  enable it by intention, we need not warning it out to him. Okey,
Just a ubifs_info sounds good to me.

Yang
>
> Thanks!
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
