Received: from serverb.sea.theriver.com ([216.39.128.32])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178RzO-0004By-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 21:36:43 +0100
Date: Thu, 16 May 2002 13:34:29 -0700 (PDT)
From: Paul <paul@oz.net>
To: David Woodhouse <dwmw2@infradead.org>
cc: Studying MTD <studying_mtd@yahoo.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: FAT for NAND Flash 
In-Reply-To: <11967.1021570512@redhat.com>
Message-ID: <Pine.LNX.4.44.0205161315020.26329-100000@localhost.localdomain>
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

Thank you for your reply, David.

Perhaps I used the wrong terminology when I said "FAT12 translation",
but doesn't the firmware on a USB SmartMedia reader have to be able to 
parse the SSFDC Physical Format Specification, such as the CIS (Card 
Information Structure)?  This is the part that seems to be missing
in sddr09.c, and the upper level stuff (e.g. fs/fat/inode.c) only handles 
pure FAT12.  In that case, sddr09.c isn't as useful to us as previously
suggested.

Thank you for your patience. :)  

-- Paul

On Thu, 16 May 2002, David Woodhouse wrote:

> paul@oz.net said:
> >  Michael and I have been looking at the SDDR-09 driver.  I could be
> > wrong, but as far as I can tell, the sddr09.c code does not grok
> > FAT12.   It only seems to have generic SCSI commands sent to the USB
> > SCSI emulation  layer (i.e. it seems to treat SmartMedia cards as
> > generic block devices).   I believe the actual FAT12 translation
> > occurs in the firmware of the USB  SmartMedia reader?
>
> No.
> 
> SmartMedia is just a translation layer. It emulates a block device.
> 
> You may use a FAT filesystem on that block device. Most people do. But why
> do you expect the driver to have any knowledge of FAT? Does the floppy disk 
> driver? Does the IDE disk driver?
> 
> The FAT (or ext2, or reiserfs, or whatever) file system is an entirely 
> separate layer from the block device which is provided by the SmartMedia 
> driver. 
> 
