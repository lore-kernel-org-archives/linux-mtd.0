Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqQtp-0006sH-Cd
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 18:51:57 +0000
Message-ID: <554BB429.7090009@broadcom.com>
Date: Thu, 7 May 2015 11:51:21 -0700
From: Florian Fainelli <fainelli@broadcom.com>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <7101952.uOJDgn7tgf@wuerfel> <20150506204910.GJ32500@ld-irv-0074>
 <20781942.cIPodTiNzG@wuerfel>
In-Reply-To: <20781942.cIPodTiNzG@wuerfel>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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

On 07/05/15 03:01, Arnd Bergmann wrote:
> On Wednesday 06 May 2015 13:49:10 Brian Norris wrote:
>> On Wed, May 06, 2015 at 09:12:43PM +0200, Arnd Bergmann wrote:
>>> On Wednesday 06 May 2015 10:59:50 Brian Norris wrote:
>>>> +       /*
>>>> +        * Some SoCs integrate this controller (e.g., its interrupt bits) in
>>>> +        * interesting ways
>>>> +        */
>>>> +       if (of_property_read_bool(dn, "brcm,nand-soc")) {
>>>> +               struct device_node *soc_dn;
>>>> +
>>>> +               soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
>>>> +               if (!soc_dn)
>>>> +                       return -ENODEV;
>>>> +
>>>> +               ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
>>>> +               if (!ctrl->soc) {
>>>> +                       dev_err(dev, "could not probe SoC data\n");
>>>> +                       of_node_put(soc_dn);
>>>> +                       return -ENODEV;
>>>> +               }
>>>> +
>>>> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
>>>> +                                      DRV_NAME, ctrl);
>>>> +
>>>> +               /* Enable interrupt */
>>>> +               ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
>>>> +
>>>> +               of_node_put(soc_dn);
>>>> +       } else {
>>>> +               /* Use standard interrupt infrastructure */
>>>> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
>>>> +                                      DRV_NAME, ctrl);
>>>> +       }
>>>>
>>>
>>> It looks to me like this should be handled as a nested irqchip, so the node
>>> you look up gets used as the "interrupt-parent" instead, making the behavior
>>> of this SoC transparent to the nand driver.
>>
>> You snipped the rest of the patch, which involves more than just IRQ
>> handling. The same registers touch both interrupts and data bus endian
>> configuration, so it can't possibly be done transparently to the NAND
>> driver.
> 
> Anything else in there? The bus configuration would just involve writing
> a constant value in some register, right? Doing that in the irqchip
> is also a bit ugly, but may still be better overall than doing it the
> way you have above.

IMHO this is uglier, having a pseudo interrupt controller driver that
also takes care of preparing bus transfers, as opposed to an ad-hoc
piece of code that does not pretend to be an interrupt controller at all
sounds like the former is lying about what it is, while the latter is
pretty straight forward even though it may duplicate an existing subsystem.

I would definitively see some value in writing an irqchip driver if this
was remotely useful outside of the NAND block, e.g: the interrupt bits
would serve other peripherals than NAND, which is not the case for 63138
and 338x AFAICT, Cygnus is a special case.

I could very well imagine a near future where this controller gets added
more features in the DMA/data-path that may require bus/chip-level glue
code to be interfaced properly between Broadcom's different internal
buses. In which case, the interrupt controller portion of the code could
be much smaller than the bus/data-path logic, would it still make sense
to pretend this to be an interrupt controller?
-- 
Florian
