From: "Singh, Vimal"
	<IMCEAEX-_O=TI_OU=BD_CN=RECIPIENTS_CN=X0094262@dlee86.itg.ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Tue, 9 Jun 2009 20:54:13 +0530
Subject: RE: [PATCH] [MTD] [NAND] Add prefetch and dma support for omap2/3
	NAND      driver
Message-ID: <19F8576C6E063C45BE387C64729E739404321C60AC@dbde02.ent.ti.com>
References: <54851.192.168.10.89.1243946277.squirrel@dbdmail.itg.ti.com>
	<19F8576C6E063C45BE387C64729E739404321C60A7@dbde02.ent.ti.com>,
	<20090609101920.GA2617@atomide.com>
In-Reply-To: <20090609101920.GA2617@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"david-b@pacbell.net" <david-b@pacbell.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tue, Jun 9, 2009 at 3:49 PM, Tony Lindgren<tony@atomide.com> wrote:
> * Singh, Vimal <IMCEAEX-_O=3DTI_OU=3DBD_CN=3DRECIPIENTS_CN=3DX0094262@dle=
e86.itg.ti.com> [090608 09:01]:
>>
>> On Mon, Jun 8, 2009 at 5:08 PM, Tony Lindgren<tony@atomide.com> wrote:
>> > * Singh, Vimal <IMCEAEX-_O=3DTI_OU=3DBD_CN=3DRECIPIENTS_CN=3DX0094262@=
dlee86.itg.ti.com> [090605 05:00]:
>> >>
>> >>
>> >> On Thu, Jun 4, 2009 at 8:58 PM, Tony Lindgren<tony@atomide.com> wrote=
:
>> >> > * vimal singh <vimalsingh@ti.com> [090604 02:34]:
>> >> >> On Wed, Jun 3, 2009 at 10:03 PM, Tony Lindgren <tony@atomide.com> =
wrote:
>> >> >> > * Singh, Vimal
>> >> >> <IMCEAEX-_O=3DTI_OU=3DBD_CN=3DRECIPIENTS_CN=3DX0094262@dlee86.itg.=
ti.com> [090602
>> >> >> 23:46]:
>> >> >> >>
>> >> >> >> On Wed, Jun 3, 2009 at 2:06 AM, Tony Lindgren <tony@atomide.com=
> wrote:
>> >> >> >> > * vimal singh <vimalsingh@ti.com> [090602 05:40]:
>> >> >> >> >> This patch adds prefetch support to access nand flash in bot=
h mpu and dma
>> >> >> mode.
>> >> >> >> >> This patch also adds 8-bit nand support (omap_read/write_buf=
8).
>> >> >> >> >> Prefetch can be used for both 8- and 16-bit devices.
>> >> >> >> >
>> >> >> >> > This should be reviewed on the linux-omap@vger.kernel.org lis=
t for sure.
>> >> >> >> > One other comment below.
>> >> >> >> >
>> >> >> >> >> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> >> >> >> >> ---
>> >> >> >> >> I prepared this patch on top of "OMAP2 / OMAP3 NAND driver" =
patch:
>> >> >> >> >> http://lists.infradead.org/pipermail/linux-mtd/2009-May/0255=
62.html
>> >> >> >> >>
>> >> >> >> >> ---
>> >> >> >> >>  arch/arm/mach-omap2/gpmc.c             |  102 ++++++++++
>> >> >> >> >>  arch/arm/plat-omap/include/mach/gpmc.h |    4
>> >> >> >> >>  drivers/mtd/nand/Kconfig               |   17 +
>> >> >> >> >>  drivers/mtd/nand/omap2.c               |  308
>> >> >> ++++++++++++++++++++++++++++++++-
>> >> >> >> >>  4 files changed, 422 insertions(+), 9 deletions(-)
>> >> >> >> >>
>> >> >> >> >> Index: mtd-2.6/arch/arm/mach-omap2/gpmc.c
>> >> >> >> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> >> >> >> --- mtd-2.6.orig/arch/arm/mach-omap2/gpmc.c
>> >> >> >> >> +++ mtd-2.6/arch/arm/mach-omap2/gpmc.c
>> >> >> >> >> @@ -54,6 +54,12 @@
>> >> >> >> >>  #define GPMC_CHUNK_SHIFT     24              /* 16 MB */
>> >> >> >> >>  #define GPMC_SECTION_SHIFT   28              /* 128 MB */
>> >> >> >> >>
>> >> >> >> >> +#ifdef CONFIG_MTD_NAND_OMAP_PREFETCH
>> >> >> >> >> +#define CS_NUM_SHIFT         24
>> >> >> >> >> +#define ENABLE_PREFETCH              7
>> >> >> >> >> +#define DMA_MPU_MODE         2
>> >> >> >> >> +#endif
>> >> >> >> >> +
>> >> >> >> >>  static struct resource       gpmc_mem_root;
>> >> >> >> >>  static struct resource       gpmc_cs_mem[GPMC_CS_NUM];
>> >> >> >> >>  static DEFINE_SPINLOCK(gpmc_mem_lock);
>> >> >> >> >> @@ -383,6 +389,99 @@ void gpmc_cs_free(int cs)
>> >> >> >> >>  }
>> >> >> >> >>  EXPORT_SYMBOL(gpmc_cs_free);
>> >> >> >> >>
>> >> >> >> >> +#ifdef CONFIG_MTD_NAND_OMAP_PREFETCH
>> >> >> >> >> +/**
>> >> >> >> >> + * gpmc_prefetch_init - configures default configuration fo=
r prefetch
>> >> >> engine
>> >> >> >> >> + */
>> >> >> >> >> +static void gpmc_prefetch_init(void)
>> >> >> >> >> +{
>> >> >> >> >> +     /* Setting the default threshold to 64 */
>> >> >> >> >> +     gpmc_write_reg(GPMC_PREFETCH_CONTROL, 0x0);
>> >> >> >> >> +     gpmc_write_reg(GPMC_PREFETCH_CONFIG1, 0x40  << 8);
>> >> >> >> >> +     gpmc_write_reg(GPMC_PREFETCH_CONFIG2, 0x0);
>> >> >> >> >> +}
>> >> >> >> >
>> >> >> >> > Why would you want to have NAND specific init code int gpmc.c=
?
>> >> >> >> >
>> >> >> >> > The purpose if gpmc.c is to provide access to configuring the
>> >> >> >> > General Purpose Memory Controller (GPMC). You should just pro=
vide
>> >> >> >> > functions in gpmc.c for the platform init code to use, and th=
en
>> >> >> >> > the drivers can stay platform independent.
>> >> >> >>
>> >> >> >> In my understanding, this 'prefetch' engine is part of GPMC its=
elf, it is a
>> >> >> >> kind of feature provided by GPMC which can be utilized by NAND =
driver.
>> >> >> >> So, to me, it makes sens to get initialized prefetch by GPMC it=
self so that
>> >> >> >> NAND driver can use it.
>> >> >> >
>> >> >> > But it should not have a dependency to NAND.
>> >> >>
>> >> >> This engine, in GPMC, is dedicated for NAND devices only.
>> >> >>
>> >> >> >
>> >> >> >> Another reason was that all read / write to GPMC register are d=
one by
>> >> >> >> functions 'gpmc_read_reg' / 'gpmc_write_reg', which have been m=
ade
>> >> >> >> 'static' in nature.
>> >> >> >
>> >> >> > That's why you need to provide a generic function in gpmc.c to e=
nable
>> >> >> > prefetch that the platform code for any driver can use.
>> >> >>
>> >> >> Exactly, and whenever a platform code uses gpmc init call, gpmc in=
itializes
>> >> >> this engine too. Since prefetch engine is the part of GPMC, IMHOP,=
 it should
