Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjHL-0002jm-Qy
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 10:51:28 +0000
Message-ID: <1363171938.11441.9.camel@sauron.fi.intel.com>
Subject: Re: 'ubi clone' from Live NAND.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bill Pringlemeir <bpringle@sympatico.ca>
Date: Wed, 13 Mar 2013 12:52:18 +0200
In-Reply-To: <BLU0-SMTP76D0EA572C27BC1C088C1FB8E40@phx.gbl>
References: <BLU0-SMTP76D0EA572C27BC1C088C1FB8E40@phx.gbl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-06 at 15:08 -0500, Bill Pringlemeir wrote:
> I have a 'ubinize' image that I have created on a PC and I have a 'raw'
> copy of the NAND flash on a 'Live' Linux distribution; the target was
> cleanly unmounted.  I use nandsim, with all my real FLASH id bytes and
> setup partitions as per the target.  Here is the sequence I follow on my
> PC.
> 
>  modprobe nandsim first_id_byte=0x2c second_id_byte=0xda third_id_byte=0x90 fourth_id_byte=0x95 parts=2,64,64
>  flash_erase /dev/mtd3 0 0
>  ubiformat /dev/mtd3 -f rootfs.ubi
>  modprobe ubi mtd=3
>  mount -t ubifs /dev/ubi0_3 /mnt/ubifs

Does it work if you do the same, but avoid flashing your 'rootfs.ubi'.
Just run 'ubiformat /dev/mtd3'. Can you mount it then, successfully do
the I/O, unmount, and remount? If that works fine, you probably did not
create 'rootfs.ubi' correctly. Double-check that you specified correct
eraseblock size, correct nand page size and subpage size.

> If 'rootfs.ubi' is the 'ubinize' image, then I can mount and see the
> file system on my PC.  However, if the 'rootfs.ubi' is a 'dump' of the
> NAND flash, I fail with the following 'dmesg',
> 
> [527676.968929] UBI: background thread "ubi_bgt0d" started, PID 5253
> [527681.522291] UBIFS error (pid 5261): ubifs_read_node: bad node type (255 but expected 6)
> [527681.522295] UBIFS error (pid 5261): ubifs_read_node: bad node at LEB 0:0, LEB mapping status 0
> [527681.522296] Not a node, first 24 bytes:
> [527681.522298] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ........................
> [527681.522301] Pid: 5261, comm: mount Tainted: P        W  O 3.5.0-25-generic #39-Ubuntu
> [527681.522302] Call Trace:
> [527681.522309]  [<ffffffffa0e8cf25>] ubifs_read_node+0x255/0x2d0 [ubifs]
> [527681.522314]  [<ffffffffa0e8a320>] ? ubifs_read_sb_node+0x30/0x90 [ubifs]
> [527681.522318]  [<ffffffffa0e8a343>] ubifs_read_sb_node+0x53/0x90 [ubifs]
> [527681.522321]  [<ffffffffa0e8a41a>] ubifs_read_superblock+0x3a/0x730 [ubifs]
> [527681.522325]  [<ffffffffa0e87a96>] ? mount_ubifs+0x3f6/0x15a0 [ubifs]
> [527681.522328]  [<ffffffffa0e87b87>] mount_ubifs+0x4e7/0x15a0 [ubifs]
> [527681.522331]  [<ffffffffa0e897ac>] ubifs_mount+0x4ac/0x730 [ubifs]
> [527681.522335]  [<ffffffff81185b63>] mount_fs+0x43/0x1b0
> [527681.522337]  [<ffffffff8119ef63>] ? find_filesystem+0x63/0x80
> [527681.522339]  [<ffffffff8119fe34>] vfs_kern_mount+0x74/0x110
> [527681.522341]  [<ffffffff811a07a4>] do_kern_mount+0x54/0x110
> [527681.522343]  [<ffffffff811a20da>] do_mount+0x26a/0x890
> [527681.522345]  [<ffffffff8113de2b>] ? strndup_user+0x5b/0x80
> [527681.522347]  [<ffffffff811a284d>] sys_mount+0x8d/0xe0
> [527681.522350]  [<ffffffff8168c969>] system_call_fastpath+0x16/0x1b

This may be a nandsim bug, but looks more like you flashed incorrect
image. You may try to do what I suggested above, and if that works,
unmount all, dump the contents of mtd3 using nanddump, and then flash it
back as you did above, and verify if that works.

> Also, the mount command fails with,
> 
> mount: wrong fs type, bad option, bad superblock on /dev/ubi0_3,
>        missing codepage or helper program, or other error
>        In some cases useful info is found in syslog - try
>        dmesg | tail  or so
> 
> Do I have to skip bad block when 'dumping' the file from the device?

Yes, although in case of nandsim there are no bad blocks.
>   Is
> there some incompatibilities between my PC ubifs and the target? 

Should not be, unless you enabled the fastmap UBI feature, in which case
you may have issues.

-- 
Best Regards,
Artem Bityutskiy
