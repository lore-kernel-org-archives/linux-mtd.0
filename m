Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18V6kq-0001il-00
	for <linux-mtd@lists.infradead.org>; Sun, 05 Jan 2003 09:07:36 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H880002MIR7EG@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 05 Jan 2003 10:37:56 +0100 (MET)
Date: Sun, 05 Jan 2003 10:37:03 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: compile error when using MEMREADOOB in do_mounts.c.
In-reply-to: <001f01c2b497$70a88970$c200a8c0@mobile>
To: Paul Wong <paul.wong@digitalview.com>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301051037.03860.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=big5
Content-transfer-encoding: 7BIT
References: <000201c2b2fd$dc75c190$9000010a@paulwong>
 <200301042132.18179.tglx@linutronix.de> <001f01c2b497$70a88970$c200a8c0@mobile>
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

On Sunday 05 January 2003 09:49, Paul Wong wrote:
>
> Yes, I modifed the bootloader (in NOR-Flash) that can load kernel image in
> /dev/mtd0 (NAND flash) and bad block handling.  and I also tried the rootfs
> in JFFS2, but the customer do not shutdown the system by keyboard, just
> directly power off the unit. then the JFFS2 may be corrupted and cannot
> boot up again. The ramdisk is a good solution for this case.   So, I want
> to modify the do_mounts.c to check the bad block to load the rootfs image
> to ramdisk.
JFFS2 can handle a direct power down. The only way you can loose data, is if 
you are writing to a file exactly in the moment, when you power down. This 
does not lead to a fs corruption. JFFS2 can handle this. 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
