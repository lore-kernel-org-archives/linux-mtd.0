Received: from mail1.bemta8.messagelabs.com ([216.82.243.209])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFQYV-0002ey-Id
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 15:24:12 +0000
Message-ID: <5220B8F6.3080405@digi.com>
Date: Fri, 30 Aug 2013 17:23:34 +0200
From: Hector Palacios <hector.palacios@digi.com>
MIME-Version: 1.0
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com> <20130831025344.GA9971@gmail.com>
In-Reply-To: <20130831025344.GA9971@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/31/2013 04:53 AM, Huang Shijie wrote:
> On Fri, Aug 30, 2013 at 04:24:53PM +0200, Hector Palacios wrote:
>> >Dear Huang,
>> >
>> >On 08/30/2013 11:55 AM, Huang Shijie wrote:
>>> > >于 2013年08月30日 17:15, Hector Palacios 写道:
>>>> > >>Hello,
>>>> > >>
>>>> > >>Working on my custom platform based on i.MX28 (and also with the
>>>> > >>MX28EVK) I checked that I cannot mount JFFS2 nand partitions because
>>>> > >>I'm getting this error:
>>>> > >>
>>>> > >>jffs2: inconsistent device description
>>>> > >>
>>>> > >>which seems to have to do with the OOB area of the NAND.
>>>> > >>I saw patchset [1] from Huang Shijie which seems to be related to the
>>>> > >>issue. I just wanted to confirm if other people has the same problem
>>>> > >>and if the patchset really aims to solve this, or mine is a different
>>>> > >>issue.
>>>> > >>
>>> > >yes, this patch set aims to solve this.
>>> > >
>>> > >You can try the SLC on the imx28.
>>> > >
>>> > >I only tested the SLC On the imx6q.
>> >
>> >I applied the patchset but I still get the same error when trying to
>> >mount a JFFS2 filesystem. My nand is:
>> >
>> >[    0.819654] ONFI param page 0 valid
>> >[    0.823179] ONFI flash detected
>> >[    0.826344] NAND device: Manufacturer ID: 0x2c,Chip ID: 0xaa (Micron MT29F2G08ABBEAH4)
>> >[    0.834455] NAND device: 256MiB, SLC, page size: 2048, OOB size: 64
>> >
> Could you print out the spare bytes of the oob area?
>
> ---
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index cc0306b..5461189 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -217,6 +217,7 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
>   	if (geo->page_size < mtd->writesize + mtd->oobsize) {
>   		of->offset = geo->page_size - mtd->writesize;
>   		of->length = mtd->oobsize - of->offset;
> +		printk("[ %s ] %d, %d\n", __func__, of->offset, of->length);
>   	}
>
>   	geo->payload_size = mtd->writesize;

Sorry, what repo/branch did you base your original patchset on? The patchset did not 
apply correctly and this one you sent won't apply either because the function 
set_geometry_by_ecc_info() does not exist. Instead, it is called 
common_nfc_set_geometry(). I'm using a v3.10 kernel but this driver has not changed 
since then (at least in the vanilla kernel).

I took a dump in U-Boot of the first sector of the JFFS2 partition, in case it helps:

