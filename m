Received: from p01c11o149.mxlogic.net ([208.65.144.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0GHp-000654-BM
 for linux-mtd@lists.infradead.org; Thu, 26 Jun 2014 20:28:51 +0000
Message-ID: <53AC825F.7040602@lutron.com>
Date: Thu, 26 Jun 2014 16:28:15 -0400
From: Akshay Bhat <abhat@lutron.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: UBIFS Panic
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was performing a stress test on UBI file system on a ARM based 
embedded board
(Beagle Bone). We have a SLC NAND flash and the MTD_UBI_WL_THRESHOLD is 
set to
4096. I have 2 scripts running in the background in a infinite while loop:
Script1: dd if=/dev/zero of=/var/db/test bs=2M count=1
Script2: dd if=/dev/urandom of=/var/log/test bs=2M count=1 2> /dev/null
Note: The above directories are mounted as (sync,relatime).

After the running the scripts for 5 days and max_ec reached the
MTD_UBI_WL_THRESHOLD. At this point I got panic1 (see below) and the ubi 
volume
switched to read-only mode. I rebooted the board, changed the transfer 
size in
the script from 2M to 140K and the scripts ran for 2+ days and I got 
panic 2 (See
below).

What is the cause of these panics?

Thanks,
Akshay

Software versions
Kernel Version: 3.8.13 (I have not tried using the latest kernel nor any
patches)
MTD-utils version: 1.5.0

#ubinfo /dev/ubi0
ubi0
Volumes count:                           6
Logical eraseblock size:                 126976 bytes, 124.0 KiB
Total amount of logical eraseblocks:     1939 (246206464 bytes, 234.8 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  40
Current maximum erase counter value:     4736
Minimum input/output unit size:          2048 bytes
Character device major/minor:            244:0
Present volumes:                         0, 1, 2, 3, 4, 5

# mtdinfo -a
Count of MTD devices:           12
Present MTD devices:            mtd0, mtd1, mtd2, mtd3, mtd4, mtd5, 
mtd6, mtd7,
mtd8, mtd9, mtd10, mtd11
Sysfs interface supported:      yes

mtd0
Name:                           SPL1
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:0
Bad blocks are allowed:         true
Device is writable:             true

mtd1
Name:                           SPL2
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:2
Bad blocks are allowed:         true
Device is writable:             true

mtd2
Name:                           SPL3
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:4
Bad blocks are allowed:         true
Device is writable:             true

mtd3
Name:                           SPL4
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:6
Bad blocks are allowed:         true
Device is writable:             true

mtd4
Name:                           U-boot
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          8 (1048576 bytes, 1024.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:8
Bad blocks are allowed:         true
Device is writable:             true

mtd5
Name:                           U-boot Backup
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          8 (1048576 bytes, 1024.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:10
Bad blocks are allowed:         true
Device is writable:             true

mtd6
Name:                           U-Boot Environment
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:12
Bad blocks are allowed:         true
Device is writable:             true

mtd7
Name:                           Kernel
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          40 (5242880 bytes, 5.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:14
Bad blocks are allowed:         true
Device is writable:             true

mtd8
Name:                           Kernel Backup
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          40 (5242880 bytes, 5.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:16
Bad blocks are allowed:         true
Device is writable:             true

mtd9
Name:                           Device Tree
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          4 (524288 bytes, 512.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:18
Bad blocks are allowed:         true
Device is writable:             true

mtd10
Name:                           Device Tree Backup
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          4 (524288 bytes, 512.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:20
Bad blocks are allowed:         true
Device is writable:             true

mtd11
Name:                           RFS
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1939 (254148608 bytes, 242.4 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:22
Bad blocks are allowed:         true
Device is writable:             true

Panic1:
[    7.307987] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[250780.000679] UBIFS error (pid 29853): ubifs_leb_map: mapping LEB 46 
failed,
error -28
[250780.000709] UBIFS warning (pid 29853): ubifs_ro_mode: switched to 
read-only
mode, error -28
[250780.000770] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d321>]
(ubifs_leb_map+0x7d/0xb4)
[250780.000807] [<c014d321>] (ubifs_leb_map+0x7d/0xb4) from [<c01531df>]
(ubifs_add_bud_to_log+0x1bf/0x214)
[250780.000851] [<c01531df>] (ubifs_add_bud_to_log+0x1bf/0x214) from
[<c01455fd>] (make_reservation+0x12d/0x274)
[250780.000884] [<c01455fd>] (make_reservation+0x12d/0x274) from 
[<c0145d65>]
(ubifs_jnl_write_data+0xf5/0x1a4)
[250780.000918] [<c0145d65>] (ubifs_jnl_write_data+0xf5/0x1a4) from 
[<c01479b5>]
(do_writepage+0x73/0x12e)
[250780.000960] [<c01479b5>] (do_writepage+0x73/0x12e) from [<c007780f>]
(__writepage+0xb/0x26)
[250780.000993] [<c007780f>] (__writepage+0xb/0x26) from [<c0077b0b>]
(write_cache_pages+0x151/0x1e8)
[250780.001026] [<c0077b0b>] (write_cache_pages+0x151/0x1e8) from 
[<c0077bc3>]
(generic_writepages+0x21/0x36)
[250780.001057] [<c0077bc3>] (generic_writepages+0x21/0x36) from 
[<c00736bb>]
(__filemap_fdatawrite_range+0x3b/0x42)
[250780.001087] [<c00736bb>] (__filemap_fdatawrite_range+0x3b/0x42) from
[<c0073741>] (filemap_write_and_wait_range+0x21/0x4a)
[250780.001118] [<c0073741>] (filemap_write_and_wait_range+0x21/0x4a) from
[<c0147bd9>] (ubifs_fsync+0x29/0x6c)
[250780.001153] [<c0147bd9>] (ubifs_fsync+0x29/0x6c) from [<c00ac21b>]
(vfs_fsync_range+0x1b/0x24)
[250780.001184] [<c00ac21b>] (vfs_fsync_range+0x1b/0x24) from [<c00ac28d>]
(generic_write_sync+0x4d/0x54)
[250780.001214] [<c00ac28d>] (generic_write_sync+0x4d/0x54) from 
[<c0073bcd>]
(generic_file_aio_write+0x71/0x8a)
[250780.001245] [<c0073bcd>] (generic_file_aio_write+0x71/0x8a) from
[<c01471a3>] (ubifs_aio_write+0xff/0x10c)
[250780.001289] [<c01471a3>] (ubifs_aio_write+0xff/0x10c) from [<c00945ed>]
(do_sync_write+0x61/0x8c)
[250780.001324] [<c00945ed>] (do_sync_write+0x61/0x8c) from [<c0094a8f>]
(vfs_write+0x5f/0x100)
[250780.001355] [<c0094a8f>] (vfs_write+0x5f/0x100) from [<c0094c9b>]
(sys_write+0x27/0x44)
[250780.001394] [<c0094c9b>] (sys_write+0x27/0x44) from [<c000c681>]
(ret_fast_syscall+0x1/0x46)
[250780.001424] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d325>]
(ubifs_leb_map+0x81/0xb4)
[250780.001455] [<c014d325>] (ubifs_leb_map+0x81/0xb4) from [<c01531df>]
(ubifs_add_bud_to_log+0x1bf/0x214)
[250780.001487] [<c01531df>] (ubifs_add_bud_to_log+0x1bf/0x214) from
[<c01455fd>] (make_reservation+0x12d/0x274)
[250780.001519] [<c01455fd>] (make_reservation+0x12d/0x274) from 
[<c0145d65>]
(ubifs_jnl_write_data+0xf5/0x1a4)
[250780.001550] [<c0145d65>] (ubifs_jnl_write_data+0xf5/0x1a4) from 
[<c01479b5>]
(do_writepage+0x73/0x12e)
[250780.001582] [<c01479b5>] (do_writepage+0x73/0x12e) from [<c007780f>]
(__writepage+0xb/0x26)
[250780.001613] [<c007780f>] (__writepage+0xb/0x26) from [<c0077b0b>]
(write_cache_pages+0x151/0x1e8)
[250780.001644] [<c0077b0b>] (write_cache_pages+0x151/0x1e8) from 
[<c0077bc3>]
(generic_writepages+0x21/0x36)
[250780.001675] [<c0077bc3>] (generic_writepages+0x21/0x36) from 
[<c00736bb>]
(__filemap_fdatawrite_range+0x3b/0x42)
[250780.001704] [<c00736bb>] (__filemap_fdatawrite_range+0x3b/0x42) from
[<c0073741>] (filemap_write_and_wait_range+0x21/0x4a)
[250780.001735] [<c0073741>] (filemap_write_and_wait_range+0x21/0x4a) from
[<c0147bd9>] (ubifs_fsync+0x29/0x6c)
[250780.001765] [<c0147bd9>] (ubifs_fsync+0x29/0x6c) from [<c00ac21b>]
(vfs_fsync_range+0x1b/0x24)
[250780.001794] [<c00ac21b>] (vfs_fsync_range+0x1b/0x24) from [<c00ac28d>]
(generic_write_sync+0x4d/0x54)
[250780.001824] [<c00ac28d>] (generic_write_sync+0x4d/0x54) from 
[<c0073bcd>]
(generic_file_aio_write+0x71/0x8a)
[250780.001854] [<c0073bcd>] (generic_file_aio_write+0x71/0x8a) from
[<c01471a3>] (ubifs_aio_write+0xff/0x10c)
[250780.001886] [<c01471a3>] (ubifs_aio_write+0xff/0x10c) from [<c00945ed>]
(do_sync_write+0x61/0x8c)
[250780.001918] [<c00945ed>] (do_sync_write+0x61/0x8c) from [<c0094a8f>]
(vfs_write+0x5f/0x100)
[250780.001950] [<c0094a8f>] (vfs_write+0x5f/0x100) from [<c0094c9b>]
(sys_write+0x27/0x44)
[250780.001980] [<c0094c9b>] (sys_write+0x27/0x44) from [<c000c681>]
(ret_fast_syscall+0x1/0x46)
[250780.008005] UBIFS error (pid 29853): do_commit: commit failed, error -30
[250780.008037] UBIFS error (pid 29853): do_writepage: cannot write page 
501 of
inode 72, error -30
[250780.153476] UBIFS error (pid 722): ubifs_leb_map: mapping LEB 18 failed,
error -28
[250780.153505] UBIFS warning (pid 722): ubifs_ro_mode: switched to 
read-only
mode, error -28
[250780.153566] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d321>]
(ubifs_leb_map+0x7d/0xb4)
[250780.153604] [<c014d321>] (ubifs_leb_map+0x7d/0xb4) from [<c01531df>]
(ubifs_add_bud_to_log+0x1bf/0x214)
[250780.153649] [<c01531df>] (ubifs_add_bud_to_log+0x1bf/0x214) from
[<c01455fd>] (make_reservation+0x12d/0x274)
[250780.153682] [<c01455fd>] (make_reservation+0x12d/0x274) from 
[<c0145d65>]
(ubifs_jnl_write_data+0xf5/0x1a4)
[250780.153715] [<c0145d65>] (ubifs_jnl_write_data+0xf5/0x1a4) from 
[<c01479b5>]
(do_writepage+0x73/0x12e)
[250780.153756] [<c01479b5>] (do_writepage+0x73/0x12e) from [<c007780f>]
(__writepage+0xb/0x26)
[250780.153790] [<c007780f>] (__writepage+0xb/0x26) from [<c0077b0b>]
(write_cache_pages+0x151/0x1e8)
[250780.153822] [<c0077b0b>] (write_cache_pages+0x151/0x1e8) from 
[<c0077bc3>]
(generic_writepages+0x21/0x36)
[250780.153854] [<c0077bc3>] (generic_writepages+0x21/0x36) from 
[<c00736bb>]
(__filemap_fdatawrite_range+0x3b/0x42)
[250780.153884] [<c00736bb>] (__filemap_fdatawrite_range+0x3b/0x42) from
[<c0073741>] (filemap_write_and_wait_range+0x21/0x4a)
[250780.153915] [<c0073741>] (filemap_write_and_wait_range+0x21/0x4a) from
[<c0147bd9>] (ubifs_fsync+0x29/0x6c)
[250780.153950] [<c0147bd9>] (ubifs_fsync+0x29/0x6c) from [<c00ac21b>]
(vfs_fsync_range+0x1b/0x24)
[250780.153980] [<c00ac21b>] (vfs_fsync_range+0x1b/0x24) from [<c00ac28d>]
(generic_write_sync+0x4d/0x54)
[250780.154009] [<c00ac28d>] (generic_write_sync+0x4d/0x54) from 
[<c0073bcd>]
(generic_file_aio_write+0x71/0x8a)
[250780.154040] [<c0073bcd>] (generic_file_aio_write+0x71/0x8a) from
[<c01471a3>] (ubifs_aio_write+0xff/0x10c)
[250780.154084] [<c01471a3>] (ubifs_aio_write+0xff/0x10c) from [<c00945ed>]
(do_sync_write+0x61/0x8c)
[250780.154119] [<c00945ed>] (do_sync_write+0x61/0x8c) from [<c0094a8f>]
(vfs_write+0x5f/0x100)
[250780.154150] [<c0094a8f>] (vfs_write+0x5f/0x100) from [<c0094c9b>]
(sys_write+0x27/0x44)
[250780.154188] [<c0094c9b>] (sys_write+0x27/0x44) from [<c000c681>]
(ret_fast_syscall+0x1/0x46)
[250780.154218] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d325>]
(ubifs_leb_map+0x81/0xb4)
[250780.154248] [<c014d325>] (ubifs_leb_map+0x81/0xb4) from [<c01531df>]
(ubifs_add_bud_to_log+0x1bf/0x214)
[250780.154281] [<c01531df>] (ubifs_add_bud_to_log+0x1bf/0x214) from
[<c01455fd>] (make_reservation+0x12d/0x274)
[250780.154312] [<c01455fd>] (make_reservation+0x12d/0x274) from 
[<c0145d65>]
(ubifs_jnl_write_data+0xf5/0x1a4)
[250780.154344] [<c0145d65>] (ubifs_jnl_write_data+0xf5/0x1a4) from 
[<c01479b5>]
(do_writepage+0x73/0x12e)
[250780.154478] [<c01479b5>] (do_writepage+0x73/0x12e) from [<c007780f>]
(__writepage+0xb/0x26)
[250780.154512] [<c007780f>] (__writepage+0xb/0x26) from [<c0077b0b>]
(write_cache_pages+0x151/0x1e8)
[250780.154543] [<c0077b0b>] (write_cache_pages+0x151/0x1e8) from 
[<c0077bc3>]
(generic_writepages+0x21/0x36)
[250780.154575] [<c0077bc3>] (generic_writepages+0x21/0x36) from 
[<c00736bb>]
(__filemap_fdatawrite_range+0x3b/0x42)
[250780.154605] [<c00736bb>] (__filemap_fdatawrite_range+0x3b/0x42) from
[<c0073741>] (filemap_write_and_wait_range+0x21/0x4a)
[250780.154636] [<c0073741>] (filemap_write_and_wait_range+0x21/0x4a) from
[<c0147bd9>] (ubifs_fsync+0x29/0x6c)
[250780.154666] [<c0147bd9>] (ubifs_fsync+0x29/0x6c) from [<c00ac21b>]
(vfs_fsync_range+0x1b/0x24)
[250780.154695] [<c00ac21b>] (vfs_fsync_range+0x1b/0x24) from [<c00ac28d>]
(generic_write_sync+0x4d/0x54)
[250780.154724] [<c00ac28d>] (generic_write_sync+0x4d/0x54) from 
[<c0073bcd>]
(generic_file_aio_write+0x71/0x8a)
[250780.154755] [<c0073bcd>] (generic_file_aio_write+0x71/0x8a) from
[<c01471a3>] (ubifs_aio_write+0xff/0x10c)
[250780.154788] [<c01471a3>] (ubifs_aio_write+0xff/0x10c) from [<c00945ed>]
(do_sync_write+0x61/0x8c)
[250780.154820] [<c00945ed>] (do_sync_write+0x61/0x8c) from [<c0094a8f>]
(vfs_write+0x5f/0x100)
[250780.154851] [<c0094a8f>] (vfs_write+0x5f/0x100) from [<c0094c9b>]
(sys_write+0x27/0x44)
[250780.154883] [<c0094c9b>] (sys_write+0x27/0x44) from [<c000c681>]
(ret_fast_syscall+0x1/0x46)
[250780.158234] UBIFS error (pid 29885): make_reservation: cannot 
reserve 216
bytes in jhead 1, error -30
[250780.158443] UBIFS error (pid 722): do_commit: commit failed, error -30
[250780.158473] UBIFS error (pid 722): do_writepage: cannot write page 0 of
inode 77, error -30
[250799.438458] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250799.438494] UBIFS error (pid 620): do_writepage: cannot write page 
502 of
inode 72, error -30
[250804.437920] UBIFS error (pid 620): make_reservation: cannot reserve 450
bytes in jhead 2, error -30
[250804.437955] UBIFS error (pid 620): do_writepage: cannot write page 48 of
inode 5566, error -30
[250829.438391] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250829.438427] UBIFS error (pid 620): do_writepage: cannot write page 
503 of
inode 72, error -30
[250834.438388] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250834.438424] UBIFS error (pid 620): do_writepage: cannot write page 
504 of
inode 72, error -30
[250839.438350] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250839.438386] UBIFS error (pid 620): do_writepage: cannot write page 
505 of
inode 72, error -30
[250844.438359] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250844.438396] UBIFS error (pid 620): do_writepage: cannot write page 
506 of
inode 72, error -30
[250849.438449] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250849.438485] UBIFS error (pid 620): do_writepage: cannot write page 
507 of
inode 72, error -30
[250854.438453] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250854.438488] UBIFS error (pid 620): do_writepage: cannot write page 
508 of
inode 72, error -30
[250859.438390] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250859.438426] UBIFS error (pid 620): do_writepage: cannot write page 
509 of
inode 72, error -30
[250864.438373] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250864.438410] UBIFS error (pid 620): do_writepage: cannot write page 
510 of
inode 72, error -30
[250869.438371] UBIFS error (pid 620): make_reservation: cannot reserve 4144
bytes in jhead 2, error -30
[250869.438407] UBIFS error (pid 620): do_writepage: cannot write page 
511 of
inode 72, error -30
[251162.922358] UBIFS error (pid 14262): ubifs_leb_map: mapping LEB 816 
failed,
error -28
[251162.922389] UBIFS warning (pid 14262): ubifs_ro_mode: switched to 
read-only
mode, error -28
[251162.922449] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d321>]
(ubifs_leb_map+0x7d/0xb4)
[251162.922486] [<c014d321>] (ubifs_leb_map+0x7d/0xb4) from [<c01531df>]
(ubifs_add_bud_to_log+0x1bf/0x214)
[251162.922529] [<c01531df>] (ubifs_add_bud_to_log+0x1bf/0x214) from
[<c01455fd>] (make_reservation+0x12d/0x274)
[251162.922562] [<c01455fd>] (make_reservation+0x12d/0x274) from 
[<c01467ab>]
(ubifs_jnl_truncate+0x243/0x420)
[251162.922597] [<c01467ab>] (ubifs_jnl_truncate+0x243/0x420) from 
[<c0147e67>]
(ubifs_setattr+0x197/0x2cc)
[251162.922637] [<c0147e67>] (ubifs_setattr+0x197/0x2cc) from [<c00a37df>]
(notify_change+0x18b/0x240)
[251162.922681] [<c00a37df>] (notify_change+0x18b/0x240) from [<c0093a5b>]
(do_truncate+0x4d/0x62)
[251162.922724] [<c0093a5b>] (do_truncate+0x4d/0x62) from [<c009cc0f>]
(do_last.isra.29+0x637/0x700)
[251162.922758] [<c009cc0f>] (do_last.isra.29+0x637/0x700) from [<c009cd4f>]
(path_openat+0x77/0x2b0)
[251162.922790] [<c009cd4f>] (path_openat+0x77/0x2b0) from [<c009d12d>]
(do_filp_open+0x1b/0x4a)
[251162.922823] [<c009d12d>] (do_filp_open+0x1b/0x4a) from [<c0094453>]
(do_sys_open+0xbd/0x126)
[251162.922863] [<c0094453>] (do_sys_open+0xbd/0x126) from [<c000c681>]
(ret_fast_syscall+0x1/0x46)
[251162.922894] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d325>]
(ubifs_leb_map+0x81/0xb4)
[251162.922980] [<c014d325>] (ubifs_leb_map+0x81/0xb4) from [<c01531df>]
(ubifs_add_bud_to_log+0x1bf/0x214)
[251162.923013] [<c01531df>] (ubifs_add_bud_to_log+0x1bf/0x214) from
[<c01455fd>] (make_reservation+0x12d/0x274)
[251162.923046] [<c01455fd>] (make_reservation+0x12d/0x274) from 
[<c01467ab>]
(ubifs_jnl_truncate+0x243/0x420)
[251162.923078] [<c01467ab>] (ubifs_jnl_truncate+0x243/0x420) from 
[<c0147e67>]
(ubifs_setattr+0x197/0x2cc)
[251162.923111] [<c0147e67>] (ubifs_setattr+0x197/0x2cc) from [<c00a37df>]
(notify_change+0x18b/0x240)
[251162.923143] [<c00a37df>] (notify_change+0x18b/0x240) from [<c0093a5b>]
(do_truncate+0x4d/0x62)
[251162.923176] [<c0093a5b>] (do_truncate+0x4d/0x62) from [<c009cc0f>]
(do_last.isra.29+0x637/0x700)
[251162.923209] [<c009cc0f>] (do_last.isra.29+0x637/0x700) from [<c009cd4f>]
(path_openat+0x77/0x2b0)
[251162.923241] [<c009cd4f>] (path_openat+0x77/0x2b0) from [<c009d12d>]
(do_filp_open+0x1b/0x4a)
[251162.923273] [<c009d12d>] (do_filp_open+0x1b/0x4a) from [<c0094453>]
(do_sys_open+0xbd/0x126)
[251162.923304] [<c0094453>] (do_sys_open+0xbd/0x126) from [<c000c681>]
(ret_fast_syscall+0x1/0x46)
[251162.925980] UBIFS error (pid 14262): do_commit: commit failed, error -30

