Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Zb8p-0004OB-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2002 17:18:23 +0000
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Flash left in a write mode
Date: Sat, 9 Feb 2002 09:28:22 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFOEBLDEAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.44.0202091114160.2394-100000@lapdancer.baythorne.internal>
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

> Define 'rebooted'? Hitting the reset button if you have one should reset
> the flash (although sometimes it doesn't - bogus f***wit points
> to whoever
> designed the Assabet for that one)
>
> If you're implementing machine_restart() for your platform, then
> it should
> be ensuring that the hardware is in a state sufficiently close to the
> power-up state, for the benefit of the bootloader. That means turning off
> the MMU and jumping to the startup vector, at the very least. Often it
> means resetting bus controllers where we've moved around the physical
> memory map too - it could be argued that this preparation should include
> resetting the flash too.

This is a normal reboot operation. Calling machine_restart() and jumping
into the boot ROM. I don't believe that this is the proper place to reset
the flash or any other optional feature of a system. All cleanup operations
for optional components should be localized to that components
implementation.

> I'll consider if it a clean patch is presented - but I'm not going to go
> out of my way to fix it myself - I don't consider it particularly broken.

I will work on a fix that is implemented with the rest of the driver code.
As for being broken, it is.... I don't have to patch my hard driver code to
get the system to reboot reliably. My guess is that may of the users of
these libraries are embedded systems programmers, who do not have hard
drives and are using the flash as their root file system. If your primary
boot device does not work reliably, it is broken.
