Received: from qw-out-1920.google.com ([74.125.92.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MK9Vx-0001lv-Jy
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 11:22:48 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1155265qwf.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Jun 2009 04:22:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200906252256.16902.david-b@pacbell.net>
References: <200906252128.08460.david-b@pacbell.net>
	<ce9ab5790906252217s1a5a8279l58a2111b3ac79786@mail.gmail.com>
	<200906252256.16902.david-b@pacbell.net>
Date: Fri, 26 Jun 2009 16:52:40 +0530
Message-ID: <ce9ab5790906260422q136ed6e1p41593ece4b5fe319@mail.gmail.com>
Subject: Re: query: nand read/write method for 2048 + 64 byte page
From: vimal singh <vimal.newwork@gmail.com>
To: David Brownell <david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 26, 2009 at 11:26 AM, David Brownell<david-b@pacbell.net> wrote=
:
> On Thursday 25 June 2009, vimal singh wrote:
>> > =A0- Second, I believe that you will see some issues if you
>> > =A0 try to have ECC cover the OOB too. =A0Problem being that
>> > =A0 the raw_write primitives are used to write OOB data and
>> > =A0 they don't believe it will be ECC protected.
>>
>> My point is to protect OOB too (other than ECC bytes).
>> So, should we implement new OOB area read/write primitives to support th=
is?
>
> It's not so much a case of "can it be done"; you may have
> noticed that ECC_HW_SYNDROME can do that. =A0While that layout
> is problematic, it certainly allows for "prepad" data to be
> included in the ECC. =A0For a 2K page, with 7 ECC bytes for
> each 512+9 bytes of data, the page layout is
>
> =A0 =A0 =A0 =A04 * (512 bytes data + 9 bytes OOB + 7 bytes ECC)

The problem is that HW ECC engine in BCH mode dose not provide any
possible configuration where we can keep ECC bytes in main area
itself. OOB + ECC data has to be in only spare area.

Would it not be the good idea to perform read/write for full (2112 bytes) p=
age?
And enable HW_ECC before read/write and then call for ecc.calculate or
ecc.correct accordingly. Rest all things can be taken care by
underlying controller driver.

>
> where prepad =3D=3D 9 ... but such layouts have obvious nasty
> characteristics, since you can't DMA the whole 2K of data
> in one chunk, and since it clobbers manufacturer bad block
> markers.
>
> (FWIW I call such layouts "Infix OOB", where the Out-of-Band
> data is actually not out-of-band in the spare area.)
>
>
> Or if the hardware allows you could just use 521 byte ECC
> chunks (8-bit NAND only!) and when you run out of 2K page
> buffer, roll directly into the OOB data. =A0You'd have to
> provide i/o methods that manage OOB and ECC data that way,
> but that seems like it'd suffice as a driver-specific kind
> of override, using ECC_HW and your matching ecclayout.
>
>
>> And in that case how will we be handling those cases where spare bytes
>> are protected by clubbing them with main area bytes to generate ECC?
>> (as example in my previous mail)
>
> You haven't addressed my observation that there's software
> out there which is going to be writing the OOB data and yet
> not expecting it to invalidate the ECC... as in, maybe you
> want to change a version byte from 0x0f to 0x10. =A0That has
> the look of a five bit ECC error! =A0Or from 0x10 to 0x11,
> well that's an easily corrected single bit error.
>
> - Dave
>
>
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
