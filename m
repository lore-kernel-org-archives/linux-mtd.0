Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC1eH-0000NF-4s
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 07:16:37 +0000
Message-ID: <1406618172.23376.78.camel@sauron.fi.intel.com>
Subject: Re: Using UBIFS as an FTL
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
To: Daniel Ehrenberg <dehrenberg@google.com>
Date: Tue, 29 Jul 2014 10:16:12 +0300
In-Reply-To: <CAAK6Zt0NHgyiRCGxpdbFgJ49P2bd8nKhqm13uP8pzHCFmjNgJQ@mail.gmail.com>
References: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
 <1406566449.23376.61.camel@sauron.fi.intel.com>
 <CAAK6Zt0NHgyiRCGxpdbFgJ49P2bd8nKhqm13uP8pzHCFmjNgJQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-07-28 at 10:47 -0700, Daniel Ehrenberg wrote:
> My understanding of ubiblock is that, when you do 4k writes scattered
> around the device, they will magnify into block-sized
> read-modify-writes. This causes ~64x as much wear (depending on the
> device type) and goes at 1/64th the speed.

Yes, I think so.

>  I don't think I could
> change ubiblock to not have this property because that wouldn't be
> backwards-compatible--I'd need an extra layer of indirection to
> separate logical pages from logical erase blocks.

Say, ext4 can mount ancient ext3 images, and it supports many media
formats, etc. Some thing like this could in theory be done with
ubiblock. But this is not necessarily the _best_ way to go.

>  Isn't ubiblock
> usable for, say, copying off or on a ubifs filesystem image?

To copy the UBIFS image you can just read from the underlying UBI device
(/dev/ubiX_Y).

>  I
> wouldn't want to remove that functionality (and maybe I'll end up
> using it). It just seems like ubiblock and a real FTL need totally
> different pieces of software.

There are many aspects in FTL - how it scales WRT mount time, memory
consumption, etc. If someone decides to tackle only one small aspect at
a time, may be it makes sense to keep adding relatively small
improvements to ubiblock, maintain backward compatibility, several
on-the-media formats, etc. Keep adding features and keep doing
improvements.

But if a couple of smart folks decide to spend a year and create
something several orders of magnitude more superior, it is probably more
feasible to just implement a separate driver, say ubiftl or whatever.

If you ask me, I'd say it is largely up to the people doing the actual
work. Although talking to the community is a good idea in any case :-)

Thanks!

-- 
Best Regards,
Artem Bityutskiy
