Received: from zmamail05.zma.compaq.com ([161.114.64.105])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1870YX-0001gQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 21:39:17 +0000
Received: from tayexg12.americas.cpqcorp.net (tayexg12.americas.cpqcorp.net [16.103.130.103])
	by zmamail05.zma.compaq.com (Postfix) with ESMTP id 7715E3BA7
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 17:09:31 -0500 (EST)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: MTD Config.in items not escaped by bus availability
Date: Wed, 30 Oct 2002 17:09:26 -0500
Message-ID: <D99C1FB421989A40818B6370E318709403CD2D24@tayexc19.americas.cpqcorp.net>
From: "Hicks, Jamey" <Jamey.Hicks@hp.com>
To: "Brian J. Murrell" <8db422baa67bd7a698f50768bba0d47e@interlinx.bc.ca>,
	<linux-mtd@lists.infradead.org>
Cc: <joern@wohnheim.fh-wedel.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> -----Original Message-----
> From: Brian J. Murrell
> [mailto:8db422baa67bd7a698f50768bba0d47e@interlinx.bc.ca]
> Sent: Wednesday, October 30, 2002 3:50 PM
> To: linux-mtd@lists.infradead.org
> Cc: joern@wohnheim.fh-wedel.de; Hicks, Jamey
> Subject: Re: MTD Config.in items not escaped by bus availability
>=20

> So the MTD subsystem will build and run on a UML (i.e. it has no
> hardware properties such as IRQ's, DMA, etc. itself)?  Surely there
> must be some aspect of the MTD system which becomes dependent on
> addressing specific hardware devices though?

I think that MTD can be built and run on UML.  Try these configuration =
options:
  CONFIG_MTD=3Dy
  CONFIG_MTD_CHAR=3Dm
  CONFIG_MTD_BLOCK=3Dm
=20
You can use system memory provided by vmalloc() for a test MTD device by =
enabling CONFIG_MTD_MTDRAM:
  CONFIG_MTDRAM=3Dm

You can use a block device to provide a test MTD device with the blkmtd =
driver:
  CONFIG_MTD_BLKMTD=3Dm

Neither of these virtual MTD devices depends on IRQ's, DMA, or other =
hardware resources.

-Jamey