Page 07c00000 dump:
         e0 ff ff ff ff ff ff ff  ff ff 85 19 01 e0 2b 00
         00 00 e6 6e 26 7d 01 00  00 00 00 00 00 00 02 00
         00 00 e9 07 98 4f 03 04  00 00 99 f9 4e ee ff 83
         66 55 62 69 6e ff 85 19  02 e0 44 00 00 00 1d fb
         f7 98 02 00 00 00 01 00  00 00 ed 41 00 00 00 00
         00 00 00 00 00 00 e9 07  98 4f e9 07 98 4f e9 07
         98 4f 00 00 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 b0 3a  0f 4f 85 19 01 e0 2b 00
         00 00 e6 6e 26 7d 01 00  00 00 01 00 00 00 03 00
         00 00 e9 07 98 4f 03 04  00 00 67 24 83 db 17 28
         32 ee 64 65 76 ff 85 19  02 e0 44 00 00 00 1d fb
         f7 98 03 00 00 00 01 00  00 00 ed 41 00 00 00 00
         00 00 00 00 00 00 e9 07  98 4f e9 07 98 4f e9 07
         98 4f 00 00 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 6c d6  be 72 85 19 01 e0 2b 00
         00 00 e6 6e 26 7d 01 00  00 00 02 00 00 00 04 00
         00 00 e9 07 98 4f 03 04  00 00 1a 79 d3 86 db 85
         f4 d1 65 74 63 ff 85 19  02 e0 44 00 00 00 1d fb
         f7 98 04 00 00 00 01 00  00 00 ed 41 00 00 00 00
         00 00 00 00 00 00 e9 07  98 4f e9 07 98 4f e9 07
         98 4f 00 00 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 78 50  ab c2 85 19 01 e0 2c 00
         00 00 5f 56 f1 e0 01 00  00 00 03 00 00 00 05 00
         00 00 e9 07 98 4f 04 04  00 00 5d 9c c9 2e cc d3
         92 50 68 6f 6d 65 85 19  02 e0 44 00 00 00 1d fb
         f7 98 05 00 00 00 01 00  00 00 ed 41 00 00 00 00
         00 00 00 00 00 00 e9 07  98 4f e9 07 98 4f e9 07
         98 4f 00 00 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 a4 bc  1a ff 85 19 01 e0 2b 00
         00 00 e6 6e 26 7d 01 00  00 00 04 00 00 00 06 00
         00 00 e9 07 98 4f 03 04  00 00 61 8e 79 39 de e2
         4e 56 6c 69 62 ff 85 19  02 e0 44 00 00 00 1d fb
         f7 98 06 00 00 00 01 00  00 00 4e 8f 5f dd be 9a
         44 2a 69 14 9a f9 70 ed  41 00 00 00 00 00 00 00
         00 00 00 e9 07 98 4f e9  07 98 4f e9 07 98 4f 00
         00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 c0 89 c8 b9 85  19 01 e0 2d 00 00 00 3a
         31 4d 58 01 00 00 00 05  00 00 00 07 00 00 00 e9
         07 98 4f 05 0a 00 00 49  21 41 23 11 56 0e ac 6d
         65 64 69 61 ff ff ff 85  19 02 e0 4e 00 00 00 79
         1b 4a f7 07 00 00 00 01  00 00 00 ff a1 00 00 00
         00 00 00 0a 00 00 00 e9  07 98 4f e9 07 98 4f e9
         07 98 4f 00 00 00 00 0a  00 00 00 0a 00 00 00 00
         00 00 00 37 4e 6b ee 40  15 33 ba 2f 74 6d 70 2f
         6d 65 64 69 61 ff ff 85  19 01 e0 2b 00 00 00 e6
         6e 26 7d 01 00 00 00 06  00 00 00 08 00 00 00 e9
         07 98 4f 03 0a 00 00 16  55 76 5d 7f ab 19 ec 6d
         6e 74 ff 85 19 02 e0 4c  00 00 00 f2 d3 43 5d 08
         00 00 00 01 00 00 00 ff  a1 00 00 00 00 00 00 08
         00 00 00 e9 07 98 4f e9  07 98 4f e9 07 98 4f 00
         00 00 00 08 00 00 00 08  00 00 00 00 00 00 00 9e
         6c 81 61 02 67 03 aa 2f  74 6d 70 2f 6d 6e 74 85
         19 01 e0 2b 00 00 00 e6  6e 26 7d 01 00 00 00 07
         00 00 00 09 00 00 00 e9  07 98 4f 03 04 00 00 e2
         a5 25 62 8d 0a e2 b8 6e  66 73 ff 85 19 02 e0 44
         00 00 00 1d fb f7 98 09  00 00 00 01 00 00 00 ed
         41 00 00 00 00 00 00 00  00 00 00 e9 07 98 4f e9
         07 98 4f e9 07 98 4f 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00  00 00 00 75 6f 23 3f 85
         19 01 e0 2b 00 00 00 e6  6e 26 7d 01 00 00 00 08
         00 00 00 0a 00 00 00 e9  07 98 4f 03 04 00 00 28
         10 51 9b ce 40 dc 3b 6f  70 74 ff 85 19 02 e0 44
         00 00 00 1d fb f7 98 0a  00 00 00 01 00 00 00 ed
         41 00 00 00 00 00 00 00  00 00 00 e9 07 98 4f e9
         07 98 4f e9 07 98 4f 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 95  88 e4 f6 31 f1 40 28 74
         8d 60 34 21 00 00 00 00  11 5a f1 79 85 19 01 e0
         2c 00 00 00 5f 56 f1 e0  01 00 00 00 09 00 00 00
         0b 00 00 00 e9 07 98 4f  04 04 00 00 6f f5 4b 33
         28 5b 94 0a 70 72 6f 63  85 19 02 e0 44 00 00 00
         1d fb f7 98 0b 00 00 00  01 00 00 00 ed 41 00 00
         00 00 00 00 00 00 00 00  e9 07 98 4f e9 07 98 4f
         e9 07 98 4f 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00  cd b6 40 44 85 19 01 e0
         2c 00 00 00 5f 56 f1 e0  01 00 00 00 0a 00 00 00
         0c 00 00 00 e9 07 98 4f  04 04 00 00 12 a8 1b 6e
         47 26 b0 37 72 6f 6f 74  85 19 02 e0 44 00 00 00
         1d fb f7 98 0c 00 00 00  01 00 00 00 ed 41 00 00
         00 00 00 00 00 00 00 00  e9 07 98 4f e9 07 98 4f
         e9 07 98 4f 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00  d9 30 55 f4 85 19 01 e0
         2c 00 00 00 5f 56 f1 e0  01 00 00 00 0b 00 00 00
         0d 00 00 00 e9 07 98 4f  04 04 00 00 ec 75 d6 5b
         8d 8c ec 2c 73 62 69 6e  85 19 02 e0 44 00 00 00
         1d fb f7 98 0d 00 00 00  01 00 00 00 ed 41 00 00
         00 00 00 00 00 00 00 00  e9 07 98 4f e9 07 98 4f
         e9 07 98 4f 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00  05 dc e4 c9 85 19 01 e0
         2b 00 00 00 e6 6e 26 7d  01 00 00 00 0c 00 00 00
         0e 00 00 00 e9 07 98 4f  03 04 00 00 d0 67 66 4c
         30 34 46 61 73 79 73 ff  85 19 02 e0 44 00 00 00
         1d fb f7 98 0e 00 00 00  01 00 00 00 ed 41 00 00
         00 00 00 00 00 00 00 00  e9 07 98 4f e9 07 98 4f
         e9 07 98 4f 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00  61 e9 36 8f 85 19 01 e0
         2b 00 00 00 e6 6e 26 7d  01 00 00 00 0d 00 00 00
         0f 00 00 00 e9 07 98 4f  03 04 00 00 2e ba ab 79
         5a a4 ae d3 74 6d 70 ff  85 19 02 e0 44 00 00 00
         1d fb f7 98 db 2f 59 39  36 e7 c5 d4 f2 38 50 52
         52 0f 00 00 00 01 00 00  00 ed 41 00 00 00 00 00
         00 00 00 00 00 e9 07 98  4f e9 07 98 4f e9 07 98
         4f 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 bd 05 87  b2 85 19 01 e0 2b 00 00
         00 e6 6e 26 7d 01 00 00  00 0e 00 00 00 10 00 00
         00 e9 07 98 4f 03 04 00  00 51 7c ef 2e 9e 90 23
         e8 75 73 72 ff 85 19 02  e0 44 00 00 00 1d fb f7
         98 10 00 00 00 01 00 00  00 ed 41 00 00 00 00 00
         00 00 00 00 00 e9 07 98  4f e9 07 98 4f e9 07 98
         4f 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
         00 00 00 00 00 4a 22 90  59 85 19 01 e0 2b 00 00
         00 e6 6e 26 7d 01 00 00  00 0f 00 00 00 11 00 00
         00 e9 07 98 4f 03 0a 00  00 a5 8c bc 11 14 5e 91
         92 76 61 72 ff 85 19 02  e0 4c 00 00 00 f2 d3 43
         5d 11 00 00 00 01 00 00  00 ff a1 00 00 00 00 00
         00 08 00 00 00 e9 07 98  4f e9 07 98 4f e9 07 98
         4f 00 00 00 00 08 00 00  00 08 00 00 00 00 00 00
         00 f5 99 09 1f 3d 2a b0  cc 2f 74 6d 70 2f 76 61
         72 85 19 01 e0 30 00 00  00 78 be 3e fa 02 00 00
         00 10 00 00 00 12 00 00  00 e9 07 98 4f 08 0a 00
         00 3a cd 47 76 47 36 3f  5b 61 64 64 67 72 6f 75
         70 85 19 02 e0 4b 00 00  00 4b eb 94 c0 12 00 00
         00 01 00 00 00 ff a1 00  00 00 00 00 00 07 00 00
         00 e9 07 98 4f e9 07 98  4f e9 07 98 4f 00 00 00
         00 07 00 00 00 07 00 00  00 00 00 00 00 9f 25 6b
         18 45 b4 57 7a 62 75 73  79 62 6f 78 ff 85 19 01
         e0 2f 00 00 00 b1 f9 44  f2 02 00 00 00 11 00 00
         00 13 00 00 00 e9 07 98  4f 07 0a 00 00 92 00 e9
         1b c5 d2 c1 7e 61 64 64  75 73 65 72 ff 85 19 02
OOB:
         ff 4b 00 00 00 4b eb 94
         c0 13 00 00 00 01 00 00
         00 ff a1 00 00 00 00 00
         00 07 00 00 00 e9 07 98
         4f e9 07 98 4f e9 07 98
         4f 00 00 00 00 07 00 00
         00 d6 88 4e 30 17 e5 05
         72 4a c6 25 4e 8e 00 00


Best regards,
--
Hector Palacios
