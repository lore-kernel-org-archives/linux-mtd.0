Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dhSm-0002kt-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 00:51:56 +0000
Message-ID: <000801c1ba73$7daa4240$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: "Ilguiz Latypov" <ilatypov@superbt.com>
Cc: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.44.0202201803210.14779-100000@server.superbt.com>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Wed, 20 Feb 2002 20:01:59 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Ilguiz,

I don't get any "Jumping to Grub" messages on boot; it's like the DOC is not installed at
all (no messages on boot).

The difference between INT 18/19 is a bit confusing.  I thought that int 18h was the old
"bootstrap" handler that used to jump to ROM BASIC (many years ago), and that int 19h
simply tried to first read the MBR on the floppy, and then on the first hard disk drive.
According to a very old DOS book I have, it looks like INT 19h will transfer control to
INT 18h if attempts to read the boot sector from floppy or hard drive are unsuccessful.

I'll try booting from a floppy with MBR = int 19 tomorrow.

I did enable the DOC_DEBUG in shared.h, but obviously this didn't make any difference as I
haven't been able to even attempt to boot yet.

The kernel I'm using does have the open source MTD drivers compiled in, and everything
works great when booted from (mtd-patched) LILO.

Thanks for your quick response.

Mark

On Wed, 20 Feb 2002, Ilguiz Latypov wrote:

> Does the "Jumping to Grub" message show up during startup
> (stage1/doc_stage1.S)?  Does this message come next?
>    Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0xff
