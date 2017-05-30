Received: from hauke-m.de ([5.39.93.123] helo=mail.hauke-m.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFneC-00024m-Ek
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 20:21:46 +0000
Subject: Re: [PATCH v3 14/16] phy: Add an USB PHY driver for the Lantiq SoCs
 using the RCU module
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20170528184006.31668-1-hauke@hauke-m.de>
 <20170528184006.31668-15-hauke@hauke-m.de>
 <CAHp75Ve9bV99=WCzmXU-Rth-gar5gqvy4taZ7NMQQHGKcVbHHw@mail.gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,
 Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 john <john@phrozen.org>, linux-spi <linux-spi@vger.kernel.org>,
 "hauke.mehrtens" <hauke.mehrtens@intel.com>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <6180daf0-2eaf-cd68-3eb5-e119dfd4aa2a@hauke-m.de>
Date: Tue, 30 May 2017 22:21:19 +0200
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve9bV99=WCzmXU-Rth-gar5gqvy4taZ7NMQQHGKcVbHHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/30/2017 08:31 PM, Andy Shevchenko wrote:
> On Sun, May 28, 2017 at 9:40 PM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>> This driver starts the DWC2 core(s) built into the XWAY SoCs and provides
>> the PHY interfaces for each core. The phy instances can be passed to the
>> dwc2 driver, which already supports the generic phy interface.
> 
>> +static void ltq_rcu_usb2_start_cores(struct platform_device *pdev)
> 
> It should return int. See below.
> 
>> +{
> 
>> +       /* Power on the USB core. */
>> +       if (clk_prepare_enable(priv->ctrl_gate_clk)) {
> 
> You basically shadow the error, why?

Thanks for the hint I changed it.

>> +               dev_err(dev, "failed to enable CTRL gate\n");
>> +               return;
>> +       }
> 
>> +       if (clk_prepare_enable(priv->phy_gate_clk)) {
>> +               dev_err(dev, "failed to enable PHY gate\n");
>> +               return;
>> +       }
> 
> Ditto.

same here.

>> +static int ltq_rcu_usb2_of_probe(struct device_node *phynode,
>> +                                   struct ltq_rcu_usb2_priv *priv)
>> +{
>> +       struct device *dev = priv->dev;
>> +       const struct of_device_id *match =
>> +               of_match_node(ltq_rcu_usb2_phy_of_match, phynode);
>> +       int ret;
>> +
> 
>> +       if (!match) {
>> +               dev_err(dev, "Not a compatible Lantiq RCU USB PHY\n");
>> +               return -EINVAL;
>> +       }
> 
> Can it ever happen?

As long as this device gets probed by device tree this can not happen,
so I will remove it.

>> +
>> +       priv->reg_bits = match->data;
> 
> I think there is a helper to get driver data directly from node.

Thanks for the hint, there is of_device_get_match_data() which does this.

>> +       if (priv->reg_bits->have_ana_cfg) {
>> +               ret = device_property_read_u32(dev, "offset-ana",
>> +                                              &priv->ana_cfg1_reg_offset);
>> +               if (ret) {
>> +                       dev_dbg(dev, "Failed to get RCU ANA CFG1 reg offset\n");
>> +                       return ret;
>> +               }
>> +       }
> 
> ret = device_property_...(...);
> if (ret && priv->reg_bits->have_ana_cfg) {
>  ...
>  return ret;
> }
> 
> ?

Yes, that should look better, I will change it.

> 
> 
>> +       priv->dev = &pdev->dev;
> 
>> +       dev_set_drvdata(priv->dev, priv);
> 
> Move this to the end of function. Ideally it should be run if and only
> if the function returns 0.

Done

>> +       provider = devm_of_phy_provider_register(&pdev->dev,
>> +                                                of_phy_simple_xlate);
>> +
>> +       return PTR_ERR_OR_ZERO(provider);
> 
> I would do explicitly, though it's up to you and maintainer.
> 
> if (IS_ERR(provider))
>  return PTR_ERR();
> 
> return 0;

I do not care, but this was I can call dev_set_drvdata() when this is
really returning 0.

Hauke
