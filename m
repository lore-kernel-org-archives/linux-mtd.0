Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGl5b-0000kU-8K
 for linux-mtd@lists.infradead.org; Thu, 29 Jan 2015 09:08:39 +0000
Message-ID: <54C9F87F.6070807@nod.at>
Date: Thu, 29 Jan 2015 10:08:15 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>
Subject: Re: Current linux-next status of UBI/UBIFS? Re: new UBI co-maintainer
References: <1421918762.8637.162.camel@sauron.fi.intel.com>
 <54C84CC2.6060708@huawei.com> <54C90484.4050001@nod.at>
 <54C9A8D2.8020403@huawei.com>
In-Reply-To: <54C9A8D2.8020403@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 artem.bityutskiy@linux.intel.com, Li Zefan <lizefan@huawei.com>,
 linux-mtd@lists.infradead.org, Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 29.01.2015 um 04:28 schrieb hujianyang:
> I wish it could be soon, because there are some other patches about
> mounting reliability improvement I want to send. Could I send them
> together? But I haven't finished this work, so I think one by one
> is the best way, and I can discuss the designing with you and Artem
> in time.

Please send them and describe the issues in details, provide a test case, etc...
It is also important to tell us *how* this bug can happen.

>>>    [PATCH] UBI: fix soft lockup in ubi_check_volume()
>>
>> I'm also fine with that.
>>
>>>    and ubidump v6
>>
>> For ubidump I have to read the whole thread again as I got lost in it. :)
>>
>>> The patch "UBI: fix soft lockup in ubi_check_volume()" solves a really
>>> important problem, I wish it could be merged into stable soon.
>>
>> Yes.
>>
>>> I've discussed with Richard about the recovery of an corrupted UBIFS
>>> image, for example, ECC error. And actually my colleagues and I had
>>> worked out some features to improve the reliability of UBIFS. We are
>>> happy to share our design and greatly aspire the help from community.
>>
>> Nice.
>>
>>> Also, I think we could start to add more functions to my ubidump to
>>> make it a useful tool.
>>
>> I have to look at ubidump in detail but it sounds good.
>> To debug fastmap issues I have also a tool to analyze UBI images.
>> Maybe we can merge. First I have to shape it up.
>>
> 
> I'm glad with it. I was using ubidump for debugging these days,
> but I'm not sure if this v6 is OK. I'd fixed some tiny issues
> after v5 so I don't know if there are still other issues left.
> Thanks for your reviewing.
> 
> I see ubifastmap is marked as "Experimental feature" now and
> you'd introduced multi-queue for ubiblock. I think some works,
> e.g. testing, are really needed before importing these feature
> into our products.

Fastmap is experimental for good reasons. :)
With my current patches nobody was able to kill it, so maybe I'll
remove the experimental tag in v3.25.

> By the way, I found some products in my company are using
> MTD_UBI_GLUEBI to implement a squashfs on top of UBI device.
> UBI_GLUEBI or UBI_BLOCK, which is better in your considering,
> and why?

UBI Block, it was designed for that case.
Just compare the number of layers. :)

Thanks,
//richard
