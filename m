Received: from natpool.ud.com ([65.112.245.211] helo=jikku-lt.corp.ud.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16njP2-0005Vm-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 16:57:32 +0000
Received: from infinity-studios.com (localhost.localdomain [127.0.0.1])
	by jikku-lt.corp.ud.com (8.11.6/8.11.6) with ESMTP id g2KGuTP12011
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 10:56:30 -0600
Message-ID: <3C98BF3D.7030006@infinity-studios.com>
Date: Wed, 20 Mar 2002 10:56:29 -0600
From: Dzuy Nguyen <dzuy@infinity-studios.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd device clarification
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

Can someone clarify what these device files are:

/dev/mtd*
/dev/mtdblock*
/dev/nftla*

I have a 16MB DoC.  My plan is to store a compressed root FS on the DoC 
flash and run the OS from
ramdisk.  I've erase the entire DoC, nftl_format the latter half of the 
DoC, make an ext2 FS on it,
and copy the kernel there.  I put my compressed root FS onto the flash 
section (first 8MB) with a
1024 offset:

# dd if=rootfs.gz of=/dev/mtd0 bs=1k seek=1024

I then tell the kernel where to get the rootfs

# rdev -r <kernel> 17408
# rdev <kernel> /dev/<which device file here?>

I've tried /dev/ramdisk, /dev/nftla and the kernel complains that it 
"Couldn't find valid RAM disk image
at 1024".
I've tried /dev/mtdblock0 (as in HOWTO) and I get I/O error from 
end_request.

I've read the bootdisk HOWTO (for /dev/fd0) and I think I can do the 
same for the DoC if I can just tell
the kernel where to get the compressed root FS.  Thanks for any advice.

Dzuy
