MIME-Version: 1.0
References: <20180624205355.20060-1-martin.blumenstingl@googlemail.com>
 <20180624205355.20060-2-martin.blumenstingl@googlemail.com>
 <20180624230357.401fd38e@bbrezillon>
In-Reply-To: <20180624230357.401fd38e@bbrezillon>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 24 Jun 2018 23:16:37 +0200
Message-ID: <CAFBinCDzF744Mcr8kkyR4mAWzxhWJhOo6QNmPoqqQTxvvUW0MA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: rawnand: hynix: fix decoding the OOB size on
 H27UCG8T2BTR
To: boris.brezillon@bootlin.com
Cc: linux-mtd@lists.infradead.org, richard@nod.at, yixun.lan@amlogic.com,
 marek.vasut@gmail.com, liang.yang@amlogic.com, miquel.raynal@bootlin.com,
 linux-amlogic@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Sun, Jun 24, 2018 at 11:03 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Sun, 24 Jun 2018 22:53:55 +0200
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > The datasheet of the H27UCG8T2BTR states that this chip has a page size
> > of "16,384 + 1,280(Spare) bytes". The description of the "4th Byte of
> > Device Identifier Description" indicates that bits 6, 3 and 2 are
> > encoding the "Redundant Area Size / 8KB", where 640 bytes is a value of
> > 0x6 (110 in binary notation).
> >
> > hynix_nand_extract_oobsize decodes an OOB size of 640 bytes for this
> > chip. Kernel boot log extract before this patch:
> > nand: Could not find valid ONFI parameter page; aborting
> > nand: device found, Manufacturer ID: 0xad, Chip ID: 0xde
> > nand: Hynix NAND 8GiB 3,3V 8-bit
> > nand: 8192 MiB, MLC, erase size: 4096 KiB, page size: 16384,
> >       OOB size: 640
> >
> > However, based on the description in the datasheet we need to multiply
> > the OOB size with 2, because it's "640 spare bytes per 8192 bytes page
> > size" and this NAND chip has a page size of 16384 (= 2 * 8192). After
> > this patch the kernel boot log reports:
> > nand: Could not find valid ONFI parameter page; aborting
> > nand: device found, Manufacturer ID: 0xad, Chip ID: 0xde
> > nand: Hynix NAND 8GiB 3,3V 8-bit
> > nand: 8192 MiB, MLC, erase size: 4096 KiB, page size: 16384,
> >       OOB size: 1280
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> LGTM.
>
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
thank you for reviewing this!

> Just out of curiosity, what do you plan to put on your MLC chip? I
> guess you already know that UBI/UBIFS are not supporting MLC chips. Do
> you use another FS or an FTL + a block FS?
my first goal is to get something (preferably a full backup) *from*
the chip, rather than putting something onto it
this MLC chip is part of a TV box I have which uses an Amlogic S812
(Meson8m2) SoC

you reviewed the first version of Amlogic's NAND driver today
I may add support for older SoCs to this driver later on (should be
fairly simple)

apart from that I have no specific plans yet


Regards
Martin
