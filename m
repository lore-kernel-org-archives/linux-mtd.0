Received: from tomts23-srv.bellnexxia.net ([209.226.175.185])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ad0m-0003mH-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 15:02:36 +0100
Date: Fri, 2 Aug 2002 10:02:33 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
In-Reply-To: <200208020933750.SM02488@there>
Message-ID: <Pine.LNX.4.44.0208020949420.26999-100000@server.superbt.com>
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

Mark,

On Fri, 2 Aug 2002, Mark Meade wrote:

> Using GRUBSTART:0 is probably the better way to do this: GRUBSTART:0 is 
> equivalent to GRUBLOADSEG:GRUBLOADOFS (8200:0, 07E0:400), and using zero as 
                                         ^^^^    ^^^^
I believe GRUBSTART is the offset value while GRUBLOADSEG is the segment 
value, i.e. GRUBSTART == (GRUBLOADSEG << 4) + GRUBLOADOFS.  The original 
code was reading a 256 byte flash block into 0x8200:0 which is 532480, and 
this could be either GRUB's playground or interrupt handlers set up by 
BIOS.

> the offset causes the "read block" command to send an address of 0 after
> sending the READID command, similar to the way it's done in
> bdev_diskonchip.c.

I understand that the same register %di serves as the offset to the
destination in RAM and as the offset in flash.  And stage2 or doc2000.c 
code will read chip ID from offset 0.  I think the offset may not be 
important because the READID command tells the chip to report the ID.  

I'd better assign (GRUBLOADSEG << 4) to %es and 0 to %di to stay safe 
though.

Ilguiz
