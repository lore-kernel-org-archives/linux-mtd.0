Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESd0z-0003cb-Fb
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 12:11:42 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IOO00CNV2BCY0F0@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 12:11:36 -0400 (EDT)
Date: Thu, 20 Oct 2005 12:11:36 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <F92C2EFE7C3BA745855BF7036E1F3F9A014CEB18@NNSMSX401>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0510201201400.5288@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F92C2EFE7C3BA745855BF7036E1F3F9A014CEB18@NNSMSX401>
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
Subject: RE: XIP & GCC optimization & halting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Oct 2005, Korolev, Alexey wrote:

> Nicolas,
> 
> Selecting of only one CFI buswidth and chip interleave helped for
> resolving this issue.
> cfi_cmdset001.o doesn't contain any reference to __udivsi3 __divsi3 and
> __ashrdi3 in data segment.
> 
> I made several tests no halts or kernel panics got appeared. 

Great!

> P/S 
> 1. I also tried to relocate some /arch/arm/lib code into RAM. It was
> very bad move because it caused kernel Data abort at the very beginning
> of kernel bootup process. Looks some code uses __divsi3 operations
> before memory got initialized.

Although I don't encourage it, that should have worked since enough of 
the kernel data should always be available even when memory is partially 
initialized.

> 2. I have a question about XIP and icache 
> 
> 	a. Execute kernel instructions from FLASH. Start filling of
>          icache pages by instructions from FLASH.
> 	b. Do_write_buffer call. Switching to READ_STATUS. 
> 	c. Finish filling of icache pages by instructions from FLASH.
>          (Part of icache is corrupted).

No, that can't happen since do_write_buffer() is marked __xipram and 
therefore lives in ram.  Also, the call to xip_enable() ensures that the 
instruction prefetch is recycled with xip_iprefetch() after the flash 
has been turned into data mode again.

> 	d. Return from Do_write_buffer 
> 	e. Execute instruction from FLASH which is presorted in icache.
> -> Data abort or kernel panic.

Should not happen (see above).


Nicolas
