Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPN4s-0003Jl-VA
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 12:06:44 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IX0009HO4UQ5ZC0@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 12:06:26 -0500 (EST)
Date: Fri, 31 Mar 2006 12:06:26 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20060331100709.GD14713@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <Pine.LNX.4.64.0603311205440.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_0nkU4jPe77YYwdtUvTfaPQ)"
References: <442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com>
	<442CE217.8080103@yandex.ru> <442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_0nkU4jPe77YYwdtUvTfaPQ)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Fri, 31 Mar 2006, Jörn Engel wrote:

> On Fri, 31 March 2006 14:00:09 +0400, Artem B. Bityutskiy wrote:
> > On Fri, 2006-03-31 at 11:40 +0200, Jörn Engel wrote:
> > > On Fri, 31 March 2006 13:36:43 +0400, Artem B. Bityutskiy wrote:
> > > > 
> > > > No, mtd->type has to tell you the type of the MTD device. Ideally, this 
> > > > has to me the only flash-specific field in the mtd_info structure. And 
> > > > if users want to do some flash specific things, they have to look at 
> > > > mtd->type, realize what is the subsystem which handles this flash, and 
> > > > start working with this subsystem. For striping, this is the striping 
> > > > subsystem. I don't know what for mtd->flags, probably this hast to go at 
> > > > all.
> > > 
> > > Is this exported to userspace via mtdchar?
> > > 
> > I don't quite understand what is "this".
> > 
> > Ideally yes...
> 
> I take it that mtd->type is not exported to userspace yet.  Which is
> good, because imho it shouldn't be.  Flash should me a step towards a
> standard interface, something that hard disk have had for years.
> Knowing every little detail about every single flash chip bears more
> harm than good.

And for the record I'm completely with you here.


Nicolas

--Boundary_(ID_0nkU4jPe77YYwdtUvTfaPQ)--
