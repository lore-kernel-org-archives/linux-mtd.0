From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 07/12] memory: davinci-aemif: introduce AEMIF driver
Date: Mon, 11 Nov 2013 17:06:59 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D2E@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-8-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-8-git-send-email-ivan.khoronzhuk@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add new AEMIF driver for EMIF16 davinci controller. The EMIF16 module=0A=
is intended to provide a glue-less interface to a variety of=0A=
asynchronous memory devices like ASRA M, NOR and NAND memory. A total=0A=
of 256M bytes of any of these memories can be accessed at any given=0A=
time via four chip selects with 64M byte access per chip select.=0A=
=0A=
Synchronous memories such as DDR1 SD RAM, SDR SDRAM and Mobile SDR=0A=
are not supported.=0A=
=0A=
See http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 drivers/memory/Kconfig         |   11 ++=0A=
 drivers/memory/Makefile        |    1 +=0A=
 drivers/memory/davinci-aemif.c |  415 ++++++++++++++++++++++++++++++++++++=
++++=0A=
 3 files changed, 427 insertions(+)=0A=
 create mode 100644 drivers/memory/davinci-aemif.c=0A=
=0A=
diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig=0A=
index 29a11db..010e75e 100644=0A=
--- a/drivers/memory/Kconfig=0A=
+++ b/drivers/memory/Kconfig=0A=
@@ -7,6 +7,17 @@ menuconfig MEMORY=0A=
=0A=
 if MEMORY=0A=
=0A=
+config TI_DAVINCI_AEMIF=0A=
+       bool "Texas Instruments DaVinci AEMIF driver"=0A=
+       depends on (ARCH_DAVINCI || ARCH_KEYSTONE) && OF=0A=
+       help=0A=
+         This driver is for the AEMIF module available in Texas Instrument=
s=0A=
+         SoCs. AEMIF stands for Asynchronous External Memory Interface and=
=0A=
+         is intended to provide a glue-less interface to a variety of=0A=
+         asynchronuous memory devices like ASRAM, NOR and NAND memory. A t=
otal=0A=
+         of 256M bytes of any of these memories can be accessed at a given=
=0A=
+         time via four chip selects with 64M byte access per chip select.=
=0A=
+=0A=
 config TI_EMIF=0A=
        tristate "Texas Instruments EMIF driver"=0A=
        depends on ARCH_OMAP2PLUS=0A=
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile=0A=
index 969d923..af14126 100644=0A=
--- a/drivers/memory/Makefile=0A=
+++ b/drivers/memory/Makefile=0A=
@@ -5,6 +5,7 @@=0A=
 ifeq ($(CONFIG_DDR),y)=0A=
 obj-$(CONFIG_OF)               +=3D of_memory.o=0A=
 endif=0A=
+obj-$(CONFIG_TI_DAVINCI_AEMIF) +=3D davinci-aemif.o=0A=
 obj-$(CONFIG_TI_EMIF)          +=3D emif.o=0A=
 obj-$(CONFIG_MVEBU_DEVBUS)     +=3D mvebu-devbus.o=0A=
 obj-$(CONFIG_TEGRA20_MC)       +=3D tegra20-mc.o=0A=
