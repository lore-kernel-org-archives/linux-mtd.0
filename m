Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPMot-0002ca-HJ
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 11:49:57 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IX0009B3435SP90@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 11:49:54 -0500 (EST)
Date: Fri, 31 Mar 2006 11:49:53 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <442CE217.8080103@yandex.ru>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-id: <Pine.LNX.4.64.0603311143460.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
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

> Alexander Belyakov wrote:
> > > Well, probably this is a perversion and is not needed in reality, but
> > > still. I conceive it like this. Yo have 2 flashes. You as usually,
> > > calculate the resulting eraseblock size. You see at the minimal I/O unit
> > > size of both flashes and similarly calculate the resulting minimal I/O
> > > size. So that's it. You'll end up with a though perverted, but still a
> > > striped MTD device.
> > 
> > First problem in case of striping NOR and NAND is a question about type of
> > striped device. Should we report it as NOR or as NAND. I believe it is
> > important for clients to know about that. Imagine, for example, device
> > reported as NAND behaves as NOR or vice versa. Another problem is a
> > difference in operation speed. Apparently you won't get any performance
> > gain. These are only top of iceberg. Note that even plain and simple
> > mtdconcat is not supposed to work with flashes of different types.
> 
> Good question. I think you could report this is a striped device (introducing
> an MTD_STRIPED option). Also you may provide a stripe_get_info(struct mtd_info
> *mtd) function which will return a struct stripe_info object describing this
> striped device, including the components it consists of.

But... before going that far, is this something that really makes sense 
in practice?

IMHO striping NOR and NAND together simply makes no sense.  NOR and NAND 
are fundamentally different things when it comes to writing to them, and 
apart from evaluation boards where every possible peripheral can be 
found you rarely will find both NOR and NAND in the same real life 
design.

So why bother?


Nicolas
