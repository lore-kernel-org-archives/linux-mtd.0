Received: from krynn.se.axis.com ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Iwfb-0000xJ-5N
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 21:28:11 +0100
Date: Thu, 22 May 2003 22:31:38 +0200
From: jonas.holmberg@axis.com
To: John Burch <jburch@vincisystems.com>
Message-ID: <20030522203138.GA6695@vin.axis.se>
References: <3C6BEE8B5E1BAC42905A93F13004E8AB01CAF732@mailse01.axis.se>
	<000a01c31f9f$ceb90940$1200a8c0@JOHNB>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000a01c31f9f$ceb90940$1200a8c0@JOHNB>
Content-Type: text/plain; charset=iso-8859-1
cc: =?iso-8859-1?Q?'J=F6rn?= Engel' <joern@wohnheim.fh-wedel.de>
cc: 'David Woodhouse' <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: Mtd block access (jffs2 formatted) and mtd char
 access(unformatted) on different partitions of a single flashdevice
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Is this chip-feature "probable"? We used to do simutaneous 
> > erases in a bootloader, but after a while we started using 
> > chips that couldn't do that so we had to change the behaviour 
> > to be able to handle all sorts of chips. I'm not sure if CFI 
> > covers that particular feature, but it would be great if it 
> > did. It wouldn't be so great to have to check JEDEC IDs...
> > 
> 
> As far as I know, the feature is unique to AMD though I don't know if it
> is supported across their entire product line.  Also, it is not a CFI
> specific feature.  For example, it's discussed in the 29LV008B (not a
> CFI compliant device) data sheet under the "Sector Erase Command
> Sequence" section.

If it is AMD specific someone ought to do some performance tests
before working on a patch, because when we changed method
from simultaneous erase to erasing one block at a time it wasn't
slower (or at least not much slower iirc) erasing an entire 16Mbit
AMD device.

/Jonas (hoping that changing email-client will allow me to sneak
past Davids naughty header-checking filters).
