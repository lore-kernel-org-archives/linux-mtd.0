Received: from mail-gx0-f226.google.com ([209.85.217.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NElSU-0002bm-4k
	for linux-mtd@lists.infradead.org; Sun, 29 Nov 2009 15:13:10 +0000
Received: by gxk26 with SMTP id 26so4043870gxk.1
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Nov 2009 07:13:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20091129145623.GD11445@n2100.arm.linux.org.uk>
References: <20091129145623.GD11445@n2100.arm.linux.org.uk>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 29 Nov 2009 10:12:43 -0500
Message-ID: <8bd0f97a0911290712y298a530fwc6c1ab1c2bcb020b@mail.gmail.com>
Subject: Re: [PATCH] add pismo support
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 29, 2009 at 09:56, Russell King - ARM Linux wrote:
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> +config MTD_PISMO
> + =C2=A0 =C2=A0 =C2=A0 tristate "MTD discovery driver for PISMO modules"
> + =C2=A0 =C2=A0 =C2=A0 depends on I2C
> + =C2=A0 =C2=A0 =C2=A0 depends on ARCH_VERSATILE
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver allows for discovery of PISMO m=
odules - see
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 <http://www.pismoworld.org/>. =C2=A0These a=
re small modules containing
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 up to five memory devices (eg, SRAM, flash,=
 DOC) described by an
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 I2C EEPROM.
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver does not create any MTD maps it=
self; instead it
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 creates MTD physmap and MTD SRAM platform d=
evices. =C2=A0If you
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable this option, you should consider ena=
bling MTD_PHYSMAP
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 and/or MTD_PLATRAM according to the devices=
 on your module.

a sentence telling the module name when built as a module would be good

> +static unsigned int pismo_width_to_bytes(unsigned int width)
> +static int pismo_eeprom_read(struct i2c_client *client, void *buf, u8 ad=
dr,
> + =C2=A0 =C2=A0 =C2=A0 size_t size)
> +static int pismo_add_device(struct pismo_data *pismo, int i,
> +       struct pismo_mem *region, const char *name, void *pdata, size_t p=
size)
> +static int pismo_add_nor(struct pismo_data *pismo, int i,
> +       struct pismo_mem *region)
> +static int pismo_add_sram(struct pismo_data *pismo, int i,
> +       struct pismo_mem *region)
> +static void pismo_add_one(struct pismo_data *pismo, int i,
> +       const struct pismo_cs_block *cs, phys_addr_t base)
> +static int __devinit pismo_probe(struct i2c_client *client,
> +                                const struct i2c_device_id *id)

all should be __devinit since they're only called by pismo_probe()

> +static int pismo_init(void)

__init

> + =C2=A0 =C2=A0 =C2=A0 if (sizeof(struct pismo_cs_block) !=3D 48) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("BUG: PISMO: si=
zeof(struct pismo_cs_block) wrong\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 if (sizeof(struct pismo_eeprom) !=3D 256) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("BUG: PISMO: si=
zeof(struct pismo_eeprom) wrong\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }

BUILD_BUG()
-mike
