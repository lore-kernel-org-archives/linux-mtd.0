Received: from tomts15-srv.bellnexxia.net ([209.226.175.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173LaJ-0003z7-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 19:45:43 +0100
Date: Thu, 2 May 2002 14:45:41 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Frederick Lefebvre <flefebvre@irg.ca>
cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Booting from DOC2000 with GRUB loader
In-Reply-To: <1020363439.31863.18.camel@zeus>
Message-ID: <Pine.LNX.4.44.0205021431060.10617-100000@server.superbt.com>
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

Frederick,

There can be 2 things missing: 

  a) the *.in files must be re-generated with 

         aclocal && automake && autoconf

     as John Sutton showed in the RPM spec file.  Also, there is 
     README_DiskOnChip file in the patch that advises the same.

  b) The only block device layer supported by the DoC MTD patch to GRUB is 
     NFTL.  This means you may need to create a filesystem on top of the 
     /dev/nftla device or partition it into pieces with fdisk.  In the 
     first case you may need to specify "root (dc0)".

If you don't want to mess with NFTL layer, you might be interested in
another bootloader based on FFS2 filesystem.  I saw it in the boot
directory of the MTD CVS repository, but never tried it.

Perhaps, the GRUB bootloader can be modified to access a read-only
filesystem created on top of the raw NAND flash sectors.

And finally, the read-write JFFS2 filesystem was specifically designed
with flash memory in mind.  I heard about experimental work to enable
JFFS2 on NAND flash chips.  See the mailing list archives.  It would be
nice to make GRUB recognize JFFS2 filesystem.

Ilguiz

On 2 May 2002, Frederick Lefebvre wrote:

> "root (dc0,0)", I get : "Error 21: Selected disk does not exist".
