Received: from [209.87.241.202] (helo=[10.0.1.46])
	by pentafluge.infradead.org with esmtpsa (Exim 4.43 #1 (Red Hat Linux))
	id 1D9XDJ-0000AO-4v
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 23:37:11 +0000
Message-ID: <4230DA22.8070305@netwinder.org>
Date: Thu, 10 Mar 2005 18:37:06 -0500
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Autodetection problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using kernel 2.6.10 on a PPC440GX with TWO 32MiB Intel J-series 
Strataflash.  These are x16 devices and they are arranged in parallel 
across the 32-bit data bus (interleave=2).  They share a common chip 
select and are mapped at the top of the address space.

With mostly default options to the kernel, the MTD autodetection logic 
performs two calls to do_cfi_probe() at offset 0x000000 and 0x2000000, 
and then proclaims, erroneously:
    Found 1 x32 devices at 0x0 in 32-bit bank
Attempts to use the flash in this state fail miserably (tons of block 
bitmap errors, cannot access beyond 32MiB, etc).

Thanks to suggestion by ThomasG, I switched on the advanced options, 
selected _only_ 32-bit buswidth, and _only_ interleave of 2.  Now the 
kernel reports what I expected:
    Found 2 x16 devices at 0x0 in 32-bit bank
and everything works like it a charm.

Though I'd mention this in case anyone encounters similar situation. 
I'm not sure if the autodetection code is meant to work in my situation...

PS. I also learned that having jffs2 debug level set at 2 causes 
considerably slowdown - doing an "ls" was taking 11 seconds.  Putting 
debug back to 0 makes everything work quickly as you'd expect.

I'm currently not subscribed to the list, please cc: any replies!
-Ralph
