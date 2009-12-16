Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKm4f-0005x5-Nd
	for linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 05:05:26 +0000
Received: by bwz4 with SMTP id 4so478323bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Dec 2009 21:05:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20091215173510.GH4575@atomide.com>
References: <ce9ab5790912150746t29be1640g817ab883b16860a3@mail.gmail.com>
	<20091215173510.GH4575@atomide.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 16 Dec 2009 10:35:00 +0530
Message-ID: <ce9ab5790912152105v6e44860en57a1b2416a4d7e77@mail.gmail.com>
Subject: Re: [PATCH] OMAP: NAND: Adding config option to enable/disable HW ECC
	mode
To: Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 15, 2009 at 11:05 PM, Tony Lindgren <tony@atomide.com> wrote:
> * Vimal Singh <vimal.newwork@gmail.com> [091215 07:45]:
>> OMAP NAND driver got HW ECC implemented.
>>
>> From d5e28c9fdbc6b0a95c1259fac7add207f9c294d7 Mon Sep 17 00:00:00 2001
>> From: Vimal Singh <vimalsingh@ti.com>
>> Date: Tue, 15 Dec 2009 21:10:54 +0530
>> Subject: [PATCH] OMAP: NAND: Adding config option to enable/disable HW E=
CC mode
>>
>> This patch adds config option to select/deselect HW ECC feature
>> on OMAP NAND driver. This is a feature provided by OMAP GPMC for
>> NAND devices.
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> ---
>> =A0drivers/mtd/nand/Kconfig | =A0 10 ++++++++++
>> =A01 files changed, 10 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 34598e9..6c4b27c 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -97,6 +97,16 @@ config MTD_NAND_OMAP_PREFETCH_DMA
>> =A0 =A0 =A0 =A0or in DMA interrupt mode.
>> =A0 =A0 =A0 =A0Say y for DMA mode or MPU mode will be used
>>
>> +config MTD_NAND_OMAP_HWECC
>> + =A0 =A0 bool "The Hardware ECC support"
>> + =A0 =A0 depends on MTD_NAND && MTD_NAND_OMAP2
>> + =A0 =A0 default n
>> + =A0 =A0 help
>> + =A0 =A0 =A0The ECC compuatation for the data to be written/read can be=
 either by
>> + =A0 =A0 =A0software or omap has Hw ecc engine which calculates it.
>> + =A0 =A0 =A0MTD_NAND_OMAP_HWECC =3D y which enables the hw ecc
>> + =A0 =A0 =A0MTD_NAND_OMAP_HWECC =3D n enables software ecc
>> +
>> =A0config MTD_NAND_TS7250
>> =A0 =A0 =A0 tristate "NAND Flash device on TS-7250 board"
>> =A0 =A0 =A0 depends on MACH_TS72XX
>
> This sounds like it should be an option passed from the board-*.c
> files as platform_data rather than a Kconfig option.

ACK. I'll do it once flash support patches get merged.


--=20
Regards,
Vimal Singh
