Received: from mail024.syd.optusnet.com.au ([210.49.20.148])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bzmP-0005cP-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 09:33:26 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail024.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g768XLK13957
	for <linux-mtd@lists.infradead.org>; Tue, 6 Aug 2002 18:33:21 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=ctam.com.au)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 17bzmK-0004lW-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 18:33:20 +1000
Message-ID: <3D4F89CF.3010809@ctam.com.au>
Date: Tue, 06 Aug 2002 18:33:19 +1000
From: Brendan J Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: kernel hangs on DOC2000 root filesystem
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

I'm having trouble getting a linux-2.4.18-pre8 PowerPC kernel booting 
from a DOC2000 device.  A similar kernel boots fine using an NFS root 
filesystem.  I can then do a modprobe nftl and read/write to the DOC 
fine.  The only difference between the 2 kernels is that the MTD. 
DOC2000 and NFTL drivers are built into one kernel and are modules on 
the other.

Any ideas why the kernel just hangs ?

Thanks,
Brendan Simon.

Here is a log of the console during boot with some extra printk messages.


CPM UART driver version 0.01
ttyS00 at 0x1040 is a SMC
ttyS01 at 0x8300 is a SCC
pty: 256 Unix98 ptys configured
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
NET4: Frame Diverter 0.46
rx_bd_base = c01a7208, tx_bd_base = c01a7288
fec: Phy @ 0x0, type 0x001378e1
FCC Startup....
Control register = 3100
Full Duplex mode
FCC3: eth0: FCC ENET Version 0.2, 00:d0:1f:20:69:bf
Cronyx Ltd, Synchronous PPP and CISCO HDLC (c) 1994
Linux port (c) 1998 Building Number Three Ltd & Jan "Yenya" Kasprzak.
Using configured DiskOnChip probe address 0xf02c0000
DiskOnChip 2000 found at address 0xF02C0000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
2 flash chips found. Total DiskOnChip size: 32 MiB
NFTL driver: nftlcore.c $Revision: 1.3 $, nftlmount.c $Revision: 1.6 $
Partition check:
 nftla: nftla1 nftla2
IEEE 802.2 LLC for Linux 2.1 (c) 1996 Tim Alpaerts
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
Linux IP multicast router 0.06 plus PIM-SM
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
prepare_namespace()
 >>>>>>>> BJS: mount_root()
 >>>>>>>> BJS: mount_root(): __getname()
 >>>>>>>> BJS: mount_root(): __getname()
 >>>>>>>> BJS: mount_root(): devfs_find_handle()
 >>>>>>>> BJS: mount_root(): bdget()
 >>>>>>>> BJS: mount_root(): devfs_get_ops()
 >>>>>>>> BJS: mount_root(): devfs_generate_path()
 >>>>>>>> BJS: mount_root(): blkdev_get()
 >>>>>>>> BJS: mount_root(): check_disk_change()
 >>>>>>>> BJS: mount_root(): get_super()
 >>>>>>>> BJS: get_super():
 >>>>>>>> BJS: get_super(): spin_lock()
 >>>>>>>> BJS: get_super(): find_super()
 >>>>>>>> BJS: get_super(): spin_unlock()
 >>>>>>>> BJS: get_super(): return(NULL)
 >>>>>>>> BJS: mount_root(): fs_name = ext2
 >>>>>>>> BJS: mount_root(): atomic_inc()
 >>>>>>>> BJS: mount_root(): blkdev_get()
 >>>>>>>> BJS: mount_root(): read_super()
 >>>>>>>> BJS: mount_root(): put_filesystem()
 >>>>>>>> BJS: mount_root(): blkdev_put()
 >>>>>>>> BJS: blkdev_put(): down()
 >>>>>>>> BJS: blkdev_put(): lock()
 >>>>>>>> BJS: blkdev_put(): fsync_no_super()
 >>>>>>>> BJS: blkdev_put(): release()
 >>>>>>>> BJS: nftl_release():
 >>>>>>>> BJS: nftl_release():
 >>>>>>>> BJS: nftl_release(): invalidate_device()
 >>>>>>>> BJS: invalidate_device():
 >>>>>>>> BJS: invalidate_device(): fsync_dev()
 >>>>>>>> BJS: fsync_dev(): sync_buffers()
 >>>>>>>> BJS: fsync_dev(): lock_kernel()
 >>>>>>>> BJS: fsync_dev(): sync_inodes()
 >>>>>>>> BJS: sync_inodes():
 >>>>>>>> BJS: sync_inodes(): get_super()
 >>>>>>>> BJS: get_super():
 >>>>>>>> BJS: get_super(): spin_lock()
 >>>>>>>> BJS: get_super(): find_super()
 >>>>>>>> BJS: get_super(): spin_unlock()
 >>>>>>>> BJS: get_super(): down_read()
 >>>>>>>> BJS: rwsem_down_read_failed(): rwsemtrace(enter)
 >>>>>>>> BJS: rwsem_down_read_failed(): rwsem_down_failed_common()
 >>>>>>>> BJS: rwsem_down_failed_common(): set_tast_state()
 >>>>>>>> BJS: rwsem_down_failed_common(): spin_lock()
 >>>>>>>> BJS: rwsem_down_failed_common(): list_add_tail()
 >>>>>>>> BJS: rwsem_down_failed_common(): rwsem_atomic_update()
 >>>>>>>> BJS: rwsem_down_failed_common(): spin_unlock()
 >>>>>>>> BJS: rwsem_down_failed_common(): schedule()
