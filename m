Received: from newfrnk82.franklin.com
	([63.88.59.82] helo=earth-out.franklin.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16rgWa-0000KK-00
	for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2002 15:41:40 +0100
Received: from saturn.franklin.com (IDENT:root@saturn.franklin.com [192.9.200.2])
	by earth-out.franklin.com (8.9.3/8.9.3) with ESMTP id JAA28677
	for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2002 09:41:29 -0500
Received: from mercury.franklin.com (IDENT:root@mercury.franklin.com [192.9.200.250])
	by saturn.franklin.com (8.9.3/8.9.3) with ESMTP id JAA02624
	for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2002 09:41:28 -0500
Date: Sun, 31 Mar 2002 09:41:30 -0500
Message-Id: <200203311441.JAA30938@mercury.franklin.com>
From: Duane Ellis <duane_ellis@franklin.com>
To: linux-mtd@lists.infradead.org
Subject: paging the kernel out of nand flash.
Reply-to: duane_ellis@franklin.com
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

I'm not sure which list to ask this on. But since my 
question is NAND flash specific I thought I'd ask here.

I've done something like this before on other systems 
but never with linux.

Has anybody setup a system with the following attributes:

1) Kernel is configured with XIP
2) BUT Kernel actually lives in NAND flash
3) When sections of the kernel code page fault
   they are loaded from NAND flash.

Maybe you do this with a small micro-ish kernel under
the main kernel.

ie: on the MMU interrupt - decided - who should handle the fault

    ie: If kernel fault - micro-kernel handles. 
    Otherwise let linux kernel handle it.

    In effect, the kernel 'just thinks' it is doing XIP.

In addition, one would need to allocate space on the NAND flash
devices such that a portion of the device (ie: the part with the
kernel in it) is not available to linux.

Along with a portion of the physical ram used for paging.

And yes, I'm well aware of problems of a fault within a fault that
handles a fault. Somethings must live in real memory.  I'm looking 
at the 'rest of the kernel'

-Duane.
