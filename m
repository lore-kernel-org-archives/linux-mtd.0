Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQvbw-0007HM-Rt
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 09:51:49 +0000
Message-ID: <540D7C18.2060104@nod.at>
Date: Mon, 08 Sep 2014 11:51:20 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Ubi patch proposition for 3.10.y
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>	
 <5404EA4F.1040508@nod.at> <20140901220258.GA28791@kroah.com>	
 <5407914B.302@nod.at> <1410169630.10764.109.camel@sauron.fi.intel.com>
In-Reply-To: <1410169630.10764.109.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Greg KH <greg@kroah.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 jean-philippe francois <jp.francois@cynove.com>, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Am 08.09.2014 11:47, schrieb Artem Bityutskiy:
> On Thu, 2014-09-04 at 00:08 +0200, Richard Weinberger wrote:
>> e8c235b UBI: init_volumes: Ignore volumes with no LEBs
>> 44305eb UBI: fastmap: do not miss bit-flips
>> 604b592 UBI: fix rb_tree node comparison in add_map
>> 5547fec UBI: fix some use after free bugs
>> fe24c6e UBI: Fix memory leak in ubi_attach_fastmap() error path
>> c22301a UBI: fastmap: fix backward compatibility with image_seq
>> 4b3e0a2 UBI: Call scan_all() with correct offset in error case
>> f240dca UBI: Fix error path in scan_pool()
>> fb10e4d UBI: fix refill_wl_user_pool()
>> 8930fa5 UBI: Fix invalidate_fastmap()
> 
> The entire "fastmap" feature is classified as "experimental", why would
> we need to be submit these to stable? I mean, we do not treat the
> feature as bullet proof anyway yet.

but people want to test it.
And we can get Fastmap only stable by having users.
As you know embedded folks tend to use rather old kernels.
Let's give them a chance to use the most current version of Fastmap on these kernels.

Thanks,
//richard
