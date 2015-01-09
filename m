Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9Rlv-0002UE-Dn
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 05:06:08 +0000
Received: by mail-ie0-f169.google.com with SMTP id y20so13344727ier.0
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 21:05:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54A8B91B.1090604@atmel.com>
References: <CALupW3Dv=OvY-5y_ScG1St8HUBYfXYpTnYAWDt_GJ+3+7KmC9Q@mail.gmail.com>
 <54A359AE.3080105@atmel.com>
 <CALupW3D=q9wSTUxCAp9EVDjd5LwPOhJOYbV9OL0QVJd4G1nH2A@mail.gmail.com>
 <54A8B91B.1090604@atmel.com>
Date: Thu, 8 Jan 2015 21:05:45 -0800
Message-ID: <CALupW3B13bd+oPgXL2oZ7ECTjYE0-q6uj8Y-WZA-ggjwLtCgoQ@mail.gmail.com>
Subject: Re: Does UBIFS NAND ECC info get stored in OOB?
From: Steve deRosier <derosier@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Josh,

On Sat, Jan 3, 2015 at 7:52 PM, Josh Wu <josh.wu@atmel.com> wrote:
> Hi, Steve
>
> On 1/3/2015 2:06 AM, Steve deRosier wrote:
>>
>
> There seems has some UBI fix on 3.8.x stable tree. It is better if you ca=
n
> apply these fixes.
>
> =E2=9E=9C  mainline git:(99f3cd5) =E2=9C=97  git log --oneline v3.8..v3.8=
.13 | grep -i UBI
> 1afae69 UBIFS: make space fixup work in the remount case
> d90dc15 UBIFS: fix double free of ubifs_orphan objects
> ce7f4e8 UBIFS: fix use of freed ubifs_orphan objects

Will do!  I had pulled in a number of other upstreamed fixes but these
must be newer than last time I looked. Thanks!



>
> For at91sam9x5ek PMECC, we cannot do pmecc correction for the erased
> page(all 0xff) if there has some bit flips.
> The reason is 9x5ek PMECC will generate non-0xff ecc code for the erased
> page(all 0xff in the page).
>
> This will case issues:
> 1. if there is any bitflip happen in erased page's oob area, that will ca=
use
> PMECC error.
> 2. if there is any bitflip happen in erased pages' data area, This bitfli=
p
> cannot be correct. And driver won't report any ECC error. I am not sure
> whether this can cause problem? As the UBI  may record the erased page, s=
o
> the data corruption maybe doesn't matter. When UBI write data to this
> bitfliped erased page, as the PMECC code will write correctly into oob ar=
ea.
> So this bitflip can be corrected by PMECC hardware.
>
> I think you can manually insert bitflip into the erased page to see wheth=
er
> this cause your issue.

Well, our issue is clearly caused by the use of `nandflash -n`.
Moving to ubiformat fixes it.

But, what you pointed out made me interested in a few more problem scenario=
s:

1. Bitflip in ECC data of a valid data page
2. Bitflip in data area of an erased page
3. Bitflip in the ECC data of an erased page.

So I tried them.  I was hoping for the best and fearing the worst.
Thankfully I effectively got the best.
1. This was the scary one for me. But, it seems that this is handled
nicely by the ECC process. dmesg printed:
    atmel_nand 40000000.nand: Bit flip in OOB, oob_byte_pos: 48,
bit_pos: 0, 0xec -> 0xed
This is awesome, it found the flip, identified where it was and fixed it. Y=
ay.

Both 2 and 3 were non-events.  As near as I could tell, UBIFS and the
MTD system ignored those. I have some special code that noticed it,
but none of the stock stuff did.  Writing and reading data there
worked fine.  And, I'd expect that if the flip caused a flip in data
that was written and later corrected, it would be fine.

>
> These seems ok.
> Be caution: if you use 1024 as sector size, you need apply the fix:
> 2fa831f9db1f <mtd: atmel_nand: pmecc: fix failure to correct bit error in
> 1024-bytes sector>
>

Thanks for the heads up on this fix.  We're using 512, but after
reading some stuff, I'm thinking that going to 1024 might make some
sense, so I might need that.

Thanks,
- Steve
