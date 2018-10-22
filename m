Date: Mon, 22 Oct 2018 12:20:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, "richard@nod.at"
 <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "cyrille.pitchen@microchip.com" <cyrille.pitchen@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Cristian.Birsan@microchip.com" <Cristian.Birsan@microchip.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP
 SPI NOR flash memories
Message-ID: <20181022122048.2b3633e0@bbrezillon>
In-Reply-To: <VI1PR04MB1038EF892921194D1BFDE6FC99F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <20180911154007.17195-1-tudor.ambarus@microchip.com>
 <20180911154007.17195-2-tudor.ambarus@microchip.com>
 <VI1PR04MB103888BC18F3C5AD0C02DEF699FE0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <31a8f6a9-1459-443a-6ef8-2b2c17769ae4@microchip.com>
 <de0f7245-2557-12be-a306-67b08e55ae7b@wedev4u.fr>
 <VI1PR04MB1038AB25EABDC8507984ADC799FF0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181017090724.12f2cd79@bbrezillon>
 <20181017091045.124e0266@bbrezillon>
 <20181017092941.3658bd9a@bbrezillon>
 <VI1PR04MB1038EFA1E83AD78EBE84ECC499FF0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181017115237.07310b74@bbrezillon>
 <VI1PR04MB1038BD6103DD8BD6B6DEC2B899F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022111543.2a607efc@bbrezillon>
 <VI1PR04MB1038EF892921194D1BFDE6FC99F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 22 Oct 2018 10:03:55 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> [    1.624684] m25p80 spi0.0: found s25fl512s, expected m25p80
> [    1.630377] Start [addr_width:00000000, read_dumy:08, read_opcode:00000000]
> [    1.637335] spi_nor_get_map_in_use:2882 smpt[0]=08ff65fc
> [    1.642641] spi_nor_get_map_in_use:2882 smpt[1]=00000004
> [    1.647945] spi_nor_get_map_in_use:2882 smpt[2]=04ff65fc
> [    1.653248] spi_nor_get_map_in_use:2882 smpt[3]=00000002
> [    1.658551] spi_nor_get_map_in_use:2882 smpt[4]=02ff65fd
> [    1.663855] spi_nor_get_map_in_use:2882 smpt[5]=00000004
> [    1.669158] spi_nor_get_map_in_use:2882 smpt[6]=ff0201fe
> [    1.674461] spi_nor_get_map_in_use:2882 smpt[7]=00007ff1
> [    1.679766] spi_nor_get_map_in_use:2882 smpt[8]=00037ff4
> [    1.685070] spi_nor_get_map_in_use:2882 smpt[9]=03fbfff4
> [    1.690375] spi_nor_get_map_in_use:2882 smpt[10]=ff0203fe
> [    1.695768] spi_nor_get_map_in_use:2882 smpt[11]=03fbfff4
> [    1.701158] spi_nor_get_map_in_use:2882 smpt[12]=00037ff4
> [    1.706550] spi_nor_get_map_in_use:2882 smpt[13]=00007ff1
> [    1.711940] spi_nor_get_map_in_use:2882 smpt[14]=ff0005ff
> [    1.717330] spi_nor_get_map_in_use:2882 smpt[15]=03fffff4
> [    1.722720] smpt[0]=[addr_width:00000000, read_dumy:08, read_opcode:00000065]

Okay, so addr_width is wrong here (I guess read_dummy is wrong too).
That's probably because we fall in the SMPT_CMD_ADDRESS_LEN_USE_CURRENT
case and nor->addr_width has not yet been initialize when we reach this
function.

> [    1.729861] spi_nor_get_map_in_use:2912 map_id=1
> 
> 

[...]

> +       for (i = 0; i<smpt_len; i++)
> +               pr_info("%s:%i smpt[%d]=%08x\n", __func__, __LINE__, i, smpt[i]);
> +
>         map_id = 0;
> -       i = 0;
>         /* Determine if there are any optional Detection Command Descriptors */
> -       while (!(smpt[i] & SMPT_DESC_TYPE_MAP)) {
> +       for (i = 0; i< smpt_len; i++) {
> +               if ((smpt[i] & SMPT_DESC_TYPE_MAP))
> +                       break;
> +
>                 read_data_mask = SMPT_CMD_READ_DATA(smpt[i]);
>                 nor->addr_width = spi_nor_smpt_addr_width(nor, smpt[i]);
>                 nor->read_dummy = spi_nor_smpt_read_dummy(nor, smpt[i]);
>                 nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
> +               pr_info("smpt[%d]=[addr_width:%08x, read_dumy:%0x8, read_opcode:%08x]\n", i, nor->addr_width, nor->read_dummy, nor->read_opcode);

								^ %08x
