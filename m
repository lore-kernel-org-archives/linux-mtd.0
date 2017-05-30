Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFlvp-0006Xq-Pl
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 18:31:53 +0000
Received: by mail-qk0-x244.google.com with SMTP id c206so3192128qkb.0
 for <linux-mtd@lists.infradead.org>; Tue, 30 May 2017 11:31:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170528184006.31668-15-hauke@hauke-m.de>
References: <20170528184006.31668-1-hauke@hauke-m.de>
 <20170528184006.31668-15-hauke@hauke-m.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 May 2017 21:31:27 +0300
Message-ID: <CAHp75Ve9bV99=WCzmXU-Rth-gar5gqvy4taZ7NMQQHGKcVbHHw@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] phy: Add an USB PHY driver for the Lantiq SoCs
 using the RCU module
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Ralf Baechle <ralf@linux-mips.org>,
 Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 john <john@phrozen.org>, linux-spi <linux-spi@vger.kernel.org>,
 "hauke.mehrtens" <hauke.mehrtens@intel.com>,
 Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 28, 2017 at 9:40 PM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> This driver starts the DWC2 core(s) built into the XWAY SoCs and provides
> the PHY interfaces for each core. The phy instances can be passed to the
> dwc2 driver, which already supports the generic phy interface.

> +static void ltq_rcu_usb2_start_cores(struct platform_device *pdev)

It should return int. See below.

> +{

> +       /* Power on the USB core. */
> +       if (clk_prepare_enable(priv->ctrl_gate_clk)) {

You basically shadow the error, why?

> +               dev_err(dev, "failed to enable CTRL gate\n");
> +               return;
> +       }

> +       if (clk_prepare_enable(priv->phy_gate_clk)) {
> +               dev_err(dev, "failed to enable PHY gate\n");
> +               return;
> +       }

Ditto.

> +static int ltq_rcu_usb2_of_probe(struct device_node *phynode,
> +                                   struct ltq_rcu_usb2_priv *priv)
> +{
> +       struct device *dev = priv->dev;
> +       const struct of_device_id *match =
> +               of_match_node(ltq_rcu_usb2_phy_of_match, phynode);
> +       int ret;
> +

> +       if (!match) {
> +               dev_err(dev, "Not a compatible Lantiq RCU USB PHY\n");
> +               return -EINVAL;
> +       }

Can it ever happen?

> +
> +       priv->reg_bits = match->data;

I think there is a helper to get driver data directly from node.

> +       if (priv->reg_bits->have_ana_cfg) {
> +               ret = device_property_read_u32(dev, "offset-ana",
> +                                              &priv->ana_cfg1_reg_offset);
> +               if (ret) {
> +                       dev_dbg(dev, "Failed to get RCU ANA CFG1 reg offset\n");
> +                       return ret;
> +               }
> +       }

ret = device_property_...(...);
if (ret && priv->reg_bits->have_ana_cfg) {
 ...
 return ret;
}

?


> +       priv->dev = &pdev->dev;

> +       dev_set_drvdata(priv->dev, priv);

Move this to the end of function. Ideally it should be run if and only
if the function returns 0.

> +       provider = devm_of_phy_provider_register(&pdev->dev,
> +                                                of_phy_simple_xlate);
> +
> +       return PTR_ERR_OR_ZERO(provider);

I would do explicitly, though it's up to you and maintainer.

if (IS_ERR(provider))
 return PTR_ERR();

return 0;

-- 
With Best Regards,
Andy Shevchenko
