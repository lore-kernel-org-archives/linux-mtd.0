Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HqqDa-0005J9-T7
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 13:45:35 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HqqDQ-0000nR-OE
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 14:45:20 +0200
Received: from 82-69-61-204.dsl.in-addr.zen.co.uk ([82.69.61.204])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 May 2007 14:45:20 +0200
Received: from mw_phil by 82-69-61-204.dsl.in-addr.zen.co.uk with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 May 2007 14:45:20 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: JFFS2 softlinks problem - repost from email
Date: Wed, 23 May 2007 12:45:07 +0000 (UTC)
Message-ID: <loom.20070523T143527-245@post.gmane.org>
References: <20070519115535.A8761@hnilux.racom.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jakub Bednar <bednar <at> hnilux.racom.cz> writes:

>MikeW <mw_phil <at> yahoo.co.uk> writes:
> 
> What do you mean by,
> "I fill the NAND JFFS2 partition with data several times ..." ?
> 
> I presume the links you refer to are symbolic links (ln -s ...)
> 
> You should describe the procedure you use (including setting up the links,
> and "filling the partition with data several times") and the problems you
> observe, What exactly "stops working" - apart from access to files on the
> affected partition(s) ?
> 
> Regards,
> MikeW
> 

Jakub Bednar <bednar <at> hnilux.racom.cz> writes:

Sorry, I'll try to be more clear.

I have a board based on AMD DBAu1550 boards.
I'm using buildroot from November 2006 with
Linux 2.6.16.20.

The cramfs initrd image is created with mkcramfs and
concatenated with the kernel. At boottime, kernel
finds CRAMFS_MAGIC and creates a mtd partition containing
this image and boots it as first rootfs.

JFFS2 partition is created from desired tree.
In the tree there are soft links e.g. ln -sf /var/log /tmp/log;
The tree is then compressed
build machine: tar -zcf pkg.tgz tree/*
build machine: cat pkg.tgz | ssh target_machine "cat - > /tmp/pkg.tgz"
(tmpfs) 
target machine: flash_erase mtd0 0x00 48;
target machine: mount -t jffs2 /dev/mtd0 /mnt;
target machine: tar -ztf /tmp/pkg.tgz; #cheks the tarbal ...
target machine: tar -zxf /tmp/pkg.tgz -C /mnt/

There are other checks (sync, remount mtd0 ro ...)
target machine: pivot_root /mnt /mnt/rom

Now the jffs2 become rootfs and /sbin and /bin are soft
links to /rom/sbin and /rom/bin (the initrd). 
The system now works OK. It's using some staff from 
one of NAND partitions as well without any problems.

Now the test on the NAND flash
target machine: flash_eraseall -j /dev/mtd6
target machine: mount -t jffs2 mtd6 /mnt2
and runing script as follows:
	while [ 1 ]; do 
		cat /dev/urandom > /mnt2/file; # fills up the fs
		rm /mnt2/file; #frees it again
	done;
(The script using dd with 512kB files causes the same error but it
takes more time) The error sometimes occur in the first loop of
this script after reboot, sometimes later.

After a while many things goes wrong and each time goes wrong something
else.

1. cd /root/.ssh (which is in jffs2 NOR flash) 
   return Input/Output Error
2. disappears /var/log (which is a soft link in jffs2 NOR flash 
   created with ln -s into /tmp - tmpfs ) 
3. disappear all links from /usr/sbin (cramfs initrd image) 
   to /usr/sbin/busybox

The JFFS2 erase block size is set correctly and its using priority 
compression. I know I'm not using the newest JFFS2 and I'm ready
to work on Linux 2.6.20 to put it into buildroot and hopefully it
will solve my trouble. But If You know what causes this problem and
how to fix it. Or if You know that in 2.6.20 it will do the same.
It will be really helpful to me.

Thank You very mych.

Regards,

Jakub
