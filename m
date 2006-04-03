Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQPLt-0005HM-FW
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 09:44:24 -0400
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IX500LOKFHRPCC0@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 09:44:15 -0400 (EDT)
Date: Mon, 03 Apr 2006 09:44:15 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <44309F34.8010301@ru.mvista.com>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-id: <Pine.LNX.4.64.0604030943200.2550@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<Pine.LNX.4.64.0603311143460.14923@localhost.localdomain>
	<44309F34.8010301@ru.mvista.com>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Alexander Belyakov <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 3 Apr 2006, Vitaly Wool wrote:

> Nicolas Pitre wrote:
> > IMHO striping NOR and NAND together simply makes no sense.  NOR and NAND are
> > fundamentally different things when it comes to writing to them, and apart
> > from evaluation boards where every possible peripheral can be found you
> > rarely will find both NOR and NAND in the same real life design.
> >   
> Oh really? What about MP3 player-oriented design with NAND flash as a main
> storage and NOR flash for kernel/userspace XIP etc?

You just demonstrated above why you'd never stripe those.  ;-)


Nicolas
