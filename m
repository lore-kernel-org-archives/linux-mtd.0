Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdzGc-0007HE-Op
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 10:23:47 +0000
Message-ID: <1413282203.7906.72.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Tue, 14 Oct 2014 13:23:23 +0300
In-Reply-To: <543C3E60.4080507@nod.at>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-4-git-send-email-richard@nod.at>
 <1412346676.3795.62.camel@sauron.fi.intel.com> <542EF3BF.1070401@nod.at>
 <1413206263.7906.18.camel@sauron.fi.intel.com> <543BE21F.5020504@nod.at>
 <1413213803.7906.45.camel@sauron.fi.intel.com> <543C3E60.4080507@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-10-13 at 23:04 +0200, Richard Weinberger wrote:
> Am 13.10.2014 um 17:23 schrieb Artem Bityutskiy:
> > Well, used and free are RB-trees, looking them up is slow.
> 
> This is true but we'd have to look it up in multiple trees and the protection queue...

Right. 2 RB-trees, and one list. The list is empty most of the time, or
contains one element. 

So we'd look-up 2 RB-trees most of the time. Very rarely we'd need to
look at the list containing very few elements.

Not that bad, I think.

> ubi_update_fastmap() takes ubi->wl_lock anyway to block any changes in the free, used, etc. trees
> to make sure that the to be taken state snapshot is consistent.

I think this is fine.

> > But there is a price - memory consumption. We do not want to pay it just
> > for making the inter-subsystems boundaries better, there ought to be a
> > better reason.
> > 
> > Say, for an (imaginary) 8GiB NAND chip with 128KiB PEB size this would
> > cost 256KiB of RAM.
> 
> Is 128KiB PEB size still realistic on modern NANDs?
> Even if, 256KiB are not much and the kernel consumes this additionally with
> every new release.

Right, but the point is that bigger systems use eMMC and wouldn't bother
with raw flash. Raw flash trending down the smaller systems, where a
hundred of kilobytes matters.

> But I can understand your concerns.

Thanks, yes, my point is to be careful about the RAM we consume, and try
to avoid growing this data structure, an only do it if we have to.

> Okay, I'll try harder to make you happy.

Well, making me happy is not the point of course :-)

Thanks!

--
Artem