Panic 2:
[81258.398060] UBIFS error (pid 292): ubifs_leb_write: writing 2048 
bytes to LEB
4:0 failed, error -28
[81258.398089] UBIFS warning (pid 292): ubifs_ro_mode: switched to read-only
mode, error -28
[81258.398164] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d0df>]
(ubifs_leb_write+0x8b/0xd8)
[81258.398205] [<c014d0df>] (ubifs_leb_write+0x8b/0xd8) from [<c0153339>]
(ubifs_log_start_commit+0x105/0x268)
[81258.398238] [<c0153339>] (ubifs_log_start_commit+0x105/0x268) from
[<c0153d4d>] (do_commit+0x147/0x3da)
[81258.398267] [<c0153d4d>] (do_commit+0x147/0x3da) from [<c015415d>]
(ubifs_bg_thread+0xd7/0x106)
[81258.398307] [<c015415d>] (ubifs_bg_thread+0xd7/0x106) from [<c003cd5b>]
(kthread+0x61/0x72)
[81258.398347] [<c003cd5b>] (kthread+0x61/0x72) from [<c000c73d>]
(ret_from_fork+0x11/0x34)
[81258.398380] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d0e3>]
(ubifs_leb_write+0x8f/0xd8)
[81258.398412] [<c014d0e3>] (ubifs_leb_write+0x8f/0xd8) from [<c0153339>]
(ubifs_log_start_commit+0x105/0x268)
[81258.398441] [<c0153339>] (ubifs_log_start_commit+0x105/0x268) from
[<c0153d4d>] (do_commit+0x147/0x3da)
[81258.398471] [<c0153d4d>] (do_commit+0x147/0x3da) from [<c015415d>]
(ubifs_bg_thread+0xd7/0x106)
[81258.398502] [<c015415d>] (ubifs_bg_thread+0xd7/0x106) from [<c003cd5b>]
(kthread+0x61/0x72)
[81258.398595] [<c003cd5b>] (kthread+0x61/0x72) from [<c000c73d>]
(ret_from_fork+0x11/0x34)
[81258.398619] UBIFS error (pid 292): do_commit: commit failed, error -28
[81260.895318] UBIFS error (pid 621): make_reservation: cannot reserve 
250 bytes
in jhead 2, error -30
[81260.895350] UBIFS error (pid 621): do_writepage: cannot write page 2 
of inode
11356, error -30
[81285.894788] UBIFS error (pid 621): make_reservation: cannot reserve 
160 bytes
in jhead 1, error -30
[81285.894820] UBIFS error (pid 621): ubifs_write_inode: can't write 
inode 5586,
error -30
[81438.783604] UBIFS error (pid 31441): ubifs_leb_map: mapping LEB 27 
failed,
error -28
[81438.783634] UBIFS warning (pid 31441): ubifs_ro_mode: switched to 
read-only
mode, error -28
[81438.783693] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d321>]
(ubifs_leb_map+0x7d/0xb4)
[81438.783731] [<c014d321>] (ubifs_leb_map+0x7d/0xb4) from [<c01531df>]
(ubifs_add_bud_to_log+0x1bf/0x214)
[81438.783775] [<c01531df>] (ubifs_add_bud_to_log+0x1bf/0x214) from 
[<c01455fd>]
(make_reservation+0x12d/0x274)
[81438.783808] [<c01455fd>] (make_reservation+0x12d/0x274) from [<c0145e6b>]
(ubifs_jnl_write_inode+0x57/0x138)
[81438.783842] [<c0145e6b>] (ubifs_jnl_write_inode+0x57/0x138) from 
[<c014a225>]
(ubifs_write_inode+0x69/0xcc)
[81438.783875] [<c014a225>] (ubifs_write_inode+0x69/0xcc) from [<c0147b43>]
(ubifs_writepage+0xd3/0x140)
[81438.783916] [<c0147b43>] (ubifs_writepage+0xd3/0x140) from [<c007780f>]
(__writepage+0xb/0x26)
[81438.783950] [<c007780f>] (__writepage+0xb/0x26) from [<c0077b0b>]
(write_cache_pages+0x151/0x1e8)
[81438.783982] [<c0077b0b>] (write_cache_pages+0x151/0x1e8) from 
[<c0077bc3>]
(generic_writepages+0x21/0x36)
[81438.784014] [<c0077bc3>] (generic_writepages+0x21/0x36) from [<c00736bb>]
(__filemap_fdatawrite_range+0x3b/0x42)
[81438.784044] [<c00736bb>] (__filemap_fdatawrite_range+0x3b/0x42) from
[<c0073741>] (filemap_write_and_wait_range+0x21/0x4a)
[81438.784075] [<c0073741>] (filemap_write_and_wait_range+0x21/0x4a) from
[<c0147bd9>] (ubifs_fsync+0x29/0x6c)
[81438.784109] [<c0147bd9>] (ubifs_fsync+0x29/0x6c) from [<c00ac21b>]
(vfs_fsync_range+0x1b/0x24)
[81438.784140] [<c00ac21b>] (vfs_fsync_range+0x1b/0x24) from [<c00ac28d>]
(generic_write_sync+0x4d/0x54)
[81438.784170] [<c00ac28d>] (generic_write_sync+0x4d/0x54) from [<c0073bcd>]
(generic_file_aio_write+0x71/0x8a)
[81438.784201] [<c0073bcd>] (generic_file_aio_write+0x71/0x8a) from 
[<c01471a3>]
(ubifs_aio_write+0xff/0x10c)
[81438.784245] [<c01471a3>] (ubifs_aio_write+0xff/0x10c) from [<c00945ed>]
(do_sync_write+0x61/0x8c)
[81438.784280] [<c00945ed>] (do_sync_write+0x61/0x8c) from [<c0094a8f>]
(vfs_write+0x5f/0x100)
[81438.784312] [<c0094a8f>] (vfs_write+0x5f/0x100) from [<c0094c9b>]
(sys_write+0x27/0x44)
[81438.784350] [<c0094c9b>] (sys_write+0x27/0x44) from [<c000c681>]
(ret_fast_syscall+0x1/0x46)
[81438.784380] [<c00104b1>] (unwind_backtrace+0x1/0x8c) from [<c014d325>]
(ubifs_leb_map+0x81/0xb4)
[81438.784411] [<c014d325>] (ubifs_leb_map+0x81/0xb4) from [<c01531df>]
(ubifs_add_bud_to_log+0x1bf/0x214)
[81438.784442] [<c01531df>] (ubifs_add_bud_to_log+0x1bf/0x214) from 
[<c01455fd>]
(make_reservation+0x12d/0x274)
[81438.784474] [<c01455fd>] (make_reservation+0x12d/0x274) from [<c0145e6b>]
(ubifs_jnl_write_inode+0x57/0x138)
[81438.784505] [<c0145e6b>] (ubifs_jnl_write_inode+0x57/0x138) from 
[<c014a225>]
(ubifs_write_inode+0x69/0xcc)
[81438.784537] [<c014a225>] (ubifs_write_inode+0x69/0xcc) from [<c0147b43>]
(ubifs_writepage+0xd3/0x140)
[81438.784569] [<c0147b43>] (ubifs_writepage+0xd3/0x140) from [<c007780f>]
(__writepage+0xb/0x26)
[81438.784600] [<c007780f>] (__writepage+0xb/0x26) from [<c0077b0b>]
(write_cache_pages+0x151/0x1e8)
[81438.784632] [<c0077b0b>] (write_cache_pages+0x151/0x1e8) from 
[<c0077bc3>]
(generic_writepages+0x21/0x36)
[81438.784662] [<c0077bc3>] (generic_writepages+0x21/0x36) from [<c00736bb>]
(__filemap_fdatawrite_range+0x3b/0x42)
[81438.784693] [<c00736bb>] (__filemap_fdatawrite_range+0x3b/0x42) from
[<c0073741>] (filemap_write_and_wait_range+0x21/0x4a)
[81438.784724] [<c0073741>] (filemap_write_and_wait_range+0x21/0x4a) from
[<c0147bd9>] (ubifs_fsync+0x29/0x6c)
[81438.784754] [<c0147bd9>] (ubifs_fsync+0x29/0x6c) from [<c00ac21b>]
(vfs_fsync_range+0x1b/0x24)
[81438.784783] [<c00ac21b>] (vfs_fsync_range+0x1b/0x24) from [<c00ac28d>]
(generic_write_sync+0x4d/0x54)
[81438.784812] [<c00ac28d>] (generic_write_sync+0x4d/0x54) from [<c0073bcd>]
(generic_file_aio_write+0x71/0x8a)
[81438.784843] [<c0073bcd>] (generic_file_aio_write+0x71/0x8a) from 
[<c01471a3>]
(ubifs_aio_write+0xff/0x10c)
[81438.784876] [<c01471a3>] (ubifs_aio_write+0xff/0x10c) from [<c00945ed>]
(do_sync_write+0x61/0x8c)
[81438.784909] [<c00945ed>] (do_sync_write+0x61/0x8c) from [<c0094a8f>]
(vfs_write+0x5f/0x100)
[81438.784940] [<c0094a8f>] (vfs_write+0x5f/0x100) from [<c0094c9b>]
(sys_write+0x27/0x44)
[81438.784972] [<c0094c9b>] (sys_write+0x27/0x44) from [<c000c681>]
(ret_fast_syscall+0x1/0x46)
[81438.785011] UBIFS error (pid 31441): do_commit: commit failed, error -30
[81438.785034] UBIFS error (pid 31441): ubifs_write_inode: can't write 
inode 79,
error -30
