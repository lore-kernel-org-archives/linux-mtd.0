Received: from cpanel5.proisp.no ([209.85.100.29])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PSWVW-00039x-As
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 15:09:40 +0000
Received: from mail-gw0-f48.google.com ([74.125.83.48]:41283)
	by cpanel5.proisp.no with esmtpsa (TLSv1:RC4-MD5:128) (Exim 4.69)
	(envelope-from <oyvind.harboe@zylin.com>) id 1PSWVR-0002pg-UM
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:09:34 +0100
Received: by gwaa20 with SMTP id a20so499061gwa.21
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 07:09:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTikJ3UTQ-D01FX8fSEGgcuG-fXEhAw6h4z9pwkRX@mail.gmail.com>
References: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
	<AANLkTikJ3UTQ-D01FX8fSEGgcuG-fXEhAw6h4z9pwkRX@mail.gmail.com>
Date: Tue, 14 Dec 2010 16:09:33 +0100
Message-ID: <AANLkTinBpNA9VGB3druyijTKVhK4aDLDc-f=MgKZ4NK6@mail.gmail.com>
Subject: Re: Faster flash_eraseall for NOR flash
From: =?UTF-8?Q?=C3=98yvind_Harboe?= <oyvind.harboe@zylin.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

thanks for the feedback!

>> I've added an option to skip already erased CFI blocks. This
>> includes checking if the JFFS2 cleanmarker is written.
>
> i dont think -f/--fast is the right name. =C2=A0how about something a bit
> more explicit like --skip-erased ?

Sounds good to me.

> why cant this also be used for NAND ? =C2=A0all the NAND devices i use ha=
ve
> 0xff when erased.

I don't have any NAND to test with, nor am I terribly familiar with
NAND.

I think it would be good to limit this patch to NOR flash that I
can actually test and know something about. Also NAND flash
doesn't have the horrible erase performance issues, so it
might not be worth it from the point of view that it adds a new
code path.

Will it be acceptable to limit this patch to NOR flash and
pass the buck on NAND flash to someone
more familiar with NAND flash, who can test it and knows
whether or not it makes much sense?

> other random problems:
> =C2=A0- the coding style of this patch is incorrect. =C2=A0please review =
the
> style found in the rest of the file. =C2=A0such as brace placement and
> spaces in function calls.

I did make an effort to follow the style, so any mismatch with
the existing style is just because I'm white-space blind. Much
like color blindness, it happens when you see enough different
formatting rules. The most annoying is of course code that
doesn't follow any rules, so I'll see about getting this fixed.

> =C2=A0- your patch is not against the master branch -- there is no
> "flash_eraseall.c" file anymore.

k.

> =C2=A0- once you update, your code will look vastly different as there ar=
e
> helpers to do memory allocation/error output/etc...

k.

> =C2=A0- better to use pread() rather than lseek()/read().

Didn't know that one. Looks nice though!



--=20
=C3=98yvind Harboe

Can Zylin Consulting help on your project?

US toll free 1-866-980-3434 / International +47 51 63 25 00

http://www.zylin.com/zy1000.html
ARM7 ARM9 ARM11 XScale Cortex
JTAG debugger and flash programmer
