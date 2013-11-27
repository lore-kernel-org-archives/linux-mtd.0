Message-ID: <52957690.60102@freescale.com>
Date: Wed, 27 Nov 2013 12:35:28 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 2/4] mtd: spi-nor: add a new data structrue spi_nor{}
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <1385447575-23773-3-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA4EEF0@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA4EEF0@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "marex@denx.de" <marex@denx.de>, "broonie@linaro.org" <broonie@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8826=E6=97=A5 19:42, Gupta, Pekon =E5=86=99=
=E9=81=93:
>> From: Huang Shijie [mailto:b32955@freescale.com]
> [...]
>> +#define	MAX_CMD_SIZE		6
>> +
>> +enum read_type {
>> +	M25P80_NORMAL =3D 0,
>> +	M25P80_FAST,
>> +	M25P80_QUAD,
>> +};
> Sorry. no 'M25P80' suffix here this is spi-nor.h :-)
>
>
ok. thanks. :)
>> +
>> +struct spi_nor {
>> +	struct mutex		lock;
>> +	struct mtd_info		mtd;
>>
> mtd_info should not be present here. Rather it should be other way roun=
d
> 'mtd_info->priv =3D (struct spi_nor *) spi_nor;
>
>
put the mtd here can make code simple,

do David/Brian have any comment about this?
If all object to put the mtd here, i will change it.


>> +	struct device		*dev;
> Again, spi_nor would be a MTD device, not a new type of device on its o=
wn.
> Thus you should use, mtd_info->dev.
>
>
this dev pointer is not from the mtd_info->dev, it from the spi_device=20
or other spi nor device .
>> +	u16			page_size;
>> +	u16			addr_width;
>> +	u8			erase_opcode;
>> +	u8			read_opcode;
> s/read_opcode/read_flash_opcode
why not keep the legacy name?
should we also rename the erase_opcode to erase_flash_opcode? :)
> How about '+  u8  read_reg_opcode' ??
>
>
>> +	u8			program_opcode;
> + How about '+  u8  write_reg_opcode' ??
>
>
>> +	u8			command[MAX_CMD_SIZE];
>> +	enum read_type		flash_read;
> s/read_type/read_mode
> (agree .. there is nothing in the name, but it matches SPI generic fram=
ework)
>
> Other missing fields I can think of are..
> + u8 read_dummy_cycles;
I was wondering if other SPI NOR driver needs this field.
current dummy is 8 clock cycles for quad-read/fast-read, but for DDR=20
QUAD read, the dummy is not 8 clock cycles.
so i did not add this field to spi-nor{}.

I do not know how the m25p80 handle the non-8 clock cycles cases...

But it's okay to me to add this field to spi-nor{}.




> + u8 write_dummy_cycles;
>
>
do the write need a dummy?

I check the s25fl128s's quad page program, it does not need a dummy.
>> +	bool			sst_write_second;
>> +
>> +	/*
>> +	 * Read the register:
>> +	 *  Read `len` length data from the register specified by the `opcod=
e`,
>> +	 *  and store the data to the `buf`.
>> +	 */
>> +	int (*read_reg)(struct spi_nor *flash, u8 opcode, u8 *buf, int len);
>>
> Do you need 'opcode' passed in argument here ?
> Can you add it as 'read_reg_opcode' field in struct spi_nor ?
> 'read_reg_opcode' should be fixed for a device like a 'read_flash_opcod=
e'.
>
>
the @read_reg can be used to read id, read status and so on.
so the opcode here is not a fixed value.

but i do not object to add the read_reg_opcode/write_reg_opcode to=20
spi_nor{}.



>> +
>> +	/*
>> +	 * Write the register:
>> +	 *  Write the `cmd_len` length data stored in the @command to the
>> NOR,
>> +	 *  the command[0] stores the write opcode. `offset` is only used fo=
r
>> +	 *  erase operation, it should set to zero for other NOR commands.
>> +	 */
>> +	int (*write_reg)(struct spi_nor *flash, int cmd_len, u32 offset);
>>
> Instead of having actual 'command[]' array in struct spi_nor, and pass =
its
> valid length here.. shouldn't you pass the command as u8[] here..
> int (*write_reg)(struct spi_nor *flash, u8 *cmd, u32 cmd_len);
> where
> 	cmd[0] =3D=3D command_opcode
> 	cmd[1] =3D=3D command argument 1 (like offset for erase)
> 	cmd[2] =3D=3D command argument 2
> 	...
>
is there any benefit of your code?
you will use a local array in the stack.

why not use the spi_nor->command which has used for a long time.


>> +
>> +	/* write data */
>> +	void (*write)(struct spi_nor *flash, loff_t to, size_t len,
>> +			size_t *retlen, const u_char *buf);
>> +	/* read data */
>> +	int (*read)(struct spi_nor *flash, loff_t from, size_t len,
>> +			size_t *retlen, u_char *buf);
>> +};
>>   #endif
>> --
>> 1.7.2.rc3
>>
> Sorry for bit intrusive feedback. But I think it would help you to
> refine it better. Also some reference below
> http://lists.infradead.org/pipermail/linux-mtd/2013-October/049307.html
>
thanks. I referenced it when i wrote this patch.

thanks
Huang Shijie
