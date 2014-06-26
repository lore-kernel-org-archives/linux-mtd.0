Received: from mail-qa0-x234.google.com ([2607:f8b0:400d:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X00tO-0005cW-H0
 for linux-mtd@lists.infradead.org; Thu, 26 Jun 2014 04:02:35 +0000
Received: by mail-qa0-f52.google.com with SMTP id w8so2385887qac.11
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2014 21:02:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAF7560@DBDE04.ent.ti.com>
References: <1403259137-22171-1-git-send-email-david@protonic.nl>
 <CAE94FHELXgoZ9Jm1E3_YT6D1SB=VAGWthZSjbsR+qqkUWn97PA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF6A08@DBDE04.ent.ti.com>
 <CAE94FHGNHDVygoviGgEtE2ZDyumjwa73tZiDnEBdSnnWCE03YQ@mail.gmail.com>
 <CAE94FHFvCoZyawRC=LL+PdBR3ig10crKJN6c_M_q=yGdOXnR9A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF7560@DBDE04.ent.ti.com>
Date: Thu, 26 Jun 2014 12:02:12 +0800
Message-ID: <CAE94FHHdznCqXMsrkFB6MDdDLaX7__v53myDgQj0yiSO-L6puw@mail.gmail.com>
Subject: Re: [FRC] [PATCH] MTD: nand_base.c: Enable support for Samsung E-die
 SLC NAND
From: Ted Juan <ted.juan@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Jander <david@protonic.nl>,
 "sjhill@realitydiluted.com" <sjhill@realitydiluted.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon and David,

Thanks your help and suggestions.

Sorry David, hijacked your thread.

The E-die 21nm  SLC NOP=3D1 , not 4.
It means it doesn't support partial write.

Anyone give any comment for the patch,please.


2014-06-25 18:04 GMT+08:00 Gupta, Pekon <pekon@ti.com>:
> Hi Ted,
>
>>
> (a) In that case you should contact the Flash vendor here.
> Fresh NAND device from factory should not violate the spec.
> I don't suspect a driver issue here, because the raw data read itself
> has random bit-flips.
>

OK, I'll try to contact Flash vendor to get more clue.


> (b) Also, it may be the case that there few particular blocks which has g=
one
> bad and those are is showing again and again at each boot. However, If it
> was such a case that only some handful blocks on NAND device have gone
> bad, then UBI torture test [1] should have detected them and marked them
> bad. And those should not re-appear in next time.
> - You can check (b) by scrubbing all bad-blocks from u-boot
>   #u-boot> nand scrub.chip all
>   #u-boot> nand bad  (should report 0 bad blocks)
> - Then, re-boot and let UBI detect bad-blocks on its own using torture-te=
st
> - And then again reset the system 2nd time and check newly detected bad-b=
locks
>   #u-boot> nand bad  (should report [n] bad blocks)
>

I'll do the torture test later. Does it mean torture test just can
seriously filter the bad block, but erase command cannot?


> (c) You can also check, if you are seeing bit-flips only during erased-pa=
ges ?
> You can identify this by adding prints in u-boot.
> There is slight difference in u-boot and kernel omap-gpmc NAND drivers,
> - u-boot: simply ignores erased-pages and does not check for bit-flips in=
 them.
> - kernel: counts number of bit-flips in erased-pages also.
>

  for (i =3D 0; i < blockCnt; i++) {
    /* check if any ecc error */
    eccflag =3D 0;
    for (j =3D 0; (j < eccsize) && (eccflag =3D=3D 0); j++)
      if (calc_ecc[j] !=3D 0)
        eccflag =3D 1;

    if (eccflag =3D=3D 1) {
      eccflag =3D 0;
      for (j =3D 0; (j < eccsize) && (eccflag =3D=3D 0); j++)
        if (read_ecc[j] !=3D 0xFF)
          eccflag =3D 1;
    }
   if (eccflag =3D=3D 1) {
       count =3D decode_bch(mode, calc_ecc, err_loc);


The above code is cut from uboot.
In this case, it should enter the decode_bch(), and decode fail, right?


>
> There will be no correction done if 'un-correctable error' flag is raised=
 by ELM.
> Therefore pre-correction and post-correction data matches in below dump.
> Bit-flip correction will _only_ happen if the number of bit-flips are wit=
hin
> correctable range (that is <=3D8 for BCH8 ECC scheme).
>

I see. thanks.


>> Plz relax timing by 10-20% and check if that makes a difference.

The below is my gpmc register value dump from kernel.
gpmc cs[0] config1 =3D 0x00600800
gpmc cs[0] config2 =3D 0x00050500
gpmc cs[0] config3 =3D 0x00050401
gpmc cs[0] config4 =3D 0x04010601
gpmc cs[0] config5 =3D 0x00070808
gpmc cs[0] config6 =3D 0x04000000
gpmc cs[0] config7 =3D 0x00000f48


The link is Flash timing report according the above config.
https://drive.google.com/file/d/0BwVGpNFs7l22bkhmQ2FFcVZXQk0/edit?usp=3Dsha=
ring

I also tried to use chip->delay=3D50 to replace R/B wait, but the result
is the same.

K9F1G08U0E vs K9F1G08U0D Timing is a little difference.

                          =E3=80=80 tR t         PROG       tBERS NOP
K9F1G08U0E Max. 40us Max. 900us Max. 16ms 1
K9F1G08U0D Max. 40us Max. 750us Max. 10ms 4

We test the D-die that never happen this issue.


>>Please bear in mind that the erase can be successful for the first few
>>(milli-)seconds. If the power supply was out of specs during erase, it is
>>perfectly possible that a few random bits flip back to "programmed" state=
 after
>>a while. That would not be caught by the status check.
>>That is a good idea to check, but I would also try to influence the
>>power-supply or -decoupling to see if that is sensible variable.
>>Do you have cold-spray? Try to use it and see if it affects the result.

Thanks. But the D-die is in this environment is ok. BTW, I'll double
check with HW guy.

regards,

Ted
