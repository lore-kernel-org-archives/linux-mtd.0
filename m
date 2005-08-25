Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8K3t-0005vM-0B
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 11:54:48 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0ILS00FMI9LE0450@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 10:58:26 -0400 (EDT)
Date: Thu, 25 Aug 2005 10:58:26 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1124978894.17190.40.camel@icampbell-debian>
To: Ian Campbell <icampbell@arcom.com>
Message-id: <Pine.LNX.4.63.0508251039400.15345@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1124978894.17190.40.camel@icampbell-debian>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problem with strataflash after suspend and resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 25 Aug 2005, Ian Campbell wrote:

> Hi,
> 
> I have a PXA255 (Xscale/ARM) platform with a strataflash part on it
> (28F128J3). With 2.6.11.11 (the only previous version I have convenient
> access to) I can suspend and resume repeatedly just fine, however with
> 2.6.13-rc7 I occasionally get something like this just after resume:
> 
>         Waiting for chip to be ready timed out. Status 0
>         Write of 68 bytes at 0x00b99f3c failed. returned -5, retlen 0
>         Not marking the space at 0x00b99f3c as dirty because the flash driver returned retlen zero
> 
> Any attempt to write a file results in a similar message.

This rings a bell...

> Once it has occurred it seems to happen every time unless I do an
> mtd-unlock. Doing an mtd-unlock on the device seems to fix it (most of
> the time) even though I don't think the device is locked (I didn't lock
> it and J3 parts don't reset locked). I've occasionally observed that
> just doing "dd if=/dev/mtd1 of=/dev/null bs=1 count=0" seems to work
> too. Other times it seems to sort itself out if left alone for a bit
> (but not consistently).

Yeah...  Anything that is likely to resynchronize the state machine with 
reality will do.

> The error originates in drivers/mtd/chips/cfi_cmdset_0001.c get_chip()
> which is returning EIO at line 659. The call is made via
> cfi_intelext_write_buffers() which calls do_write_buffer() which calls
> get_chip().
> 
> I've seen status 0 as well as 0xF018, 0xFF0A, 0x203A, 0x4946, 0x7465,
> 0x312e -- none of which appear to make much sense and I suspect they are
> just garbage.

They are probably just flash content.  0x203a is " :", 0x4946 is "IF", 
0x7465 is "te", 0x312e is "1." (or the other way around) and so on.

> The flash would appear to be readable, since resuming involves running
> the very early parts of the bootloader, which is stored in flash.

And that's the problem.  The flash is in data mode while the driver 
probably still thinks it is in status mode.

Make sure that cfi_intelext_suspend() gets called prior going to sleep 
and that cfi_intelext_resume() is called upon getting back from sleep 
mode.  If those calls don't take place you'll have inconsistent driver 
state, or worse inconsistent flash content.


Nicolas
