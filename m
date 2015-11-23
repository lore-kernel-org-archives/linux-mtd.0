Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0w0q-0004Oe-6V
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 18:38:58 +0000
Subject: Re: [PATCH (v4) 2/2] mtd: brcmnand: Add support for the BCM63268
To: Jonas Gorski <jogo@openwrt.org>
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk>
 <CAOiHx=mZpycf962D0snStBMDA=Pnexdrk6wok9MVQdHaLN8fAQ@mail.gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <56535D15.7070307@simon.arlott.org.uk>
Date: Mon, 23 Nov 2015 18:38:13 +0000
MIME-Version: 1.0
In-Reply-To: <CAOiHx=mZpycf962D0snStBMDA=Pnexdrk6wok9MVQdHaLN8fAQ@mail.gmail.com>
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

On 23/11/15 15:42, Jonas Gorski wrote:
> On Sun, Nov 22, 2015 at 11:17 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
>> +       priv->clk = of_clk_get(dev->of_node, 0);
> 
> 
> Why not use a named clock here? That way you can make use of
> devm_clk_get and don't need to care about putting it.

Ok.

>> +
>> +static struct platform_driver bcm63268_nand_driver = {
>> +       .probe                  = bcm63268_nand_probe,
>> +       .remove                 = brcmnand_remove,
>> +       .driver = {
>> +               .name           = "bcm63268_nand",
>> +               .pm             = &brcmnand_pm_ops,
>> +               .of_match_table = bcm63268_nand_of_match,
>> +       }
>> +};
>> +module_platform_driver(bcm63268_nand_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Simon Arlott");
>> +MODULE_DESCRIPTION("NAND driver for BCM63268");
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 2c8f67f..7b4988f 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -2270,6 +2270,9 @@ int brcmnand_remove(struct platform_device *pdev)
>>         list_for_each_entry(host, &ctrl->host_list, node)
>>                 nand_release(&host->mtd);
>>
>> +       if (ctrl->soc && ctrl->soc->remove_device)
>> +               ctrl->soc->remove_device(ctrl->soc);
>> +
> 
> This is a bit weird, why don't you just use your own .remove callback
> for the driver that like you did for .probe? then you won't need to
> add a remove_device callback at all.

I don't have access to the struct brcmnand_soc which is stored by
brcmnand_probe() as the containing struct is defined in brcmnand.c.

I could move that struct out to a header file and use it directly from a
bcm63268_nand_remove() function but I'd have to move a few other defines
too.

>>         dev_set_drvdata(&pdev->dev, NULL);
>>
>>         return 0;
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/brcmnand/brcmnand.h
>> index ef5eabb..5c5dc2d 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.h
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.h
>> @@ -24,6 +24,7 @@ struct brcmnand_soc {
>>         bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
>>         void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
>>         void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
>> +       void (*remove_device)(struct brcmnand_soc *soc);
>>  };
>>
>>  static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *soc)
> 
> 
> Jonas
> 


-- 
Simon Arlott
