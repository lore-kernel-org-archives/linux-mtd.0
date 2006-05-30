Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FlA1z-00069v-RX
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 15:37:39 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J0300KRXFUI8KD0@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 30 May 2006 15:37:31 -0400 (EDT)
Date: Tue, 30 May 2006 15:37:30 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <447C5226.5030800@rosetechnology.dk>
To: Henrik Bork Steffensen <hbs@rosetechnology.dk>
Message-id: <Pine.LNX.4.64.0605301511150.16927@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <447C5226.5030800@rosetechnology.dk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Unlocked flash is re-locked by unknow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 May 2006, Henrik Bork Steffensen wrote:

> Hi,
> We have this custom arm based board were we ran Linux 2.4 for 3 years,
> now we are moving to 2.6 and has problems with our NOR Flash.
> 
> After boot the flash is locked which is normal for this chip.
> Then we run flash_unlock and mounts the jffs2 fs.
> At this point we can create /remove files.
> But after a some time (or some actions) we get write errors.
> If we re-run flash_unlock, everything works fine again for
> some time (or some actions), then it locks again....
> 
> We have tried to figure out which action lock's the device without
> success...

A spike on the flash power maybe?

> This is not a HW problem since booting 2.4 makes it work again.

Note that some newer flash parts have a pin that "force-locks" the flash 
when asserted.  Maybe you have one of those and the pin is floating?  
And to sum it all the 2.6 kernel somehow has a different EMI picture 
than the 2.4 and it causes the flash to lock itself that way?  

Or maybe just modifying the kernel version number from 2.6 to 2.4 in the 
source and recompiling will fix it?  ;-)

> Please provide any hint, a simple link to will be fine.

Are you sure your 2.4.x code is not automatically unlocking the flash by 
any chance which might just be masking the problem?


Nicolas
