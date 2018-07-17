Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffY0J-0005Eg-RH
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 21:59:34 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Dinh Nguyen
 <dinguyen@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "thor.thayer@linux.intel.com" <thor.thayer@linux.intel.com>, Marek Vasut
 <marex@denx.de>
Subject: Re: [BUG] mtd: rawnand: mircon: Cannot detect chip with commit
 51f3b3970a8c
Date: Tue, 17 Jul 2018 21:59:16 +0000
Message-ID: <db049be9e08943b984c41733167cfec7@svr-chch-ex1.atlnz.lc>
References: <c3419bce-ecdb-b587-5e79-f75e34e7ef6c@kernel.org>
 <20180706192058.2464d86c@bbrezillon>
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

Hi Dinh, Boris,=0A=
=0A=
On 07/07/18 05:21, Boris Brezillon wrote:=0A=
> On Fri, 6 Jul 2018 12:03:49 -0500=0A=
> Dinh Nguyen <dinguyen@kernel.org> wrote:=0A=
> =0A=
>> Hi,=0A=
>>=0A=
>> It looks like commit: "51f3b3970a8c mtd: rawnand: micron: detect forced=
=0A=
>> on-die ECC" is causing the NAND chip on the SoCFPGA Arria10 devkit to=0A=
>> stop working on linux-next.=0A=
>>=0A=
>> If I revert the commit, then the NAND driver is able to detect the NAND=
=0A=
>> chip.=0A=
>>=0A=
>> The NAND chip is a Micron MT29F1G08ABBEAH4 part.=0A=
>>=0A=
>>=0A=
>> [    0.741984] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xa1=
=0A=
>> [    0.748336] nand: Micron MT29F1G08ABBEAH4=0A=
>> [    0.752330] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048,=
=0A=
>> OOB siz=0A=
>> e: 64=0A=
>>   [    0.763358] ecc.mode =3D 3=0A=
>> [    0.766312] On-die ECC forcefully enabled, not supported=0A=
>> [    0.771654] denali-nand-dt: probe of ffb90000.nand failed with error =
-22=0A=
>>=0A=
>> With commit reverted:=0A=
>>=0A=
>> [    0.742481] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xa1=
=0A=
>> [    0.748833] nand: Micron MT29F1G08ABBEAH4=0A=
>> [    0.752828] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048,=
=0A=
>> OOB siz=0A=
>> e: 64=0A=
>> [    0.760610] Bad block table found at page 65472, version 0x01=0A=
>> [    0.766433] Bad block table found at page 65408, version 0x01=0A=
>> [    0.772464] 2 fixed-partitions partitions found on MTD device denali-=
nand=0A=
>> [    0.779247] Creating 2 MTD partitions on "denali-nand":=0A=
>> [    0.784453] 0x000000000000-0x000001c00000 : "Boot and fpga data"=0A=
>> [    0.791241] 0x000001c00000-0x000008000000 : "Root Filesystem - JFFS2"=
=0A=
>>=0A=
>> Looks like if I comment out this part of the patch in=0A=
>> drivers/mtd/nand/raw/nand_micron.c=0A=
>>=0A=
>> +#if 0=0A=
>>          for (i =3D 0; i < ARRAY_SIZE(micron_on_die_ecc); i++)=0A=
>>                  if (chip->id.data[1] =3D=3D micron_on_die_ecc[i])=0A=
>>                          return MICRON_ON_DIE_MANDATORY;=0A=
>> -=0A=
>> +#endif=0A=
> =0A=
> Oops, I overlooked that detail. Testing only the ID bytes is not=0A=
> enough, because it does not encode whether the NAND has on-die ECC or=0A=
> not. We should really test the model name here...=0A=
> =0A=
> Chris, can you prepare a fixup for that?=0A=
> =0A=
=0A=
With the latest set of changes is there anything left to do for this? I =0A=
think we now have on-die ECC detection that doesn't require checking the ID=
.=0A=
