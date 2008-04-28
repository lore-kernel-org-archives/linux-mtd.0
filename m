Received: from smtp.innovsys.com ([66.115.232.196] helo=mail.innovsys.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JqWBG-00020D-11
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 16:26:18 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 1/2] [MTD] Add support for RAM & ROMmappings in the
	physmap_of MTD driver.
Date: Mon, 28 Apr 2008 11:26:15 -0500
Message-ID: <DCEAAC0833DD314AB0B58112AD99B93B04512785@ismail.innsys.innovsys.com>
In-Reply-To: <200804251353.13698.laurentp@cse-semaphore.com>
References: <200803261344.03438.laurentp@cse-semaphore.com><1208895496.9212.671.camel@pmac.infradead.org><480F19B9.1070403@ru.mvista.com>
	<200804251353.13698.laurentp@cse-semaphore.com>
From: "Rune Torgersen" <runet@innovsys.com>
To: "Laurent Pinchart" <laurentp@cse-semaphore.com>,
	"Sergei Shtylyov" <sshtylyov@ru.mvista.com>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Laurent Pinchart wrote:
> Last thing I heard was that the device tree should not encode
> a device's
> expected usage, so memory nodes should not have any
> compatible property that
> would automatically associated them to an MTD driver. I've
> been adviced to
> add platform-specific code to instantiate a platform device manually
> (possibly checking if the required memory node is present in
> the device
> tree). This arguably makes sense, but adds more
> platform-specific code.

So... What good it the device tree at all then, if intended usage should
not be encoded in there.
Most other devices has an intended usage encoded.

Examples would be the FCC's on a Freescale PQ2 chip, where they are
encoded as ethernet controllers. (Thsy could be used as high-speed HDLC
controllers, ATM controllers and other usages), the SCC ports (as
serial, they can be used for syncronous serial and HDLC)

That would also mean if usage would change, the kernel image (and
possiby u-boot) whould have to change, instead of just fixing the device
tree. Argh....
