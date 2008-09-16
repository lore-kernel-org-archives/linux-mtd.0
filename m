Received: from ik-out-1112.google.com ([66.249.90.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KfZ92-0005xQ-Io
	for linux-mtd@lists.infradead.org; Tue, 16 Sep 2008 11:55:01 +0000
Received: by ik-out-1112.google.com with SMTP id c21so2470377ika.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Sep 2008 04:54:59 -0700 (PDT)
Message-ID: <48CF9E98.1030706@gmail.com>
Date: Tue, 16 Sep 2008 13:55:04 +0200
From: Karl Beldan <karl.beldan@gmail.com>
MIME-Version: 1.0
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] [MTD] [NAND] nand_base.c: reset chip first
References: <ea2442770809150537p538f5298s9b5b003a1825b09f@mail.gmail.com>
	<20080916101048.GA4322@fluff.org.uk>
In-Reply-To: <20080916101048.GA4322@fluff.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Dooks wrote:
> On Mon, Sep 15, 2008 at 02:37:29PM +0200, Karl Beldan wrote:
>> Some chips require a RESET after power-up (e.g. Micron MT29FxGxxxxx).
>> The first command sent is NAND_CMD_READID.
>> Issue a NAND_CMD_RESET in nand_scan_ident before reading the device id.
>> Tested with an MT29F4G08AAC.
> 
> This seems sensible to me, we don't really know what state the NAND
> chip is in.
> 
> Does there need to be a delay after sending the reset command before
> attempting to read the chip's identity?
>  

There's the tWB + tRST delay which is handled by the CMD_RESET case in 
nand_command if that's what you were thinking of.
Tested both R/B and STATUS_READY code paths.

>> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
>> ---
>> Prior to resetting, the chip gives a correct first ID byte though.
>>
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index d1129ba..2cfac9b 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -2318,6 +2318,12 @@ static struct nand_flash_dev
>> *nand_get_flash_type(struct mtd_info *mtd,
>>  	/* Select the device */
>>  	chip->select_chip(mtd, 0);
>>
>> +	/*
>> +	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
>> +	 * after power-up
>> +	 */
>> +	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
>> +
>>  	/* Send the command for reading device ID */
>>  	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
>>
>> @@ -2488,6 +2494,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips)
>>  	/* Check for a chip array */
>>  	for (i = 1; i < maxchips; i++) {
>>  		chip->select_chip(mtd, i);
>> +		/* See comment in nand_get_flash_type for reset */
>> +		chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
>>  		/* Send the command for reading device ID */
>>  		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
>>  		/* Read manufacturer and device IDs */
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Karl
