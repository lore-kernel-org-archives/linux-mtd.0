Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciq8i-0001IF-RQ
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 22:21:03 +0000
Received: by mail-qk0-x243.google.com with SMTP id n186so6285631qkb.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2017 14:20:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170228230501.370ef2bb@bbrezillon>
References: <1488300926-3517-1-git-send-email-kdasu.kdev@gmail.com>
 <20170228230501.370ef2bb@bbrezillon>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Tue, 28 Feb 2017 17:20:38 -0500
Message-ID: <CAC=U0a0in2rWuReEGpWBqzgZ4aT8SRSSpCKxtk=EWwKd_Czk2w@mail.gmail.com>
Subject: Re: [PATCH V4,
 1/2] mtd: nand: brcmnand: Change brcmnand_set_wp() prototype
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 richard@nod.at, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On Tue, Feb 28, 2017 at 5:05 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 28 Feb 2017 11:55:25 -0500
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
>
>         if (!(ctrl->features & BRCMNAND_HAS_WP))
>                 wp_on = 0;
>
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
>                         /* Permanently disable write protection */
>                         if (wp_on == 2) {
>                                 ret = brcmnand_set_wp(host, false);
>                                 if (ret)
>                                         goto err;
>                         }
>
>
>>               }
>>       }
>>
>

Let me rework this and send a new patch. Actually I just need to set
the controller wp bit and the wp value since I do not need to worry
about the status since we are not going to try and change the #WP at
all in this case when we send the erase/program command.
brcmnand_set_wp_reg() calling this should be sufficient during probe.
