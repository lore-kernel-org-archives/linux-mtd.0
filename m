Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zpn0e-0000kP-B0
 for linux-mtd@lists.infradead.org; Sat, 24 Oct 2015 00:48:36 +0000
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
To: Brian Norris <computersforpeace@gmail.com>, Clay McClure <clay@daemons.net>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com>
CC: <linux-mtd@lists.infradead.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
Message-ID: <562AD54B.2000501@broadcom.com>
Date: Fri, 23 Oct 2015 17:48:11 -0700
MIME-Version: 1.0
In-Reply-To: <20151023232742.GV13239@google.com>
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



On 10/23/2015 4:27 PM, Brian Norris wrote:
> + others
>
> On Fri, Oct 23, 2015 at 12:47:06PM -0700, Clay McClure wrote:
>> On systems using Broadcom Cortex-A9 SoCs (BCM585XX, BCM586XX, BCM56340),
>> nand_flash_detect_onfi() fails at boot with:
>>
>>      Could not find valid ONFI parameter page; aborting
>>
>> brcmnand_read_byte()'s NAND_CMD_PARAM handler assumes the in-memory
>> cache of the NAND controller's FLASH_CACHE registers is big-endian.
>> But the iproc_nand driver forces little-endian APB bus transfers,
>> so the in-memory cache ends up exactly backwards.
>>
>> The solution is to swap flash_cache byte order before extracting
>> bytes from it. NAND_CMD_PARAM is not an oft-used command, so we
>> don't need to worry about the overhead of byte swaps here.
>>
>> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
>> Signed-off-by: Clay McClure <clay@daemons.net>
>> ---
>>   drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 7c1c306..932bc49 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -1228,7 +1228,7 @@ static uint8_t brcmnand_read_byte(struct mtd_info *mtd)
>>   		if (host->last_byte > 0 && offs == 0)
>>   			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, addr, -1);
>>
>> -		ret = ctrl->flash_cache[offs >> 2] >>
>> +		ret = __cpu_to_be32(ctrl->flash_cache[offs >> 2]) >>
>
> This is most definitely wrong, as it breaks all the other little endian
> systems that are using this. Not to say that the original code is
> pretty... (It really should be cleaned up a bit.)
>
> Anyway, since looks like you're using iproc_nand, I'd solicit Scott and
> Ray's opinions on what's really wrong here. Have you guys tested ONFI
> paramater pages for Cygnus?
>
> Brian
>

No, we have not tested ONFI parameter pages on Cygnus. And I believe 
this is observed on NSP instead of Cygnus? It looks like Cygnus and 
other iProc chips should have the same issue though.

According to the commit message, it looks like the original logic is 
making the assumption that data in the flash cache buffer is in BE 
format? I thought the raw NAND data in is expected to be in LE format, 
and data stored in the flash cache buffer here would be in the native 
CPU endian format since __raw_readl was used?

If so, then should the logic here be the following?

ret = cpu_to_le32(ctrl->flash_cache[offs >> 2]) >> ((offs & 0x03) << 3);

>>   					(24 - ((offs & 0x03) << 3));
>>   		break;
>>   	case NAND_CMD_GET_FEATURES:
>> --
>> 2.1.4
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
