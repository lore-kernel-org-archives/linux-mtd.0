Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXMlR-0000sK-Go
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 07:17:53 +0000
Received: by mail-oi0-x242.google.com with SMTP id r74so1384202oie.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2017 00:17:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7e0d37e6-c3de-5c17-72e1-f6003e5d7d4a@alliedtelesis.co.nz>
References: <149914202384.24318.7331828698981799313.stgit@kyeongy-dl.atlnz.lc>
 <7e0d37e6-c3de-5c17-72e1-f6003e5d7d4a@alliedtelesis.co.nz>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 18 Jul 2017 09:17:26 +0200
Message-ID: <CAFLxGvwAJ+xfN=1QGfe_6mNksmMr6cTjSSRKPqYGKMi-1zvU2Q@mail.gmail.com>
Subject: Re: [PATCH] jffs2: GC deadlock reading a page that is used in
 jffs2_write_begin()
To: Kyeong Yoo <Kyeong.Yoo@alliedtelesis.co.nz>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyeong Yoo,

On Mon, Jul 17, 2017 at 11:54 PM, Kyeong Yoo
<Kyeong.Yoo@alliedtelesis.co.nz> wrote:
> Hi,
>
> Can someone review this and give me any feedback?
>
> This patch is to prevent deadlock in jffs2 GC.
>
> Thanks,
> Kyeong
>
>
> On 04/07/17 16:22, Kyeong Yoo wrote:
>> GC task can deadlock in read_cache_page() because it may attempt
>> to release a page that is actually allocated by another task in
>> jffs2_write_begin().
>> The reason is that in jffs2_write_begin() there is a small window
>> a cache page is allocated for use but not set Uptodate yet.
>>
>> This ends up with a deadlock between two tasks:
>> 1) A task (e.g. file copy)
>>     - jffs2_write_begin() locks a cache page
>>     - jffs2_write_end() tries to lock "alloc_sem" from
>>        jffs2_reserve_space() <-- STUCK
>> 2) GC task (jffs2_gcd_mtd3)
>>     - jffs2_garbage_collect_pass() locks "alloc_sem"
>>     - try to lock the same cache page in read_cache_page() <-- STUCK

Your description does not match the code. Are you seeing this on a
recent mainline kernel?
Can t be that your kernel does not has this commit?
commit 157078f64b8a9cd7011b6b900b2f2498df850748
Author: Thomas Betker <thomas.betker@rohde-schwarz.com>
Date:   Tue Nov 10 22:18:15 2015 +0100

    Revert "jffs2: Fix lock acquisition order bug in jffs2_write_begin"

    This reverts commit 5ffd3412ae55
    ("jffs2: Fix lock acquisition order bug in jffs2_write_begin").


-- 
Thanks,
//richard
