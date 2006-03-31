Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPNHy-0003gY-NJ
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 12:20:08 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IX000I6H5H8ZO50@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 12:19:56 -0500 (EST)
Date: Fri, 31 Mar 2006 12:19:56 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1143807072.3579.105.camel@sauron.oktetlabs.ru>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-id: <Pine.LNX.4.64.0603311215180.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_xxr+0IfT8uG2zmhsAtOHoQ)"
References: <442CE217.8080103@yandex.ru> <442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
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

--Boundary_(ID_xxr+0IfT8uG2zmhsAtOHoQ)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Fri, 31 Mar 2006, Artem B. Bityutskiy wrote:

> On Fri, 2006-03-31 at 13:59 +0200, Jörn Engel wrote:
> > Whether the flash can mark things obsolete is a flash feature.  At
> > least this is based on a flash feature.  So maybe we should rename it
> > to MTD_CAN_FLIP_SINGLE_BITS or similar and then have
> 
> This is better then "can mark obsolete". At lease this does not depend
> on application. But I still think that the number of features like is
> unpredictable and large.

No.  The flash type is more unpredictable than the number of feature 
which is what flash types are made of anyway.  If you create a new flash 
type, it is more likely to be a different combination of existing 
features. And if the number of features grows, then it is very likely 
that you'll have to add code in JFFS2 to cope with it anyway.

So in the end the flash type is redundent and purely informational.


Nicolas

--Boundary_(ID_xxr+0IfT8uG2zmhsAtOHoQ)--
