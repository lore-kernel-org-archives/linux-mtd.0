Received: from mr213138.mail.yeah.net ([223.252.213.138])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bae1b-0001nT-9Q
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 07:15:36 +0000
Subject: Re: MTD RAID
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dongsheng Yang <dongsheng081251@gmail.com>
References: <CA+qeAOpuZ0CXZP8tCWdhoVvTEKAw26gtz63-UJmQ4XLSXAd=Yg@mail.gmail.com>
 <20160819084908.4955c629@bbrezillon> <57B6B073.9060404@easystack.cn>
Cc: starvik@axis.com, jesper.nilsson@axis.com,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-cris-kernel@axis.com,
 shengyong1@huawei.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 richard <richard@nod.at>, dmitry.torokhov@gmail.com,
 dooooongsheng.yang@gmail.com, jschultz@xes-inc.com, fabf@skynet.be,
 mtownsend1973@gmail.com, linux-mtd@lists.infradead.org,
 Colin King <colin.king@canonical.com>, asierra@xes-inc.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <57B6B1FA.7050108@easystack.cn>
Date: Fri, 19 Aug 2016 15:15:06 +0800
MIME-Version: 1.0
In-Reply-To: <57B6B073.9060404@easystack.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In addition, current implementation actually have a retry in reading.


     if (++i_copy >= raid->ncopies)
         goto out;

     ret = mtd_raid_ctx_retry(ctx, i_copy);


That means, we can read the good one copy from RAID-1 device even there
is one bad device.

Yang

On 08/19/2016 03:08 PM, Dongsheng Yang wrote:
>
>
> On 08/19/2016 02:49 PM, Boris Brezillon wrote:
>> Hi Dongsheng,
>>
>> On Fri, 19 Aug 2016 14:34:54 +0800
>> Dongsheng Yang <dongsheng081251@gmail.com> wrote:
>>
>>> Hi guys,
>>>      This is a email about MTD RAID.
>>>
>>> *Code:*
>>>      kernel:
>>> https://github.com/yangdongsheng/linux/tree/mtd_raid_v2-for-4.7
>> Just had a quick look at the code, and I see at least one major problem
>> in your RAID-1 implementation: you're ignoring the fact that NAND blocks
>> can be or become bad. What's the plan for that?
>
> Hi Boris,
>     Thanx for your quick reply.
>
>     When you are using RAID-1, it would erase the all mirrored blockes 
> when you are erasing.
> if there is a bad block in them, mtd_raid_erase will return an error 
> and the userspace tool
> or ubi will mark this block as bad, that means, the 
> mtd_raid_block_markbad() will mark the all
>  mirrored blocks as bad, although some of it are good.
>
> In addition, when you have data in flash with RAID-1, if one block 
> become bad. For example,
> when the mtd0 and mtd1 are used to build a RAID-1 device mtd2. When 
> you are using mtd2
> and you found there is a block become bad. Don't worry about data 
> losing, the data is still
> saved in the good one mirror. you can replace the bad one device with 
> another new mtd device.
>
> My plan about this feature is all on the userspace tool.
> (1). mtd_raid scan mtd2 <---- this will show the status of RAID device 
> and each member of it.
> (2). mtd_raid replace mtd2 --old mtd1 --new mtd3.   <---- this will 
> replace the bad one mtd1 with mtd3.
>
> What about this idea?
>
> Yang
>>
>> Regards,
>>
>> Boris
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
