Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12fKSk-0000xM-00
	for mtd-list@infradead.org; Wed, 12 Apr 2000 11:33:34 +0100
Received: from square.inter.net.il ([192.116.202.83])
	by infradead.org with smtp (Exim 3.03 #1)
	id 12fKSi-0000xC-00
	for mtd@infradead.org; Wed, 12 Apr 2000 11:33:32 +0100
Message-ID: <38F45195.5040502@bigfoot.com>
Date: Wed, 12 Apr 2000 13:36:05 +0300
From: Udi Finkelstein <udif@bigfoot.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: DOC2000 and Kernel 2.3 ??
References: <f1c7fssr0pi4tvjhv4g10trhkqq28j0i6r@4ax.com> <8d0raj$gbm$1@whiskey.fireplug.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Stuart Lynne wrote:
> 
> In article <f1c7fssr0pi4tvjhv4g10trhkqq28j0i6r@4ax.com>,
> Udi Finkelstein <udif@bigfoot.com> wrote:
> 
> >I see 3 possible options:
> >
> >1. Hacking the original m-sys 2.2.x driver to work under 2.3.x. Is this
> >possible? How much of the binary only portion depends on the 2.2.x kernel=
> > API?
> >Can it be adapted to 2.3.x by changing only the skeleton code around it?
> 
> Very little if any. You should be able to just modify the fldrvlnx.c file
> appropriately and have it work.
> 
> I'm not to sure what CRAMFS is going to do for you. It's not too hard
> to have a minimal system entirely on the RAM disk
If I want to use a filesystem containing read-only files (executables 
and data files) which is 2 MB for example, I would require either:
*  2MB  conventional filesystem (e2fs) mounted read-only, using no 
dedicated RAM (other than caching/buffering), but using 2MB of the flash 
disk (50% in my case).
* compressed RAM disk mounted as an initrd, using 2MB RAM (out of the 
8MB DRAM I have), but only 1MB flash (25% of the DOC2000-4MB I use, 
assuming 50% compression ratio).
* CRAMFS based partition using 1MB flash and no RAM.

Ofcourse, the bigger the partition needs to be, the higher the gains.

I'd rather have the 3rd option.

Also, where do I find a *complete* list of 2.2 -> 2.3 kernel changes? 
the only list I found was:

http://www.atnf.csiro.au/~rgooch/linux/docs/porting-to-2.3.html

and it is certainly lacking.

> Stuart Lynne <sl@fireplug.net>                __O 
> 
Udi



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
