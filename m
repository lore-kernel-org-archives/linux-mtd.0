Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXgl5-0000MC-O8
 for linux-mtd@lists.infradead.org; Fri, 14 Dec 2018 06:15:37 +0000
Received: by mail-pl1-x641.google.com with SMTP id e5so2238343plb.5
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 22:15:25 -0800 (PST)
Subject: Re: ubifs: fix page_count in ->ubifs_migrate_page()
To: Dave Chinner <david@fromorbit.com>, Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com, hch@lst.de,
 linux-fsdevel@vger.kernel.org
References: <1544624037-3436-1-git-send-email-openzhangj@gmail.com>
 <5829763.q4qAXljTxb@blindfold> <20181213225736.GF29416@dastard>
From: zhangjun <openzhangj@gmail.com>
Message-ID: <e477c69a-082b-586b-a45a-50dee2b530ca@gmail.com>
Date: Fri, 14 Dec 2018 14:15:18 +0800
MIME-Version: 1.0
In-Reply-To: <20181213225736.GF29416@dastard>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018/12/14 上午6:57, Dave Chinner wrote:
> On Thu, Dec 13, 2018 at 03:23:37PM +0100, Richard Weinberger wrote:
>> Hello zhangjun,
>>
>> thanks a lot for bringing this up!
>>
>> Am Mittwoch, 12. Dezember 2018, 15:13:57 CET schrieb zhangjun:
>>> Because the PagePrivate() in UBIFS is different meanings,
>>> alloc_cma() will fail when one dirty page cache located in
>>> the type of MIGRATE_CMA
>>>
>>> If not adjust the 'extra_count' for dirty page,
>>> ubifs_migrate_page() -> migrate_page_move_mapping() will
>>> always return -EAGAIN for:
>>> 	expected_count += page_has_private(page)
>>> This causes the migration to fail until the page cache is cleaned
>>>
>>> In general, PagePrivate() indicates that buff_head is already bound
>>> to this page, and at the same time page_count() will also increase.
>
> That's an invalid assumption.
>
> We should not be trying to infer what PagePrivate() means in code
> that has no business using looking at it i.e. page->private is private
> information for the owner of the page, and it's life cycle and
> intent are unknown to anyone other than the page owner.
>
> e.g. on XFS, a page cache page's page->private /might/ contain a
> struct iomap_page, or it might be NULL. Assigning a struct
> iomap_page to the page does not change the reference count on the
> page.  IOWs, the page needs to be handled exactly the same
> way by external code regardless of whether there is somethign
> attached to page->private or not.
>
> Hence it looks to me like the migration code is making invalid
> assumptions about PagePrivate inferring reference counts and so the
> migration code needs to be fixed. Requiring filesystems to work
> around invalid assumptions in the migration code is a sure recipe
> for problems with random filesystems using page->private for their
> own internal purposes....
>
> Cheers,
>
> Dave.
I agree with your main point of view, but for the buffer_head based file 
system this assumption is no problem,
and the parameters and comments from the migrate_page_move_mapping() 
function:
   * 3 for pages with a mapping and PagePrivate/PagePrivate2 set.
This assumption has been explained.
Or to accurately say that the migrate system does not currently have a 
generic function for this case.
Since you call the function implemented for buffer_head, you should 
follow its rules.
