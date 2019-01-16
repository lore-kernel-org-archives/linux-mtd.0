From: houtao1@huawei.com (Hou Tao)
Date: Wed, 16 Jan 2019 17:38:56 +0800
Subject: [PATCH] ubi: account the fastmap data blocks when checking
 found_pebs
In-Reply-To: <3735706.oOp81Q8WGZ@blindfold>
References: <20190116005935.141529-1-houtao1@huawei.com>
 <1729890.X3pJ5IsDyS@blindfold>
 <a540ab38-c0a9-1339-7c1c-23008b375b71@huawei.com>
 <3735706.oOp81Q8WGZ@blindfold>
Message-ID: <d43d7cf7-54a9-da64-a1e6-699c6cc20e11@huawei.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi Richard,

On 2019/1/16 17:17, Richard Weinberger wrote:
> Tao,
> 
> Am Mittwoch, 16. Januar 2019, 10:12:47 CET schrieb Hou Tao:
>>> This should get accounted in the loop above.
>>>          list_for_each_entry(aeb, &ai->fastmap, u.list) {
>>>
>> I have considered to add these data blocks into the fastmap list in ubi_scan_fastmap(), but
>> it seems nobody will try to find the data block in fastmap list, so I choose a quick fix for
>> the assertion.
> 
> Please fix it properly. Fastmap is already a way too complicated.
> BTW: What NAND is this? How many blocks does fastmap need?
> Usually on huge NANDs the whole fastmap fits into one block.
>  
It is just a 2GB-sized NAND flash simulated by nandsim, and two blocks (one super block and
one data block) are used by fast-map.

The following are the details:

$ mtdinfo -a
mtd0
Name:                           NAND simulator partition 0
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          16384 (2147483648 bytes, 2.0 GiB)
Minimum input/output unit size: 4096 bytes
Sub-page size:                  1024 bytes
OOB size:                       128 bytes

mtd1
Name:                           test
Type:                           ubi
Eraseblock size:                126976 bytes, 124.0 KiB
Amount of eraseblocks:          496 (62980096 bytes, 60.0 MiB)
Minimum input/output unit size: 4096 bytes
Sub-page size:                  4096 bytes


>>> I agree that this logic needs a redesign.
>>> Please see this patch series I sent last year but had no time to further work
>>> on it:
>>> https://lkml.org/lkml/2018/6/13/755
>>>
>>> I'd highly appreciate if you could revive it. :-)
>>>
>> Do you mean the whole patch set ? And we are planning to enable fast-map in our products,
>> so I could try to do it.
> 
> The more the merrier. :)
> 
> Thanks,
> //richard
> 
> 
> 
> .
> 
