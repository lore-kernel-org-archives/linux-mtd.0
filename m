Received: from mail-yw0-x230.google.com ([2607:f8b0:4002:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciONP-0005Tz-Ou
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 16:42:26 +0000
Received: by mail-yw0-x230.google.com with SMTP id l138so15663415ywc.0
 for <linux-mtd@lists.infradead.org>; Mon, 27 Feb 2017 08:41:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170227170911.5b0fa0a7@bbrezillon>
References: <1487647832-10544-1-git-send-email-kdasu.kdev@gmail.com>
 <20170227170911.5b0fa0a7@bbrezillon>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Mon, 27 Feb 2017 11:41:15 -0500
Message-ID: <CAKekbet3_Mv1oRybrQ6m01GFioNfy=e8-2h=yn-3qEB=4dN9qw@mail.gmail.com>
Subject: Re: [PATCH V3,
 1/2] mtd: nand: brcmnand: Change brcmnand_set_wp() prototype
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Richard Weinberger <richard@nod.at>,
 marek.vasut@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok will make sure the mtd email list is up-to-date.

Thanks
Kamal

On Mon, Feb 27, 2017 at 11:09 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Kamal,
>
> This time I'm not even in the recipients list :-(. Can you please make
> sure you Cc all the relevant maintainers when sending a patch (this is
> not the first time it happens).
>
> Thanks,
>
> Boris
>
> On Mon, 20 Feb 2017 22:30:31 -0500
> Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
>> Changing brcmnand_set_wp() prototype in prepration for refactoring the nand
>> write protect logic to add flash status byte check for the protection bit.
>>
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> ---
>>  drivers/mtd/nand/brcmnand/brcmnand.c | 27 +++++++++++++++++----------
>>  1 file changed, 17 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 42ebd73..c7c4efe 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -765,11 +765,14 @@ enum {
>>       CS_SELECT_AUTO_DEVICE_ID_CFG            = BIT(30),
>>  };
>>
>> -static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
>> +static int brcmnand_set_wp(struct brcmnand_host *host, int en)
>>  {
>> +     struct brcmnand_controller *ctrl = host->ctrl;
>>       u32 val = en ? CS_SELECT_NAND_WP : 0;
>>
>>       brcmnand_rmw_reg(ctrl, BRCMNAND_CS_SELECT, CS_SELECT_NAND_WP, 0, val);
>> +
>> +     return 0;
>>  }
>>
>>  /***********************************************************************
>> @@ -1029,7 +1032,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
>>                       dev_dbg(ctrl->dev, "WP %s\n", wp ? "on" : "off");
>>                       old_wp = wp;
>>               }
>> -             brcmnand_set_wp(ctrl, wp);
>> +             brcmnand_set_wp(host, wp);
>>       }
>>  }
>>
>> @@ -2462,14 +2465,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>>       /* Disable XOR addressing */
>>       brcmnand_rmw_reg(ctrl, BRCMNAND_CS_XOR, 0xff, 0, 0);
>>
>> -     if (ctrl->features & BRCMNAND_HAS_WP) {
>> -             /* Permanently disable write protection */
>> -             if (wp_on == 2)
>> -                     brcmnand_set_wp(ctrl, false);
>> -     } else {
>> -             wp_on = 0;
>> -     }
>> -
>>       /* IRQ */
>>       ctrl->irq = platform_get_irq(pdev, 0);
>>       if ((int)ctrl->irq < 0) {
>> @@ -2522,6 +2517,18 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>>                       }
>>
>>                       list_add_tail(&host->node, &ctrl->host_list);
>> +
>> +                     if (ctrl->features & BRCMNAND_HAS_WP) {
>> +                             /* Permanently disable write protection */
>> +                             if (wp_on == 2) {
>> +                                     ret = brcmnand_set_wp(host, false);
>> +                                     if (ret)
>> +                                             goto err;
>> +                             }
>> +                     } else {
>> +                             wp_on = 0;
>> +                     }
>> +
>>               }
>>       }
>>
>
