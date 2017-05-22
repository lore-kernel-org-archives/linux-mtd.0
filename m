Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCfL4-0006kh-GK
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 04:53:07 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Date: Mon, 22 May 2017 04:52:34 +0000
Message-ID: <31c94577108c42c1b51d410081d97eb5@svr-chch-ex1.atlnz.lc>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon>
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

On 18/05/17 03:29, Boris Brezillon wrote:=0A=
> Hi Chris,=0A=
> =0A=
> On Wed, 17 May 2017 17:39:07 +1200=0A=
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> Setting the of_node for the mtd device allows the generic mtd code to=0A=
>> setup the partitions. Additionally we must specify a non-zero erasesize=
=0A=
>> for the partitions to be writeable.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>   drivers/mtd/devices/mchp23k256.c | 5 +++++=0A=
>>   1 file changed, 5 insertions(+)=0A=
>>=0A=
>> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp=
23k256.c=0A=
>> index 2542f5b8b63f..02c6b9dcbd3e 100644=0A=
>> --- a/drivers/mtd/devices/mchp23k256.c=0A=
>> +++ b/drivers/mtd/devices/mchp23k256.c=0A=
>> @@ -143,6 +143,7 @@ static int mchp23k256_probe(struct spi_device *spi)=
=0A=
>>   =0A=
>>   	data =3D dev_get_platdata(&spi->dev);=0A=
>>   =0A=
>> +	mtd_set_of_node(&flash->mtd, spi->dev.of_node);=0A=
>>   	flash->mtd.dev.parent	=3D &spi->dev;=0A=
>>   	flash->mtd.type		=3D MTD_RAM;=0A=
>>   	flash->mtd.flags	=3D MTD_CAP_RAM;=0A=
>> @@ -151,6 +152,10 @@ static int mchp23k256_probe(struct spi_device *spi)=
=0A=
>>   	flash->mtd._read	=3D mchp23k256_read;=0A=
>>   	flash->mtd._write	=3D mchp23k256_write;=0A=
>>   =0A=
>> +	flash->mtd.erasesize =3D PAGE_SIZE;=0A=
>> +	while (flash->mtd.size & (flash->mtd.erasesize - 1))=0A=
>> +		flash->mtd.erasesize >>=3D 1;=0A=
>> +=0A=
> =0A=
> Can we fix allocate_partition() to properly handle the=0A=
> master->erasesize =3D=3D 0 case instead of doing that?=0A=
> =0A=
=0A=
Do you mean something like this?=0A=
=0A=
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c=0A=
index ea5e5307f667..0cd20ed6b374 100644=0A=
--- a/drivers/mtd/mtdpart.c=0A=
+++ b/drivers/mtd/mtdpart.c=0A=
@@ -577,6 +577,7 @@ static struct mtd_part *allocate_partition(struct =0A=
mtd_info *master,=0A=
                         part->name);=0A=
         }=0A=
         if ((slave->mtd.flags & MTD_WRITEABLE) &&=0A=
+           master->erasesize !=3D 0 &&=0A=
             mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {=0A=
                 slave->mtd.flags &=3D ~MTD_WRITEABLE;=0A=
=0A=
=0A=
I'm happy to submit this as a formal patch but it could potentially =0A=
affect a number of devices. Whereas the snippet I initially added is =0A=
consistent with drivers/mtd/chips/map_ram.c.=0A=
=0A=
For now I'll leave v2 as-is but I can send a v3 if needed.=0A=
=0A=
