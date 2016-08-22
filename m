Received: from mr213138.mail.yeah.net ([223.252.213.138])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbgR3-00062n-WD
 for linux-mtd@lists.infradead.org; Mon, 22 Aug 2016 04:02:08 +0000
Subject: Re: MTD RAID
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <57B6E1BD.1060707@easystack.cn>
 <AL*AZwAyAecQSM1UjjjNxao0.3.1471605640762.Hmail.dongsheng.yang@easystack.cn>
 <20160819135536.1ed9e374@bbrezillon>
Cc: starvik@axis.com, jesper.nilsson@axis.com,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, shengyong1@huawei.com,
 linux-cris-kernel@axis.com, dedekind1@gmail.com,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, dooooongsheng.yang@gmail.com,
 jschultz@xes-inc.com, fabf@skynet.be, mtownsend1973@gmail.com,
 linux-mtd@lists.infradead.org, Colin King <colin.king@canonical.com>,
 asierra@xes-inc.com, dmitry.torokhov@gmail.com,
 Dongsheng Yang <dongsheng081251@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <57BA7924.506@easystack.cn>
Date: Mon, 22 Aug 2016 12:01:40 +0800
MIME-Version: 1.0
In-Reply-To: <20160819135536.1ed9e374@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 08/19/2016 07:55 PM, Boris Brezillon wrote:
> On Fri, 19 Aug 2016 19:20:40 +0800 (GMT+08:00)
> 杨东升 <dongsheng.yang@easystack.cn> wrote:
>
>> Hi guys,Sorry I think i did not express myself clearly. From this reference:
>>
>>
>> https://linas.org/linux/Software-RAID/Software-RAID.txt
>>
>>
>> we can see, RAID stands for "Redundant Array of Inexpensive Disks"
>> and is meant to be a way of creating a fast and reliable
>> disk-drive subsystem out of individual disks. In the PC
>> world, "I" has come to stand for "Independent".
>>
>>
>> There are two benifets in RAID, "fast" and "reliable".
>> So I　introduce the RAID framework in MTD world. and implement
>> 3 types of RAID currently.
>>
>>
>> (1) single: I reuse this work same with what it is in BTRFS.
>> It's not a standard RAID level. But just concat the devices.
>>
>>
>> (2) RAID0: also known as Striping mode. This can make device faster.
>>  From what I show in my first email, we can see we can get 51.1 MB/s in dd
>> although the original device is only 14.0 MB/s.
> Some comments on your results. It's all theoretical (based on nandsim),
> and assuming your NAND chips are connected to the same NAND controller
> you would just get the same perf as in 'single' mode (accesses through
> the NAND controller are currently serialized, that's something I'm
> trying to change but it's not here yet).
>
> So yes, in an ideal word, sequential accesses would be improved, but
> we're not here yet. BTW, did you run this test on a real HW?

http://www.fujitsu.com/global/about/resources/news/press-releases/2015/1119-01.html
>
>>
>> (3) RAID1: also known as Mirroring mode. This can make device more reliable.
>> Yes, Boris pointed out that there could be some problems if we are using NAND flash.
>> But I think these all are possible to be solved. And I don't think this is the problem of
>> MTD RAID, but the problem of the special use case of NAND. I am glad to make the
>> MTD RAID working better on MLC and TLC.
> It's not only an MLC/TLC problem, it's just that you're more likely to
> see it on MLC/TLC NANDs. The fact that you're not regularly
> reading/refreshing some blocks of the mirror MTD is a real problem, and
> this lead to the safety illusion I was mentioning in my previous answer.
>
> That's why I think implementing RAID on top of raw MTD devices is a bad
> idea.
>
>>
>> In addition, there are some more RAID levels, such as RAID10, RAID4/5/6. All of them are
>> useful for "fast" and "reliable".
> I'm not saying RAID is useless, I'm just saying it's a pain to
> implement on top of MTD devices.
>
>>
>> I hope this mail helps to express my idea here.
>>
> I think I got the main idea, and I already explained why I think it's
> not a good idea. If you still want to go this road then you'll have to
> convince me that your implementation is safe (which is not the case
> yet).
>
> BTW, think about that: if you use an SSD in a RAID setting, the SSD's
> FTL is taking care of the NAND unreliability problems. Here you're just
> ignoring these problems and are assuming doing RAID on a NAND is just
> as safe as doing RAID on an SSD, which is wrong.
> If you want to be in a 'similar' setting, then the RAID array has to
> operate on top of the FTL/WL layer (in this specific case, UBI).
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