>> >> >> get initialized as part of GPMC initialization.
>> >> >
>> >> > No, the driver needing it should initialize it. There should not be=
 any
>> >> > ifdefs needed in the gpmc.c for that.
>> >>
>> >> Are you suggesting to move gpmc prefetch specific code to 'drivers/mt=
d/nand/omap2.c'?
>> >> This can be done but then, we will be accessing gpmc registers outsid=
e gpmc.c. Is that ok?
>> >
>> > Well I'm thinking that you just basically need something like this in
>> > gpmc.c:
>> >
>> > int gpmc_prefetch_request(int cs);
>> > int gpmc_prefetch_enable(int cs);
>> > int gpmc_prefetch_reset(int cs);
>> > ...
>> >
>> > And gpmc_prefetch_request would then return an error if already taken.
>> > No need then to tinker with the GPMC prefetch registers in the NAND
>> > driver.
>>
>> This seems exactly what in this patch has been done, other than renaming=
 the functions and suggestion that gpmc prefetch init call should happen fr=
om NAND driver and should return success or failure based on whether it has=
 already been initialized or not. Am I correct?
>
> Yes, let's take another look once those have been updated.

Plz refer to my comments below.

>
>> But since, the prefetch and write-posting engine is a single-context eng=
ine that can be allocated to only one chip-select at a time for a read pref=
etch or a write-posting process, I feel it is still OK if we initialize gpm=
c prefetch engine only once in gpmc.c only and then whenever there is a req=
uest for gmpc prefetch start/enable we should check if engine is already be=
ing used by some other chip-select by verifying GPMC_PREFETCH_CONFIG1.ENABL=
EENGINE (bit '7').
>>
>> This was not done because there is only NAND device, as of now, in all t=
he boards we are using.
>>
>> Let me know what you think about this.
>
> There's absolutely no reason to add any NAND specific code to gpmc.c.

Yes, and this patch has no NAND specific code in gpmc.c. But it has functio=
ns required for gpmc prefetch:

static void gpmc_prefetch_init(void)
void gpmc_prefetch_start(int cs, int dma_mode,
                                     unsigned int u32_count, int is_write)
void gpmc_prefetch_stop(void)
int gpmc_prefetch_status(void)


Which are similar to functions you are suggesting:
int gpmc_prefetch_request(int cs);       -  gpmc_prefetch_init
int gpmc_prefetch_enable(int cs);      -  gpmc_prefetch_start
int gpmc_prefetch_reset(int cs);      -  gpmc_prefetch_stop
...

As per my understanding this patch already implements your comments, Plz le=
t me know if I am missing something.=20

-vmial

>
> Tony
>
>>
>> >
>> >> >
>> >> >> And then there are prefetch start, stop and status functions calls=
 have been
>> >> >> provided to be used by NAND driver.
>> >> >
>> >> > These should really be done in the platform init code for the NAND =
driver.
>> >> > The NAND driver really should be generic, not omap specific.
>> >>
>> >> Are you talking about different omap versions or omap itself, I am bi=
t confused. This NAND driver is
>> >> omap specific only.
>> >
>> > I guess I'm talking in generic terms. What's under drivers/* should in=
 the long
>> > run be device independent code, and the platform specific code should =
be under
>> > arch/arm/*omap*.
>>
>> Yes, this is exactly what I was trying to do. GPMC prefetch is platform =
specific feature and hence code related to this was kept in gmpc.c (i.e. ar=
ch/arm/*omap*/.).
>>
>> ---
>> Regards,
>> Vimal
>> >
>> > Regards,
>> >
>> > Tony
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe linux-omap" =
in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> >
>>
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=
