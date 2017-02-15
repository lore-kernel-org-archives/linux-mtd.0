Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ce4fy-0000Tz-8n
 for linux-mtd@lists.infradead.org; Wed, 15 Feb 2017 18:51:40 +0000
Received: by mail-qk0-x242.google.com with SMTP id u25so24544443qki.2
 for <linux-mtd@lists.infradead.org>; Wed, 15 Feb 2017 10:51:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170215095119.3412108a@bbrezillon>
References: <1487089424-4354-1-git-send-email-kdasu.kdev@gmail.com>
 <20170215095119.3412108a@bbrezillon>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Wed, 15 Feb 2017 13:51:15 -0500
Message-ID: <CAC=U0a3z+9SUO5RYxrKiZxbPgrNFY8AyRPO=1Nfv6UbHa4SQ5g@mail.gmail.com>
Subject: Re: [PATCH] mtd: brcmnand: Check flash write protect pin status
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
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

On Wed, Feb 15, 2017 at 3:51 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Kamal,
>
> Can you Cc the MTD and NAND maintainers when you send NAND/MTD patches?
>
> Also, for the subject prefix, I'd prefer 'mtd: nand: brcm:'.
>

Ok

> On Tue, 14 Feb 2017 11:23:44 -0500
> Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
>> With v6.x and v7.x controller lets the driver to enable disable #WP pin.
>> So to be safe let driver send flash status cmd whenever the #WP pin status
>> is being changed and makes sure the controller and the the flash are both
>> ready to accept new cmds by verifying the WP protect/unprotect bit is set
>> correctly in the flash status byte. Modify enable/disable #WP register only
>> when the nand controller is not ready.
>
> You mean 'is ready' here, right?

Yes, will fix this.

>
> I still have a hard time understanding what the problem is with this
> commit message. Can you try to clarify that?
>

 Software assumed that setting/resetting the NAND_WP controller
register would assert/de-assert the #WP pin instantaneously from the
flash parts perspective, and was proceeding to erase/program. Nand
driver was not verifying flash status byte for  WP. In rigorous
testing we found this was causing rare data corruptions with erase
and/or subsequent programming. So to make sure the flash part is ready
to accept erase/program commands was to send status read command and
read back the WP bit status from the flash whenever we change the pin
state. I will clarify this in the commit message as well.

