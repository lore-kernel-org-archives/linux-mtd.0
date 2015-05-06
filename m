Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yq4ky-0005e3-DR
 for linux-mtd@lists.infradead.org; Wed, 06 May 2015 19:13:21 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Wed, 06 May 2015 21:12:43 +0200
Message-ID: <7101952.uOJDgn7tgf@wuerfel>
In-Reply-To: <1430935194-7579-7-git-send-email-computersforpeace@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <1430935194-7579-7-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 06 May 2015 10:59:50 Brian Norris wrote:
> +       /*
> +        * Some SoCs integrate this controller (e.g., its interrupt bits) in
> +        * interesting ways
> +        */
> +       if (of_property_read_bool(dn, "brcm,nand-soc")) {
> +               struct device_node *soc_dn;
> +
> +               soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
> +               if (!soc_dn)
> +                       return -ENODEV;
> +
> +               ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
> +               if (!ctrl->soc) {
> +                       dev_err(dev, "could not probe SoC data\n");
> +                       of_node_put(soc_dn);
> +                       return -ENODEV;
> +               }
> +
> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
> +                                      DRV_NAME, ctrl);
> +
> +               /* Enable interrupt */
> +               ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
> +
> +               of_node_put(soc_dn);
> +       } else {
> +               /* Use standard interrupt infrastructure */
> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
> +                                      DRV_NAME, ctrl);
> +       }
> 

It looks to me like this should be handled as a nested irqchip, so the node
you look up gets used as the "interrupt-parent" instead, making the behavior
of this SoC transparent to the nand driver.

We recently merged nested irqdomain support as well, which might help here,
or might not be needed.

	Arnd
