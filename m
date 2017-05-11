Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8vY9-0007Ks-Dy
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 21:23:06 +0000
Received: by mail-qt0-x244.google.com with SMTP id r58so4512182qtb.2
 for <linux-mtd@lists.infradead.org>; Thu, 11 May 2017 14:22:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJbz7-1BMi8wAHptbDDtbSPqf-K2Kitq1Z4YhnQiAa_n04vhBQ@mail.gmail.com>
References: <CAJbz7-1BMi8wAHptbDDtbSPqf-K2Kitq1Z4YhnQiAa_n04vhBQ@mail.gmail.com>
From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous@gmail.com>
Date: Thu, 11 May 2017 23:22:43 +0200
Message-ID: <CAJbz7-2F5X+2gg=GPO=Ay5AuNttzUf1NsrDNjYyXLuexg+P3RQ@mail.gmail.com>
Subject: Re: mtd:nor: unlock enhancement for cmdset0002
To: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for self-answering, but I forgot to add mtd maintainers and
mtd-mailinglist.

/Honza

2017-05-11 12:11 GMT+02:00 Honza Petrou=C5=A1 <jpetrous@gmail.com>:
> Hi,
>
> I'm not so much experienced in MTD area, so please correct me, if I'm wro=
ng.
>
> NOR flashes supported by cmdset0002 (AMD & Fujitsu Standard Vendor Comman=
d Set)
> are not able to unlock one particular eraseblock, the unlocking is
> done by unlock
> the whole chip. Because of that the driver (cfi_cmdset_0002.c) do it
> in free steps:
>   1) remember all locked eraseblocks
>   2) do chip unlock
>   3) lock all remaining eraseblocks (minus, of course ones which have to =
be
> enabled by current ioctl call).
>
> Unfortunately, in step 2 (unlocking chip) there is used unlocking over
> all eraseblocks
> which belong to requested unlock area. It means that chip unlock operatio=
n
> is doing multiple times, without any reason of doing so. It is enough to =
do
> unlock only on one eraseblock (as it already means full chip unlock). Thi=
s way
> we can save programming time, on bigger parts even more dramatically
> (one chip unlock per request vs. [number of eraseblocks] * chip unlock).
>
> So I would like to ask, if my finding is correct.
>
> Thanks
> /Honza
>
> BTW, in current project we have one NOR chip, so when I applied
> the following patch (I know it has to be generalized, even now I
> understand that it can not work correctly in case of multiple NOR chips
> or with different eraseblock sizes, ... etc) I lowered unlocking for 20x
> on 64MB filesystem.
>
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 9dca881..36e45d2 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2694,8 +2694,8 @@ static int __maybe_unused cfi_ppb_unlock(struct
> mtd_info *mtd, loff_t ofs,
>         }
>
>         /* Now unlock the whole chip */
> -       ret =3D cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
> -                              DO_XXLOCK_ONEBLOCK_UNLOCK);
> +       ret =3D do_ppb_xxlock(map, &cfi->chips[0], 0, regions[0].erasesiz=
e,
> +                                DO_XXLOCK_ONEBLOCK_UNLOCK);
>         if (ret) {
>                 kfree(sect);
>                 return ret;
