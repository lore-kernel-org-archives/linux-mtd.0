Received: from smtpauth03.csee.onr.siteprotect.com ([64.26.60.137])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MHPXr-00058t-Fh
	for linux-mtd@lists.infradead.org; Thu, 18 Jun 2009 21:53:28 +0000
Message-ID: <4A3AB748.8080901@boundarydevices.com>
Date: Thu, 18 Jun 2009 14:53:12 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
Subject: Re: [PATCH v2 3/3] Add 4-bit ECC support for large page NAND chips
	on	Davinci
References: <1245183812-11500-1-git-send-email-s-paulraj@ti.com>	<4A3AAEA6.7040608@boundarydevices.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D57B62E2E@dlee01.ent.ti.com>
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D57B62E2E@dlee01.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paulraj, Sandeep wrote:
> 
>> -----Original Message-----
>> From: Troy Kisky [mailto:troy.kisky@boundarydevices.com]
>> Sent: Thursday, June 18, 2009 5:16 PM
>> To: Paulraj, Sandeep
>> Cc: davinci-linux-open-source@linux.davincidsp.com; linux-
>> mtd@lists.infradead.org; dwmw2@infradead.org; tglx@linutronix.de;
>> akpm@linux-foundation.org
>> Subject: Re: [PATCH v2 3/3] Add 4-bit ECC support for large page NAND
>> chips on Davinci
>>
>> s-paulraj@ti.com wrote:
>>> From: Sandeep Paulraj <s-paulraj@ti.com>
>>>
>>> The patch applies to linux-mtd GIT tree
>>>
>>> This patch adds 4-bit ECC support for large page NAND chips using the
>> new ECC
>>> mode NAND_ECC_HW_OOB_FIRST. The platform data from board-dm355-evm has
>> been
>>> adjusted to use this mode.
>>>
>>> The patches have been verified on DM355 device with 2K and 4K page size
>>> Micron devices using mtd-tests.
>>> Error correction upto 4-bits has also been verified using
>>> nandwrite/nanddump utilities.
>>>
>>> Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
>>> Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
>>> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
>>> ---
>>>  drivers/mtd/nand/davinci_nand.c |   65
>> ++++++++++++++++++++++++++++++++++----
>>>  1 files changed, 58 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/mtd/nand/davinci_nand.c
>> b/drivers/mtd/nand/davinci_nand.c
>>> index ba6940d..2ff0712 100644
>>> --- a/drivers/mtd/nand/davinci_nand.c
>>> +++ b/drivers/mtd/nand/davinci_nand.c
>>> @@ -500,6 +500,49 @@ static struct nand_ecclayout hwecc4_small
>> __initconst = {
>>>  	},
>>>  };
>>>
>>> +/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash,
>>> + * storing ten ECC bytes plus the manufacturer's bad block marker byte,
>>> + * and not overlapping the default BBT markers.
>>> + */
>>> +static struct nand_ecclayout hwecc4_2048 __initconst = {
>>> +	.eccbytes = 40,
>>> +	.eccpos = { /* 2 bytes at offset 0 hold the badblock markers */
>>> +		/* 4 bytes at offset 8 hold BBT header */
>>> +		/* 1 byte at offset 12 holds BBT version */
>>> +		/* 8 bytes at offset 16 hold JFFS2 clean markers */
>>> +		24, 25, 26, 27, 28, 29,	30, 31, 32, 33,
>>> +		34, 35, 36, 37, 38, 39,	40, 41, 42, 43,
>>> +		44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
>>> +		54, 55, 56, 57, 58, 59, 60, 61, 62, 63, },
>>> +	.oobfree = {
>>> +		{.offset = 16, .length = 8, },
>> why not  offset = 2, length = 22
>> Won't the badblock marker show if this is used as a BBT?
>> Can JFFS2 not use the same bytes when not a BBT?

> [Sandeep] We do not want any overlap between the ECC bytes and any of the above so just reserving as explained above and using the last 40 bytes.

You mean that you want no overlap between JFFS2 and BBT header. Can you explain this need
or point me to a document that will explain it? Thanks...



>>> +		{.offset = 64, },
>> You can kill the above line.
>>
>>> +	},
>>> +};
>>> +
>>> +/* An ECC layout for using 4-bit ECC with large-page (4096bytes) flash,
>>> + * storing ten ECC bytes plus the manufacturer's bad block marker byte,
>>> + * and not overlapping the default BBT markers.
>>> + */
>>> +static struct nand_ecclayout hwecc4_4096 __initconst = {
>>> +	.eccbytes = 80,
>>> +	.eccpos = { /* 2 bytes at offset 0 hold the badblock markers */
>>> +		/* 4 bytes at offset 8 hold BBT header */
>>> +		/* 1 byte at offset 12 holds BBT version */
>>> +		/* 8 bytes at offset 16 hold JFFS2 clean markers */
>>> +		24, 25, 26, 27, 28, 29,	30, 31, 32, 33,
>>> +		34, 35, 36, 37, 38, 39,	40, 41, 42, 43,
>>> +		44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
>>> +		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
>>> +		64, 65, 66, 67, 68, 69, 70, 71, 72, 73,
>>> +		74, 75, 76, 77, 78, 69,	80, 81, 82, 83,
>>> +		84, 85, 86, 87, 88, 89, 90, 91, 92, 93,
>>> +		94, 95, 96, 97, 98, 99, 100, 101, 102, 103, },
>> Can these not be at the end??? i.e. 48-127
> [Sandeep] I am just using the first available free bytes.
> To answer your question, yes it can be at the end but I do not see any reason why it has to be at the end
> Any reason why you insist that it should be at the end.


Well, for one, it is nice to have oobfree contiguous. But mainly, I hope
to eventually use a default layout which will have the oob data at the
end when 0 holds the badblock marker.


> 
>>> +	.oobfree = {
>>> +		{.offset = 16, .length = 8, },
>>> +		{.offset = 104, },

Then, the above line can disappear if the ecc is at the end.

>>> +	},
>>> +};
>>>
>>>  static int __init nand_davinci_probe(struct platform_device *pdev)
>>>  {
>>> @@ -689,15 +732,23 @@ static int __init nand_davinci_probe(struct
>> platform_device *pdev)
>>>  				info->mtd.oobsize - 16;
>>>  			goto syndrome_done;
>>>  		}
>>> +		if (chunks == 4) {
>>> +			info->ecclayout = hwecc4_2048;
>>> +			info->ecclayout.oobfree[1].length = info->mtd.oobsize -
>>> +				info->ecclayout.oobfree[1].offset;
>> This can be removed, it is already 0.
>>
>>> +			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
>>> +			goto syndrome_done;
>>> +		}
>>> +		if (chunks == 8) {
>>> +			info->ecclayout = hwecc4_4096;
>>> +			info->ecclayout.oobfree[1].length = info->mtd.oobsize -
>>> +				info->ecclayout.oobfree[1].offset;

Along with this line.

>>> +			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
>>> +			goto syndrome_done;
>>> +		}
>>>
>>> -		/* For large page chips we'll be wanting to use a
>>> -		 * not-yet-implemented mode that reads OOB data
>>> -		 * before reading the body of the page, to avoid
>>> -		 * the "infix OOB" model of NAND_ECC_HW_SYNDROME
>>> -		 * (and preserve manufacturer badblock markings).
>>> -		 */
>>>  		dev_warn(&pdev->dev, "no 4-bit ECC support yet "
>>> -				"for large page NAND\n");
>>> +				"for >4K page NAND\n");
>>>  		ret = -EIO;
>>>  		goto err_scan;
>>>
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
