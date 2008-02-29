Received: from e33.co.us.ibm.com ([32.97.110.151])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JV656-0000wY-HX
	for linux-mtd@lists.infradead.org; Fri, 29 Feb 2008 14:19:24 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m1TEJ6TE032020
	for <linux-mtd@lists.infradead.org>; Fri, 29 Feb 2008 09:19:06 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m1TEJ63Q169012
	for <linux-mtd@lists.infradead.org>; Fri, 29 Feb 2008 07:19:06 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m1TEJ5Nd019430
	for <linux-mtd@lists.infradead.org>; Fri, 29 Feb 2008 07:19:06 -0700
Date: Fri, 29 Feb 2008 08:17:07 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Grant Erickson <gerickson@nuovations.com>
Subject: Re: Writing JFFS2 to Samsung K9F1208U0B NAND on AMCC PPC405EX/r
	Kilauea/Haleakala
Message-ID: <20080229081707.2fa09f98@zod.rchland.ibm.com>
In-Reply-To: <C3EC922E.DAF1%gerickson@nuovations.com>
References: <C3EC922E.DAF1%gerickson@nuovations.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 28 Feb 2008 16:30:38 -0800
Grant Erickson <gerickson@nuovations.com> wrote:

> I am attempting to create and write a JFFS2 file system to the Samsung
> K9F1208U0B NAND part on an AMCC PPC405EXr "Haleakala" board and seem to be
> running into a hurdle or two.
> 
> Given the Samsung K9F1208U0B's 16 KiB erase block and 512 B page sizes, I
> invoked mkfs.jffs2 with:
> 
> % mkfs.jffs2 -n -b -s 512 -e 16 KiB -d /export/haleakala -o haleakala.img
> 
> I then erase the device with 'flash_eraseall' using the '-j' option:
> 
> # flash_eraseall -j /dev/mtd9
> Erasing 16 Kibyte @ 3f94000 -- 99 % complete. Cleanmarker written at
> 3f94000.
> 
> However, when I attempt to lay down the file system image with nandwrite
> (again, using the '-j' option), I get a driver error:
> 
> # nandwrite -j /dev/mtd9 haleakala.img
> MEMSETOOBSEL: Inappropriate ioctl for device

This has been broken since the ECC rework went into the kernel.  I hear
there are patches floating around to fix it.  Maybe they will magically
appear today...

josh
