Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13D02V-0006Cj-00
	for mtd-list@infradead.org; Fri, 14 Jul 2000 08:37:39 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13D02U-0006Cd-00
	for mtd@infradead.org; Fri, 14 Jul 2000 08:37:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20000713200952.1875.qmail@web5302.mail.yahoo.com> 
References: <20000713200952.1875.qmail@web5302.mail.yahoo.com> 
To: Juan Gonzo <kayemmess@yahoo.ca>
Cc: MTD Mailing List <mtd@infradead.org>
Subject: Re: persistence of files using jffs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jul 2000 08:37:36 +0100
Message-ID: <9496.963560256@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kayemmess@yahoo.ca said:
>    (1) mknod /dev/mtd3 b 31 3   (mtd3 is where the fs 'partition' is,
>                                  using examples from nora.c)

The block devices should be /dev/mtdblock<n>. /dev/mtd3 should be a 
character device. But the names don't really matter.


kayemmess@yahoo.ca said:
>  And I can 'umount /mnt' successfully as well.
> However, when I cycle power on the system, any *new* files I create or
> copy into this space are lost. 

Hmmm. Are they there when you unmount and remount? Can you make sure you're 
using the latest version from CVS, and enable CONFIG_JFFS_FS_VERBOSE?



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
