Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FMQiW-0007uf-1V
	for linux-mtd@lists.infradead.org; Thu, 23 Mar 2006 09:23:20 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWL00C4I3YMKP10@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 23 Mar 2006 09:23:11 -0500 (EST)
Date: Thu, 23 Mar 2006 09:23:10 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <44226CEB.70200@intel.com>
To: Alexander Belyakov <alexander.belyakov@intel.com>
Message-id: <Pine.LNX.4.64.0603230920030.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1143047296.29683.44.camel@sauron.oktetlabs.ru>
	<44226CEB.70200@intel.com>
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Mar 2006, Alexander Belyakov wrote:

> My question is: shall I post new reduced (mtdstripe core only) patch here
> leaving all the rest for future discussion?

You should split your patch into pieces: mtdstrip core in one patch, and 
driver modifications in their own separate patch for each of them.  But 
please post the whole serie.


Nicolas
