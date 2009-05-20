Received: from fed1rmmtao104.cox.net ([68.230.241.42])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6sFf-0002Ew-OD
	for linux-mtd@lists.infradead.org; Wed, 20 May 2009 20:19:06 +0000
Message-ID: <4A1465AE.7090706@boundarydevices.com>
Date: Wed, 20 May 2009 13:18:54 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
	page	NAND chips
References: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>	<4A11F5FC.40709@boundarydevices.com>	<4A11FA90.3060403@boundarydevices.com>
	<7A436F7769CA33409C6B44B358BFFF0C01138180E0@dlee02.ent.ti.com>
	<4A1454B8.3010605@boundarydevices.com>
	<7A436F7769CA33409C6B44B358BFFF0C01138184F0@dlee02.ent.ti.com>
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0C01138184F0@dlee02.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

Narnakaje, Snehaprabha wrote:
> 
>> -----Original Message-----
>> From: Troy Kisky [mailto:troy.kisky@boundarydevices.com]
>> Sent: Wednesday, May 20, 2009 3:07 PM
>> To: Narnakaje, Snehaprabha
>> Cc: linux-mtd@lists.infradead.org; davinci-linux-open-
>> source@linux.davincidsp.com; dwmw2@infradead.org; tglx@linutronix.de;
>> akpm@linux-foundation.org
>> Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
>> page NAND chips
>>
>> Narnakaje, Snehaprabha wrote:
>>> Troy,
>>>
>>>> -----Original Message-----
>>>> From: Troy Kisky [mailto:troy.kisky@boundarydevices.com]
>>>> Sent: Monday, May 18, 2009 8:17 PM
>>>> To: Narnakaje, Snehaprabha
>>>> Cc: dwmw2@infradead.org; davinci-linux-open-
>> source@linux.davincidsp.com;
>>>> linux-mtd@lists.infradead.org; tglx@linutronix.de; akpm@linux-
>>>> foundation.org
>>>> Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for
>> large
>>>> page NAND chips
>>>>
>>>> Troy Kisky wrote:
>>>>> nsnehaprabha@ti.com wrote:
>>>>>> From: Sneha Narnakaje <nsnehaprabha@ti.com>
>>>>>>
>>>>>> This patch adds 4-bit ECC support for large page NAND chips using the
>>>> new ECC
>>>>>> mode NAND_ECC_HW_OOB_FIRST. The platform data from board-dm355-evm
>> has
>>>> been
>>>>>> adjusted to use this mode.
>>>>>>
>>>>>> The patches have been verified on DM355 device with 2K Micron devices
>>>> using
>>>>>> mtd-tests and JFFS2. Error correction upto 4-bits has also been
>>>> verified using
>>>>>> nandwrite/nanddump utilities.
>>>>>>
>>>>>> Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
>>>>>> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
>>>>>> ---
>>>>>>  drivers/mtd/nand/davinci_nand.c |   37
>>>> +++++++++++++++++++++++++++++++------
>>>>>>  1 files changed, 31 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/nand/davinci_nand.c
>>>> b/drivers/mtd/nand/davinci_nand.c
>>>>>> index ba6940d..4557b8d 100644
>>>>>> --- a/drivers/mtd/nand/davinci_nand.c
>>>>>> +++ b/drivers/mtd/nand/davinci_nand.c
>>>>>> @@ -500,6 +500,24 @@ static struct nand_ecclayout hwecc4_small
>>> __initconst = {
>>>>>>  	},
>>>>>>  };
>>>>>>
>>>>>> +/* An ECC layout for using 4-bit ECC with large-page (2048bytes)
>> flash,
>>>>>> + * storing ten ECC bytes plus the manufacturer's bad block marker
>> byte,
>>>>>> + * and not overlapping the default BBT markers.
>>>>>> + */
>>>>>> +static struct nand_ecclayout hwecc4_2048 __initconst = {
>>>>>> +	.eccbytes = 40,
>>>>>> +	.eccpos = { 0, 1, 2, 3, 4,
>>>>>> +		/* offset 5 holds the badblock marker */
>>>> I don't see any bad block overrides to move it from bytes 0,1
>>>> to byte 5 in this patch. What am I missing?
>>> We are making sure we are not overwriting offset 5, that holds the
>> badblock marker from nand manufacturer. Thus offset 5 is skipped in the
>> eccpos.
>>
>> Yes, I agree, you are. But how does Linux know where to look for the bad
>> block marker?
> 
> I believe, it is defined in the nand_bbt.c.
> 
> BTW, looking closely at the nand_bbt.c, looks like I made a mistake :-)
> 
> static struct nand_bbt_descr smallpage_flashbased = {
>         .options = NAND_BBT_SCAN2NDPAGE,
>         .offs = 5,
>         .len = 1,
>         .pattern = scan_ff_pattern
> };
> 
> static struct nand_bbt_descr largepage_flashbased = {
>         .options = NAND_BBT_SCAN2NDPAGE,
>         .offs = 0,
>         .len = 2,
>         .pattern = scan_ff_pattern
> };
> 
> Since my patches are to support large page, Shouldn't I be skipping 2 bytes (offset 0 and 1)?
> 
> The 1 byte at offset 5 was for smallpage.
> 
> Thanks
> Sneha
> 
> 

Yes, that is what I thought. If you can place the ecc anywhere, please put it at the end of the oob data
for large page devices.


Troy