diff --git a/drivers/memory/davinci-aemif.c b/drivers/memory/davinci-aemif.=
c=0A=
new file mode 100644=0A=
index 0000000..e36b74b=0A=
--- /dev/null=0A=
+++ b/drivers/memory/davinci-aemif.c=0A=
@@ -0,0 +1,415 @@=0A=
+/*=0A=
+ * DaVinci/Keystone AEMIF driver=0A=
+ *=0A=
+ * Copyright (C) 2010 - 2013 Texas Instruments Incorporated. http://www.ti=
.com/=0A=
+ * Copyright (C) Heiko Schocher <hs@denx.de>=0A=
+ * Copyright (C) Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
+ *=0A=
+ * This program is free software; you can redistribute it and/or modify=0A=
+ * it under the terms of the GNU General Public License version 2 as=0A=
+ * published by the Free Software Foundation.=0A=
+ */=0A=
+=0A=
+#include <linux/clk.h>=0A=
+#include <linux/err.h>=0A=
+#include <linux/io.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/of.h>=0A=
+#include <linux/of_platform.h>=0A=
+#include <linux/platform_device.h>=0A=
+=0A=
+#define TA_SHIFT       2=0A=
+#define RHOLD_SHIFT    4=0A=
+#define RSTROBE_SHIFT  7=0A=
+#define RSETUP_SHIFT   13=0A=
+#define WHOLD_SHIFT    17=0A=
+#define WSTROBE_SHIFT  20=0A=
+#define WSETUP_SHIFT   26=0A=
+#define EW_SHIFT       30=0A=
+#define SS_SHIFT       31=0A=
+=0A=
+#define TA(x)          ((x) << TA_SHIFT)=0A=
+#define RHOLD(x)       ((x) << RHOLD_SHIFT)=0A=
+#define RSTROBE(x)     ((x) << RSTROBE_SHIFT)=0A=
+#define RSETUP(x)      ((x) << RSETUP_SHIFT)=0A=
+#define WHOLD(x)       ((x) << WHOLD_SHIFT)=0A=
+#define WSTROBE(x)     ((x) << WSTROBE_SHIFT)=0A=
+#define WSETUP(x)      ((x) << WSETUP_SHIFT)=0A=
+#define EW(x)          ((x) << EW_SHIFT)=0A=
+#define SS(x)          ((x) << SS_SHIFT)=0A=
+=0A=
+#define ASIZE_MAX      0x1=0A=
+#define TA_MAX         0x3=0A=
+#define RHOLD_MAX      0x7=0A=
+#define RSTROBE_MAX    0x3f=0A=
+#define RSETUP_MAX     0xf=0A=
+#define WHOLD_MAX      0x7=0A=
+#define WSTROBE_MAX    0x3f=0A=
+#define WSETUP_MAX     0xf=0A=
+#define EW_MAX         0x1=0A=
+#define SS_MAX         0x1=0A=
+#define NUM_CS         4=0A=
+=0A=
+#define TA_VAL(x)      (((x) & TA(TA_MAX)) >> TA_SHIFT)=0A=
+#define RHOLD_VAL(x)   (((x) & RHOLD(RHOLD_MAX)) >> RHOLD_SHIFT)=0A=
+#define RSTROBE_VAL(x) (((x) & RSTROBE(RSTROBE_MAX)) >> RSTROBE_SHIFT)=0A=
+#define RSETUP_VAL(x)  (((x) & RSETUP(RSETUP_MAX)) >> RSETUP_SHIFT)=0A=
+#define WHOLD_VAL(x)   (((x) & WHOLD(WHOLD_MAX)) >> WHOLD_SHIFT)=0A=
+#define WSTROBE_VAL(x) (((x) & WSTROBE(WSTROBE_MAX)) >> WSTROBE_SHIFT)=0A=
+#define WSETUP_VAL(x)  (((x) & WSETUP(WSETUP_MAX)) >> WSETUP_SHIFT)=0A=
+#define EW_VAL(x)      (((x) & EW(EW_MAX)) >> EW_SHIFT)=0A=
+#define SS_VAL(x)      (((x) & SS(SS_MAX)) >> SS_SHIFT)=0A=
+=0A=
+#define NRCSR_OFFSET   0x00=0A=
+#define AWCCR_OFFSET   0x04=0A=
+#define A1CR_OFFSET    0x10=0A=
+=0A=
+#define ACR_ASIZE_MASK 0x3=0A=
+#define ACR_EW_MASK    BIT(30)=0A=
+#define ACR_SS_MASK    BIT(31)=0A=
+#define ASIZE_16BIT    1=0A=
+=0A=
+#define CONFIG_MASK    (TA(TA_MAX) | \=0A=
+                               RHOLD(RHOLD_MAX) | \=0A=
+                               RSTROBE(RSTROBE_MAX) |  \=0A=
+                               RSETUP(RSETUP_MAX) | \=0A=
+                               WHOLD(WHOLD_MAX) | \=0A=
+                               WSTROBE(WSTROBE_MAX) | \=0A=
+                               WSETUP(WSETUP_MAX) | \=0A=
+                               EW(EW_MAX) | SS(SS_MAX) | \=0A=
+                               ASIZE_MAX)=0A=
+=0A=
+#define DRV_NAME       "davinci-aemif"=0A=
+=0A=
+/**=0A=
+ * structure to hold cs parameters=0A=
+ * @cs: chip-select number=0A=
+ * @wstrobe: write strobe width, ns=0A=
+ * @rstrobe: read strobe width, ns=0A=
+ * @wsetup: write setup width, ns=0A=
+ * @whold: write hold width, ns=0A=
+ * @rsetup: read setup width, ns=0A=
+ * @rhold: read hold width, ns=0A=
+ * @ta: minimum turn around time, ns=0A=
+ * @enable_ss: enable/disable select strobe mode=0A=
+ * @enable_ew: enable/disable extended wait mode=0A=
+ * @asize: width of the asynchronous device's data bus=0A=
+ */=0A=
+struct davinci_aemif_cs_data {=0A=
+       u8      cs;=0A=
+       u16     wstrobe;=0A=
+       u16     rstrobe;=0A=
+       u8      wsetup;=0A=
+       u8      whold;=0A=
+       u8      rsetup;=0A=
+       u8      rhold;=0A=
+       u8      ta;=0A=
+       u8      enable_ss;=0A=
+       u8      enable_ew;=0A=
+       u8      asize;=0A=
+};=0A=
+=0A=
+/**=0A=
+ * structure to hold device data=0A=
+ * @base: base address of AEMIF registers=0A=
+ * @clk: source clock=0A=
+ * @clk_rate: clock's rate in kHz=0A=
+ * @num_cs: number of assigned chip-selects=0A=
+ * @cs_data: array of chip-select settings=0A=
+ */=0A=
+struct davinci_aemif_device {=0A=
+       struct device *dev;=0A=
+       void __iomem *base;=0A=
+       struct clk *clk;=0A=
+       unsigned long clk_rate;=0A=
+       u8 num_cs;=0A=
+       int cs_offset;=0A=
+       struct davinci_aemif_cs_data cs_data[NUM_CS];=0A=
+};=0A=
+=0A=
+static struct davinci_aemif_device *aemif;=0A=
+/**=0A=
+ * davinci_aemif_calc_rate - calculate timing data.=0A=
+ * @wanted: The cycle time needed in nanoseconds.=0A=
+ * @clk: The input clock rate in kHz.=0A=
+ * @max: The maximum divider value that can be programmed.=0A=
+ *=0A=
+ * On success, returns the calculated timing value minus 1 for easy=0A=
+ * programming into AEMIF timing registers, else negative errno.=0A=
+ */=0A=
+static int davinci_aemif_calc_rate(int wanted, unsigned long clk, int max)=
=0A=
+{=0A=
+       int result;=0A=
+=0A=
+       result =3D DIV_ROUND_UP((wanted * clk), NSEC_PER_MSEC) - 1;=0A=
+=0A=
+       dev_dbg(aemif->dev, "%s: result %d from %ld, %d\n", __func__, resul=
t,=0A=
+               clk, wanted);=0A=
+=0A=
+       /* It is generally OK to have a more relaxed timing than requested.=
.. */=0A=
+       if (result < 0)=0A=
+               result =3D 0;=0A=
+=0A=
+       /* ... But configuring tighter timings is not an option. */=0A=
+       else if (result > max)=0A=
+               result =3D -EINVAL;=0A=
+=0A=
+       return result;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * davinci_aemif_config_abus - configure async bus parameters=0A=
+ * @data: aemif chip select configuration=0A=
+ *=0A=
+ * This function programs the given timing values (in real clock) into the=
=0A=
+ * AEMIF registers taking the AEMIF clock into account.=0A=
+ *=0A=
+ * This function does not use any locking while programming the AEMIF=0A=
+ * because it is expected that there is only one user of a given=0A=
+ * chip-select.=0A=
+ *=0A=
+ * Returns 0 on success, else negative errno.=0A=
+ */=0A=
+static int davinci_aemif_config_abus(struct davinci_aemif_cs_data *data)=
=0A=
+{=0A=
+       int ta, rhold, rstrobe, rsetup, whold, wstrobe, wsetup;=0A=
+       unsigned offset;=0A=
+       u32 set, val;=0A=
+=0A=
+       offset =3D A1CR_OFFSET + (data->cs - aemif->cs_offset) * 4;=0A=
+=0A=
+       ta      =3D davinci_aemif_calc_rate(data->ta, aemif->clk_rate, TA_M=
AX);=0A=
+       rhold   =3D davinci_aemif_calc_rate(data->rhold, aemif->clk_rate,=
=0A=
+                                         RHOLD_MAX);=0A=
+       rstrobe =3D davinci_aemif_calc_rate(data->rstrobe, aemif->clk_rate,=
=0A=
+                                         RSTROBE_MAX);=0A=
+       rsetup  =3D davinci_aemif_calc_rate(data->rsetup, aemif->clk_rate,=
=0A=
+                                         RSETUP_MAX);=0A=
+       whold   =3D davinci_aemif_calc_rate(data->whold, aemif->clk_rate,=
=0A=
+                                         WHOLD_MAX);=0A=
+       wstrobe =3D davinci_aemif_calc_rate(data->wstrobe, aemif->clk_rate,=
=0A=
+                                         WSTROBE_MAX);=0A=
+       wsetup  =3D davinci_aemif_calc_rate(data->wsetup, aemif->clk_rate,=
=0A=
+                                         WSETUP_MAX);=0A=
+=0A=
+       if (ta < 0 || rhold < 0 || rstrobe < 0 || rsetup < 0 ||=0A=
+                       whold < 0 || wstrobe < 0 || wsetup < 0) {=0A=
+               dev_err(aemif->dev, "%s: cannot get suitable timings\n",=0A=
+                       __func__);=0A=
+               return -EINVAL;=0A=
+       }=0A=
+=0A=
+       set =3D TA(ta) | RHOLD(rhold) | RSTROBE(rstrobe) | RSETUP(rsetup) |=
=0A=
+               WHOLD(whold) | WSTROBE(wstrobe) | WSETUP(wsetup);=0A=
+=0A=
+       set |=3D (data->asize & ACR_ASIZE_MASK);=0A=
+       if (data->enable_ew)=0A=
+               set |=3D ACR_EW_MASK;=0A=
+       if (data->enable_ss)=0A=
+               set |=3D ACR_SS_MASK;=0A=
+=0A=
+       val =3D readl(aemif->base + offset);=0A=
+       val &=3D ~CONFIG_MASK;=0A=
+       val |=3D set;=0A=
+       writel(val, aemif->base + offset);=0A=
+=0A=
+       return 0;=0A=
+}=0A=
+=0A=
+inline int davinci_aemif_cycles_to_nsec(int val)=0A=
+{=0A=
+       return ((val + 1) * NSEC_PER_MSEC) / aemif->clk_rate;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * davinci_aemif_get_hw_params - function to read hw register values=0A=
+ * @data: ptr to cs data=0A=
+ *=0A=
+ * This function reads the defaults from the registers and update=0A=
+ * the timing values. Required for get/set commands and also for=0A=
+ * the case when driver needs to use defaults in hardware.=0A=
+ */=0A=
+static void davinci_aemif_get_hw_params(struct davinci_aemif_cs_data *data=
)=0A=
+{=0A=
+       u32 val, offset;=0A=
+       offset =3D A1CR_OFFSET + (data->cs - aemif->cs_offset) * 4;=0A=
+=0A=
+       val =3D readl(aemif->base + offset);=0A=
+       data->ta =3D davinci_aemif_cycles_to_nsec(TA_VAL(val));=0A=
+       data->rhold =3D davinci_aemif_cycles_to_nsec(RHOLD_VAL(val));=0A=
+       data->rstrobe =3D davinci_aemif_cycles_to_nsec(RSTROBE_VAL(val));=
=0A=
+       data->rsetup =3D davinci_aemif_cycles_to_nsec(RSETUP_VAL(val));=0A=
+       data->whold =3D davinci_aemif_cycles_to_nsec(WHOLD_VAL(val));=0A=
+       data->wstrobe =3D davinci_aemif_cycles_to_nsec(WSTROBE_VAL(val));=
=0A=
+       data->wsetup =3D davinci_aemif_cycles_to_nsec(WSETUP_VAL(val));=0A=
+       data->enable_ew =3D EW_VAL(val);=0A=
+       data->enable_ss =3D SS_VAL(val);=0A=
+       data->asize =3D val & ASIZE_MAX;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * of_davinci_aemif_parse_abus_config - parse CS configuration from DT=0A=
+ * @np: device node ptr=0A=
+ *=0A=
+ * This function update the emif async bus configuration based on the valu=
es=0A=
+ * configured in a cs device binding node.=0A=
+ */=0A=
+static int of_davinci_aemif_parse_abus_config(struct device_node *np)=0A=
+{=0A=
+       struct davinci_aemif_cs_data *data;=0A=
+       unsigned long cs;=0A=
+       u32 val;=0A=
+=0A=
+       if (kstrtoul(np->name + 2, 10, &cs) < 0) {=0A=
+               dev_dbg(aemif->dev, "cs name is incorrect");=0A=
+               return -EINVAL;=0A=
+       }=0A=
+=0A=
+       if (cs - aemif->cs_offset >=3D NUM_CS || cs < aemif->cs_offset) {=
=0A=
+               dev_dbg(aemif->dev, "cs number is incorrect %lu", cs);=0A=
+               return -EINVAL;=0A=
+       }=0A=
+=0A=
+       if (aemif->num_cs >=3D NUM_CS) {=0A=
+               dev_dbg(aemif->dev, "cs count is more than %d", NUM_CS);=0A=
+               return -EINVAL;=0A=
+       }=0A=
+=0A=
+       data =3D &aemif->cs_data[aemif->num_cs++];=0A=
+       data->cs =3D cs;=0A=
+=0A=
+       /* read the current value in the hw register */=0A=
+       davinci_aemif_get_hw_params(data);=0A=
+=0A=
+       /* override the values from device node */=0A=
+       of_property_read_u8(np, "ti,davinci-cs-ta", &data->ta);=0A=
+       of_property_read_u8(np, "ti,davinci-cs-rhold", &data->rhold);=0A=
+       of_property_read_u16(np, "ti,davinci-cs-rstrobe", &data->rstrobe);=
=0A=
+       of_property_read_u8(np, "ti,davinci-cs-rsetup", &data->rsetup);=0A=
+       of_property_read_u8(np, "ti,davinci-cs-whold", &data->whold);=0A=
+       of_property_read_u16(np, "ti,davinci-cs-wstrobe", &data->wstrobe);=
=0A=
+       of_property_read_u8(np, "ti,davinci-cs-wsetup", &data->wsetup);=0A=
+       if (!of_property_read_u32(np, "ti,bus-width", &val))=0A=
+               if (val =3D=3D 16)=0A=
+                       data->asize =3D 1;=0A=
+       data->enable_ew =3D of_property_read_bool(np, "ti,davinci-cs-ew");=
=0A=
+       data->enable_ss =3D of_property_read_bool(np, "ti,davinci-cs-ss");=
=0A=
+       return 0;=0A=
+}=0A=
+=0A=
+static const struct of_device_id davinci_aemif_of_match[] =3D {=0A=
+       { .compatible =3D "ti,davinci-aemif", },=0A=
+       { .compatible =3D "ti,keystone-aemif", },=0A=
+       { .compatible =3D "ti,omap-L138-aemif", },=0A=
+       {},=0A=
+};=0A=
+=0A=
+static const struct of_device_id davinci_cs_of_match[] =3D {=0A=
+       { .compatible =3D "ti,davinci-cs", },=0A=
+       {},=0A=
+};=0A=
+=0A=
+static int davinci_aemif_probe(struct platform_device *pdev)=0A=
+{=0A=
+       int ret  =3D -ENODEV, i;=0A=
+       struct resource *res;=0A=
+       struct device *dev =3D &pdev->dev;=0A=
+       struct device_node *np =3D dev->of_node;=0A=
+=0A=
+       if (np =3D=3D NULL)=0A=
+               return 0;=0A=
+=0A=
+       if (aemif) {=0A=
+               dev_err(dev, "davinci_aemif driver is in use currently\n");=
=0A=
+               return -EBUSY;=0A=
+       }=0A=
+=0A=
+       aemif =3D devm_kzalloc(dev, sizeof(*aemif), GFP_KERNEL);=0A=
+=0A=
+       if (!aemif) {=0A=
+               dev_err(dev, "cannot allocate memory for aemif\n");=0A=
+               return -ENOMEM;=0A=
+       }=0A=
+=0A=
+       aemif->clk =3D devm_clk_get(dev, "aemif");=0A=
+       if (IS_ERR(aemif->clk)) {=0A=
+               dev_err(dev, "cannot get clock 'aemif'\n");=0A=
+               return PTR_ERR(aemif->clk);=0A=
+       }=0A=
+=0A=
+       clk_prepare_enable(aemif->clk);=0A=
+       aemif->clk_rate =3D clk_get_rate(aemif->clk) / 1000;=0A=
+=0A=
+       aemif->dev =3D dev;=0A=
+=0A=
+       if (of_device_is_compatible(np, "ti,omap-L138-aemif"))=0A=
+               aemif->cs_offset =3D 2;=0A=
+=0A=
+       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=0A=
+       aemif->base =3D devm_ioremap_resource(dev, res);=0A=
+       if (IS_ERR(aemif->base)) {=0A=
+               ret =3D PTR_ERR(aemif->base);=0A=
+               goto error;=0A=
+       }=0A=
+=0A=
+       /*=0A=
+        * For every controller device node, there is a cs device node that=
=0A=
+        * describe the bus configuration parameters. This functions iterat=
e=0A=
+        * over these nodes and update the cs data array.=0A=
+        */=0A=
+       for_each_matching_node(np, of_match_ptr(davinci_cs_of_match)) {=0A=
+               ret =3D of_davinci_aemif_parse_abus_config(np);=0A=
+               if (ret < 0)=0A=
+                       goto error;=0A=
+       }=0A=
+=0A=
+       for (i =3D 0; i < aemif->num_cs; i++) {=0A=
+               ret =3D davinci_aemif_config_abus(&aemif->cs_data[i]);=0A=
+               if (ret < 0) {=0A=
+                       dev_err(dev, "Error configuring chip select %d\n",=
=0A=
+                               aemif->cs_data[i].cs);=0A=
+                       goto error;=0A=
+               }=0A=
+       }=0A=
+=0A=
+       /*=0A=
+        * Create a child devices explicitly from here to=0A=
+        * guarantee that the child will be probed after the AEMIF timing=
=0A=
+        * parameters are set.=0A=
+        */=0A=
+       for_each_matching_node(np, of_match_ptr(davinci_cs_of_match)) {=0A=
+               ret =3D of_platform_populate(np, NULL, NULL, dev);=0A=
+               if (ret < 0)=0A=
+                       goto error;=0A=
+       }=0A=
+=0A=
+       return 0;=0A=
+error:=0A=
+       clk_disable_unprepare(aemif->clk);=0A=
+       return ret;=0A=
+}=0A=
+=0A=
+static int davinci_aemif_remove(struct platform_device *pdev)=0A=
+{=0A=
+       clk_disable_unprepare(aemif->clk);=0A=
+       return 0;=0A=
+}=0A=
+=0A=
+static struct platform_driver davinci_aemif_driver =3D {=0A=
+       .probe =3D davinci_aemif_probe,=0A=
+       .remove =3D davinci_aemif_remove,=0A=
+       .driver =3D {=0A=
+               .name =3D DRV_NAME,=0A=
+               .owner =3D THIS_MODULE,=0A=
+               .of_match_table =3D of_match_ptr(davinci_aemif_of_match),=
=0A=
+       },=0A=
+};=0A=
+=0A=
+module_platform_driver(davinci_aemif_driver);=0A=
+=0A=
+MODULE_AUTHOR("Murali Karicheri <m-karicheri2@ti.com>");=0A=
+MODULE_AUTHOR("Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>");=0A=
+MODULE_DESCRIPTION("Texas Instruments AEMIF driver");=0A=
+MODULE_LICENSE("GPL v2");=0A=
+MODULE_ALIAS("platform:" DRV_NAME);=0A=
--=0A=
1.7.9.5=0A=
=0A=
