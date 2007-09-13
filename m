Received: from mail.shareable.org ([81.29.64.88])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IVppy-00042R-LP
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 10:38:37 -0400
Date: Thu, 13 Sep 2007 15:38:19 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
Subject: Re: UBI : Atomic change LEB
Message-ID: <20070913143819.GE22250@mail.shareable.org>
References: <6b5362aa0709130102o5042412fgab0e0558edc895c0@mail.gmail.com>
	<1189682032.14370.117.camel@sauron>
	<6b5362aa0709130602g61e9b6f0xa762be770e95a32b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b5362aa0709130602g61e9b6f0xa762be770e95a32b@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brijesh Singh wrote:
> Thank you Artem.
> This seems like a good idea.This will certainly work
> .
> The only problem I see is
> * this will serialize  all the automic changes.If some device supports
> multiple writes in parrallel,we are locking it for no reason(We have
> reason but hope we can find another option).Also we won't need
> serialization when there are lots of spare blocks.
> 
> I can't see a better way right now.May be we should think over any
> possible twik to solve it.

Could you use a read-write lock, instead of a mutex?

Lock for "read" (meaning shared) when writing to the MTD device.  Lock
for "write" (meaning exclusive) when erasing.  Then all erases are
serialised, and writes can go in parallel.

Would that solve the locking problems?

If a device can support multiple erases in parallel as well, then
you'd want something more complicated.

-- Jamie
