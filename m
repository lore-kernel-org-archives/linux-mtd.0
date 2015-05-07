Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqQr1-0003fV-Mt
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 18:49:04 +0000
Message-ID: <554BB386.4070704@broadcom.com>
Date: Thu, 7 May 2015 11:48:38 -0700
From: Ray Jui <rjui@broadcom.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <7101952.uOJDgn7tgf@wuerfel> <20150506204910.GJ32500@ld-irv-0074>
 <20781942.cIPodTiNzG@wuerfel> <20150507184246.GO32500@ld-irv-0074>
In-Reply-To: <20150507184246.GO32500@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>,
 Kevin Cernekee <cernekee@gmail.com>,
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



On 5/7/2015 11:42 AM, Brian Norris wrote:
> On Thu, May 07, 2015 at 12:01:02PM +0200, Arnd Bergmann wrote:
>> On Wednesday 06 May 2015 13:49:10 Brian Norris wrote:
>>> On Wed, May 06, 2015 at 09:12:43PM +0200, Arnd Bergmann wrote:
>>>> On Wednesday 06 May 2015 10:59:50 Brian Norris wrote:
>>>>> +       /*
>>>>> +        * Some SoCs integrate this controller (e.g., its interrupt bits) in
>>>>> +        * interesting ways
>>>>> +        */
>>>>> +       if (of_property_read_bool(dn, "brcm,nand-soc")) {
>>>>> +               struct device_node *soc_dn;
>>>>> +
>>>>> +               soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
>>>>> +               if (!soc_dn)
>>>>> +                       return -ENODEV;
>>>>> +
>>>>> +               ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
>>>>> +               if (!ctrl->soc) {
>>>>> +                       dev_err(dev, "could not probe SoC data\n");
>>>>> +                       of_node_put(soc_dn);
>>>>> +                       return -ENODEV;
>>>>> +               }
>>>>> +
>>>>> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
>>>>> +                                      DRV_NAME, ctrl);
>>>>> +
>>>>> +               /* Enable interrupt */
>>>>> +               ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
>>>>> +
>>>>> +               of_node_put(soc_dn);
>>>>> +       } else {
>>>>> +               /* Use standard interrupt infrastructure */
>>>>> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
>>>>> +                                      DRV_NAME, ctrl);
>>>>> +       }
>>>>>
>>>>
>>>> It looks to me like this should be handled as a nested irqchip, so the node
>>>> you look up gets used as the "interrupt-parent" instead, making the behavior
>>>> of this SoC transparent to the nand driver.
>>>
>>> You snipped the rest of the patch, which involves more than just IRQ
>>> handling. The same registers touch both interrupts and data bus endian
>>> configuration, so it can't possibly be done transparently to the NAND
>>> driver.
>>
>> Anything else in there?
> 
> Looks like miscellaneous NAND-related control bits. AXI and APB endian
> configuration; several interrupt-enable bits (we only use one for now);
> a clock-enable; and some timing test mode bits.
> 
>> The bus configuration would just involve writing
>> a constant value in some register, right?
> 
> I'm not an expert on the Cygnus/iProc chips, but I believe the answer is
> no: we *must* reconfigure the bus before and after each data
> transaction, because it affects the rest of the core too. Others on the
> CC list can probably elaborate.
> 

Yes, we must configure the bus before the after each data/cache
registers access, because it changes the APB bus endianess.

Thanks,

Ray
