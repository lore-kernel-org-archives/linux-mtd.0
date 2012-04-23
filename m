Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMCoS-0005l2-OQ
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 06:31:53 +0000
Received: by yenm10 with SMTP id m10so6608715yen.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 23:31:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EF2E73589CA71846A15D0B2CDF79505D0905DB465E@wm021.weinmann.com>
References: <EF2E73589CA71846A15D0B2CDF79505D0905DB465E@wm021.weinmann.com>
Date: Sun, 22 Apr 2012 23:31:50 -0700
Message-ID: <CAN8TOE_GxjW+W7f53Uvfqe3Urs6mh3mHnSV36rvqk5=7kCKe4Q@mail.gmail.com>
Subject: Re: [PATCH (mtd-utils)] mtd_write: fall back to old method on ENOMEM
From: Brian Norris <computersforpeace@gmail.com>
To: "Voss, Nikolaus" <N.Voss@weinmann.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 22, 2012 at 10:45 PM, Voss, Nikolaus <N.Voss@weinmann.de> wrote=
:
> MEMWRITE ioctl tries to kmalloc the whole data. With usual
> eraseblock sizes of 128 KiB, on memory constrained systems
> this can easily lead to ENOMEM due to memory fragmentation
> even if there are plenty of free pages left e.g.:
>
> --------------------------------------------------------------
>
> libmtd: error!: MEMWRITE ioctl failed for eraseblock 55 (mtd6)
> =A0 =A0 =A0 =A0error 12 (Cannot allocate memory)
> ubiformat: error!: cannot write eraseblock 55
> =A0 =A0 =A0 =A0 =A0 error 12 (Cannot allocate memory)

What version of mtd-utils are using? I don't think ubiformat should be
utilizing the MEMWRITE codepath anymore, since commit 71c76e7.

> ---
> =A0lib/libmtd.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/lib/libmtd.c b/lib/libmtd.c
> index 9b247ae..9d24ef0 100644
> --- a/lib/libmtd.c
> +++ b/lib/libmtd.c
> @@ -1151,7 +1151,7 @@ int mtd_write(libmtd_t desc, const struct mtd_dev_i=
nfo *mtd, int fd, int eb,
> =A0 =A0 =A0 =A0ret =3D ioctl(fd, MEMWRITE, &ops);
> =A0 =A0 =A0 =A0if (ret =3D=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> - =A0 =A0 =A0 else if (errno !=3D ENOTTY && errno !=3D EOPNOTSUPP)
> + =A0 =A0 =A0 else if (errno !=3D ENOTTY && errno !=3D EOPNOTSUPP && errn=
o !=3D ENOMEM)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return mtd_ioctl_error(mtd, eb, "MEMWRITE"=
);
>
> =A0 =A0 =A0 =A0/* Fall back to old methods if necessary */

I'm not sure we want to go down the path of special cases for every
possible error; the "fall back" is because this ioctl doesn't exist on
older kernels. If MEMWRITE is causing real problems for the intended
use case (writing page data + OOB), then userspace or kernel-space
should be tweaked. But it's really not a problem AFAIK, since it's
real use is for page-at-a-time (data+OOB) writes from tools like
nandwrite.

Brian
