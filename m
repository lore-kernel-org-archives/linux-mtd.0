Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLiuD-0003AQ-0j
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 10:36:54 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTPA id <0IWH00I50I0H8UG0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 10:36:19 -0500 (EST)
Date: Tue, 21 Mar 2006 10:36:17 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <44200736.5010102@ru.mvista.com>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-id: <Pine.LNX.4.64.0603211027500.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<44200736.5010102@ru.mvista.com>
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 Mar 2006, Vitaly Wool wrote:

> Alexander,
> 
> 1. Looks like it kills XIP.
> 2. It's pretty funny that you modify only Intel/Sharp command set
> implementation, as if the whole MTD exists only for you.

Don't forget it is presented as a RFC. So it won't be merged today for 
sure.

And I think it is honest from Intel to provide the core code and 
support for only one NOR flash type since this is most probably the only 
flash type they can test with, as long of course it doesn't break other 
users.  If other people are interested into adding support for 
additional flash types they are welcome to do so.


Nicolas
