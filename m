Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eQq7U-0006uP-R8
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 07:45:54 +0000
Subject: Re: [PATCH] Fix OOB_READ bug where hardware FIFO is not drained
 completely. Fix potential bug for non-ECC operations.
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Greg Cook <greg@morpheus.ws>, <ezequiel.garcia@free-electrons.com>,
 <linux-mtd@lists.infradead.org>, <miquel.raynal@free-electrons.com>, "Kasper
 Revsbech (KREV)" <krev@triax.com>
References: <20171212083826.5000-1-greg@morpheus.ws>
 <20171212142033.5b19efec@bbrezillon>
 <ab0ba0d5-09e9-4c9f-7798-b02fe9b54260@prevas.dk>
Message-ID: <1e25d252-9c56-be29-f6c7-788624d4fc31@prevas.dk>
Date: Mon, 18 Dec 2017 08:44:36 +0100
MIME-Version: 1.0
In-Reply-To: <ab0ba0d5-09e9-4c9f-7798-b02fe9b54260@prevas.dk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris
>>
>> Can you try with the below patch and see if it fixes the timeout issue?
>>
>> --->8---
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c 
>> b/drivers/mtd/nand/pxa3xx_nand.c
>> index 021374fe59dc..d1979c7dbe7e 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -961,6 +961,7 @@ static void prepare_start_command(struct 
>> pxa3xx_nand_info *info, int command)
>>            switch (command) {
>>          case NAND_CMD_READ0:
>> +       case NAND_CMD_READOOB:
>>          case NAND_CMD_PAGEPROG:
>>                  info->use_ecc = 1;
>>                  break;
> This fixes the timeout issue :-) Also without bbt...
>
> root@output-module:~# nanddump -oa /dev/mtd1
> ECC failed: 0
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 8
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x00000000 and ending at 0x0ff00000...
> UBIXSUBI
>

Is this considered a valid patch for our 4.14 LTS kernel, pxa3xx driver?
Or is it only masking some other problems?

/Sean
