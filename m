Received: from tomts23-srv.bellnexxia.net ([209.226.175.185])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16myyU-0002OZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 15:23:02 +0000
Received: from superbt.com ([65.92.36.216]) by tomts23-srv.bellnexxia.net
          (InterMail vM.4.01.03.23 201-229-121-123-20010418) with ESMTP
          id <20020318153430.HCZN6313.tomts23-srv.bellnexxia.net@superbt.com>
          for <linux-mtd@lists.infradead.org>;
          Mon, 18 Mar 2002 10:34:30 -0500
Received: from localhost (ilatypov@localhost)
	by superbt.com (8.11.4/8.11.4) with ESMTP id g2IFYNV14038
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 10:34:23 -0500
Date: Mon, 18 Mar 2002 10:34:23 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: DOC2000 + GRUB/LILO booting problems
Message-ID: <Pine.LNX.4.44.0203181034060.13911-100000@server.superbt.com>
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

Veselin,

On Mon, 18 Mar 2002, Veselin Mijuskovic wrote:

> 	I'm pretty new to MTD and all these stuff, but if this is the 
> case, how the kernel mounts the /dev/nftla1 with no problems at all when I 
> boot from the hard disk?

I agree it might be impossible for the kernel to mount a partition
formatted within NFTL layer if NFTL data structures in the beginning of
the flash chip are overwritten.  But I don't know the exact details of the
NFTL layer myself.

> 	Isn't it dangerous? It's a 16MB DOC2000 - are these the right
> parameters? Can I overwrite bad block table with the above command? How
> can I recover bad block table (I can make 'dd if=/dev/mtd0 of=some_file'
> to create a backup copy, can I)?

The GRUB bootloader needs around 96K at minimum.  NFTL layer can be set up
after the bootloader only.  It seems the start of the NFTL layer will be
detected automatically by the kernel.  In my understanding, the kernel
will simply search for a signature in every erase unit of the chip to find
the beginning of NFTL layer.

As for the backup, the dd command should work when reading from the chip.  
As you might know, the flash sectors need to be erased to accept new data.  
I think the implementation of the system call corresponding to the write()
C library function against the /dev/mtdX MTD DoC 2000 driver will perform
the necessary "flash program" command automatically.  Perhaps, the "flash
erase" command has to be carried out explicitly through utilities like
util/erase_all.  

Of course, write()s against /dev/nftlaX driver will do the "flash erase"
command transparently.

Ilguiz
