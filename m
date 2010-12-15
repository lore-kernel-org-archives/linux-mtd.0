Received: from mail-fx0-f48.google.com ([209.85.161.48])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSgaU-0003kJ-IU
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 01:55:32 +0000
Received: by fxm2 with SMTP id 2so1495229fxm.21
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 17:55:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1292340409.2538.40.camel@localhost>
References: <1290156045-11719-1-git-send-email-r64343@freescale.com>
	<1292340409.2538.40.camel@localhost>
Date: Wed, 15 Dec 2010 09:55:08 +0800
Message-ID: <AANLkTi=zB7UBjkvGYv_wdwZpH1Ghatn6eye1z5616h4X@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: nand: add check for out of page read
From: Jason Liu <liu.h.jason@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: Jason Liu <r64343@freescale.com>, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Artem,

2010/12/14 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2010-11-19 at 16:40 +0800, Jason Liu wrote:
>> When run mtd_oobtest case, there will be one error for step(4),
>> which turned out it need add one check for out of page read in
>> nand_do_read_oob just like mtd_do_write_oob did it already.
>> This commit also fix one typo error for comments in mtd_do_write_oob
>>
>> Signed-off-by: Jason Liu <r64343@freescale.com>
>
> I cannot reproduce this with nandsim, can you?
>
> I tried:
>
> 1. sudo modprobe nandsim
> =9A sudo modprobe mtd_oobtest dev=3D0
>
> 2. sudo ./load_nandsim.sh 128 128 2048
> =9A sudo modprobe mtd_oobtest dev=3D0
>
> In both cases the test passes: "mtd_oobtest: finished with 0 errors"
>
> And in 'nand_do_read_oob()' I see the following piece of code:
>
> =9A =9A =9A =9A/* Do not allow reads past end of device */
> =9A =9A =9A =9Aif (unlikely(from >=3D mtd->size ||
> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A ops->ooboffs + readlen > ((mtd->s=
ize >> chip->page_shift) -
> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =
=9A =9A(from >> chip->page_shift)) * len)) {
> =9A =9A =9A =9A =9A =9A =9A =9ADEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read =
beyond end "
> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =
=9A =9A"of device\n", __func__);
> =9A =9A =9A =9A =9A =9A =9A =9Areturn -EINVAL;
> =9A =9A =9A =9A}

Here the mtd->size in nand_base.c should be the NAND flash chip size,
while in nand_oobtest,

              /* Attempt to read off end of device */
                ops.mode      =3D MTD_OOB_AUTO;
                ops.len       =3D 0;
                ops.retlen    =3D 0;
                ops.ooblen    =3D mtd->ecclayout->oobavail;
                ops.oobretlen =3D 0;
                ops.ooboffs   =3D 1;
                ops.datbuf    =3D NULL;
                ops.oobbuf    =3D readbuf;
                printk(PRINT_PREF "attempting to read past end of device\n"=
);
                printk(PRINT_PREF "an error is expected...\n");
                err =3D mtd->read_oob(mtd, mtd->size - mtd->writesize, &ops=
);
                if (err) {
                        printk(PRINT_PREF "error occurred as expected\n");
                        err =3D 0;
                } else {
                        printk(PRINT_PREF "error: read past end of device\n=
");
                        errcnt +=3D 1;
                }
        }

here, mtd->size is mtd partition size right? when the mtd partition is
not the last MTD partition, the error will happen.

I have tested on real NAND, while not on nandsim.

>
> which should handle the case AFAICS.
>
> So, although I did think hard about this, it looks like there is no
> problem. What is the kernel version you are looking at? I checked it
> with my l2-mtd-2.6.git, which is the latest mtd-2.6.git plus a revert
> commit of your patch:
>
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

Yes, as I have written the email to you before in a private email to
tell that this patch has issue and please drop it.

Thanks,

>
> --
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =9Ahttp://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =9Ahttp://www.tux.org/lkml/
>
