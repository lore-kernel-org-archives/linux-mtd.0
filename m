Received: from tomts11.bellnexxia.net ([209.226.175.55] helo=tomts11-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170STc-00070C-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 20:30:52 +0100
Date: Wed, 24 Apr 2002 15:30:49 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: John Sutton <john@scl.co.uk>
cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from a DiskOnChip2000
In-Reply-To: <02042419440000.17852@diva.localdomain>
Message-ID: <Pine.LNX.4.44.0204241513350.21843-100000@server.superbt.com>
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

John,

Sorry if I misunderstood you, but you installed the lilo bootloader into
DiskOnChip.  As you found, lilo needs BIOS disk number to talk to the 
device.  The same is true for GRUB as the latter doesn't have the IDE 
drivers built in.

The M-System's DiskOnChip is shipped with the BIOS driver programmed into
the flash memory.  The driver gets activated during BIOS initialization.  
The M-System's lilo usage model assumes that BIOS will attempt to load the
lilo image in the same way as BIOS would load the master boot sector off
the hard disk.  

The above startup scheme is possible because the M-System's drivers are
already hooked to the BIOS INT 13h disk access call when BIOS wants to 
load the first sector off the bootable medium.

So your attempt to load the kernel off DiskOnChip with lilo may succeed as
long as you keep the M-System's boot area of the flash chip intact.  I
think the problem with lilo you mentioned is due to different default BIOS
disk number/geometry specified by you and the configuration of the
M-System's driver.  You may need to consult M-System's documentation paper
on its MS-DOS-based formatting software.

Once the Linux kernel is started, accessing a filesystem installed on top
of NFTL layer can be possible by means of the M-System's Linux driver
*and* by the MTD doc2000.c/nftl.c drivers *but* not by both.

Ilguiz

On Wed, 24 Apr 2002, John Sutton wrote:

> disk=/dev/nftla
>         bios=0x80
>         sectors=2
>         heads=16
>         cylinders=998
>         partition=/dev/nftla1
>                 start=2
