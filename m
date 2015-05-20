Received: from mail-wg0-f48.google.com ([74.125.82.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yv4jm-0004QA-FQ
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 14:12:47 +0000
Received: by wgbgq6 with SMTP id gq6so54385134wgb.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 07:12:23 -0700 (PDT)
Message-ID: <555C9584.1030609@vanguardiasur.com.ar>
Date: Wed, 20 May 2015 11:09:08 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Antoine Tenart <antoine.tenart@free-electrons.com>,
 computersforpeace@gmail.com
Subject: Re: [PATCH v5 07/12] mtd: nand: add Samsung K9GBG08U0A-M to nand_ids
 table
References: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
 <1431356341-31640-8-git-send-email-antoine.tenart@free-electrons.com>
 <555792FC.8030407@vanguardiasur.com.ar> <20150520140631.GN22054@kwain>
In-Reply-To: <20150520140631.GN22054@kwain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org,
 sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/20/2015 11:06 AM, Antoine Tenart wrote:
> On Sat, May 16, 2015 at 03:57:00PM -0300, Ezequiel Garcia wrote:
>> On 05/11/2015 11:58 AM, Antoine Tenart wrote:
>>> Add the full description of the Samsung K9GBG08U0A-M nand chip in the
>>> nand_ids table.
>>>
>>> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
>>> ---
>>>  drivers/mtd/nand/nand_ids.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
>>> index dd620c19c619..500c33e1db06 100644
>>> --- a/drivers/mtd/nand/nand_ids.c
>>> +++ b/drivers/mtd/nand/nand_ids.c
>>> @@ -50,6 +50,10 @@ struct nand_flash_dev nand_flash_ids[] = {
>>>  		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
>>>  		  SZ_8K, SZ_8K, SZ_2M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K),
>>>  		  4 },
>>> +	{"NAND 4GiB 3,3V 8-bit",
>>> +		{ .id = {0xec, 0xd7, 0x94, 0x76, 0x64, 0x43}, },
>>> +		  8192, 4096, SZ_1M, LP_OPTIONS, 0, 0, NAND_ECC_INFO(40, SZ_1K),
>>
>> You should stick to SZ_8K and SZ_4K here.
> 
> Right.
> 
>>
>>> +		  4 },
>>>  
>>>  	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
>>>  	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
>>>
>>
>> I found a datasheet here for K9GBG08U0A that claims to support JEDEC
>> device identification (i.e. 0x90 0x40 and 0xEC 0x40 commands). Have you
>> tested it? Any reason you are adding full ID instead?
> 
> This nand looks like another one defined in this file, so a full ID make
> sure the right parameters applies here.
> 

Oh, so you say the NAND detects the device ID and uses those parameters,
instead of doing the JEDEC detection?

Then I'd say NAND is broken and should be fixed. Brian, am I crazy?
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
