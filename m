Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPIjI-0006tB-2x
 for linux-mtd@lists.infradead.org; Wed, 03 Sep 2014 22:08:41 +0000
Message-ID: <5407914B.302@nod.at>
Date: Thu, 04 Sep 2014 00:08:11 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Greg KH <greg@kroah.com>
Subject: Re: Ubi patch proposition for 3.10.y
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
 <5404EA4F.1040508@nod.at> <20140901220258.GA28791@kroah.com>
In-Reply-To: <20140901220258.GA28791@kroah.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 jean-philippe francois <jp.francois@cynove.com>, stable@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.09.2014 00:02, schrieb Greg KH:
> On Mon, Sep 01, 2014 at 11:51:11PM +0200, Richard Weinberger wrote:
>> Am 29.08.2014 14:26, schrieb jean-philippe francois:
>>> I think commit 4b3e0a25... [1] (UBI: Call scan_all() with correct
>>> offset in error case) should be added to 3.10.y stable branch.
>>>
>>> It solves an ubifs corruption problem on my board. Edited bootlog for
>>> each case are attached.
>>>
>>> ubifs corruption can be easily reproduced on this board :
>>> 1) format nand partition and flash rootfs
>>> 2) record h264 stream on nand
>>> 3) scp a file from host pc to rootfs while 2 is ongoing
>>> 4) unplug power
>>
>> Hmm, I think this is a good point to bite the bullet and backport all
>> UBI fastmap related fixes to -stable.

Actually I meant, I need to sit down and go through the changelog and locate
them all. :)

> And what exactly would those commits be?

There you go:

e8c235b UBI: init_volumes: Ignore volumes with no LEBs
44305eb UBI: fastmap: do not miss bit-flips
604b592 UBI: fix rb_tree node comparison in add_map
5547fec UBI: fix some use after free bugs
fe24c6e UBI: Fix memory leak in ubi_attach_fastmap() error path
c22301a UBI: fastmap: fix backward compatibility with image_seq
4b3e0a2 UBI: Call scan_all() with correct offset in error case
f240dca UBI: Fix error path in scan_pool()
fb10e4d UBI: fix refill_wl_user_pool()
8930fa5 UBI: Fix invalidate_fastmap()

Thanks,
//richard
