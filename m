Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12oOlC-0007fP-00
	for mtd-list@infradead.org; Sun, 07 May 2000 11:58:06 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12oOl9-0007fJ-00
	for mtd@infradead.org; Sun, 07 May 2000 11:58:04 +0100
Received: from localhost (1810 bytes) by jodie.lucid
	via sendmail with P:stdio/R:bind_hosts/T:inet_zone_bind_smtp
	(sender: <dvir>) (ident <dvir> using unix)
	id <m12oOqo-0000ciC@jodie.lucid>
	for <mtd@infradead.org>; Sun, 7 May 2000 14:03:54 +0300 (IDT)
	(Smail-3.2.0.102 1998-Aug-2 #2 built 1998-Oct-13)
From: Dvir Oren <dvir@lucidvon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14613.19866.269661.531112@jodie.local>
Date: Sun, 7 May 2000 14:03:54 +0300 (IDT)
To: MTD <mtd@infradead.org>
Subject: next step
In-Reply-To: <14613.18040.415068.143363@jodie.local>
References: <E12mz9Z-0006NG-00@infradead.org>
	<14613.18040.415068.143363@jodie.local>
Reply-To: Dvir Oren <dviro@lucidvon.com>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Rodrigo Moya writes ("next step"):

> fdisk /dev/nftla -> and create a unique partition for linux
 
Note that in my experience you sometimes (always?) have to boot after
changing the partition table, as the re-read does not always work.
 
Also, David once told me that fdisking /dev/nftla when nftl.o is loaded
(which will always be true if you are using a kernel with the MTD drivers
build-in) might not work.  This is to be checked with David.
 
> dd if=/dev/sda4 of=/dev/nftla1
 
That will probably work, though it's not a clean way of doing it.  Perhaps
a tarred and gzipped file would be better.  You might even want to run a
regular distribution setup - if you have the space for it.
 
> /sbin/lilo -> should I use the patched LILO I suppose?
 
You do need the patched LILO with the patched boot.b file.  I don't if you
can get the patched LILO from David's tree, but it was posted by me on this
list - so you should be able to get it.  Note that there are two patched 
LILOs, one to work with M-Systems' drivers, one that will work with both
M-Systems' and MTD's drivers.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
