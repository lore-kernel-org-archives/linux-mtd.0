Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0OXf-0002HY-TO
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2018 09:35:58 +0000
Received: by mail-wm0-x231.google.com with SMTP id v21so14093701wmc.1
 for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2018 02:35:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <HE1PR0601MB24277E30F93433268CD816BAF3AD0@HE1PR0601MB2427.eurprd06.prod.outlook.com>
References: <HE1PR0601MB24277E30F93433268CD816BAF3AD0@HE1PR0601MB2427.eurprd06.prod.outlook.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 26 Mar 2018 11:35:38 +0200
Message-ID: <CAFLxGvz1eBHLOG_HCyAX-ep-VuP_E0wb=xJE=FFU-Hg3CKX9PQ@mail.gmail.com>
Subject: Re: Is it really reasonable to reserve a percentage of the total nand
 flash size for bad block handling for UBI?
To: "Wang, Qiong (Q.)" <qwang34@yfve.com.cn>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

Wang, Qiong (Q.) ,

On Mon, Mar 26, 2018 at 11:16 AM, Wang, Qiong (Q.) <qwang34@yfve.com.cn> wr=
ote:
> Hello,
>
> I=E2=80=99m creating a 16MiB UBIFS partition out of a 512MiB nand flash.A=
fter it is successfully mounted I discovered that 80 PEBs are reserved for =
the bad block handling. Since the PEB size is 128KiB for my nand flash,that=
 is totally 10MiB, taking more than half size of my partition size.

This is the problem, there is no such thing as a "UBIFS partition.
UBI expects that you use the vast majority of the MTD for UBI such
that the wear-leveling domain is as large as possible.
If you want multiple UBIFS instances, create one UBI with multiples UBI vol=
umes.

> After checking the ubi source code I discovered that is because ubi uses =
the total nand flash size to multiply the max bad PEB percentage to get the=
 reserved bad block. I listed the source code below:
>
> drivers/mtd/ubi/build.c
>
> static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_pe=
r1024)
> {
>          int limit, device_pebs;
>          uint64_t device_size;
>
>          if (!max_beb_per1024)
>                   return 0;
>
>          /*
>          * Here we are using size of the entire flash chip and
>          * not just the MTD partition size because the maximum
>          * number of bad eraseblocks is a percentage of the
>          * whole device and bad eraseblocks are not fairly
>          * distributed over the flash chip. So the worst case
>          * is that all the bad eraseblocks of the chip are in
>          * the MTD partition we are attaching (ubi->mtd).
>          */
>          device_size =3D mtd_get_device_size(ubi->mtd);
>          device_pebs =3D mtd_div_by_eb(device_size, ubi->mtd);
>          limit =3D mult_frac(device_pebs, max_beb_per1024, 1024);
>
>          /* Round it up */
>          if (mult_frac(limit, 1024, max_beb_per1024) < device_pebs)
>                   limit +=3D 1;
>
>          return limit;
> }
>
> The comment explained that the worst case is that all the bad eraseblocks=
 of the chip are in the MTD partition we are attaching but I do think it=E2=
=80=99s a rather rare situation. I wonder is it really necessary to reserve=
 so many PEBs for bad block handling for such small partition? What if I ne=
ed a small ubifs partition without so many PEBs reserved for bad block hand=
ling?

See above.

HTH

--=20
Thanks,
//richard
