Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7QOv-0001Hv-AK
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2016 17:23:06 +0000
Received: by mail-wm0-x244.google.com with SMTP id a20so23313607wme.2
 for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2016 09:22:44 -0800 (PST)
Message-ID: <582DE75D.5040503@gmail.com>
Date: Thu, 17 Nov 2016 17:22:37 +0000
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: nandsim: fix error check
References: <1479251395-3100-1-git-send-email-sudipm.mukherjee@gmail.com>
 <0ad0b3d4-bde6-57ab-6856-de771ade3c32@gmail.com> <582C1041.7040809@gmail.com>
 <009a3016-3fe9-bda0-feb7-7d2cc132b091@gmail.com> <582CC815.8010803@gmail.com>
 <a8f709f5-ab56-b85b-198a-f5ae36f0442b@gmail.com>
In-Reply-To: <a8f709f5-ab56-b85b-198a-f5ae36f0442b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 17 November 2016 01:21 PM, Marek Vasut wrote:
> On 11/16/2016 09:56 PM, Sudip Mukherjee wrote:
>> On Wednesday 16 November 2016 04:56 PM, Marek Vasut wrote:
>>> On 11/16/2016 08:52 AM, Sudip Mukherjee wrote:
>>>> On Tuesday 15 November 2016 11:42 PM, Marek Vasut wrote:
>>>>> On 11/16/2016 12:09 AM, Sudip Mukherjee wrote:
>>>>>> debugfs_create_dir() and debugfs_create_file() returns NULL on
>>>>>> error or
>>>>>> a pointer on success. They do not return the error value with ERR_PTR.
>>>>>> So we should not check the return with IS_ERR_OR_NULL, instead we
>>>>>> should just check for NULL.
>>>>>>
>>>>>> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
>>>>>> ---
>>>>>>     drivers/mtd/nand/nandsim.c | 9 +++------
>>>>>>     1 file changed, 3 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
>>>>>> index c76287a..9b0d79a 100644
>>>>>> --- a/drivers/mtd/nand/nandsim.c
>>>>>> +++ b/drivers/mtd/nand/nandsim.c
>>>>>> @@ -525,15 +525,13 @@ static int nandsim_debugfs_create(struct
>>>>>> nandsim *dev)
>>>>>>     {
>>>>>>         struct nandsim_debug_info *dbg = &dev->dbg;
>>>>>>         struct dentry *dent;
>>>>>> -    int err;
>>>>>> +    int err = -ENODEV;
>>>>>
>>>>> Why don't you just nuke the err altogether and just return -ENODEV ?
>>>>
>>>> That was the first version which i made and discarded before sending. I
>>>> will go and find it now.
>>>
>>> Why did you discard it ?
>>>
>>
>> That is actually a stupid reason. I was confused with the print
>> statement which uses err.
>>
>> NS_ERR("cannot create \"nandsim\" debugfs directory, err %d\n",
>>              err);
>>
>
> Ah, got it, so yeah, nuke the err altogether :)

v2 is already sent yesterday.

Regards
Sudip
