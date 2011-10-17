Received: from outrelay01.libero.it ([212.52.84.101])
 by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RFp6i-0003eN-Ob
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 15:28:05 +0000
Received: from wmail24 (172.31.0.49) by outrelay01.libero.it (8.5.133)
 (authenticated as marco_cantu_ranzani@libero.it)
 id 4E3BF90A06874CC5 for linux-mtd@lists.infradead.org;
 Mon, 17 Oct 2011 17:28:03 +0200
Message-ID: <14846627.1117531318865283953.JavaMail.defaultUser@defaultHost>
From: "marco_cantu_ranzani@libero.it" <marco_cantu_ranzani@libero.it>
To: linux-mtd@lists.infradead.org
Subject: Re: Re: Error on sync / reboot
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
Date: Mon, 17 Oct 2011 15:28:05 -0000

On poweroff:
---------------------------------

UBI error: do_sync_erase: cannot erase PEB 559, error -5
UBI error: erase_worker: failed to erase PEB 559, error -5
UBI: mark PEB 559 as bad
nand_bbt: Error while writing bad block table -5
UBI error: ubi_io_mark_bad: cannot mark PEB 559 bad, error -5
UBI warning: ubi_ro_mode: switch to read-only mode
UBI error: do_work: work failed with error code -5
UBI error: ubi_thread: ubi_bgt0d: work failed with error code -5
 UBIFS error (pid 536): ubifs_check_node: bad magic 0x000000, expected 
0x6101831
UBIFS error (pid 536): ubifs_check_node: bad node at LEB 11:32720
UBIFS error (pid 536): ubifs_read_node: expected node type 0
UBIFS error (pid 536): ubifs_iget: failed to read inode 143, error -117
UBIFS error (pid 536): ubifs_lookup: dead directory entry 'umount', error -117
UBIFS warning (pid 536): ubifs_ro_mode: switched to read-only mode, error -117
Backtrace: 
[<c00304d0>] (dump_backtrace+0x0/0x10c) from [<c03aea9c>] 
(dump_stack+0x18/0x1c)
 r7:c3a51800 r6:c340e5e0 r5:c343aa00 r4:ffffff8b
[<c03aea84>] (dump_stack+0x0/0x1c) from [<c01668ac>] (ubifs_ro_mode+0x68/0x74)
[<c0166844>] (ubifs_ro_mode+0x0/0x74) from [<c01602d8>] 
(ubifs_lookup+0x138/0x148)
[<c01601a0>] (ubifs_lookup+0x0/0x148) from [<c00b3928>] 
(do_lookup+0x1a8/0x1c4)
 r8:c340e5e0 r7:c3b5bde0 r6:c340b480 r5:c3b5be88 r4:c343aa00
[<c00b3780>] (do_lookup+0x0/0x1c4) from [<c00b54b8>] 
(__link_path_walk+0x71c/0xfe0)
[<c00b4d9c>] (__link_path_walk+0x0/0xfe0) from [<c00b5f5c>] 
(path_walk+0x50/0xa0)
[<c00b5f0c>] (path_walk+0x0/0xa0) from [<c00b606c>] (do_path_lookup+0x50/0x58)
 r7:ffffff9c r6:00000000 r5:c3a59000 r4:c3b5be88
[<c00b601c>] (do_path_lookup+0x0/0x58) from [<c00b6d04>] 
(do_filp_open+0xac/0x890)
 r7:ffffff9c r6:00020021 r5:c3a59000 r4:00000001
[<c00b6c58>] (do_filp_open+0x0/0x890) from [<c00b0990>] (open_exec+0x2c/0xbc)
[<c00b0964>] (open_exec+0x0/0xbc) from [<c00b0efc>] (do_execve+0xb0/0x334)
 r6:c3b49800 r5:c3a59000 r4:00000000
[<c00b0e4c>] (do_execve+0x0/0x334) from [<c002f62c>] (sys_execve+0x3c/0x5c)
[<c002f5f0>] (sys_execve+0x0/0x5c) from [<c002bfa0>] 
(ret_fast_syscall+0x0/0x28)
 r7:0000000b r6:beb4aa7c r5:40059ef4 r4:00000000
UBIFS error (pid 537): ubifs_check_node: bad magic 0x000000, expected 
0x6101831
UBIFS error (pid 537): ubifs_check_node: bad node at LEB 23:1
                                                             UBIFS error (pid 
537): ubifs_read_node: expected node type 0
UBIFS error (pid 537): ubifs_iget: failed to read inode 863, error -117
UBIFS error (pid 537): ubifs_lookup: dead directory entry 'swapoff', error 
-117
The system is going down NOW!
Sent SIGTERM to all processes
UBIFS error (pid 502): ubifs_read_node: bad node type (0 but expected 1)
UBIFS error (pid 502): ubifs_read_node: bad node at LEB 395:48992, LEB mapping 
status 1
UBIFS error (pid 502): do_readpage: cannot read page 19 of inode 1908, error 
-22
UBIFS error (pid 502): ubifs_read_node: bad node type (0 but expected 1)
UBIFS error (pid 502): ubifs_read_node: bad node at LEB 395:48992, LEB mapping 
status 1
UBIFS error (pid 502): do_readpage: cannot read page 19 of inode 1908, error 
-22
