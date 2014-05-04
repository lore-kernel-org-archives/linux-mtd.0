Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wgq5F-0008Ia-V5
 for linux-mtd@lists.infradead.org; Sun, 04 May 2014 06:39:34 +0000
Message-ID: <5365E06B.8080300@huawei.com>
Date: Sun, 4 May 2014 14:38:35 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Dolev Raviv <draviv@codeaurora.org>
Subject: Re: [PATCH v2] UBIFS: Fix assert failed in ubifs_set_page_dirty
References: <535B7B96.9030008@huawei.com> <536092CE.2090209@huawei.com>
 <20140430121846.GI1821@guralp.com>
 <3921496816192fe04ed3cdbb562fc6d8.squirrel@www.codeaurora.org>
In-Reply-To: <3921496816192fe04ed3cdbb562fc6d8.squirrel@www.codeaurora.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Dolev

On 2014/4/30 21:48, Dolev Raviv wrote:
> Hi Hujianyang and Laurence,
> I'm hitting an assertion in very similar code during the callback
> ubifs_releasepage(). I'm quite new to this code area, and currently diving
> in to understanding the race you described (before I attempt to look at
> the patch).
> 
> I was wondering if this assertion is related?
> 
> [  862.695278] UBIFS assert failed in ubifs_releasepage at 1434 (pid 11088)

What's your kernel version? Because in v3.15 and v3.10, line 1434
present different assertion.

I think you probably hit:

"ubifs_assert(0)"

static int ubifs_releasepage(struct page *page, gfp_t unused_gfp_flags)
{
        /*
         * An attempt to release a dirty page without budgeting for it - should
         * not happen.
         */
        if (PageWriteback(page))
                return 0;
        ubifs_assert(PagePrivate(page));
        ubifs_assert(0);                          <- v3.10 line 1434
        ClearPagePrivate(page);
        ClearPageChecked(page);
        return 1;
}


Page_Private bit seems to indicate page is budgeted in UBIFS. Dropping
caches performs with page lock and just deals with pages which are not
dirty. Then, if page_private bit is set, vfs performs ->releasepage at
try_to_release_page.

Maybe some explanation of this assert failed is that there is a private
(budgeted) but not dirty page in your page caches.

I think it is not related to my race because pages can just remain
in 3 states at fsync and mmap:

1) Dirty, Private
2) Not Dirty, Not Private
3) Dirty, Not Private (wrong condition)

Did you get some more assert failed after this? If you umount UBIFS,
ubifs_put_super will check the budget info, and I think you should
hit some assertion there.

Do you have a simply way to reproduce this assert failed?


Hu
