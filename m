Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZIiM-00085r-Gx
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 13:45:52 +0000
Subject: Re: [PATCH v7] mtd: nand: increase ready wait timeout and report
 timeouts
To: Richard Weinberger <richard@nod.at>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
References: <1444139527-14087-1-git-send-email-harvey.hunt@imgtec.com>
 <CAFLxGvxvWSGt3Z8p0yTPMh6v7LnjLKGtSeGdPkqauCYOXVnTzg@mail.gmail.com>
 <20160225231432.GN21465@google.com> <20160226002302.2f56f1a9@bbrezillon>
 <56CF8DCA.7010606@nod.at>
CC: Alex Smith <alex.smith@imgtec.com>, Alex Smith <alex@alex-smith.me.uk>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, Niklas Cassel <niklas.cassel@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <56D056F5.8040302@imgtec.com>
Date: Fri, 26 Feb 2016 13:45:25 +0000
MIME-Version: 1.0
In-Reply-To: <56CF8DCA.7010606@nod.at>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 25/02/16 23:27, Richard Weinberger wrote:
> Am 26.02.2016 um 00:23 schrieb Boris Brezillon:
>>> Regardless, this timeout loop is wrong. Shouldn't it have something like
>>> the following?
>>>
>>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>>> index f2c8ff398d6c..596a9b0503da 100644
>>> --- a/drivers/mtd/nand/nand_base.c
>>> +++ b/drivers/mtd/nand/nand_base.c
>>> @@ -566,8 +566,8 @@ void nand_wait_ready(struct mtd_info *mtd)
>>>   		cond_resched();
>>>   	} while (time_before(jiffies, timeo));
>>>
>>> -	pr_warn_ratelimited(
>>> -		"timeout while waiting for chip to become ready\n");
>>> +	if (!chip->dev_ready(mtd))
>>> +		pr_warn_ratelimited("timeout while waiting for chip to become ready\n");
>>>   out:
>>>   	led_trigger_event(nand_led_trigger, LED_OFF);
>>>   }
>>
>> Looks good to me.
>>
>> If you post the patch, you can add
>>
>> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> Same here.
>
> Reviewed-by: Richard Weinberger <richard@nod.at>
>
> Thanks,
> //richard
>

-cc IMG list (I left it in my gitconfig when I originally sent this 
patch...).

Thanks for debugging and fixing this - proposed patch looks good to me:

Reviewed-by: Harvey Hunt <harvey.hunt@imgtec.com>

Thanks,

Harvey
