Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ERbvB-0002r8-9Y
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2005 16:49:29 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IOI006WAV67HCE0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 17 Oct 2005 16:49:19 -0400 (EDT)
Date: Mon, 17 Oct 2005 16:49:19 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <F92C2EFE7C3BA745855BF7036E1F3F9A01495FB0@NNSMSX401>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0510171635110.5288@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01495FB0@NNSMSX401>
Cc: linux-mtd@lists.infradead.org
Subject: Re: XIP & GCC optimization & halting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 17 Oct 2005, Korolev, Alexey wrote:

> Hi all,
> 
> I faced several issues with XIP on kernel 2.6.11.
> I used Mainstone board and NOR flash with the only partition (non RWW
> device).
> First found issue of XIP was concerned with GCC optimization.
> The function Do_write_buffer was inlined into upper function and as a
> result loose __xipram attribute in case of default -Os compile option.
> I reduced compile option to -O1 and it helped.

Please apply this patch to your tree:

diff --git a/include/linux/mtd/xip.h b/include/linux/mtd/xip.h
index 7b7deef..46ddb14 100644
--- a/include/linux/mtd/xip.h
+++ b/include/linux/mtd/xip.h
@@ -27,7 +27,7 @@
  * obviously not be running from flash.  The __xipram is therefore marking
  * those functions so they get relocated to ram.
  */
-#define __xipram __attribute__ ((__section__ (".data")))
+#define __xipram noinline __attribute__ ((__section__ (".data")))
 
 /*
  * We really don't want gcc to guess anything.

> After resolving this issue I found another one halting. 
> The system halts with rather big probability on write and erase
> operations (good way to reproduce it download file (of size ~1M) via
> tftp on JFFS2 volume).
> I used BDI debugger to investigate the issue and found that after
> halting flash device was in READ_STATUS mode and write operation is not
> complete. PC reg points to stuff in virtual memory region mapped to
> FLASH.
> I disabled for just a case FIQs, but it didn't help.

The default FIQ exception handler lives in ram anyway.

> I really puzzled what code could interrupt write operation then IRQs and
> FIQs are disabled. 

data abort I'd guess.

If you could set your BDI to trap any data abort when XIP is disabled 
and provide the content of the FAR (fault address register) when it 
happens that might be extremely helpful.

> Also from time to time I see another issue. 
> I get kernel panic message of the view :
> I added debug print just before BUG was called. 
> It looks very strange according to code chips_per_word = worwidth *
> cfi_interleave / map_bankwidth. There is no way to get 6 !
> 
> 2005-10-15 17:49:58 | cfi_interleave = 2 worwidth = 4 map_bankwidth = 4
> chips_per_word = 6 cmd = 0x80.

Probably a side effect of the above bug.


Nicolas
