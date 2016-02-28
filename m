Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aa6ff-0007hN-GU
 for linux-mtd@lists.infradead.org; Sun, 28 Feb 2016 19:06:24 +0000
Received: by mail-wm0-x230.google.com with SMTP id n186so21611567wmn.1
 for <linux-mtd@lists.infradead.org>; Sun, 28 Feb 2016 11:06:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACna6rzvikqy1kaL6P9GRP6ibvnoY=gAdFhFmutyQaTW+NnH1g@mail.gmail.com>
References: <1456538836-27449-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <CACna6rzvikqy1kaL6P9GRP6ibvnoY=gAdFhFmutyQaTW+NnH1g@mail.gmail.com>
Date: Sun, 28 Feb 2016 16:06:00 -0300
Message-ID: <CAAEAJfC4rA7W3FgB1mFObN=+_wE+arg=kLHni-=Wo3GzALcZVg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: update flags for n25q128a
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Gregory Clement <gregory.clement@free-electrons.com>
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

On 27 February 2016 at 08:25, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wr=
ote:
> On 27 February 2016 at 03:07, Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
>> @@ -864,8 +864,12 @@ static const struct flash_info spi_nor_ids[] =3D {
>>         { "n25q032a",    INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD=
_READ) },
>>         { "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SP=
I_NOR_QUAD_READ) },
>>         { "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SP=
I_NOR_QUAD_READ) },
>> -       { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SPI_NOR_QUAD=
_READ) },
>> -       { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SPI_NOR_QUAD=
_READ) },
>> +       { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256,
>> +                SECT_4K | SPI_NOR_QUAD_READ |
>> +                SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>> +       { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256,
>> +                SECT_4K | SPI_NOR_QUAD_READ |
>> +                SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>
> We use one line per chip, so please keep stick to this formatting. I
> can guess you wanted to follow kernel's coding style, but this adds
> inconsistency. Also kernel's coding style allows lines over 80 chars
> for better readibility. If we are ever going to change it, it should
> be a separated patch affecting all entries.
>

Sure, I can do that.

Also, I'll drop the HAS_LOCK and HAS_TB flags for now. These devices
need more work
for protection to work properly.

The protection is handled with TB, BP3-BP0 and currently we only
support TB,BP2-BP0.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
