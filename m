Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13C7VU-0005JC-00
	for mtd-list@infradead.org; Tue, 11 Jul 2000 22:23:56 +0100
Received: from web5302.mail.yahoo.com ([216.115.106.111])
	by infradead.org with smtp (Exim 3.03 #1)
	id 13C7VT-0005J6-00
	for mtd@infradead.org; Tue, 11 Jul 2000 22:23:55 +0100
Message-ID: <20000711212323.21257.qmail@web5302.mail.yahoo.com>
Date: Tue, 11 Jul 2000 17:23:23 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: Re: mtd devices & jffs 
To: MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I guess the problem I am going to run into is that I don't
want to erase all of the flash, nor do I want JFFS to use
all of the flash.  Part of the flash will have a kernel
image burned into, and another part is being used for config
data etc.  And then the filesystem is supposed to have its
chunk of flash to use.

Is this possible?  Looking through the JFFS code, they hardcode
the start address for their scan at 0x0 and get the end addr
based on the size of the total flash.  Is there a way to tell
JFFS "start at this addr and only use this much space" without
changing this code?

Thanks,
   -- kelly


--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> kayemmess@yahoo.ca said:
> > Dirty flash memory or bad inode: hexdump(pos = 0x1098176, len =
> 128):
> 
> Looks like there were data on the flash chips before you started.
> Erase 
> them first. There's no utility to erase whole devices, but the
> 'erase' 
> program in the util/ directory will erase a single erase block at a
> time.
> 
>  for a in `seq 0 131072 16777216` ; do mtd/util/erase /dev/mtd0 $a ;
> done
> 
> ....or put a loop into the erase program. The MTDGETINFO ioctl should
> return 
> the size of the device.
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
