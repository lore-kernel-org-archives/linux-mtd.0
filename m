Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPMy4-0002zd-De
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 11:59:33 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IX000M1C4IZFZ90@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 11:59:23 -0500 (EST)
Date: Fri, 31 Mar 2006 11:59:23 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1143795335.3579.63.camel@sauron.oktetlabs.ru>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-id: <Pine.LNX.4.64.0603311152310.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com>
	<442CE217.8080103@yandex.ru> <442CE2DC.7020505@yandex.ru>
	<442CE5AB.8030903@intel.com>
	<1143795335.3579.63.camel@sauron.oktetlabs.ru>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 31 Mar 2006, Artem B. Bityutskiy wrote:

> On Fri, 2006-03-31 at 12:17 +0400, Alexander Belyakov wrote:
> > In that case clients should be aware of using striped devices and 
> > provide special support for them. The one of the ideas of the suggested 
> > solution is to hide striping internals from the client providing generic 
> > mtd device (just with somewhat increased performance).
> 
> I think you are one more guy who hit on the not generic enough
> interface.
> 
> Indeed, on the one hand, you want to inform the type of flash used. If
> this is NAND, people have to use NAND-specific stuff like
> mtd->write_ecc. If this is NOR, they have to use NOR-related stuff like
> mtd->write, mtd->point and so on.
> 
> On the other hand, you still want to inform users that this is a striped
> MTD device. They may want to know this.
> 
> And the best thing you can do is not to adopt yourself to far too old
> MTD interface, which is like this for historical reasons, but to make a
> revolution in the MTD interface itself.
> 
> By revolution I mean:
> 
> 1. To invent a common generic flash model.
> 2. To make MTD interface generic.
> 3. To fix existing users. Well, I would say fixing JFFS2 may be enough.
> 
> This is a big piece of work, but it is what I consider a professional
> approach.

I'm sorry but I must disagree with your assertion above.

Yes the MTD interface might need a big revamp... but why would that be 
related to stripe at all?

Why would a striped MTD device be different from, say, a partitioned MTD 
device?

Part of having a professional approach is _not_ to mix everything up 
together.  And to that effect I don't see anything at the interface 
level even in its current form that would prevent an MTD stripe module 
from playing nicely with the rest of the users, just like mtd partitions 
or mtdconcat.


Nicolas
