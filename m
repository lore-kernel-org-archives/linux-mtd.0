Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjB1m-0001Hj-CV
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 20:39:17 +0000
Received: by mail-qk0-x244.google.com with SMTP id n127so13785050qkf.2
 for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2017 12:38:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170301210116.586059b5@bbrezillon>
References: <1488396450-9820-1-git-send-email-kdasu.kdev@gmail.com>
 <20170301210116.586059b5@bbrezillon>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Wed, 1 Mar 2017 15:38:51 -0500
Message-ID: <CAC=U0a3T9rFz-jfr+Wwpmqt=CZ+fUmVwQREnTkDeLxVfWDGp_w@mail.gmail.com>
Subject: Re: [PATCH V5,] mtd: nand: brcmnand: Check flash #WP pin status
 before nand erase/program
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

On Wed, Mar 1, 2017 at 3:01 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed,  1 Mar 2017 14:27:30 -0500
> Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
>> brcmnand controller v6.x and v7.x lets driver to enable disable #WP pin
>> via NAND_WP bit in CS_SELECT register. Driver implementation assumes that
>> setting/resetting the bit would assert/de-assert  #WP pin instantaneously
>> from the flash part's perspective, and was proceeding to erase/program
>> without verifying flash status byte for protection bit. In rigorous
>> testing this was causing rare data corruptions with erase and/or
>> subsequent programming. To fix this check NAND status in addition to
>> controller #WP pin status. This change makes sure both sides are ready
>> to accept new commands.
>
> You didn't fix the commit message.
>

I did change the message based on PATCH V3. 2/2 comments.

"                          ^ To fix this, check the NAND status in
addition to the NAND controller #WP pin status. This way, we make sure
both sides are ready to accept new commands."

Am I missing something ?

>>
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> ---
>
> Note for future submissions: when you have a single patch, please put
> a changelog (changes introduced by each new version) here.
>

So you want me to resend with the change log ?.

>>  drivers/mtd/nand/brcmnand/brcmnand.c | 61 ++++++++++++++++++++++++++++++++++--
>>  1 file changed, 58 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 42ebd73..7419c5c 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -101,6 +101,9 @@ struct brcm_nand_dma_desc {
>>  #define BRCMNAND_MIN_BLOCKSIZE       (8 * 1024)
>>  #define BRCMNAND_MIN_DEVSIZE (4ULL * 1024 * 1024)
>>
>> +#define NAND_CTRL_RDY                        (INTFC_CTLR_READY | INTFC_FLASH_READY)
>> +#define NAND_POLL_STATUS_TIMEOUT_MS  100
>> +
>>  /* Controller feature flags */
>>  enum {
>>       BRCMNAND_HAS_1K_SECTORS                 = BIT(0),
>> @@ -765,6 +768,31 @@ enum {
>>       CS_SELECT_AUTO_DEVICE_ID_CFG            = BIT(30),
>>  };
>>
>> +static int bcmnand_ctrl_poll_status(struct brcmnand_controller *ctrl,
>> +                                 u32 mask, u32 expected_val,
>> +                                 unsigned long timeout_ms)
>> +{
>> +     unsigned long limit;
>> +     u32 val;
>> +
>> +     if (!timeout_ms)
>> +             timeout_ms = NAND_POLL_STATUS_TIMEOUT_MS;
>> +
>> +     limit = jiffies + msecs_to_jiffies(timeout_ms);
>> +     do {
>> +             val = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
>> +             if ((val & mask) == expected_val)
>> +                     return 0;
>> +
>> +             cpu_relax();
>> +     } while (time_after(limit, jiffies));
>> +
>> +     dev_warn(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
>> +              expected_val, val & mask);
>> +
>> +     return -ETIMEDOUT;
>> +}
>> +
>>  static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
>>  {
>>       u32 val = en ? CS_SELECT_NAND_WP : 0;
>> @@ -1024,12 +1052,39 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
>>
>>       if ((ctrl->features & BRCMNAND_HAS_WP) && wp_on == 1) {
>>               static int old_wp = -1;
>> +             int ret;
>>
>>               if (old_wp != wp) {
>>                       dev_dbg(ctrl->dev, "WP %s\n", wp ? "on" : "off");
>>                       old_wp = wp;
>>               }
>> +
>> +             /*
>> +              * make sure ctrl/flash ready before and after
>> +              * changing state of #WP pin
>> +              */
>> +             ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY |
>> +                                            NAND_STATUS_READY,
>> +                                            NAND_CTRL_RDY |
>> +                                            NAND_STATUS_READY, 0);
>> +             if (ret)
>> +                     return;
>> +
>>               brcmnand_set_wp(ctrl, wp);
>> +             chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
>> +             /* NAND_STATUS_WP 0x00 = protected, 0x80 = not protected */
>> +             ret = bcmnand_ctrl_poll_status(ctrl,
>> +                                            NAND_CTRL_RDY |
>> +                                            NAND_STATUS_READY |
>> +                                            NAND_STATUS_WP,
>> +                                            NAND_CTRL_RDY |
>> +                                            NAND_STATUS_READY |
>> +                                            (wp ? 0 : NAND_STATUS_WP), 0);
>> +
>> +             if (ret)
>> +                     dev_err_ratelimited(&host->pdev->dev,
>> +                                         "nand #WP expected %s\n",
>> +                                         wp ? "on" : "off");
>>       }
>>  }
>>
>> @@ -1157,15 +1212,15 @@ static irqreturn_t brcmnand_dma_irq(int irq, void *data)
>>  static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
>>  {
>>       struct brcmnand_controller *ctrl = host->ctrl;
>> -     u32 intfc;
>> +     int ret;
>>
>>       dev_dbg(ctrl->dev, "send native cmd %d addr_lo 0x%x\n", cmd,
>>               brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS));
>>       BUG_ON(ctrl->cmd_pending != 0);
>>       ctrl->cmd_pending = cmd;
>>
>> -     intfc = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
>> -     WARN_ON(!(intfc & INTFC_CTLR_READY));
>> +     ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
>> +     WARN_ON(ret);
>>
>>       mb(); /* flush previous writes */
>>       brcmnand_write_reg(ctrl, BRCMNAND_CMD_START,
>
