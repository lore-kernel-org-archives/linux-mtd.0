Received: from [192.109.80.15] (helo=turing.logware.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15doJG-0006v0-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2001 08:38:18 +0100
Received: from exchange.ten.logware.de (exchange.ten.logware.de [10.220.10.26])
	by turing.logware.de (8.9.3/8.9.3) with ESMTP id KAA08055
	for <linux-mtd@lists.infradead.org>; Mon, 3 Sep 2001 10:13:46 +0200
Message-ID: <71B37AB6576DD211AB7E008048CD4D319FA656@exchange.ten.logware.de>
From: Veikko Werner <veikko.werner@logware.de>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: AW: DOC2000 Boot de-ja-vue - add... 
Date: Mon, 3 Sep 2001 09:44:41 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

 Hello again,

I found it myself. I cp'ed only the links in the lib dir. Now i can make
chroot. 
Now I'm trying to boot it let's see ...

Veikko

-----Originalnachricht-----
Von: Veikko Werner
An: 'linux-mtd@lists.infradead.org '
Gesendet: 03.09.01 09:25
Betreff: AW: DOC2000 Boot de-ja-vue - add... 


Thanks David,

that was a good hint. 
After I mount /dev/nftla1 I can do /mnt/nftla1/sbin/init , sh, bash ...
but if I use # chroot /mnt/nftla1 /sbin/init 
I get 'chroot: can not execute /sbin/init: No such file or directory'

okay now I know there's a problem. But I've no idea how to solve it.
I attach a listing of my root-fs. maybe one can see an error.

Veikko

-----Originalnachricht-----
Von: David Woodhouse
An: Veikko Werner
Cc: linux-mtd@lists.infradead.org
Gesendet: 31.08.01 17:41
Betreff: Re: DOC2000 Boot de-ja-vue - add... 


veikko.werner@logware.de said:
> conclusion:  MTD and NFTL load successfully kernels says "root
> mounted" so I should must have the files I have when I mount it from
> HD but that seems to be not right maybe access to the DOC is to slow?
> Can I pass some arguments for slowing down ? 

Boot from the hard drive and check you can run /sbin/init and /bin/sh 
from the DiskOnChip:

 mount /dev/nftla1 /mnt
 chroot /mnt /bin/sh


--
dwmw2


 <<doc.lst.gz>> 
