Received: from ns1.gatteins.it ([193.58.239.94])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sa6Mh-0006hR-G7
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 14:28:40 +0000
Received: from [10.16.100.127] (net-130-0-156-18.cust.dsl.vodafone.it
 [130.0.156.18])
 by ns1.gatteins.it (Postfix) with ESMTPA id 5FE05DEF24
 for <linux-mtd@lists.infradead.org>; Thu, 31 May 2012 16:28:49 +0200 (MEST)
Message-ID: <4FC78012.5010704@sirius-es.it>
Date: Thu, 31 May 2012 16:28:34 +0200
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: mtd nand erase and bad block
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
In-Reply-To: <4FC771EC.4090500@intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/31/2012 03:28 PM, Adrian Hunter wrote:
> On 31/05/12 15:12, Matteo Facchinetti wrote:
>> Hi,
>>
>> I'm developing a mtd driver for a nand flash controller and I need help;
>> I'm to the end of the work, and I have problems and dubts about bad block
>> handling.
>>
>> For test, I mark manually bad block byte on flash block.
>> When I erase with flash_erase, all works and skip the bad block:
>> :~# flash_erase /dev/mtd6 0 0
>> Erasing 1024 Kibyte @ 100000 --  2 % complete flash_erase: Skipping bad
>> block at 00200000
>> Erasing 1024 Kibyte @ 2700000 -- 100 % complete
>>
>> If I try to erase with -N parameter I read the following output:
>> ~# flash_erase -N /dev/mtd6 0 0
>> Erasing 1024 Kibnand_erase_nand: attempt to erase a bad block at page
>> 0x00001600
>> yte @ 200000 --  5 % complete libmtd: error!: MEMERASE64 ioctl failed for
>> eraseblock 2 (mtd6)
>>          error 5 (Input/output error)
>> flash_erase: error!: /dev/mtd6: MTD Erase failure
>>               error 5 (Input/output error)
>> Erasing 1024 Kibyte @ 2700000 -- 100 % complete
>>
>> I espected that with -N option, flash_erase should erase the hand-damaged
>> block, recovering the usability of the block. Is it true?
>>
>> What's going wrong?
>
> The NAND driver has validation to prevent erasure of bad blocks.  Refer
> nand_erase_nand() in drivers/mtd/nand/nand_base
>
> 		/* Check if we have a bad block, we do not erase bad blocks! */
> 		if (nand_block_checkbad(mtd, ((loff_t) page)<<
> 					chip->page_shift, 0, allowbbt)) {
> 			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
> 				    __func__, page);
> 			instr->state = MTD_ERASE_FAILED;
> 			goto erase_exit;
> 		}
>
>
this means that -N parameter bypass only the BBT table check, but in the 
erase routine there is a low level check that forbids the bad block erase.

What's the way for recheck bad blocks and refresh the BBT from userspace 
application?


Matteo
