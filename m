Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13BuUt-00031A-00
	for mtd-list@infradead.org; Tue, 11 Jul 2000 08:30:27 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13BuUs-000314-00
	for mtd@infradead.org; Tue, 11 Jul 2000 08:30:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20000710221950.8117.qmail@web5304.mail.yahoo.com> 
References: <20000710221950.8117.qmail@web5304.mail.yahoo.com> 
To: Juan Gonzo <kayemmess@yahoo.ca>
Cc: MTD Mailing List <mtd@infradead.org>
Subject: Re: mtd devices & jffs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 Jul 2000 08:30:23 +0100
Message-ID: <20923.963300623@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kayemmess@yahoo.ca said:
> Dirty flash memory or bad inode: hexdump(pos = 0x1098176, len = 128):

Looks like there were data on the flash chips before you started. Erase 
them first. There's no utility to erase whole devices, but the 'erase' 
program in the util/ directory will erase a single erase block at a time.

 for a in `seq 0 131072 16777216` ; do mtd/util/erase /dev/mtd0 $a ; done

...or put a loop into the erase program. The MTDGETINFO ioctl should return 
the size of the device.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
