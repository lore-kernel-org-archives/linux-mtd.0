Date: Mon, 22 Oct 2018 11:15:43 +0200
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
Message-ID: <20181022111543.2a607efc@bbrezillon>
In-Reply-To: <VI1PR04MB1038BD6103DD8BD6B6DEC2B899F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
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

On Mon, 22 Oct 2018 06:04:13 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:


> -       /* Find the matching configuration map */
> -       while (SMPT_MAP_ID(smpt[i]) != map_id) {
> -               if (smpt[i] & SMPT_DESC_END)
> -                       goto out;
> +       if (map_id_is_valid)
> +               pr_info("%s:%i map_id=%d\n", __func__, __LINE__, map_id);
> +       else
> +               pr_info("%s:%i NO map_id\n", __func__, __LINE__);
> +
> +       for (nmaps = 0; nmaps< smpt_len; nmaps++) {

Why did you change this for loop?

> +               if(!(smpt[nmaps] & SMPT_DESC_TYPE_MAP))
> +                       continue;
> +
> +               if(!map_id_is_valid) {
> +                       if (nmaps) {

With your change in the for () block, this test is no longer valid...

Please keep the original patch and patch the if () condition as
suggested.

> +                               ret = NULL;
> +                               break;
> +                       }
> +
> +                       ret = smpt+nmaps;
> +               } else if (map_id == SMPT_MAP_ID(smpt[nmaps])) {
> +                       ret = smpt+nmaps;
> +                       break;
> +               }
> +
>                 /* increment the table index to the next map */
> -               i += SMPT_MAP_REGION_COUNT(smpt[i]) + 1;
> +               nmaps += SMPT_MAP_REGION_COUNT(smpt[nmaps]) + 1;
>         }
> 
> -       ret = smpt + i;
>         /* fall through */
>  out:
>         nor->addr_width = addr_width;
