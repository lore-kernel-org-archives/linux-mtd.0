Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xehx9-0000z4-W9
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 10:06:41 +0000
Message-ID: <543F9895.7010502@nod.at>
Date: Thu, 16 Oct 2014 12:06:13 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
References: <1412029248-22454-1-git-send-email-richard@nod.at>				
 <1412029248-22454-4-git-send-email-richard@nod.at>			
 <1412346676.3795.62.camel@sauron.fi.intel.com> <542EF3BF.1070401@nod.at>		
 <1413206263.7906.18.camel@sauron.fi.intel.com> <543BE21F.5020504@nod.at>	
 <1413213803.7906.45.camel@sauron.fi.intel.com> <543C3E60.4080507@nod.at>
 <1413282203.7906.72.camel@sauron.fi.intel.com>
In-Reply-To: <1413282203.7906.72.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 14.10.2014 um 12:23 schrieb Artem Bityutskiy:
> On Mon, 2014-10-13 at 23:04 +0200, Richard Weinberger wrote:
>> Am 13.10.2014 um 17:23 schrieb Artem Bityutskiy:
>>> Well, used and free are RB-trees, looking them up is slow.
>>
>> This is true but we'd have to look it up in multiple trees and the protection queue...
> 
> Right. 2 RB-trees, and one list. The list is empty most of the time, or
> contains one element. 

Actually it is the free, used and scrub tree plus the protection queue.
Then there is another place where PEBs can hide, the erase work queue.
This brings me to an issue I've recently identified and fixed in my local queue.

ubi_wl_put_peb() does the following:
                if (in_wl_tree(e, &ubi->used)) {
                        self_check_in_wl_tree(ubi, e, &ubi->used);
                        rb_erase(&e->u.rb, &ubi->used);
                } else if (in_wl_tree(e, &ubi->scrub)) {
                        self_check_in_wl_tree(ubi, e, &ubi->scrub);
                        rb_erase(&e->u.rb, &ubi->scrub);
                } else if (in_wl_tree(e, &ubi->erroneous)) {
                        self_check_in_wl_tree(ubi, e, &ubi->erroneous);
                        rb_erase(&e->u.rb, &ubi->erroneous);
                        ubi->erroneous_peb_count -= 1;
                        ubi_assert(ubi->erroneous_peb_count >= 0);
                        /* Erroneous PEBs should be tortured */
                        torture = 1;
                } else {
                        err = prot_queue_del(ubi, e->pnum);
                        if (err) {
                                ubi_err("PEB %d not found", pnum);
                                ubi_ro_mode(ubi);
                                spin_unlock(&ubi->wl_lock);
                                return err;
                        }
                }
        }
        spin_unlock(&ubi->wl_lock);

        err = schedule_erase(ubi, e, vol_id, lnum, torture);

If it happens that a fastmap write is needed between spin_unlock() and schedule_erase(), fastmap
will miss this PEB. Because it go already deleted from one of the RB trees or the protection queue but not
jet queued to the work list. Yes, I hit this bug in real world.

My solution is marking the ubi_wl_entry's ->state attribute with a flag like UBI_WLE_STATE_ERASE.
This way I was also able to get rid of the ubi_is_erase_work() wart.

> So we'd look-up 2 RB-trees most of the time. Very rarely we'd need to
> look at the list containing very few elements.
> 
> Not that bad, I think.
> 
>> ubi_update_fastmap() takes ubi->wl_lock anyway to block any changes in the free, used, etc. trees
>> to make sure that the to be taken state snapshot is consistent.
> 
> I think this is fine.
> 
>>> But there is a price - memory consumption. We do not want to pay it just
>>> for making the inter-subsystems boundaries better, there ought to be a
>>> better reason.
>>>
>>> Say, for an (imaginary) 8GiB NAND chip with 128KiB PEB size this would
>>> cost 256KiB of RAM.
>>
>> Is 128KiB PEB size still realistic on modern NANDs?
>> Even if, 256KiB are not much and the kernel consumes this additionally with
>> every new release.
> 
> Right, but the point is that bigger systems use eMMC and wouldn't bother
> with raw flash. Raw flash trending down the smaller systems, where a
> hundred of kilobytes matters.
> 
>> But I can understand your concerns.
> 
> Thanks, yes, my point is to be careful about the RAM we consume, and try
> to avoid growing this data structure, an only do it if we have to.

Currently I'm using an integer variable. But a char would also do it. I need only
a few flags.

What I'm trying to say is, state tracking would solve the "internal state accessing" problem in a clean and
sane way.

I gave the ubi_get_peb_state() idea a try. Unfortunately it won't work that well as expected.
The UBI Fastmap on-flash layout has a section which contains the state and EC counter of each PEB.
But the PEBs are not stored on flash starting with 0 to ubi->peb_count, they are stored by their state.
First free, then used, then scrub and finally to be erased PEBs. I've chosen this layout to avoid an
addition on-flash state attribute to keep the overall structure small.

So, writing a fastmap like:
for (i = 0; i < ubi->peb_count; i++)
  ubi_get_peb_state(i);

...won't work. I need to iterate first over the free RB tree, then over the used tree, and so on.
This way I'd have to allocate memory and store the state somewhere or iterate multiple times over the same RB trees.

What about this:
Let's create a file like fastmap-wl.c, it will contain all Fastmap functions which deal with internal
wl.c stuff. In wl.c we can add:
#ifdef CONFIG_MTD_UBI_FASTMAP
#include "fastmap-wl.c"
#endif

This way we can get rid of almost all #ifdefs in wl.c and don't have to export a lot of new fastmap specific helper functions in wl.c
to global scope.
Including a c file is common practice in Linux.
A prominent example is USB. See drivers/usb/host/ehci-hcd.c.

What do you think?

Thanks,
//richard
