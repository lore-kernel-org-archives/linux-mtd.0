Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZBSs-0005HQ-H0
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 13:11:33 -0500
Received: from mail.tec.linutronix.de (unknown [192.168.0.1])
	by mail.tglx.de (Postfix) with ESMTP id E399665C3FA
	for <linux-mtd@lists.infradead.org>;
	Mon,  7 Nov 2005 19:07:46 +0100 (CET)
Received: from tglx.tec.linutronix.de (tglx.tec.linutronix.de [192.168.0.68])
	by mail.tec.linutronix.de (Postfix) with ESMTP id 4B1FD2806C
	for <linux-mtd@lists.infradead.org>;
	Mon,  7 Nov 2005 19:11:17 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 7 Nov 2005 19:15:03 +0100
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200511071915.03263.tglx@linutronix.de>
Subject: MTD git repository status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

I've updated the mtd git repository hopefully in time for 2.6.15.

http://www.kernel.org/git/?p=linux/kernel/git/tglx/mtd-2.6.git;a=summary

	tglx

Following changes are not included into the update:

- [JFFS2]  Erase Block Header(EBH)
	Needs proper testing and stabilizing first

- [MTD] NAND: OOB changes
	Needs more thoughts. I'm particularly unhappy with the introduction of new 
functions and the still pending problem of the automatic placement/retrieval 
of oob data. The change should subsume and/or extend the oob_info 
functionality rather than introducing a parallel solution.

- [MTD] NAND: nandsim
	There is still the big Kconfig clutter. For testing environments it _is_ 
sufficient to provide all this information as module parameters. No need to 
bloat the config file

- [MTD] ONENAND: Simulator
	Is depending on arch/??? probably ARM and uses some obscure __iomem* 
constructs.

Can the authors please shed some light on the status of following drivers:

- [MTD] maps mphysram.c
	It needs a bunch of coding style cleanups.
	
- [MTD] devices ramtd.c
	Needs probably a go on the fixed size allocation already marked with 
	/* FIXME */

- [MTD] ssfdc.c
	AFAIK the driver is mostly functional. What's missing ?
	It needs a bunch of coding style cleanups.
