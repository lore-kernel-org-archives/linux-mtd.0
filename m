Received: from mail-bw0-f221.google.com ([209.85.218.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NdIKe-00028D-66
	for linux-mtd@lists.infradead.org; Fri, 05 Feb 2010 07:10:29 +0000
Received: by bwz21 with SMTP id 21so2933172bwz.4
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Feb 2010 23:10:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100204234753.GZ22747@atomide.com>
References: <ce9ab5791001122250m5daa723y6f084c83ce25fb5@mail.gmail.com>
	<20100204234753.GZ22747@atomide.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 5 Feb 2010 12:40:02 +0530
Message-ID: <ce9ab5791002042310l580d623co9ba5a6082b53345f@mail.gmail.com>
Subject: Re: [PATCH 1/3] Introducing 'gpmc-nand.c' for GPMC specific NAND init
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

On Fri, Feb 5, 2010 at 5:17 AM, Tony Lindgren <tony@atomide.com> wrote:
> Hi,
>
> Almost there.. Few more comments below.
>
> * Vimal Singh <vimal.newwork@gmail.com> [100112 22:48]:
>> From 89eaa5d55e04f65e76ad49ed8b010cba578d91ca Mon Sep 17 00:00:00 2001
>> From: Vimal Singh <vimalsingh@ti.com>
>> Date: Mon, 11 Jan 2010 16:01:29 +0530
>> Subject: [PATCH] Introducing 'gpmc-nand.c' for GPMC specific NAND init
>>
>> Introducing 'gpmc-nand.c' for GPMC specific NAND init.
>> For example: GPMC timing parameters and all.
>> This patch also migrates gpmc related calls from 'nand/omap2.c'
>> to 'gpmc-nand.c'.
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> ---
>> =A0arch/arm/mach-omap2/Makefile =A0 =A0 =A0 =A0 =A0 | =A0 =A03 +
>> =A0arch/arm/mach-omap2/gpmc-nand.c =A0 =A0 =A0 =A0| =A0139 +++++++++++++=
+++++++++++++++++++
>> =A0arch/arm/plat-omap/include/plat/nand.h | =A0 =A08 ++
>> =A0drivers/mtd/nand/omap2.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 35 +------=
-
>> =A04 files changed, 154 insertions(+), 31 deletions(-)
>> =A0create mode 100644 arch/arm/mach-omap2/gpmc-nand.c
>
> <snip>
>
>> +static int omap2_nand_gpmc_config(void __iomem *nand_base)
>> +{
>> + =A0 =A0 struct gpmc_timings t;
>> + =A0 =A0 int err;
>> +
>> + =A0 =A0 memset(&t, 0, sizeof(t));
>> + =A0 =A0 t.sync_clk =3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_t->=
sync_clk);
>> + =A0 =A0 t.cs_on =3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_t->cs_=
on);
>> + =A0 =A0 t.adv_on =3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_t->ad=
v_on);
>> +
>> + =A0 =A0 /* Read */
>> + =A0 =A0 t.adv_rd_off =3D gpmc_round_ns_to_ticks(
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_nand_data=
->gpmc_t->adv_rd_off);
>> + =A0 =A0 t.oe_on =A0=3D t.adv_on;
>> + =A0 =A0 t.access =3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_t->ac=
cess);
>> + =A0 =A0 t.oe_off =3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_t->oe=
_off);
>> + =A0 =A0 t.cs_rd_off =3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_t-=
>cs_rd_off);
>> + =A0 =A0 t.rd_cycle =A0=3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_=
t->rd_cycle);
>> +
>> + =A0 =A0 /* Write */
>> + =A0 =A0 t.adv_wr_off =3D gpmc_round_ns_to_ticks(
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_nand_data=
->gpmc_t->adv_wr_off);
>> + =A0 =A0 t.we_on =A0=3D t.oe_on;
>> + =A0 =A0 if (cpu_is_omap34xx()) {
>> + =A0 =A0 =A0 =A0 t.wr_data_mux_bus =3D gpmc_round_ns_to_ticks(
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_nand_data=
->gpmc_t->wr_data_mux_bus);
>> + =A0 =A0 =A0 =A0 t.wr_access =3D gpmc_round_ns_to_ticks(
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_nand_data=
->gpmc_t->wr_access);
>> + =A0 =A0 }
>> + =A0 =A0 t.we_off =3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_t->we=
_off);
>> + =A0 =A0 t.cs_wr_off =3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_t-=
>cs_wr_off);
>> + =A0 =A0 t.wr_cycle =A0=3D gpmc_round_ns_to_ticks(gpmc_nand_data->gpmc_=
t->wr_cycle);
>> +
>> + =A0 =A0 /* Configure GPMC */
>> + =A0 =A0 gpmc_cs_write_reg(gpmc_nand_data->cs, GPMC_CS_CONFIG1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GPMC_CONFIG1_DEVICESIZE(gpmc_n=
and_data->devsize) |
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GPMC_CONFIG1_DEVICETYPE_NAND);
>> +
>> + =A0 =A0 err =3D gpmc_cs_set_timings(gpmc_nand_data->cs, &t);
>> + =A0 =A0 if (err)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return err;
>> +
>> + =A0 =A0 return 0;
>> +}
>
> The nand_base is unused in omap2_nand_gpmc_config. And it's not needed th=
ere,
> see below.
>
> Also, maybe rename it to omap2_nand_gpmc_retime() instead? It should get
> get called dynamically based on the cpufreq notifications from the driver
> whenever the L3 frequency is being scaled. Otherwise NAND will stop worki=
ng :)
>
>> +
>> +static int gpmc_nand_setup(void __iomem *nand_base)
>> +{
>> + =A0 =A0 struct device *dev =3D &gpmc_nand_device.dev;
>> +
>> + =A0 =A0 /* Set timings in GPMC */
>> + =A0 =A0 if (omap2_nand_gpmc_config(nand_base) < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Unable to set gpmc timings\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return 0;
>> +}
>
> Here too nand_base is not needed. You can now get rid of this function.

Yeah, I will remove 'nand_base' from these functions. Actually
prototype of 'nand_setup' func in 'plat/nand.h' file was already
present with this arg. I'll correct that too.

>
>> +
>> +int __init gpmc_nand_init(struct omap_nand_platform_data *_nand_data)
>> +{
>> + =A0 =A0 unsigned int val;
>> + =A0 =A0 int err =3D 0;
>> + =A0 =A0 struct device *dev =3D &gpmc_nand_device.dev;
>> +
>> + =A0 =A0 gpmc_nand_data =3D _nand_data;
>> + =A0 =A0 gpmc_nand_data->nand_setup =3D gpmc_nand_setup;
>> + =A0 =A0 gpmc_nand_device.dev.platform_data =3D gpmc_nand_data;
>> +
>> + =A0 =A0 err =3D gpmc_nand_setup(gpmc_nand_data->gpmc_cs_baseaddr);
>> + =A0 =A0 if (err < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "NAND platform setup failed: %d\n=
", err);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return err;
>> + =A0 =A0 }
>
> And this ordering must be changed around. You need to first call
> gpmc_cs_request to allocate the GPMC area based on the chip select
> and size from the gpmc_nand_data.
>
> Only then you can call the timing function.
>
>> + =A0 =A0 err =3D gpmc_cs_request(gpmc_nand_data->cs, NAND_IO_SIZE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &gpmc_nand_dat=
a->phys_base);
>> + =A0 =A0 if (err < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Cannot request GPMC CS\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return err;
>> + =A0 =A0 }
>
> So please do the gpmc_cs_request first.
>

That's correct, I'll do this.

> Should be easy to fix for the whole series. Then let's plan on
> merging it, it will be a nice improvment for all omaps using
> NAND.

I'll reply on comments on those patches.


--=20
Regards,
Vimal Singh
