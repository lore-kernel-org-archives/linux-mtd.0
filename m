Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0blr-0000FU-PF
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 22:38:53 +0000
Received: by mail-wr0-x243.google.com with SMTP id u18so918561wrc.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2017 15:38:31 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] mtd: dataflash: Improve coding style in
 jedec_probe()
To: Joe Perches <joe@perches.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 linux-mtd@lists.infradead.org
References: <20170418142127.23301-1-andrew.smirnov@gmail.com>
 <20170418142127.23301-2-andrew.smirnov@gmail.com>
 <32615ada-eddc-3911-17bf-32f6897c77e1@gmail.com>
 <1492554972.8661.51.camel@perches.com>
Cc: cphealy@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <dd25e04b-ecb8-f53a-23b0-bfeb85a4a226@gmail.com>
Date: Wed, 19 Apr 2017 00:38:28 +0200
MIME-Version: 1.0
In-Reply-To: <1492554972.8661.51.camel@perches.com>
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

On 04/19/2017 12:36 AM, Joe Perches wrote:
> On Tue, 2017-04-18 at 20:25 +0200, Marek Vasut wrote:
>> On 04/18/2017 04:21 PM, Andrey Smirnov wrote:
>>> As per request from Marek Vasut, change the following:
>>
>> Does that really have to be in the commit message ? ^_^'
>>
>>>    - Replace indentation between type and name of local variable from
>>>      tabs to spaces
>>>
>>>    - Replace magic number 0x1F with CFI_MFR_ATMEL macro
>>>
>>>    - Replace variable 'tmp' with 'ret' and 'i' where appropriate
>>>
>>>    - Reformat multi-line comments and add newlines where appropriate
>>>
>>> No functional change intended.
>>
>> Appreciated, thanks!
> 
> trivia:
> 
>>> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> []
>>> @@ -768,9 +771,9 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
>>>  	jedec = jedec << 8;
>>>  	jedec |= id[2];
>>>  
>>> -	for (tmp = 0, info = dataflash_data;
>>> -			tmp < ARRAY_SIZE(dataflash_data);
>>> -			tmp++, info++) {
>>> +	for (i = 0, info = dataflash_data;
>>> +			i < ARRAY_SIZE(dataflash_data);
>>> +			i++, info++) {
>>>  		if (info->jedec_id == jedec) {
>>>  			pr_debug("%s: OTP, sector protect%s\n",
>>>  				dev_name(&spi->dev),
> 
> This loop could be written without the i variable.
> 
> 	for (info = dataflash_data;
> 	     info < dataflash_data + ARRAY_SIZE(dataflash_data);
> 	     info++) {
> 

But in a separate patch please, so it's bisectable. I don't want to slap
such change into this patch.

-- 
Best regards,
Marek Vasut
