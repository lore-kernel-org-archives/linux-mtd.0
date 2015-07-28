Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK6iD-0003uZ-W9
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 15:22:38 +0000
Received: by igr7 with SMTP id 7so121177197igr.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2015 08:22:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201507281633.47322.marex@denx.de>
References: <cover.1438073915.git.hramrach@gmail.com>
 <c9120b0590effa9ea7e60ef805782de70b5336ea.1438073915.git.hramrach@gmail.com>
 <201507281633.47322.marex@denx.de>
Date: Tue, 28 Jul 2015 17:22:17 +0200
Message-ID: <CACna6ryGDsL4cP_tvWrZ+wkBx3_+PhP1mu2RzS32HzBbB2kCmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add Pm25LD020 and GD25Q41B chip ID.
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Michal Suchanek <hramrach@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On 28 July 2015 at 16:33, Marek Vasut <marex@denx.de> wrote:
> On Tuesday, July 28, 2015 at 11:07:58 AM, Michal Suchanek wrote:
>> First chip reads Pm25LD020 or Pm25L0020. Found on some WD HDD PCB.
>> Identified as PMC Pm25LD020.
>> Flash read does not return consistent data which explains why the disk
>> died.
>>
>> Second chip reads something like 25Q41BT. Found on Esspif ESP8266 based
>> ESP-01 board. Identified as Giga Devices GD25Q41B.
>>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor=
.c
>> index cba3bd0..e55689d 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -558,6 +558,7 @@ static const struct spi_device_id spi_nor_ids[] =3D =
{
>>       { "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) =
},
>>
>>       /* GigaDevice */
>> +     { "gd25q41b", INFO(0xc84013, 0, 64 * 1024,  8, SECT_4K) },
>>       { "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
>>       { "gd25lq32c", INFO(0xc86016, 0, 64 * 1024,  64, SECT_4K) },
>>       { "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
>> @@ -601,6 +602,7 @@ static const struct spi_device_id spi_nor_ids[] =3D =
{
>>       /* PMC */
>>       { "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) }=
,
>>       { "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) }=
,
>> +     { "pm25ld020",   INFO(0x7f9d22, 0, 64 * 1024,    4, SECT_4K) },
>>       { "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
>>
>>       /* Spansion -- single (large) sector size only, at least
>
> You might want to split this into two patches, but see my comment on 1/2
> and please wait for Brian's confirmation there before you do anything.

Since these flashes are from 2 different vendors, it may make sense to
use 2 separated patches. I don't care too much however.

Adding these entries is OK in general.

--=20
Rafa=C5=82
