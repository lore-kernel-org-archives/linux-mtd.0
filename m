Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAKzX-0000qB-1e
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 17:40:40 +0000
Subject: Re: [PATCH 2/6] MTD: xway: fix invalid operator
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
 <1465161609-19303-3-git-send-email-hauke@hauke-m.de>
 <20160607112826.25daf140@bbrezillon>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, john@phrozen.org
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <b7697bbc-0f14-67da-fab9-2a93c67422da@hauke-m.de>
Date: Tue, 7 Jun 2016 19:40:14 +0200
MIME-Version: 1.0
In-Reply-To: <20160607112826.25daf140@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/07/2016 11:28 AM, Boris Brezillon wrote:
> On Sun,  5 Jun 2016 23:20:05 +0200
> Hauke Mehrtens <hauke@hauke-m.de> wrote:
> 
>> From: John Crispin <john@phrozen.org>
>>
>> xway_read_byte should use a logic or and not an add operator when
>> working out the NAND address. The NAND address bits are used to
>> activate the pins to the NAND flash.
>>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>>  drivers/mtd/nand/xway_nand.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
>> index ccac19c..0ab6e83 100644
>> --- a/drivers/mtd/nand/xway_nand.c
>> +++ b/drivers/mtd/nand/xway_nand.c
>> @@ -134,7 +134,7 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
>>  	int ret;
>>  
>>  	spin_lock_irqsave(&ebu_lock, flags);
>> -	ret = ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
>> +	ret = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));
> 
> It's doing exactly the same, isn't it? What's the rationale behind this
> change?

Yes that is correct, this is only a style change.

In the other places we are also using the bool operations and this
address space is not a list of registers, but some address bits are used
to activate or deactivate some pins and all data written to this address
range is handled in the same way.

Hauke
