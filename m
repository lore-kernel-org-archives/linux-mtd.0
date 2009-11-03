Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N5Eri-0007uW-Ej
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 08:35:51 +0000
Received: by bwz4 with SMTP id 4so7623833bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Nov 2009 00:35:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1257236897.21596.57.camel@localhost>
References: <ce9ab5790910292321y1e7239b7pbffe9a5891d66448@mail.gmail.com>
	<ce9ab5790910300142kf12e31cpd6249d4c7383553f@mail.gmail.com>
	<ce9ab5790910300227r41d42673webad0ee48e3444d1@mail.gmail.com>
	<1257236897.21596.57.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 3 Nov 2009 14:05:23 +0530
Message-ID: <ce9ab5790911030035p2f8dfe21q7c8f911077adc262@mail.gmail.com>
Subject: Re: [PATCH 2/3]NAND: OMAP: Fixing omap nand driver, compiled as
	module
To: dedekind1@gmail.com
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

On Tue, Nov 3, 2009 at 1:58 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Fri, 2009-10-30 at 14:57 +0530, Vimal Singh wrote:
>> Last time I forgot to 'git add' for 'arch/arm/mach-omap2/gpmc.c'... My b=
ad.
>> Correct patch is below.
>>
>> -vimal
>>
>>
>> From: Vimal Singh <vimalsingh@ti.com>
>> Date: Fri, 30 Oct 2009 14:54:29 +0530
>> Subject: [PATCH] NAND: OMAP: Fixing omap nand driver, compiled as module
>>
>> Removing OMAP NAND driver, when loaded as a module, gives error and
>> does not get success. This fixes this and makes driver loadable and
>> removable run time.
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> ---
>> =A0arch/arm/mach-omap2/gpmc.c | =A0 =A02 ++
>> =A0drivers/mtd/nand/omap2.c =A0 | =A0 =A05 ++++-
>> =A02 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
>> index 1587682..1d10b7b 100644
>> --- a/arch/arm/mach-omap2/gpmc.c
>> +++ b/arch/arm/mach-omap2/gpmc.c
>> @@ -88,6 +88,7 @@ void gpmc_cs_write_reg(int cs, int idx, u32 val)
>> =A0 =A0 =A0 reg_addr =3D gpmc_base + GPMC_CS0 + (cs * GPMC_CS_SIZE) + id=
x;
>> =A0 =A0 =A0 __raw_writel(val, reg_addr);
>> =A0}
>> +EXPORT_SYMBOL(gpmc_cs_write_reg);
>>
>> =A0u32 gpmc_cs_read_reg(int cs, int idx)
>> =A0{
>> @@ -96,6 +97,7 @@ u32 gpmc_cs_read_reg(int cs, int idx)
>> =A0 =A0 =A0 reg_addr =3D gpmc_base + GPMC_CS0 + (cs * GPMC_CS_SIZE) + id=
x;
>> =A0 =A0 =A0 return __raw_readl(reg_addr);
>> =A0}
>> +EXPORT_SYMBOL(gpmc_cs_read_reg);
>
> Why do you export these?

These functions are called during prob. So, if not exported and driver
is compiled as a module compilation will break with error saying these
are not defined or not found.


--=20
Regards,
Vimal Singh
