Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPv1H-0003wE-Ks
 for linux-mtd@lists.infradead.org; Wed, 20 Jul 2016 17:11:08 +0000
Received: by mail-yw0-x243.google.com with SMTP id c13so3798402ywh.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2016 10:10:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160720084403.0a6e185b@bbrezillon>
References: <1468992838-23474-1-git-send-email-andrew.smirnov@gmail.com>
 <20160720084403.0a6e185b@bbrezillon>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 20 Jul 2016 10:10:29 -0700
Message-ID: <CAHQ1cqE5asXhm5PTFOO9knruoUkezGdNjHyH6Ai=E+=zDUUxEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: Error out if cmd_ctrl() is missing
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 19, 2016 at 11:44 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 19 Jul 2016 22:33:57 -0700
> Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
>> If no user specified chip->select_chip() function is provided, code in
>> nand_base.c will automatically set this hook to nand_select_chip(),
>> which in turn depends on chip->cmd_ctrl() hook being valid. Not
>> providing both of those functions in NAND controller driver (for example
>> by mistake) will result in a bit cryptic segfault. Same is true for
>> chip->cmdfunc().
>>
>> To avoid the above scenario change the prototype of nand_set_defaults()
>> to return error code, all the callers to check for it and error out if
>> cmd_ctrl() is not provided.
>>
>> Suggested-by: Brian Norris <computersforpeace@gmail.com>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  drivers/mtd/nand/nand_base.c | 29 ++++++++++++++++++++++++-----
>>  1 file changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index ce7b2ca..bee480f 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3114,22 +3114,30 @@ static void nand_shutdown(struct mtd_info *mtd)
>>  }
>>
>>  /* Set default functions */
>> -static void nand_set_defaults(struct nand_chip *chip, int busw)
>> +static int nand_set_defaults(struct nand_chip *chip, int busw)
>>  {
>>       /* check for proper chip_delay setup, set 20us if not */
>>       if (!chip->chip_delay)
>>               chip->chip_delay = 20;
>>
>>       /* check, if a user supplied command function given */
>> -     if (chip->cmdfunc == NULL)
>> +     if (chip->cmdfunc == NULL) {
>> +             if (!chip->cmd_ctrl)
>> +                     goto no_cmd_ctrl;
>> +
>>               chip->cmdfunc = nand_command;
>> +     }
>>
>>       /* check, if a user supplied wait function given */
>>       if (chip->waitfunc == NULL)
>>               chip->waitfunc = nand_wait;
>>
>> -     if (!chip->select_chip)
>> +     if (!chip->select_chip) {
>> +             if (!chip->cmd_ctrl)
>> +                     goto no_cmd_ctrl;
>> +
>>               chip->select_chip = nand_select_chip;
>> +     }
>>
>>       /* set for ONFI nand */
>>       if (!chip->onfi_set_features)
>> @@ -3161,6 +3169,11 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
>>               init_waitqueue_head(&chip->controller->wq);
>>       }
>>
>> +     return 0;
>> +
>> +no_cmd_ctrl:
>> +     pr_err("chip.cmd_ctrl() callback is not provided\n");
>> +     return -EINVAL;
>>  }
>>
>>  /* Sanitize ONFI strings so we can safely print them */
>> @@ -3878,9 +3891,13 @@ ident_done:
>>       }
>>
>>       if (chip->options & NAND_BUSWIDTH_AUTO) {
>> +             int ret;
>> +
>>               WARN_ON(chip->options & NAND_BUSWIDTH_16);
>>               chip->options |= busw;
>> -             nand_set_defaults(chip, busw);
>> +             ret = nand_set_defaults(chip, busw);
>
> I realize this one will actually never fail because it has already been
> checked in nand_scan_ident(). Maybe we should leave the
> nand_set_defaults() as a void function and check for missing
> ->cmd_ctrl() directly in nand_scan_ident().

Sure, will change in v3, this would also allow me to have only a
single check instead of two and those ugly gotos.

Andrey
