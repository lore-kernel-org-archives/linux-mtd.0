Received: from lelnx194.ext.ti.com ([198.47.27.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctX1k-0002Aw-4m
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 10:10:02 +0000
Subject: Re: [PATCH] Revert "mtd: davinci-nand: disable subpage write for
 keystone-nand"
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
References: <9d21903d38de6685c9bf45d6eb8e32ab0e8c65c5.1490609415.git.nsekhar@ti.com>
 <20170329170352.2d6c0721@bbrezillon>
 <7e06e416-8c4a-46dd-5223-2da522daba08@ti.com>
 <20170330120012.081310fa@bbrezillon>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Muralidharan Karicheri <m-karicheri2@ti.com>,
 Franklin S Cooper Jr <fcooper@ti.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <0c648fbb-bb73-30e3-21bb-2875fa8c281d@ti.com>
Date: Thu, 30 Mar 2017 15:38:54 +0530
MIME-Version: 1.0
In-Reply-To: <20170330120012.081310fa@bbrezillon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 30 March 2017 03:30 PM, Boris Brezillon wrote:
> On Thu, 30 Mar 2017 13:13:58 +0530
> Sekhar Nori <nsekhar@ti.com> wrote:
> 
>> Hi Boris,
>>
>> On Wednesday 29 March 2017 08:33 PM, Boris Brezillon wrote:
>>> On Mon, 27 Mar 2017 15:56:55 +0530
>>> Sekhar Nori <nsekhar@ti.com> wrote:
>>>   
>>>> This partly reverts commit 28c015a9daabe4ed3aeb0ccf669a3f1c2b8b81d5.
>>>>
>>>> Since f6d7c1b5598b ("mtd: nand: davinci: Reinitialize the HW ECC
>>>> engine in 4bit hwctl") using subpage and 4bit HWECC works.
>>>>
>>>> Revert the original workaround made for this. Tested with
>>>> mtd_subpagetest and UBIFS on K2E, K2HK, K2L EVMs.
>>>>
>>>> The addition of keystone specific compatible to davinci_nand_of_match[]
>>>> contained in original commit is retained.  
>>>
>>> Hm, it sounds like a bad idea to re-enable sub-page writes afterwards.
>>> You might break existing systems using UBI, because UBI detects the
>>> sub-page write feature and decides to place the VID header at a
>>> different position depending on that.
>>> To sum-up, you're likely to break users that have already flashed a UBI
>>> image with the old driver.  
>>
>> Okay, I didn't realize that.
>>
>>> If you want to re-enable sub-page writes, just switch back to the
>>> "ti,davinci-nand" compatible.  
>>
>> How about a comment on top of the disable subpage write code explaining 
>> that its not really needed anymore ? Something like this patch:
>>
>> ---8<---
>> From: Sekhar Nori <nsekhar@ti.com>
>> Date: Thu, 30 Mar 2017 13:08:30 +0530
>> Subject: [PATCH] mtd: nand: davinci: add comment on NAND subpage write status
>>  on keystone
>>
>> Add a comment clarifying that NAND subpage write on keystone works,
>> but is not being enabled in the interest of backward compatibility.
>>
>> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
>> ---
>>  drivers/mtd/nand/davinci_nand.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
>> index 27fa8b87cd5f..5bf8be1cfc8c 100644
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -581,6 +581,17 @@ static struct davinci_nand_pdata
>>  			"ti,davinci-nand-use-bbt"))
>>  			pdata->bbt_options = NAND_BBT_USE_FLASH;
>>  
>> +		/*
>> +		 * Since kernel v4.8, this driver has been fixed to enable
>> +		 * use of 4-bit hardware ECC with subpages and verified on
>> +		 * TI's keystone EVMs (K2L, K2HK and K2E).
>> +		 * However, in the interest of not breaking systems using
>> +		 * existing UBI partitions, sub-page writes are not being
>> +		 * (re)enabled. If you want to use subpage writes on Keystone
>> +		 * platforms (i.e. do not have any existing UBI partitions),
>> +		 * then remove the if() block below or pass "ti,davinci-nand"
>> +		 * as the compatible in your device-tree file.
> 
> Hm, I'm not sure we should suggest to remove these lines from the code.
> Just suggest to use "ti,davinci-nand" compatible.

Thats fine with me. Today, this if() block is the only place where
ti,keystone-nand is used. If in future it gets used for something else
(yet unknown), then the comment might start to get misleading. Thats why
just removing the code seemed like a safer option to me.

But the main intention was to document that subpage is not really broken
on K2 platform. So, what you suggest will do as well.

Thanks,
Sekhar
