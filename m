Received: from mail023.syd.optusnet.com.au ([210.49.20.162])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KtwB-0007Ky-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 05:52:51 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail023.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g5K4qld32506
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 14:52:47 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=ctam.com.au)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 17Ktw4-0004Fs-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 14:52:44 +1000
Message-ID: <3D115F9B.9030203@ctam.com.au>
Date: Thu, 20 Jun 2002 14:52:43 +1000
From: Brendan J Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: doc2000 nftl[abcd] devices
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

I'm using a powerpc linux 2.4.18-pre8 kernel with an 8MB DOC2000.  I've 
managed to create 3 virtual disks using the latest nftl_format from cvs.
$ nftl_format /dev/mtd0 0x00000000 0x02000000
$ nftl_format /dev/mtd0 0x02000000 0x04000000
$ nftl_format /dev/mtd0 0x06000000 0x02000000

I've also compiled the latest cfdisk from util-linux-2.11n.
I loaded the nftl driver (insmod nftl) and did a fdisk (cfdisk 
/dev/nftla).  It complained about having no partition table and aksed if 
I wanted to continue.  I said yes and I created a new partition and it 
recognised the size as being 2MB :)  I wrote this to disk and then 
rebooted my embedded system (power cycled).  It came back up and I could 
mkfs.ext2 it and mount it.  Another power cycle and mount to prove to 
myself everything was written to the DOC correctly.

Now I try the same thing with nftlb and I get errors saying "Cannot open 
disk drive".  It should be the same process shouldn't it ?  Any ideas of 
where to look to fix or debug this ??  I've had a look at nftldump and I 
can see the 3 sets of media headers and they seem like they are in the 
right place.

My devices are:
crw-------    1 0        0         90,   0 Jun 17  2002 /dev/mtd0
brw-------    1 0        0         93,   0 Jun 17  2002 /dev/nftla
brw-------    1 0        0         93,   1 Jun 17  2002 /dev/nftla1
brw-------    1 0        0         93,   2 Jun 17  2002 /dev/nftla2
brw-------    1 0        0         93,   3 Jun 17  2002 /dev/nftla3
brw-------    1 0        0         93,   4 Jun 17  2002 /dev/nftla4
brw-------    1 0        0         93,  16 Jun 17  2002 /dev/nftlb
brw-------    1 0        0         93,  17 Jun 17  2002 /dev/nftlb1
brw-------    1 0        0         93,  32 Jun 17  2002 /dev/nftlc
brw-------    1 0        0         93,  33 Jun 17  2002 /dev/nftlc1
brw-------    1 0        0         93,  48 Jun 17  2002 /dev/nftld
brw-------    1 0        0         93,  49 Jun 17  2002 /dev/nftld1

Do I need to patch the kernel with the latest MTD stuff or should the 
MTD stuff in linuxppc-2.4.18-pre8 be OK ??

Thanks,
Brendan Simon.