>>
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> ---
>>  drivers/mtd/nand/brcmnand/brcmnand.c | 75 +++++++++++++++++++++++++++++++-----
>>  1 file changed, 65 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 42ebd73..6935bc1 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -101,6 +101,9 @@ struct brcm_nand_dma_desc {
>>  #define BRCMNAND_MIN_BLOCKSIZE       (8 * 1024)
>>  #define BRCMNAND_MIN_DEVSIZE (4ULL * 1024 * 1024)
>>
>> +#define FLASH_RDY    (NAND_STATUS_READY)
>> +#define NAND_CTRL_RDY        (INTFC_CTLR_READY | INTFC_FLASH_READY)
>> +
>>  /* Controller feature flags */
>>  enum {
>>       BRCMNAND_HAS_1K_SECTORS                 = BIT(0),
>> @@ -765,13 +768,62 @@ enum {
>>       CS_SELECT_AUTO_DEVICE_ID_CFG            = BIT(30),
>>  };
>>
>> -static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
>> +static int bcmnand_ctrl_busy_poll(struct brcmnand_controller *ctrl, u32 mask)
>> +{
>> +     unsigned long timeout = jiffies + msecs_to_jiffies(200);
>> +
>> +     if (!mask)
>> +             mask = INTFC_CTLR_READY;
>
> Do you really need this check? All users of bcmnand_ctrl_busy_poll()
> are passing mask != 0.

Will remove this check.

>> +
>> +     while ((brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) & mask) !=
>> +             mask) {
>> +             if (time_after(jiffies, timeout)) {
>> +                     dev_warn(ctrl->dev, "timeout on ctrl_ready\n");
>> +                     return -ETIMEDOUT;
>> +             }
>> +             cpu_relax();
>> +     }
>> +     return 0;
>> +}
>> +
>> +static inline void brcmnand_set_wp_reg(struct brcmnand_controller *ctrl, int en)
>>  {
>>       u32 val = en ? CS_SELECT_NAND_WP : 0;
>>
>>       brcmnand_rmw_reg(ctrl, BRCMNAND_CS_SELECT, CS_SELECT_NAND_WP, 0, val);
>>  }
>>
>> +static void brcmnand_set_wp(struct brcmnand_host *host, int en)
>> +{
>> +     struct brcmnand_controller *ctrl = host->ctrl;
>> +     struct mtd_info *mtd = &host->mtd;
>> +     struct nand_chip *chip = mtd->priv;
>> +     u32 sts_reg;
>> +     bool is_wp;
>> +
>> +     /*
>> +      * make sure ctrl/flash ready before and after
>> +      * changing state of WP PIN
>> +      */
>> +     bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY | FLASH_RDY);
>> +     brcmnand_set_wp_reg(ctrl, en);
>> +     chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
>> +     bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY | FLASH_RDY);
>> +     sts_reg = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
>> +     /* NAND_STATUS_WP 0x80 = not protected, 0x00 = protected */
>> +     is_wp = (sts_reg & NAND_STATUS_WP) ? false : true;
>> +
>> +     if (is_wp != en) {
>> +             u32 nand_wp = brcmnand_read_reg(ctrl, BRCMNAND_CS_SELECT);
>> +
>> +             nand_wp &= CS_SELECT_NAND_WP;
>> +             dev_err_ratelimited(&host->pdev->dev,
>> +                                 "#WP %s sts:0x%x expected %s NAND_WP 0x%x\n",
>> +                                 is_wp ? "On" : "Off",  sts_reg & 0xff,
>> +                                 en ? "On" : "Off", nand_wp ? 1 : 0);
>
> Hm, so this function can fail. Shouldn't you make it return a return
> code instead of ignoring failures? This way, you can return an error
> from the probe.
>

Should not happen, but can return err though.

>> +     }
>> +}
>> +
>>  /***********************************************************************
>>   * Flash DMA
>>   ***********************************************************************/
>> @@ -1029,7 +1081,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
>>                       dev_dbg(ctrl->dev, "WP %s\n", wp ? "on" : "off");
>>                       old_wp = wp;
>>               }
>> -             brcmnand_set_wp(ctrl, wp);
>> +             brcmnand_set_wp(host, wp);
>>       }
>>  }
>>
>> @@ -1158,15 +1210,18 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
>>  {
>>       struct brcmnand_controller *ctrl = host->ctrl;
>>       u32 intfc;
>> +     u32 mask = NAND_CTRL_RDY;
>
> No need for this local variable...

Will fix this.

>
>>
>>       dev_dbg(ctrl->dev, "send native cmd %d addr_lo 0x%x\n", cmd,
>>               brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS));
>>       BUG_ON(ctrl->cmd_pending != 0);
>>       ctrl->cmd_pending = cmd;
>>
>> +     bcmnand_ctrl_busy_poll(ctrl, mask);
>
> ... just call
>
>         bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY);
>
> here.
>
>>       intfc = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
>>       WARN_ON(!(intfc & INTFC_CTLR_READY));
>>
>> +
>
> Drop this extra empty line.
>

Ok.

>>       mb(); /* flush previous writes */
>>       brcmnand_write_reg(ctrl, BRCMNAND_CMD_START,
>>                          cmd << brcmnand_cmd_shift(ctrl));
>> @@ -2462,14 +2517,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
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
>> @@ -2522,6 +2569,14 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>>                       }
>>
>>                       list_add_tail(&host->node, &ctrl->host_list);
>> +
>> +                     if (ctrl->features & BRCMNAND_HAS_WP) {
>> +                             /* Permanently disable write protection */
>> +                             if (wp_on == 2)
>> +                                     brcmnand_set_wp(host, false);
>> +                     } else {
>> +                             wp_on = 0;
>> +                     }
>
> Hm, this is not really related to the change you describe in your
> commit message. This should probably go in a separate commit.
>

It is related to the change since this code moved within the probe
function due the new  brcmnand_set_wp() prototype. So has to be part
of the same commit.

>>               }
>>       }
>>
>

Thanks
Kamal
