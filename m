Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGXfu-0000io-VD
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 21:30:37 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "andrew@lunn.ch"
 <andrew@lunn.ch>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, "Richard
 Weinberger" <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Date: Thu, 1 Jun 2017 21:30:07 +0000
Message-ID: <bba73e6d5f4b41a88423287300d892e5@svr-chch-ex1.atlnz.lc>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon> <20170601184340.GA102137@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/06/17 06:43, Brian Norris wrote:=0A=
> On Wed, May 17, 2017 at 05:29:11PM +0200, Boris Brezillon wrote:=0A=
>> Hi Chris,=0A=
>>=0A=
>> On Wed, 17 May 2017 17:39:07 +1200=0A=
>> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:=0A=
>>=0A=
>>> Setting the of_node for the mtd device allows the generic mtd code to=
=0A=
>>> setup the partitions. Additionally we must specify a non-zero erasesize=
=0A=
>>> for the partitions to be writeable.=0A=
>>>=0A=
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>>> ---=0A=
>>>  drivers/mtd/devices/mchp23k256.c | 5 +++++=0A=
>>>  1 file changed, 5 insertions(+)=0A=
>>>=0A=
>>> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mch=
p23k256.c=0A=
>>> index 2542f5b8b63f..02c6b9dcbd3e 100644=0A=
>>> --- a/drivers/mtd/devices/mchp23k256.c=0A=
>>> +++ b/drivers/mtd/devices/mchp23k256.c=0A=
>>> @@ -143,6 +143,7 @@ static int mchp23k256_probe(struct spi_device *spi)=
=0A=
>>>=0A=
>>>  	data =3D dev_get_platdata(&spi->dev);=0A=
>>>=0A=
>>> +	mtd_set_of_node(&flash->mtd, spi->dev.of_node);=0A=
>>>  	flash->mtd.dev.parent	=3D &spi->dev;=0A=
>>>  	flash->mtd.type		=3D MTD_RAM;=0A=
>>>  	flash->mtd.flags	=3D MTD_CAP_RAM;=0A=
>>> @@ -151,6 +152,10 @@ static int mchp23k256_probe(struct spi_device *spi=
)=0A=
>>>  	flash->mtd._read	=3D mchp23k256_read;=0A=
>>>  	flash->mtd._write	=3D mchp23k256_write;=0A=
>>>=0A=
>>> +	flash->mtd.erasesize =3D PAGE_SIZE;=0A=
>>> +	while (flash->mtd.size & (flash->mtd.erasesize - 1))=0A=
>>> +		flash->mtd.erasesize >>=3D 1;=0A=
>>> +=0A=
>>=0A=
>> Can we fix allocate_partition() to properly handle the=0A=
>> master->erasesize =3D=3D 0 case instead of doing that?=0A=
>=0A=
> Is everything actually ready for the eraseblock size to be 0?=0A=
=0A=
That was my initial motivation for faking it.=0A=
=0A=
> That would=0A=
> seem surprising to many applications, I would think. Can you, for=0A=
> instance, even use UBI on such a device?=0A=
=0A=
I've tried ext2 and I believe Andrew has tried minix fs. We're talking =0A=
SRAM so UBI/UBIFS doesn't really provide much benefit for this use-case.=0A=
=0A=
> BTW, I feel like this check is a little more natural to do with=0A=
> 'mtd->flags & MTD_NO_ERASE', rather than checking the (apparently=0A=
> meaningless) erasesize.=0A=
>=0A=
> (I realize there's a later version of these patches, but I figured I'd=0A=
> put my comments where the suggestion was brought up.)=0A=
>=0A=
> Brian=0A=
>=0A=
=0A=
