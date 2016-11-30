Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
To: Shawn Lin <shawn.lin@rock-chips.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <1479437945-27918-1-git-send-email-shawn.lin@rock-chips.com>
 <1479437945-27918-3-git-send-email-shawn.lin@rock-chips.com>
 <62baf961-e84f-24a4-4345-05a51f351c01@gmail.com>
 <cf514674-cc2b-f159-3caa-a3233fa1dbbb@rock-chips.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <86db3803-69a6-1afd-f4cb-841dd9eac9fb@gmail.com>
Date: Wed, 30 Nov 2016 04:23:36 +0100
MIME-Version: 1.0
In-Reply-To: <cf514674-cc2b-f159-3caa-a3233fa1dbbb@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/30/2016 02:17 AM, Shawn Lin wrote:
[...]
>>> +static inline int rockchip_sfc_pio_read(struct rockchip_sfc *sfc,
>>> u_char *buf,
>>> +                    size_t len)
>>> +{
>>> +    u32 dwords, rx_wl, count, i, tmp;
>>> +    unsigned long timeout;
>>> +    int ret = 0;
>>> +    u32 *tbuf = (u32 *)buf;
>>> +    u_char *tbuf2;
>>> +
>>> +    /*
>>> +     * Align bytes to dwords, and get the remained bytes.
>>> +     * We should always round down to DWORD as the ahb for
>>> +     * Rockchip Socs won't support non-aligned-to-DWORD transfer.
>>> +     * So please don't use any APIs that will finally use non-aligned
>>> +     * read, for instance, memcpy_fromio or ioread32_rep etc.
>>> +     */
>>> +    dwords = len >> 2;
>>> +    len = len & 0x3;
>>
>> Won't this overwrite some bits past the $buf if you write more than $len
>> bytes into this memory location ?
>>
> 
> I can't see the possibility here to overwrite $buf, no?

Looking at the code again, I believe not, although it's quite
non-trivial piece of code.

>>> +    while (dwords) {
>>> +        rx_wl = (readl_relaxed(sfc->regbase + SFC_FSR) >>
>>> +             SFC_FSR_RX_WATER_LVL_SHIFT) &
>>> +             SFC_FSR_RX_WATER_LVL_MASK;
>>> +
>>> +        if (rx_wl > 0) {
>>> +            count = min_t(u32, dwords, rx_wl);
>>> +            for (i = 0; i < count; i++) {
>>> +                *tbuf++ = readl_relaxed(sfc->regbase +
>>> +                            SFC_DATA);
>>> +                dwords--;
>>> +            }
>>> +
>>> +            if (dwords == 0)
>>> +                break;
>>> +            timeout = 0;
>>> +        } else {
>>> +            mdelay(1);
>>> +            if (timeout++ > SFC_MAX_IDLE_RETRY) {
>>> +                ret = -ETIMEDOUT;
>>> +                break;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* Read the remained bytes */
>>> +    timeout = 0;
>>> +    tbuf2 = (u_char *)tbuf;
>>> +    while (len) {
>>> +        rx_wl = (readl_relaxed(sfc->regbase + SFC_FSR) >>
>>> +             SFC_FSR_RX_WATER_LVL_SHIFT) &
>>> +             SFC_FSR_RX_WATER_LVL_MASK;
>>> +        if (rx_wl > 0) {
>>> +            tmp = readl_relaxed(sfc->regbase + SFC_DATA);
>>> +            for (i = 0; i < len; i++)
>>> +                tbuf2[i] = (u8)((tmp >> (i * 8)) & 0xff);
>>> +            goto done;
>>> +        } else {
>>> +            mdelay(1);
>>> +            if (timeout++ > SFC_MAX_IDLE_RETRY) {
>>> +                ret = -ETIMEDOUT;
>>> +                break;
>>> +            }
>>> +        }
>>> +    }

[...]

>>> +static int rockchip_sfc_probe(struct platform_device *pdev)
>>> +{
>>> +    struct device *dev = &pdev->dev;
>>> +    struct resource *res;
>>> +    struct rockchip_sfc *sfc;
>>> +    int ret;
>>> +
>>> +    sfc = devm_kzalloc(dev, sizeof(*sfc), GFP_KERNEL);
>>> +    if (!sfc)
>>> +        return -ENOMEM;
>>> +
>>> +    platform_set_drvdata(pdev, sfc);
>>> +    sfc->dev = dev;
>>> +
>>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +    sfc->regbase = devm_ioremap_resource(dev, res);
>>> +    if (IS_ERR(sfc->regbase))
>>> +        return PTR_ERR(sfc->regbase);
>>> +
>>> +    sfc->clk = devm_clk_get(&pdev->dev, "sfc");
>>> +    if (IS_ERR(sfc->clk)) {
>>> +        dev_err(&pdev->dev, "Failed to get sfc interface clk\n");
>>> +        return PTR_ERR(sfc->clk);
>>> +    }
>>> +
>>> +    sfc->hclk = devm_clk_get(&pdev->dev, "hsfc");
>>> +    if (IS_ERR(sfc->hclk)) {
>>> +        dev_err(&pdev->dev, "Failed to get sfc ahp clk\n");
>>> +        return PTR_ERR(sfc->hclk);
>>> +    }
>>> +
>>> +    ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>>> +    if (ret) {
>>> +        dev_warn(dev, "Unable to set dma mask\n");
>>> +        return ret;
>>> +    }
>>> +
>>> +    sfc->buffer = dmam_alloc_coherent(dev, SFC_DMA_MAX_LEN,
>>> +            &sfc->dma_buffer, GFP_KERNEL);
>>> +    if (!sfc->buffer)
>>> +        return -ENOMEM;
>>> +
>>> +    mutex_init(&sfc->lock);
>>> +
>>> +    ret = clk_prepare_enable(sfc->hclk);
>>> +    if (ret) {
>>> +        dev_err(&pdev->dev, "Failed to enable hclk\n");
>>> +        goto err_hclk;
>>> +    }
>>> +
>>> +    ret = clk_prepare_enable(sfc->clk);
>>> +    if (ret) {
>>> +        dev_err(&pdev->dev, "Failed to enable clk\n");
>>> +        goto err_clk;
>>> +    }
>>> +
>>> +    sfc->use_dma = !of_property_read_bool(sfc->dev->of_node,
>>> +                          "rockchip,sfc-no-dma");
>>> +
>>> +    sfc->negative_edge = of_device_is_compatible(sfc->dev->of_node,
>>> +                             "rockchip,rk1108-sfc");
>>
>> I think this should rather be a boolean property -- but isn't this
>> something like CPOL or CPHA anyway ?
> 
> It isn't the same as CPOL or CPHA. And this value should be Soc
> specificed.

So what is this about ? Can you explain what this negative_edge thing is
and how it works on the bus-level ?

[...]

-- 
Best regards,
Marek Vasut
