Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13DEb6-00008D-00
	for mtd-list@infradead.org; Sat, 15 Jul 2000 00:10:20 +0100
Received: from web5305.mail.yahoo.com ([216.115.106.114])
	by infradead.org with smtp (Exim 3.03 #1)
	id 13DEb5-00007w-00
	for mtd@infradead.org; Sat, 15 Jul 2000 00:10:19 +0100
Message-ID: <20000714230947.15023.qmail@web5305.mail.yahoo.com>
Date: Fri, 14 Jul 2000 19:09:47 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: Re: persistence of files using jffs 
To: MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

When umount and then remount, any new files I copied are
not there.

Our system has 4 Intel Strataflash chips that are coupled pairs
to give us 32MB at 32bits data width.  In the structure 'map_info',
I set the 'buswidth' field to 4.

The startup code uses the write32 functions, but when I mount 
I noticed that write16 functions are being used.  As well, in 
the file cfi_cmdset_0001.c, only write16 functions are called.  
Is this causing a problem for our system?

Thanks,
   -- kelly


--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> kayemmess@yahoo.ca said:
> >    (1) mknod /dev/mtd3 b 31 3   (mtd3 is where the fs 'partition'
> is,
> >                                  using examples from nora.c)
> 
> The block devices should be /dev/mtdblock<n>. /dev/mtd3 should be a 
> character device. But the names don't really matter.
> 
> 
> kayemmess@yahoo.ca said:
> >  And I can 'umount /mnt' successfully as well.
> > However, when I cycle power on the system, any *new* files I create
> or
> > copy into this space are lost. 
> 
> Hmmm. Are they there when you unmount and remount? Can you make sure
> you're 
> using the latest version from CVS, and enable CONFIG_JFFS_FS_VERBOSE?
> 
> 
> 
> --
> dwmw2
> 
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


_______________________________________________________
Do You Yahoo!?
Get your free @yahoo.ca address at http://mail.yahoo.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
