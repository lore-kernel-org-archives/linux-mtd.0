Received: from outrelay01.libero.it ([212.52.84.101])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RFowI-0003WC-Nu
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 15:17:19 +0000
Received: from wmail24 (172.31.0.49) by outrelay01.libero.it (8.5.133)
	(authenticated as marco_cantu_ranzani@libero.it)
	id 4E3BF90A0686D267 for linux-mtd@lists.infradead.org;
	Mon, 17 Oct 2011 17:17:10 +0200
Message-ID: <29722548.1110771318864630977.JavaMail.defaultUser@defaultHost>
Date: Mon, 17 Oct 2011 17:17:10 +0200 (CEST)
From: "marco_cantu_ranzani@libero.it" <marco_cantu_ranzani@libero.it>
To: <linux-mtd@lists.infradead.org>
Subject: Error on sync / reboot
MIME-Version: 1.0
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: 7bit
Reply-To: "marco_cantu_ranzani@libero.it" <marco_cantu_ranzani@libero.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 559:512, 
written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:5, PEB 559
UBI: run torture test for PEB 559
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 560:512, 
written 0 bytes
UBI error: do_sync_erase: cannot erase PEB 559, error -5
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:5, PEB 560
UBI error: erase_worker: failed to erase PEB 559, error -5
UBI: try another PEB
UBI: mark PEB 559 as bad
nand_bbt: Error while writing bad block table -5
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 561:512, 
written 0 bytes
UBI error: ubi_io_mark_bad: cannot mark PEB 559 bad, error -5
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:5, PEB 561
UBI warning: ubi_ro_mode: switch to read-only mode
UBI: try another PEB
UBI error: ubi_io_write: read-only mode
UBI error: do_work: work failed with error code -5
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:5, PEB 562
UBI error: ubi_thread: ubi_bgt0d: work failed with error code -5
UBIFS error (pid 533): ubifs_leb_write: writing 2048 bytes to LEB 5:0 failed, 
error -30
UBIFS warning (pid 533): ubifs_ro_mode: switched to read-only mode, error -30
Backtrace: 
[<c00304d0>] (dump_backtrace+0x0/0x10c) from [<c03aea9c>] 
(dump_stack+0x18/0x1c)
 r7:00000005 r6:00000000 r5:c3817000 r4:ffffffe2
[<c03aea84>] (dump_stack+0x0/0x1c) from [<c01668ac>] (ubifs_ro_mode+0x68/0x74)
[<c0166844>] (ubifs_ro_mode+0x0/0x74) from [<c0166de8>] 
(ubifs_leb_write+0x94/0xa0)
[<c0166d54>] (ubifs_leb_write+0x0/0xa0) from [<c016ead4>] 
(ubifs_log_start_commit+0x25c/0x414)
 r7:c3817000 r6:000001c8 r5:00000000 r4:00000800
[<c016e878>] (ubifs_log_start_commit+0x0/0x414) from [<c016f3f4>] 
(do_commit+0x1e4/0x7c8)
[<c016f210>] (do_commit+0x0/0x7c8) from [<c016faa0>] 
(ubifs_run_commit+0xc8/0x158)
[<c016f9d8>] (ubifs_run_commit+0x0/0x158) from [<c0162018>] 
(ubifs_sync_fs+0x88/0xa0)
 r7:00000003 r6:000001c8 r5:c3a4b158 r4:00000000
[<c0161f90>] (ubifs_sync_fs+0x0/0xa0) from [<c00cef54>] 
(__sync_filesystem+0x4c/0x64)
 r9:c3afa000 r8:00000000 r7:c04c0084 r6:c3972e40 r5:00000001
r4:c3972e00
[<c00cef08>] (__sync_filesystem+0x0/0x64) from [<c00cf074>] 
(sync_filesystems+0x108/0x154)
 r5:c3afa000 r4:c3972e00
[<c00cef6c>] (sync_filesystems+0x0/0x154) from [<c00cf11c>] 
(sys_sync+0x24/0x48)
[<c00cf0f8>] (sys_sync+0x0/0x48) from [<c002bfa0>] (ret_fast_syscall+0x0/0x28)
UBIFS error (pid 533): do_commit: commit failed, error -30
ubUBIFS error (pid 523): ubifs_read_node: bad node type (0 but expected 1)
UBIFS error (pid 523): ubifs_read_node: bad node at LEB 20:87232, LEB mapping 
status 1
UBIFS error (pid 523): do_readpage: cannot read page 75 of inode 100, error 
-22
UBIFS error (pid 523): ubifs_read_node: bad node type (0 but expected 1)
UBIFS error (pid 523): ubifs_read_node: bad node at LEB 20:87232, LEB mapping 
status 1
UBIFS error (pid 523): do_readpage: cannot read page 75 of inode 100, error 
-22


*****************************************

Kernel 2.6.32

Architecture mini2440

!!! compiled without CONFIG_NAND_VERIFY_WRITE
