Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wguzw-0001i9-Dw
 for linux-mtd@lists.infradead.org; Sun, 04 May 2014 11:54:24 +0000
Message-ID: <b164fc802b8a22836092488f8cc498a1.squirrel@www.codeaurora.org>
In-Reply-To: <5365E06B.8080300@huawei.com>
References: <535B7B96.9030008@huawei.com> <536092CE.2090209@huawei.com>
 <20140430121846.GI1821@guralp.com>
 <3921496816192fe04ed3cdbb562fc6d8.squirrel@www.codeaurora.org>
 <5365E06B.8080300@huawei.com>
Date: Sun, 4 May 2014 11:54:03 -0000
Subject: Re: [PATCH v2] UBIFS: Fix assert failed in ubifs_set_page_dirty
From: "Dolev Raviv" <draviv@codeaurora.org>
To: "hujianyang" <hujianyang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: Dolev Raviv <draviv@codeaurora.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hu, Thanks allot for your help.
> Hi, Dolev
>
> On 2014/4/30 21:48, Dolev Raviv wrote:
>> Hi Hujianyang and Laurence,
>> I'm hitting an assertion in very similar code during the callback
>> ubifs_releasepage(). I'm quite new to this code area, and currently
>> diving
>> in to understanding the race you described (before I attempt to look at
>> the patch).
>>
>> I was wondering if this assertion is related?
>>
>> [  862.695278] UBIFS assert failed in ubifs_releasepage at 1434 (pid
>> 11088)
>
> What's your kernel version? Because in v3.15 and v3.10, line 1434
> present different assertion.

You are right the version is v3.10 and I do hit the
"ubifs_assert(0)"

> Page_Private bit seems to indicate page is budgeted in UBIFS. Dropping
> caches performs with page lock and just deals with pages which are not
> dirty. Then, if page_private bit is set, vfs performs ->releasepage at
> try_to_release_page.
>
> Maybe some explanation of this assert failed is that there is a private
> (budgeted) but not dirty page in your page caches.

Wouldn't then the assertion in the previous line fail?
I dove into the code, and I understood there probably isn't any real
connection between the to.
I do appreciate you took the time to answer me :) .

>
> I think it is not related to my race because pages can just remain
> in 3 states at fsync and mmap:
>
> 1) Dirty, Private
> 2) Not Dirty, Not Private
> 3) Dirty, Not Private (wrong condition)
>
> Did you get some more assert failed after this? If you umount UBIFS,
> ubifs_put_super will check the budget info, and I think you should
> hit some assertion there.

I did notice, at least once, assertion failure:
[ 4445.102863] UBIFS: un-mount UBI device 1, volume 0
[ 4445.106627] UBIFS assert failed in ubifs_put_super at 1775 (pid 10416)

But, this error happens only significantly later ~2 hours.

>
> Do you have a simply way to reproduce this assert failed?
>

At the moment I hit this randomly when stressing the system.
I use a stress test that run parallel IOzone and lmdd benchmark, each
100MB (out of ~217MB free)



Wouldn't then the assertion in the previous line fail?
I dove into the code, and I understood there probably isn't any real
connection between the to.
I do appreciate you took the time to answer me . :-)

Thanks,
Dolev
-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
