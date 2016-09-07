Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhj1Z-0002m6-AH
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 20:00:45 +0000
Received: by mail-oi0-x233.google.com with SMTP id m11so41735167oif.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Sep 2016 13:00:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKODt8xsX-ze7n_kvwTxbDRFN19FaOwbcKwRQn6ifoAXZbC7Yg@mail.gmail.com>
References: <CAKODt8xsX-ze7n_kvwTxbDRFN19FaOwbcKwRQn6ifoAXZbC7Yg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 7 Sep 2016 22:00:23 +0200
Message-ID: <CAFLxGvxF=7u3CL39_Ka3zZ8KT9XLyVjeKMV==fAYDnPoaxrthQ@mail.gmail.com>
Subject: Re: How does ubiupdatevol deals with corrupted state
To: Pierre Mallard <mallard.pierre@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pierre,

On Wed, Sep 7, 2016 at 6:13 PM, Pierre Mallard <mallard.pierre@gmail.com> w=
rote:
> I have a question on ubiupdatevol expected behavior. Indeed, from
> times to times it happens that after a call to ubiupdatevol on a
> static volume, the volume is marked as corrupted by ubi driver, but
> ubiupdatevol return always success.
>
> In those case, kernel print following messages :
>
> 1970-01-01T02:42:09.660119+00:00 | kernel | - | UBI warning:
> ubi_eba_read_leb: CRC error: calculated 0xa1327885, must be 0x3745d28a
> 1970-01-01T02:42:09.660178+00:00 | kernel | - | UBI warning:
> vol_cdev_write: volume 5 on UBI device 0 is corrupted

This must not happen.

> After a few search in latest kernel master and mtd-utils git sources,
> it appears that :
>
> =C2=B7 A write to /dev/ubix_y=E2=80=A6 will not always lead to a returned=
 error
> from driver but rather may only mark the volume as corrupted if
> failure is detected (vol_cdev_write function, when successive write
> succeeded and ubi_check_volume returned 1 for ecc error)
> =C2=B7 ubiupdatevol does not check for corrupt flag after update if write
> is successful and therefore does not return an error if volume is
> corrupted.
>
> My first question is whether what happened to me, can happen : i.e.
> can the volume get corrupted without a write error reported by driver
> ? (I would suspect therefore a problem in nand driver  - pl353 from
> Xilinx for this case - )

Please verify your driver. i.e. run ubi tests. They are part of the mtd-uti=
ls
source package.

> In the eventuality where this is part of a standard =E2=80=9Cdegraded=E2=
=80=9D
> behavior, what is the reason for not checking for corruption in
> ubiupdatevol ?
>
> Is this only a static volume problem ? i.e. any chance to encounter
> same problem in dynamic volume.

With static volumes you notice because they offer data checksumming.
Maybe your driver has an issue and updating static volumes is just the
most visible symptom.

--=20
Thanks,
//richard
