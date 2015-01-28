Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGUqE-000898-Ux
 for linux-mtd@lists.infradead.org; Wed, 28 Jan 2015 15:47:44 +0000
Message-ID: <54C90484.4050001@nod.at>
Date: Wed, 28 Jan 2015 16:47:16 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>, artem.bityutskiy@linux.intel.com
Subject: Re: Current linux-next status of UBI/UBIFS? Re: new UBI co-maintainer
References: <1421918762.8637.162.camel@sauron.fi.intel.com>
 <54C84CC2.6060708@huawei.com>
In-Reply-To: <54C84CC2.6060708@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Li Zefan <lizefan@huawei.com>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 28.01.2015 um 03:43 schrieb hujianyang:
> On 2015/1/22 17:26, Artem Bityutskiy wrote:
>> Hi,
>>
>> I'd like to give Richard Weinberger UBI tree push rights, so that he
>> could help us improving the QoS.
>>
>> If no one objects, lets make it effective.
>>
> 
> Hi Artem,
> 
> First, thank Richard for his contributions to UBI/UBIFS.
> 
> 
> I regret to say the updating of UBI/UBIFS was blocked about 2 months.
> So Richard could help us maintaining the improvement of UBIFS next?
> 
> I've sent some patches to MTD list these days, what's the opinion of
> you and Richard about these pacthes?
> 
>    [PATCH] UBI: add ubi_err() to report the failure of leb read

IIRC I had some questions on that patch. If all questions are resolved I'm fine with it.

>    [PATCH RFC 1/2] UBIFS: fix empty log leb error

These patches look okay to me but as they are posted as RFC I really want
a comment from Artem on them.

>    [PATCH] UBI: fix soft lockup in ubi_check_volume()

I'm also fine with that.

>    and ubidump v6

For ubidump I have to read the whole thread again as I got lost in it. :)

> The patch "UBI: fix soft lockup in ubi_check_volume()" solves a really
> important problem, I wish it could be merged into stable soon.

Yes.

> I've discussed with Richard about the recovery of an corrupted UBIFS
> image, for example, ECC error. And actually my colleagues and I had
> worked out some features to improve the reliability of UBIFS. We are
> happy to share our design and greatly aspire the help from community.

Nice.

> Also, I think we could start to add more functions to my ubidump to
> make it a useful tool.

I have to look at ubidump in detail but it sounds good.
To debug fastmap issues I have also a tool to analyze UBI images.
Maybe we can merge. First I have to shape it up.

> I think the updating of UBI/UBIFS will re-start soon, am I right?

Correct. Currently I'm preparing the tree.

Thanks,
//richard
