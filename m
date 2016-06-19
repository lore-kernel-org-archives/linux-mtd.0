Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEbur-00018t-RB
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 12:33:30 +0000
Subject: Re: [PATCH v2 4/8] MTD: xway: remove endless loop
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-5-git-send-email-hauke@hauke-m.de>
 <20160619141449.5fd34945@bbrezillon>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <c4cfbc0b-d829-9c3c-36bb-f3fa53519af0@hauke-m.de>
Date: Sun, 19 Jun 2016 14:32:56 +0200
MIME-Version: 1.0
In-Reply-To: <20160619141449.5fd34945@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/19/2016 02:14 PM, Boris Brezillon wrote:
> On Sat, 18 Jun 2016 21:14:08 +0200
> Hauke Mehrtens <hauke@hauke-m.de> wrote:
> 
>> From: John Crispin <john@phrozen.org>
>>
>> The reset loop logic could run into a endless loop. Lets fix it as
>> requested.
>> http://lists.infradead.org/pipermail/linux-mtd/2012-September/044240.html
>>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>>  drivers/mtd/nand/xway_nand.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
>> index 346781a..61176c4 100644
>> --- a/drivers/mtd/nand/xway_nand.c
>> +++ b/drivers/mtd/nand/xway_nand.c
>> @@ -73,16 +73,22 @@ struct xway_nand_data {
>>  static void xway_reset_chip(struct nand_chip *chip)
>>  {
>>  	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
>> +	unsigned long timeout;
>>  	unsigned long flags;
>>  
>>  	nandaddr &= ~NAND_WRITE_ADDR;
>>  	nandaddr |= NAND_WRITE_CMD;
>>  
>>  	/* finish with a reset */
>> +	timeout = jiffies + msecs_to_jiffies(20);
>> +
>>  	spin_lock_irqsave(&ebu_lock, flags);
>>  	writeb(NAND_WRITE_CMD_RESET, (void __iomem *) nandaddr);
>> -	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
>> -		;
>> +	do {
>> +		if ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
>> +			break;
>> +		cond_resched();
>> +	} while (!time_after_eq(jiffies, timeout));
>>  	spin_unlock_irqrestore(&ebu_lock, flags);
>>  }
>>  
> 
> AFAICS, this function is doing exactly what
> ->cmdfunc(NAND_CMD_RESET, -1 , -1) does, except for the NAND_WAIT_WR_C
> test? What is this bit representing?
> 
> I'd really prefer if you kill this function and just call ->cmdfunc()
> instead.
> 

NAND_WAIT_WR_C indicates that the previous operation is finished.

When this is not needed I can call the generic function.

Hauke
