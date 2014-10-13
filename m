Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xdmnb-0008Os-Ql
 for linux-mtd@lists.infradead.org; Mon, 13 Oct 2014 21:05:00 +0000
Message-ID: <543C3E60.4080507@nod.at>
Date: Mon, 13 Oct 2014 23:04:32 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
References: <1412029248-22454-1-git-send-email-richard@nod.at>			
 <1412029248-22454-4-git-send-email-richard@nod.at>		
 <1412346676.3795.62.camel@sauron.fi.intel.com> <542EF3BF.1070401@nod.at>	
 <1413206263.7906.18.camel@sauron.fi.intel.com> <543BE21F.5020504@nod.at>
 <1413213803.7906.45.camel@sauron.fi.intel.com>
In-Reply-To: <1413213803.7906.45.camel@sauron.fi.intel.com>
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

Am 13.10.2014 um 17:23 schrieb Artem Bityutskiy:
> Well, used and free are RB-trees, looking them up is slow.

This is true but we'd have to look it up in multiple trees and the protection queue...

> If what you need is to go through all used and free PEBs, then you can
> introduce some kind of
> 
> struct ubi_wl_entry *ubi_wl_get_next_used(struct ubi_wl_entry *prev)
> 
> function, and similar functions for the free.
> 
> I would return you the next entry (or NULL would indicate the end), and
> it would take the previous entry as the input, or NULL for the first
> call.
> 
> We'd need to take the locks before calling this function. This is
> cleaner than what we do now, right?

ubi_update_fastmap() takes ubi->wl_lock anyway to block any changes in the free, used, etc. trees
to make sure that the to be taken state snapshot is consistent.

>> But we could add the state information to struct ubi_wl_entry by adding a single integer attribute called "state" or "flags".
> 
> But there is a price - memory consumption. We do not want to pay it just
> for making the inter-subsystems boundaries better, there ought to be a
> better reason.
> 
> Say, for an (imaginary) 8GiB NAND chip with 128KiB PEB size this would
> cost 256KiB of RAM.

Is 128KiB PEB size still realistic on modern NANDs?
Even if, 256KiB are not much and the kernel consumes this additionally with
every new release.
But I can understand your concerns.

> Squeezing the state into the last 2 bits a memory reference would be
> another possibility, BTW. Not elegant, though...
> 
>> Would this make you happy? :)
> 
> Not very, I'd save this for the last resort solution.

Okay, I'll try harder to make you happy.

Thanks,
//richard
