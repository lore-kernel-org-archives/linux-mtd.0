Received: from smtpout10-04.prod.mesa1.secureserver.net ([64.202.165.238]
	helo=smtpout10.prod.mesa1.secureserver.net)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJBS4-0000Kh-My
	for linux-mtd@lists.infradead.org; Thu, 09 Aug 2007 13:05:40 -0400
Message-ID: <46BB498D.9040707@techmoninc.com>
Date: Thu, 09 Aug 2007 12:06:21 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 (DOC 2000) woes.
References: <46B76F31.6020507@techmoninc.com> <46B9EE9B.7060805@techmoninc.com>
	<46BB21F1.3060109@techmoninc.com>
In-Reply-To: <46BB21F1.3060109@techmoninc.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

More information:

An oops on my locale computer as I was attempting to make a jumpdrive 
back to an vfat filesystem.  I needed to recreate the partition so I 
typed the following:

root@Andy:/# fdisk /dev/sdb1

Obliviously my mistake is just adding the partition number to the device 
-- it happens.  I get the following error:

Device contains neither a valid DOS partition table, nor Sun, SGI or OSF 
disklabel
Building a new DOS disklabel. Changes will remain in memory only,
until you decide to write them. After that, of course, the previous
content won't be recoverable.

Warning: invalid flag 0x0000 of partition table 4 will be corrected by 
w(rite)


I quit out of it but realize that this is the SAME error that I get on 
the DiskOnChip.  So, to me it looks like I'm hitting the first partition 
of the nftl in place of the device base.  This is the command I use:


root@winsys:~# modprobe nftl
root@winsys:~# fdisk /dev/nftla

And here are the results:

Device contains neither a valid DOS partition table, nor Sun, SGI or OSF 
disklabel
Building a new DOS disklabel. Changes will remain in memory only,
until you decide to write them. After that, of course, the previous
content won't be recoverable.

Warning: invalid flag 0x0000 of partition table 4 will be corrected by 
w(rite)

Command (m for help): q


So, am I getting the wrong device from the driver?  I cannot update the 
partition table on this unit -- it would make sense to me if I'm 
attempting to put a partition on the device /dev/nftla1 in place of 
/dev/nftla.  I created the block devices nftla{,1,2} using:
mknod /dev/nftla b 93 0
and I end up with a device:
brw-rw---- 1 root disk 93, 0 2007-08-09 10:52 /dev/nftla
So, am I seeing a driver error or am I the error?

Any help would be greatly appreciated.

Andy
