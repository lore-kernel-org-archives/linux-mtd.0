Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178PA0-0003wi-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 18:35:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.44.0205160902230.24338-100000@localhost.localdomain> 
References: <Pine.LNX.4.44.0205160902230.24338-100000@localhost.localdomain> 
To: Paul <paul@oz.net>
Cc: Studying MTD <studying_mtd@yahoo.com>, linux-mtd@lists.infradead.org
Subject: Re: FAT for NAND Flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 16 May 2002 18:35:12 +0100
Message-ID: <11967.1021570512@redhat.com>
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

paul@oz.net said:
>  Michael and I have been looking at the SDDR-09 driver.  I could be
> wrong, but as far as I can tell, the sddr09.c code does not grok
> FAT12.   It only seems to have generic SCSI commands sent to the USB
> SCSI emulation  layer (i.e. it seems to treat SmartMedia cards as
> generic block devices).   I believe the actual FAT12 translation
> occurs in the firmware of the USB  SmartMedia reader?

No.

SmartMedia is just a translation layer. It emulates a block device.

You may use a FAT filesystem on that block device. Most people do. But why
do you expect the driver to have any knowledge of FAT? Does the floppy disk 
driver? Does the IDE disk driver?

The FAT (or ext2, or reiserfs, or whatever) file system is an entirely 
separate layer from the block device which is provided by the SmartMedia 
driver. 

--
dwmw2
