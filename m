Received: from mail-yw0-x22b.google.com ([2607:f8b0:4002:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bMdCt-00021p-B2
 for linux-mtd@lists.infradead.org; Mon, 11 Jul 2016 15:33:15 +0000
Received: by mail-yw0-x22b.google.com with SMTP id i12so94837288ywa.1
 for <linux-mtd@lists.infradead.org>; Mon, 11 Jul 2016 08:32:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160710013010.GA12327@localhost>
References: <1467999399-22288-1-git-send-email-f.fainelli@gmail.com>
 <20160710013010.GA12327@localhost>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Mon, 11 Jul 2016 11:32:13 -0400
Message-ID: <CAKekbesHHqEgL6ZRCT-PytmbN-iPzhRm723Y8ao0+ggqDbQGtg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: brcmnand: Change BUG_ON in brcmnand_send_cmd
To: Brian Norris <computersforpeace@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-mtd@lists.infradead.org,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 9, 2016 at 9:30 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Fri, Jul 08, 2016 at 10:36:39AM -0700, Florian Fainelli wrote:
>> Change the BUG_ON() condition in brcmnand_send_cmd() which checks for
>> the interrupt status "controller ready" bit to a WARN_ON.
>>
>> There is no good reason to kill the system when this condition occur
>> because we could have systems which listed the NAND controller as
>> available (e.g: from Device Tree), but the NAND chip could be
>> malfunctioning and not responding.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>
> Acked-by: Brian Norris <computersforpeace@gmail.com>
>

Reviewed-by: Kamal Dasu <kdasu.kdev@gmail.com>

>> ---
>> Note that I even hesitated to remove that completely, but there is
>> some value in knowing about this condition since it helps figuring
>> out what could be wrong.
>>
>>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index b6062a2f3dfd..72bdc283778d 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -1165,7 +1165,7 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
>>       ctrl->cmd_pending = cmd;
>>
>>       intfc = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
>> -     BUG_ON(!(intfc & INTFC_CTLR_READY));
>> +     WARN_ON(!(intfc & INTFC_CTLR_READY));
>>
>>       mb(); /* flush previous writes */
>>       brcmnand_write_reg(ctrl, BRCMNAND_CMD_START,
>> --
>> 2.7.4
>>



-- 
Kamal Dasu
Principal Engineer | Broadcom Ltd. 200 Brickstone Sq Andover | 978-719-1405
