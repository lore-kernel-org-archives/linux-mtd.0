Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JZkN-0007qf-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 13:39:27 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6L0035SLZV3D@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 04 Dec 2002 15:09:31 +0100 (MET)
Date: Wed, 04 Dec 2002 15:07:32 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: fail to mount MTD (NAND) as root file system
In-reply-to: <BDEDIOGGNJEEPBHLJLFGAEDPCEAA.tium@palmpalm.com>
To: Taeil Um <tium@mail.palmpalm.com>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200212041507.32162.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=euc-kr
Content-transfer-encoding: 7BIT
References: <BDEDIOGGNJEEPBHLJLFGAEDPCEAA.tium@palmpalm.com>
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

On Wednesday 04 December 2002 14:54, Taeil Um wrote:
> When i tried mount the NAND flash as a root file system, i succeeded for
> the first time.
 
> But if i reboot the system and mount NAND flash as a root file system
> again,
 i got a KERNEL-OOPS as bellow
> VFS: Mounted root (ext2 filesystem).
> VFS: Mounted root (jffs2 filesystem).
> Unable to handle kernel NULL pointer dereference at virtual address
> 00000003
 pgd = c0024000
> *pgd = 00000000, *pmd = 00000000
> Internal error: Oops: ffffffff
> CPU: 0
> pc : [<c0055668>]    lr : [<c0006000>]    Not tainted
> sp : c001fe6c  ip : ffffffff  fp : c001fe88
> r10: c1d41000  r9 : c017274c  r8 : 00000003
> r7 : 60000013  r6 : c020f218  r5 : 000001f0  r4 : c020f210
> r3 : ffffffff  r2 : ffffffff  r1 : ffffffff  r0 : ffffffbf
> ------------------------------------------------------------------
> 
Please recompile your kernel with debugging enabled and provide a stacktrace 
through ksymoops.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
