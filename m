Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ih9g-0003nq-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 19:32:52 +0000
Received: from ilatypov by infradead.org with local (Exim 3.20 #2)
	id 16ihKh-0005BZ-00
	for linux-mtd@lists.infradead.org; Wed, 06 Mar 2002 19:44:15 +0000
Date: Wed, 6 Mar 2002 14:18:17 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Chris Fowler <strtok@hotmail.com>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Lost DOC2000 after installation of Grub
In-Reply-To: <200203061645.g26Gjl806741@skylab.outpostsentinel.com>
Message-ID: <Pine.LNX.4.44.0203061259340.6543-100000@server.superbt.com>
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

Chris,

It seems that you might need the /boot/grub/menu.lst file to enable 
automatic boot process.  There is GRUB documentation at

    http://www.gnu.org/manual/grub-0.90/html_mono/grub.html

According to your lilo.conf, you have the kernel and initrd.gz in the
/boot/ directory of a filesystem formatted on top of /dev/nftla.

This means you may need the menu.lst included below.  Long lines might get
wrapped by email agents.

I didn't try initrd ramdisks with GRUB myself, so that configuration is
not tested.  

Your GRUB bootloader must understand the filesystem which you installed on 
top of /dev/nftla block device layer.

It seems that no DoC drivers are strictly required when using initrd.  
The initial ramdisk gets loaded by the boot loader.  

The kernel parameter initrd is not processed by the kernel.  This
parameter is to inform bootloaders.  See kernel's

    Documentation/i386/boot.txt

The ramdisk_image and ramdisk_size parameters are to be added to the
kernel command line by the bootloader automatically.  See also

    Documentation/initrd.txt

Ilguiz

===================================================================
default=0
timeout=2
serial --speed=9600
terminal --timeout=2 serial console

title=Linux with serial console
root (dc0)
kernel /boot/kernel root=/dev/ram0 rw init=/linuxrc console=ttyS0,9600
initrd /boot/initrd.gz

title=Linux with video card and keyboard
root (dc0)
kernel /boot/kernel root=/dev/ram7 rw init=/linuxrc
initrd /boot/initrd.gz
===================================================================

On Wed, 6 Mar 2002, Chris Fowler wrote:

> When I use root=(dc0,0) :
> 
> Error 23:  Erro parsing number.
