Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLkuW-0004ov-5a
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 07:43:48 +0000
Received: by mail-vk0-x242.google.com with SMTP id x66-v6so398298vka.11
 for <linux-mtd@lists.infradead.org>; Thu, 24 May 2018 00:43:32 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <4ecb6215-699b-b714-cab5-cb237e883ec7@microchip.com>
References: <20180426161820.2852-1-boris.brezillon@bootlin.com>
 <20180426161820.2852-7-boris.brezillon@bootlin.com>
 <6a39f071-186e-7009-994d-af845ce3f75d@microchip.com>
 <4ecb6215-699b-b714-cab5-cb237e883ec7@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 May 2018 09:43:27 +0200
Message-ID: <CAMuHMdX1QzEu9i6mpamzUth7VMfJVLJ_0TzVcess7UJ=YvCxRg@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] mtd: spi-nor: Use the spi_mem_xx() API
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, Vignesh R <vigneshr@ti.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
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

Hi Cyrille,

On Wed, May 23, 2018 at 5:56 PM, Cyrille Pitchen
<cyrille.pitchen@microchip.com> wrote:
> Le 23/05/2018 =C3=A0 17:44, Cyrille Pitchen a =C3=A9crit :
>> Le 26/04/2018 =C3=A0 18:18, Boris Brezillon a =C3=A9crit :
>>>  static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, i=
nt len)
>>>  {
>>>      struct m25p *flash =3D nor->priv;
>>> -    struct spi_device *spi =3D flash->spi;
>>> -
>>> -    flash->command[0] =3D opcode;
>>> -    if (buf)
>>> -            memcpy(&flash->command[1], buf, len);
>>> +    struct spi_mem_op op =3D SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 1),
>>> +                                      SPI_MEM_OP_NO_ADDR,
>>> +                                      SPI_MEM_OP_NO_DUMMY,
>>
>> I didn't test nor compiled to verify but I have some doubt:
>> here the 'op' variable is allocated on the stack and both definitions
>> of SPI_MEM_OP_NO_ADDR and SPI_MEM_OP_NO_DUMMY macros are { }.
>>
>> It might be some rule of the C language that I ignore but are we guarant=
eed
>> that the .nbytes member of both structures is actually initialized to 0 =
?
>>
>> I would say no: I think since the structure is allocated on the stack al=
l
>> members not being explicitly initialized are left uninitialized by the
>> compiler when it generates the assembler code. However, I'm not 100% sur=
e of
>> that.
>
> Actually, I'm reading that with C99 extensions, "omitted field members ar=
e
> implicitly initialized the same as objects that have static storage durat=
ion."
> https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html

JFTR, omitted field members are.
But IIRC, implicit gaps due to alignment rules aren't, which mostly matters
for leaking random data to userspace.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
