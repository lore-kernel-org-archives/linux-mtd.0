Received: from tomts22-srv.bellnexxia.net ([209.226.175.184])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e1EH-0004Rj-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 21:58:17 +0000
Date: Thu, 21 Feb 2002 17:08:52 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
In-Reply-To: <000801c1ba73$7daa4240$0101a8c0@dellc800>
Message-ID: <Pine.LNX.4.44.0202211614390.27335-100000@server.superbt.com>
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

I updated the patches/grub-2002-02-19-doc.patch with regard to Millenium 
specifics at stage 1.  Sorry I missed that last time.  And again, someone 
with Millenium chip has to test the change as I don't have such chip.

I can't understand why would the message "Loading GRUB from DiskOnChip" 
not appear at startup.  It is the first thing in step (b):

  a) The motherboard BIOS finds the 2-byte signature of DoC in the 
     C0000-E0000 area and jumps there.  This is Initial Program Loader in 
     M-Sys notation.  It will copy 512 bytes of the flash code to 0x2000:0 
     and jump there.

  b) The 512 bytes flash code (Secondary Program Loader, or stage 1) 
     copies the rest of itself into the end of the real memory 640K area, 
     adjusts the BIOS memory size accordingly, installs the INT 19h 
     pointer to that area and returns.

  c) Once the BIOS scan is done, the motherboard BIOS invokes INT 19h 
     which would otherwise be handled by the BIOS itself.  Thus the rest 
     of stage 1 code receives control.  The code initializes DoC and reads 
     the whole bootloader off the DoC into 0x7f0:0 and jumps to stage 2 at 
     0:0x8200.

Can you please try the updated DoC GRUB patch?  This shouldn't fix the INT 
19h problem though.

Ilguiz

P.S.  It is funny that the same DoC handling code has to be stored in 3 
places: 
  a) in stage 1 to load "plain" stage 2
  b) in stage 2 to load kernel
  c) in kernel to provide a file system

On Wed, 20 Feb 2002, Mark Meade wrote:

> I don't get any "Jumping to Grub" messages on boot; it's like the DOC is
> not installed at all (no messages on boot).
