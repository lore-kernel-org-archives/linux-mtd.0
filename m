Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPNL6-0003kA-WF
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 12:23:41 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IX000IU55M2ZQ50@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 12:22:50 -0500 (EST)
Date: Fri, 31 Mar 2006 12:22:50 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <442D207D.9030903@yandex.ru>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-id: <Pine.LNX.4.64.0603311221070.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_I0zohEV1kMI1zCS+5yV5Eg)"
References: <20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
	<20060331122055.GK14713@wohnheim.fh-wedel.de>
	<442D207D.9030903@yandex.ru>
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

--Boundary_(ID_I0zohEV1kMI1zCS+5yV5Eg)
Content-type: TEXT/PLAIN; charset=ISO-8859-1
Content-transfer-encoding: 8BIT

On Fri, 31 Mar 2006, Artem B. Bityutskiy wrote:

> Jörn Engel wrote:
> > I believe the number of sane features is not very high.  Right now,
> > jffs2 is de-facto the only thing to worry about.  And last time I
> > checked (two weeks ago), there were not many different decisions based
> > on flash type.
> > 
> 
> Whatever is the de-facto user, I orient to common principles. One of them is
> modularization. JFFS2 and MTD are a distinc and separate thngs. And having
> anything JFFS2-specific in MTD is insane in my humble oppinion, sorry. And
> this does not depend on what is de-facto.

You are right here.  This is why MTD drivers should export _flash_ 
features rather than filesystem requirements.  And it is up to 
filesystem code to cope with the (lack of) certain flash features not 
the other way around.


Nicolas

--Boundary_(ID_I0zohEV1kMI1zCS+5yV5Eg)--
