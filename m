Received: from tomts11.bellnexxia.net ([209.226.175.55] helo=tomts11-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IXxB-0002Zw-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 18:00:09 +0100
Date: Thu, 13 Jun 2002 13:00:06 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: George Rathbone <george@qits.net.au>
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems booting from DOC2000
In-Reply-To: <26A2FD9AA493164F98D51AB846340698020CEE@itsdr>
Message-ID: <Pine.LNX.4.44.0206131257020.7507-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 13 Jun 2002, George Rathbone wrote:

> The only change in the kernel from the floppy is the boot device being
> set to (93,1) and the ramdisk set to 0.

How can lilo load kernel from /dev/nftla1?

M-Sys has solved this problem by hooking their DOC drivers onto BIOS INT
13h.

Other solutions such as DiskOnChip patch for GRUB involve a stripped down 
DOC NFTL driver in the bootloader.

Ilguiz
