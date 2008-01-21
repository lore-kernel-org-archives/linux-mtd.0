Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JGtJt-0002Cb-0e
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2008 09:52:04 +0000
Message-ID: <47946B2A.1030400@dave-tech.it>
Date: Mon, 21 Jan 2008 10:51:38 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: Ram <vshrirama@gmail.com>
Subject: Re: Micron NAND support in linux MTD
References: <47907CDF.30802@dave-tech.it>
	<8bf247760801180745k6f8337d5p751d91b21bd3728d@mail.gmail.com>
In-Reply-To: <8bf247760801180745k6f8337d5p751d91b21bd3728d@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sriram,

IIUC the bad block position is set in function nand_get_flash_type:

	/* Set the bad block position */
	chip->badblockpos = mtd->writesize > 512 ?
		NAND_LARGE_BADBLOCK_POS : NAND_SMALL_BADBLOCK_POS;


/*
* Constants for oob configuration
*/
#define NAND_SMALL_BADBLOCK_POS		5
#define NAND_LARGE_BADBLOCK_POS		0

That is two values are defined:
a) 5 for small block devices (6th location)
b) 0 for large block devices (1st location)

So the position is correct with respect to the Micron MT29F1GxxABB 
datasheet.
However I still have a doubt about which page is checked. I'n not sure 
if JFFS2/MTD check first page only. Datasheet says:

"The factory identifies
invalid blocks before shipping by programming data other than FFh (x8) 
or FFFFh (x16) into the first spare location (column address 2,048 for 
x8 devices, or 1,024 for x16 devices) *of the first or second page of 
each bad block*."

so both first and second page should be checked. Do you know what 
JFFS2/MTD do?


-- 
llandre



> Hi,
>    The location of the "bad block indicator" within the spare area
> depends on the
>     manufacturer. It could vary from chip to chip.
> 
>    it could also depend on the page size as well.
> 
>    Usually, for a large page size nand, It could be located at the
> first byte of the OOB.
>    For a small it could be at 6th byte.
> 
>   The way you send some commands to the large page size nand device is
> somewhat different
>   from the small page size nand device. I think you may not be using
> the driver for a large page  nand device.
> 
>   Most of the stuff (driver) for the large page nand devices is
> generic. The way you wait for nand busy changes.
> 
>   Check the way your reading the flash information from the chip id
> and additional infomation.
>   The way youre mtd_info structure is getting initialised. You could
> be missing something here.
> 
> Hope this helps.
> 
> Regards,
> sriram
> 
> 
> 
> 
> On Jan 18, 2008 3:48 PM, llandre <r&d2@dave-tech.it> wrote:
>> Hi,
>>
>> I found on MTD mailing list your patch that adds Micron manufacturer ID:
>> http://article.gmane.org/gmane.linux.drivers.mtd/17694
>>
>> I'm going to use NAND Micron devices for a new project however I still
>> have a doubt about how MTD/JFFS2 handle bad blocks. To detect blocks
>> marked as bad it checks the 6th location of OOB area of first page, thus
>> it seems it is not able to handle Micron devices properly. In fact these
>> devices stores bad block marker in the first location of OOB of first or
>> second page (for example see page 50 of MT29F1GxxABB data sheet). Am I
>> misreading the datasheet? Could you help me to clear this point?
>>
>>
>> Thanks in advance,
>> llandre
>>
>> DAVE Electronics System House - R&D Department
>> web:   http://www.dave-tech.it
>> email: r&d2@dave-tech.it
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
> 
> 
