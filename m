Received: from mail-yw0-x232.google.com ([2607:f8b0:4002:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cinSY-0000Mm-ED
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 19:29:20 +0000
Received: by mail-yw0-x232.google.com with SMTP id l138so16090976ywc.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2017 11:28:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <08fbd1bb-6e3b-40c4-e1ff-c1edebee625a@gmail.com>
References: <1488300926-3517-1-git-send-email-kdasu.kdev@gmail.com>
 <08fbd1bb-6e3b-40c4-e1ff-c1edebee625a@gmail.com>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Tue, 28 Feb 2017 14:28:14 -0500
Message-ID: <CAKekbes3QVvdOTVzjz4SKr=OSviv36U5Fm7=tjR7Dp+4=9fBtw@mail.gmail.com>
Subject: Re: [PATCH V4,
 1/2] mtd: nand: brcmnand: Change brcmnand_set_wp() prototype
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marek,

On Tue, Feb 28, 2017 at 1:25 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 02/28/2017 05:55 PM, Kamal Dasu wrote:
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
>
> Would it be worth it to move this into separate function ? Or maybe make
> brcmnand_set_wp() check for BRCMNAND_HAS_WP and only set the WP
> if the controller is actually capable of that ? I think that might make
> the code readability a bit better ...
>
>>               }
>>       }
>>
>>

The above code is called during the probe and only when the bootline
wants to permanently set the wp off( wp == 2)  hence structured that
way. I would prefer to leave it that way.

In all other cases there is already brcmand_wp(mtd_info *mtd, int wp)
checks and maintains the wp state.

>
> --
> Best regards,
> Marek Vasut

Thanks
Kamal
