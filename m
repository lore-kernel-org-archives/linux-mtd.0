Received: from tomts21-srv.bellnexxia.net ([209.226.175.183])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ktJN-0007OG-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 20:55:57 +0000
Date: Tue, 12 Mar 2002 16:07:19 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader
In-Reply-To: <200203111306968.SM01632@there>
Message-ID: <Pine.LNX.4.44.0203121533350.15005-100000@server.superbt.com>
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

1. Thanks for the latest patch to stage2/bdev_diskonchip.c that rectifies
the chip identification.

2. As for the device page size issue in Millennium IPL, the data sheets
and application notes at

    http://www.m-sys.com/content/Products/ShowInformation.asp?PID=1&Code=1

inform that DoC Millennium and DoC Millennium Plus feature a Download
Engine which takes care of copying the flash image into the read-only area
available at offset 0 of the window.

The above process takes place when the device is reset.

Apparently, the XIP IPL doesn't need the DoC 2000 trick with duplicating
the code for 256-byte and 512-byte page size devices at offsets 0x100 and
0x200 respectively.

3. There is a data sheet on Millennium Plus at the aove link, if anyone is
interested.  The chip has ID 0x40, its IPL is downloaded from a non-zero
flash offset, and there are few data structures in the beginning of the
flash memeory.

Ilguiz

On Mon, 11 Mar 2002, Mark Meade wrote:

> You mentioned that there are DoC Millennium parts based on 256-byte-page
> chips -- so my hack to force the 512-byte code to 0x100 will not work
> correctly for all Millennium parts.
