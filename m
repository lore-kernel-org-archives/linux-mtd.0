Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLMvh-0007NW-RF
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 11:08:28 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWF007RCOTVJUH0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 11:08:19 -0500 (EST)
Date: Mon, 20 Mar 2006 11:08:19 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1142865089.c65a3380tomas2003@home.se>
To: Tomas E <tomas2003@home.se>
Message-id: <Pine.LNX.4.64.0603201102430.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1142865089.c65a3380tomas2003@home.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 20 Mar 2006, Tomas E wrote:

> Hi,
> 
> I have a problem with writing to a Intel Strata flash
> and then doing a warm reset.

How do you "warm reset" ?

> When I do a simple write echo "xxxx" > /MyFlash/test.text the flash 
> writes but remain in the state that only 0080 can be read when I 
> ioremap some address in the flash.
> 
> My problem is that the bootcode also exist in the flash so if the 
> watchdog resets the everything just hang.

How does the watchdog perform its reset?

> Is this a expected behavior or shouldn't a write put the flash in a 
> readable state (on a hardware level)?

Normally, the flash is put back into read mode with cfi_intelext_reset() 
through a reboot notifier handler, assuming of course that you're 
using a standard kernel interface to reboot your system.

> What should I do to debug this?

First you should tell us a bit more about your board reset.


Nicolas
