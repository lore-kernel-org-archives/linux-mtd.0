Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fRJi-0003lY-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 20:01:46 +0000
Received: from ilatypov by infradead.org with local (Exim 3.20 #2)
	id 16fRUe-00089T-00
	for linux-mtd@lists.infradead.org; Mon, 25 Feb 2002 20:13:04 +0000
Date: Mon, 25 Feb 2002 15:00:04 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Herman Theron <HEtheron@csir.co.za>
cc: linux-mtd@lists.infradead.org
Subject: Re: Error using GRUB patch (and LILO questions)
In-Reply-To: <sc7a1e95.021@CS-IMO.CSIR.CO.ZA>
Message-ID: <Pine.LNX.4.44.0202251407090.1343-100000@server.superbt.com>
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

Herman,

Yes, when starting from a floppy, it is BIOS who hands the control over to
the boot sector content of the floppy disk.  LILO doesn't interfere with
the BIOS boot order.

The DoC patch to GRUB will affect the BIOS boot order, since the code in
the flash memory will gain control earlier.

It is still possible to boot off the floppy drive by using the GRUB 
loader (see below an untested sample of /boot/grub/menu.lst).

Ilguiz

================================================================
default=0
timeout=2
serial --speed=115200
terminal --timeout=2 serial console

title=Linux with serial console
root (dc0,0)
kernel /boot/vmlinuz root=/dev/nftla2 ro console=ttyS0,115200

title=Rescue floppy disk
root (fd0)
kernel /vmlinuz root=/dev/fd0 ro console=ttyS0,115200

title=Windows
rootnoverify (hd0,0)
makeactive
chainloader +1
================================================================


On Mon, 25 Feb 2002, Herman Theron wrote:

> Sometimes I want to boot using a stiffy (rescue disk), but Grub will
> always start first.
