Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FP04H-0005Hc-8Q
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 11:32:20 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWY0028W8LRDPE0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 11:32:16 -0500 (EST)
Date: Thu, 30 Mar 2006 11:32:15 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1143714902.3579.31.camel@sauron.oktetlabs.ru>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-id: <Pine.LNX.4.64.0603301119220.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<1143714902.3579.31.camel@sauron.oktetlabs.ru>
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Mar 2006, Artem B. Bityutskiy wrote:

> Working with flashes, it is very handy to use a notion of the minimal
> flash Input/Output unit size. For NOR flashes it is 1 byte (or even 1
> bit, but better to think about it as 1 byte). For NAND flashes, this is
> one NAND page in current MTD. For ECC-NOR flashes, this is something
> like 16 bytes, for data flashes this is another and so on.

While NOR flash can indeed write one byte (or even one bit) at a time, 
it is not really useful, not in the context of stripe at least.  The NOR 
write buffer size is a much more useful metric.

So while the minimum write size is of course a required parameter (that 
would clean up many *_init functions in jffs2/wbuf.c), it is also 
necessary to consider the "optimal" write size, being the write buffer 
size in the case of NOR flash.  Larger writes can be performed as long 
as they are multiples of the minimum write size.

Read size is obviously irrelevant as any size can be accommodated by the 
driver.


Nicolas
