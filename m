Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRlDu-0007lt-IC
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 15:53:55 +0000
Received: by mail-pd0-f181.google.com with SMTP id g10so2643364pdj.26
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2013 08:53:32 -0700 (PDT)
Message-ID: <524D92F8.70603@gmail.com>
Date: Thu, 03 Oct 2013 08:53:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v4 05/12] mtd: nand: print out the cell information for
 nand chip
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>	
 <1380092301-21924-6-git-send-email-b32955@freescale.com>	
 <20130930224942.GO23337@ld-irv-0074.broadcom.com>
 <1380810883.27358.432.camel@sauron.fi.intel.com>
In-Reply-To: <1380810883.27358.432.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/03/2013 07:34 AM, Artem Bityutskiy wrote:
> On Mon, 2013-09-30 at 15:49 -0700, Brian Norris wrote:
>> On Wed, Sep 25, 2013 at 02:58:14PM +0800, Huang Shijie wrote:
>>> Print out the cell information for nand chip.
>>>
>>> (Since the message is too long, this patch also splits the log
>>> with two separate pr_info())
>>>
>>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>>> ---
>>>   drivers/mtd/nand/nand_base.c |   11 +++++++----
>>>   1 files changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>>> index 94d9084..b94309b 100644
>>> --- a/drivers/mtd/nand/nand_base.c
>>> +++ b/drivers/mtd/nand/nand_base.c
>>> @@ -3460,11 +3460,14 @@ ident_done:
>>>   	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
>>>   		chip->cmdfunc = nand_command_lp;
>>>
>>> -	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
>>> -		" %dMiB, page size: %d, OOB size: %d\n",
>>> +	pr_info("NAND device: Manufacturer ID: 0x%02x,"
>>> +			"Chip ID: 0x%02x (%s %s) \n",
>>
>> You're adding excess whitespace before the '\n'. I'll squash this
>> myself.
>
> Nowadays' fashion is to never split strings, Huang.

checkpatch.pl actually warns about this now, so I already fixed it but 
didn't remember to mention it. Also, in splitting this string, Huang 
removed a space (fixed as well).

Brian
