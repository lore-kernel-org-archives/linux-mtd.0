Received: from srv1.mail.cv.net ([167.206.112.40])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187U9q-0004ji-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2002 05:15:46 +0000
Received: from [192.168.2.103] (ool-4353287a.dyn.optonline.net [67.83.40.122])
 by srv1.mail.cv.net (Sun Internet Mail Server sims.4.0.2000.10.12.16.25.p8)
 with ESMTP id <0H4V00JGKUKEWP@srv1.mail.cv.net> for
 linux-mtd@lists.infradead.org; Fri,  1 Nov 2002 00:43:27 -0500 (EST)
Date: Fri, 01 Nov 2002 00:45:59 -0500 (EST)
From: Pavel Roskin <proski@gnu.org>
Subject: Re: Adding devices at runtime
In-reply-to: <20021101033007.GA3738@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Message-id: <Pine.LNX.4.44.0211010019590.1418-100000@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
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

Hello!

> > Right now I have to use the MTDRAM driver on the boot device, so the I
> > cannot rewrite it (I haven't tried, but I don't expect it to work).  I can
> > only rewrite the other chip.
> 
> Could you be a little more verbose on what your problem is? What kind
> of mtd devices do you have, what do you want to do with them, why
> register one of them at runtime,...

Sorry, I cannot be more verbose about the device.  I was saying "at
runtime" because I don't need the second chip for the boot process.  I
don't care if it's done at runtime or I hardcode the address into the
kernel.  However, I did check the Config.in and I know that the kernel
only takes parameters for one chip and one MTDRAM device.

> It is possible to register devices at runtime. But I don't know of any
> driver that gives you an interface to do so without insmod'ing it. A
> question of some 50 lines of code to add that functionality.

I have those lines (perhaps they are not very pretty), but I was wondering
if there is "the right way" to do it.  I gather from your that it's called
insmod.  That's fine.

I guess another solution would be writing a map for the device, just like
those little C files under drivers/mtd/maps/

Thank you for reply!

-- 
Regards,
Pavel Roskin
