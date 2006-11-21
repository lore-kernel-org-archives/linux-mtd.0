Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GmStR-00009L-CD
	for linux-mtd@lists.infradead.org; Tue, 21 Nov 2006 05:30:26 -0500
Message-ID: <4562D537.5080908@ru.mvista.com>
Date: Tue, 21 Nov 2006 13:30:15 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
References: <20061117184055.569da7ad@localhost.localdomain>
	<1164034364.3574.6.camel@zod.rchland.ibm.com>
In-Reply-To: <1164034364.3574.6.camel@zod.rchland.ibm.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kbaidarov <kbaidarov@dev.rtsoft.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:

<snip>
>> +static struct mtd_blktrans_ops mtdblock_tr = {
>> +	.name		= "mtdblock",
>> +	.major		= 258,
>> +	.part_bits	= 0,
>> +	.readsect	= mtdblock_readsect,
>> +	.writesect	= mtdblock_writesect,
>> +	.add_mtd	= mtdblock_add_mtd,
>> +	.remove_dev	= mtdblock_remove_dev,
>> +	.owner		= THIS_MODULE,
>> +};
>>     
>
> You went to the trouble of getting a new major number assigned... why
> not call it something other than mtdblock?
>   
Agree.
>   
>> Index: mips-kernel-2.6/drivers/mtd/Kconfig
>> ===================================================================
>> --- mips-kernel-2.6.orig/drivers/mtd/Kconfig
>> +++ mips-kernel-2.6/drivers/mtd/Kconfig
>> @@ -197,6 +197,13 @@ config MTD_BLOCK_RO
>>  	  You do not need this option for use with the DiskOnChip devices. For
>>  	  those, enable NFTL support (CONFIG_NFTL) instead.
>>
>> +config MTD_BLOCK_RO_BBFREE
>> +	tristate "Readonly bad block free block device access to MTD devices"
>> +	depends on MTD_BLOCK!=y && MTD && MTD_BLOCK_RO!=y
>> +	help
>> +	  Same as readonly block driver, but this allow you to mount read-only file
>> +	  systems from an MTD device, containing bad blocks.
>> +
>>     
>
> This part seems hacky to me...  why can't use use mtdblock or
> mtdblock_ro when this is enabled?  And what happens in the module case?
>   
I guess this line is borrowed from MTD_BLOCK_RO:

config MTD_BLOCK_RO
        tristate "Readonly block device access to MTD devices"
        depends on MTD_BLOCK!=y && MTD && BLOCK

I think though that these limitations are redundant at least for 
MTD_BLOCK_RO_BBFREE b/c there might be the cases where there're both 
NAND and NOR chips in the system so MTD_BLOCK_RO and MTD_BLOCK_RO_BBFREE 
might be needed to be present in the system at the same time.

Vitaly
