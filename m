Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGfnK-000619-07
 for linux-mtd@lists.infradead.org; Thu, 29 Jan 2015 03:29:27 +0000
Message-ID: <54C9A8D2.8020403@huawei.com>
Date: Thu, 29 Jan 2015 11:28:18 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: Current linux-next status of UBI/UBIFS? Re: new UBI co-maintainer
References: <1421918762.8637.162.camel@sauron.fi.intel.com>
 <54C84CC2.6060708@huawei.com> <54C90484.4050001@nod.at>
In-Reply-To: <54C90484.4050001@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Brian
 Norris <computersforpeace@gmail.com>, artem.bityutskiy@linux.intel.com,
 Li Zefan <lizefan@huawei.com>, linux-mtd@lists.infradead.org,
 Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 2015/1/28 23:47, Richard Weinberger wrote:
>>
>>    [PATCH] UBI: add ubi_err() to report the failure of leb read
> 
> IIRC I had some questions on that patch. If all questions are resolved I'm fine with it.
> 

Yes, I know that. OK... I'll re-check your comments and send this
patch again.

>>    [PATCH RFC 1/2] UBIFS: fix empty log leb error
> 
> These patches look okay to me but as they are posted as RFC I really want
> a comment from Artem on them.
>

I wish it could be soon, because there are some other patches about
mounting reliability improvement I want to send. Could I send them
together? But I haven't finished this work, so I think one by one
is the best way, and I can discuss the designing with you and Artem
in time.

>>    [PATCH] UBI: fix soft lockup in ubi_check_volume()
> 
> I'm also fine with that.
> 
>>    and ubidump v6
> 
> For ubidump I have to read the whole thread again as I got lost in it. :)
> 
>> The patch "UBI: fix soft lockup in ubi_check_volume()" solves a really
>> important problem, I wish it could be merged into stable soon.
> 
> Yes.
> 
>> I've discussed with Richard about the recovery of an corrupted UBIFS
>> image, for example, ECC error. And actually my colleagues and I had
>> worked out some features to improve the reliability of UBIFS. We are
>> happy to share our design and greatly aspire the help from community.
> 
> Nice.
> 
>> Also, I think we could start to add more functions to my ubidump to
>> make it a useful tool.
> 
> I have to look at ubidump in detail but it sounds good.
> To debug fastmap issues I have also a tool to analyze UBI images.
> Maybe we can merge. First I have to shape it up.
> 

I'm glad with it. I was using ubidump for debugging these days,
but I'm not sure if this v6 is OK. I'd fixed some tiny issues
after v5 so I don't know if there are still other issues left.
Thanks for your reviewing.

Actually I'm working on a 3.10-stable branch, new features like
ubiblock, ubifastmap are not introduced into my version. But
we will update kernel version soon and import these features.

I see ubifastmap is marked as "Experimental feature" now and
you'd introduced multi-queue for ubiblock. I think some works,
e.g. testing, are really needed before importing these feature
into our products.

I'd like to work with you for both dumping tool and features
in kernel.

>> I think the updating of UBI/UBIFS will re-start soon, am I right?
> 
> Correct. Currently I'm preparing the tree.
> 

I see more and more products in my company turn to use UBIFS
instead of Yaffs2/Jffs2. One of the prime reasons is the well
supporting by community. Thanks for the contributes from you,
Artem and other developers.

By the way, I found some products in my company are using
MTD_UBI_GLUEBI to implement a squashfs on top of UBI device.
UBI_GLUEBI or UBI_BLOCK, which is better in your considering,
and why?


Thanks,
Hu
