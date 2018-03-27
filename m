Received: from mail-io0-x233.google.com ([2607:f8b0:4001:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0vGH-0002Z1-GS
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 20:32:06 +0000
Received: by mail-io0-x233.google.com with SMTP id y128so834725iod.4
 for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2018 13:31:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <21454318.LBOlOGBNfX@blindfold>
References: <20180303222903.27767-1-linus.walleij@linaro.org>
 <21454318.LBOlOGBNfX@blindfold>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Mar 2018 22:31:51 +0200
Message-ID: <CACRpkdaGsEAX01pd+OiP0Vys9jQZGeqioM6c3VreDcTMSKfY6Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: jedec_probe: Fix crash in jedec_read_mfr()
To: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
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

On Tue, Mar 27, 2018 at 9:02 PM, Richard Weinberger <richard@nod.at> wrote:
> Am Samstag, 3. M=C3=A4rz 2018, 23:29:03 CEST schrieb Linus Walleij:

>> It turns out that the loop where we read manufacturer
>> jedec_read_mfd() can under some circumstances get a
>> CFI_MFR_CONTINUATION repeatedly, making the loop go
>> over all banks and eventually hit the end of the
>> map and crash because of an access violation:
>>
>>               uint32_t ofs =3D cfi_build_cmd_addr(0 + (bank << 8), map, =
cfi);
>>               mask =3D (1 << (cfi->device_type * 8)) - 1;
>> +             if (ofs >=3D map->size)
>> +                     return 0;
>>               result =3D map_read(map, base + ofs);
>>               bank++;
>>       } while ((result.x[0] & mask) =3D=3D CFI_MFR_CONTINUATION);
>
> The fix is legit but I'm not sure whether we should emit a warning in thi=
s
> case too since something is obviously wrong.

What is wrong is perhaps our way of probing JEDEC
Flashes: the condition is hit when accessing a device on a
16bit bus in 8bit mode, which is what the probe code tries
before it tries 16bit.

However there are clear comments in the
code (above jedec_match()) indicating that it is impossible
to do a perfect probe routine so this could be expected to
happen to some extent,I am merely amending an issue that
may be unfixable.

Yours,
Linus Walleij
