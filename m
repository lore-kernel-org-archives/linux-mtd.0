Received: from mail-wr0-f194.google.com ([209.85.128.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbuaF-0003wu-R6
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 19:40:49 +0000
Received: by mail-wr0-f194.google.com with SMTP id 89so12956098wrr.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 11:40:27 -0800 (PST)
Subject: Re: [PATCH V2 1/2] mtd: bcm47xxpart: move TRX parsing code to
 separated function
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20170110115045.9134-1-zajec5@gmail.com>
 <20170110221525.9216-1-zajec5@gmail.com>
 <d42baa4c-1ab3-2a43-0adc-2ed10022d084@gmail.com>
 <cc2c7b030467be49a713574c4ac4422f@milecki.pl>
 <a595b27a-235c-1f11-db90-772e2a4bf2bd@gmail.com>
 <20170209201122.21f4cf6e@bbrezillon>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ea1e0a3b-f7b8-5090-7668-622c3cc1ca0d@gmail.com>
Date: Thu, 9 Feb 2017 20:33:07 +0100
MIME-Version: 1.0
In-Reply-To: <20170209201122.21f4cf6e@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/09/2017 08:11 PM, Boris Brezillon wrote:
> On Thu, 9 Feb 2017 19:21:03 +0100
> Marek Vasut <marek.vasut@gmail.com> wrote:
> 
>> On 02/09/2017 07:05 PM, Rafał Miłecki wrote:
>>> On 2017-02-09 18:28, Marek Vasut wrote:  
>>>> On 01/10/2017 11:15 PM, Rafał Miłecki wrote:  
>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>
>>>>> This change simplifies main parsing loop logic a bit. In future it may
>>>>> be useful for moving TRX support to separated module / parser (if we
>>>>> implement support for them at some point).
>>>>> Finally parsing TRX at the end puts us in a better position as we have
>>>>> better flash layout knowledge. It may be useful e.g. if it appears there
>>>>> is more than 1 TRX partition.
>>>>>
>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>> ---
>>>>> V2: Keep using bcm47xxpart_add_part in new parsing function
>>>>> ---
>>>>>  drivers/mtd/bcm47xxpart.c | 121
>>>>> ++++++++++++++++++++++++++++------------------
>>>>>  1 file changed, 74 insertions(+), 47 deletions(-)
>>>>>
>>>>> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
>>>>> index 283ff7e..1093025 100644
>>>>> --- a/drivers/mtd/bcm47xxpart.c
>>>>> +++ b/drivers/mtd/bcm47xxpart.c
>>>>> @@ -83,6 +83,67 @@ static const char
>>>>> *bcm47xxpart_trx_data_part_name(struct mtd_info *master,
>>>>>      return "rootfs";
>>>>>  }
>>>>>
>>>>> +static int bcm47xxpart_parse_trx(struct mtd_info *master,
>>>>> +                 struct mtd_partition *trx,
>>>>> +                 struct mtd_partition *parts,
>>>>> +                 size_t parts_len)
>>>>> +{
>>>>> +    struct trx_header header;
>>>>> +    size_t bytes_read;
>>>>> +    int curr_part = 0;
>>>>> +    int i, err;
>>>>> +
>>>>> +    if (parts_len < 3) {
>>>>> +        pr_warn("No enough space to add TRX partitions!\n");
>>>>> +        return -ENOMEM;
>>>>> +    }
>>>>> +
>>>>> +    err = mtd_read(master, trx->offset, sizeof(header), &bytes_read,
>>>>> +               (uint8_t *)&header);
>>>>> +    if (err && !mtd_is_bitflip(err)) {
>>>>> +        pr_err("mtd_read error while reading TRX header: %d\n", err);  
>>>>
>>>> Minor nit -- Can we make this dev_err() ?  
>>>
>>> The problem is parsers receive struct mtd_info (as an argument) with has
>>> empty
>>> dev. I just tried
>>> dev_info(&master->dev, "TEST TEST TEST :)\n");
>>> and got this:
>>> [    0.491576]  (null): TEST TEST TEST :)
>>>
>>> I guess that's the reason why parse_mtd_partitions and
>>> mtd_device_parse_register
>>> also use pr_* functions.
>>>
>>> So this should be improved at mtd core subsystem first, then we can use
>>> it in
>>> drivers as well.  
>>
>> Isn't this patch fixing just that?
>>  [PATCH] mtd: Add partition device node to mtd partition devices
>>
> 
> 
> No, this patch is only adding a pointer to a device_node object (DT
> node).
> To solve the problem, we need to have the master dev name set before we
> register its partitions, and this is currently only the case if you
> enable CONFIG_MTD_PARTITIONED_MASTER.
> 
Ah hmmmm , then leave the pr_err() there , this can be fixed later.

Acked-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
