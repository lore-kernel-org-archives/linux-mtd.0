Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HUkZf-0001Cm-Sm
	for linux-mtd@lists.infradead.org; Fri, 23 Mar 2007 10:17:03 -0400
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext11.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l2NEGfOM010578
	for <linux-mtd@lists.infradead.org>; Fri, 23 Mar 2007 16:16:54 +0200
Message-ID: <4603E105.3090803@nokia.com>
Date: Fri, 23 Mar 2007 16:15:33 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: BUG: sleeping function called from invalid context
References: <45FFBCC6.8010800@nokia.com>
In-Reply-To: <45FFBCC6.8010800@nokia.com>
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


I tried turning off preemption and SMP and got this BUG instead:


# uname -a
Linux ahunter-desktop 2.6.20ded12one #14 Thu Mar 22 09:35:09 EET 2007 i686 GNU/Linux
# insmod nandsim weakpages=444# modprobe
# dmesg -n8
# mount -t jffs2 mtd0 /mnt/test_file_system
JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2006 Red Hat, Inc.
# /home/git/fs-tests/integrity/integck -n5
[nandsim] warning: simulating write failure in page 444
Write of 4164 bytes at 0x00036e88 failed. returned -5, retlen 0
Not marking the space at 0x00036e88 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 4164 bytes at 0x00036a04 failed. returned -5, retlen 0
Not marking the space at 0x00036a04 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 1448 bytes at 0x00037784 failed. returned -5, retlen 0
Not marking the space at 0x00037784 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
jffs2_flush_wbuf(): Write failed with -5
In jffs2_wbuf_recover
Skipping node at 0x00036000(3)-0x000363d4 which is either before 0x00037800 or obsolete
Skipping node at 0x000363d4(3)-0x000366f8 which is either before 0x00037800 or obsolete
Skipping node at 0x000366f8(3)-0x0003679c which is either before 0x00037800 or obsolete
Skipping node at 0x0003679c(2)-0x000377e0 which is either before 0x00037800 or obsolete
Skipping node at 0x000377e0(1)-0x00038000 which is either before 0x00037800 or obsolete
No non-obsolete nodes to be recovered. Just filing block bad
Write of 1948 bytes at 0x000377e0 failed. returned -5, retlen 0
Not marking the space at 0x000377e0 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
jffs2_flush_wbuf(): Write failed with -5
In jffs2_wbuf_recover
Skipping node at 0x00036000(3)-0x000368c8 which is either before 0x00037800 or obsolete
Skipping node at 0x000368c8(3)-0x000369c8 which is either before 0x00037800 or obsolete
First node to be recovered is at 0x000369c8(3)-0x0003799c
wbuf recover 000369c8-0003799c (4052 bytes in 1 nodes)
Write 0xe00 bytes at 0x00400000 in wbuf recover
Recovery of wbuf succeeded to 00400000
Refiling block of 00000fd4 at 000369c8(3) to 00400000
calling jffs2_gc_fetch_inode
wbuf recovery completed OK. wbuf_ofs 0x00400e00, len 0x1d4
JFFS2 warning: (3229) jffs2_sum_write_data: Write of 1636 bytes at 0x0003799c failed. returned -5, retlen 0
[nandsim] warning: simulating write failure in page 444
Write of 3412 bytes at 0x0003724c failed. returned -5, retlen 0
Not marking the space at 0x0003724c as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 2320 bytes at 0x00037690 failed. returned -5, retlen 0
Not marking the space at 0x00037690 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 1956 bytes at 0x00037300 failed. returned -5, retlen 0
Not marking the space at 0x00037300 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 2244 bytes at 0x000376b0 failed. returned -5, retlen 0
Not marking the space at 0x000376b0 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
jffs2_flush_wbuf(): Write failed with -5
In jffs2_wbuf_recover
Skipping node at 0x00036000(3)-0x0003609c which is either before 0x00037800 or obsolete
Skipping node at 0x0003609c(3)-0x00036bd8 which is either before 0x00037800 or obsolete
Skipping node at 0x00036bd8(3)-0x000370d8 which is either before 0x00037800 or obsolete
First node to be recovered is at 0x000370d8(3)-0x000378a8
wbuf recover 000370d8-000378a8 (2000 bytes in 1 nodes)
Write 0x600 bytes at 0x004ca000 in wbuf recover
Recovery of wbuf succeeded to 004ca000
Refiling block of 000007d0 at 000370d8(3) to 004ca000
calling jffs2_gc_fetch_inode
wbuf recovery completed OK. wbuf_ofs 0x004ca600, len 0x1d0
Write of 1748 bytes at 0x000378a8 failed. returned -5, retlen 0
Not marking the space at 0x000378a8 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 3032 bytes at 0x000373a4 failed. returned -5, retlen 0
Not marking the space at 0x000373a4 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 4164 bytes at 0x00036bc4 failed. returned -5, retlen 0
Not marking the space at 0x00036bc4 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 2804 bytes at 0x000374ac failed. returned -5, retlen 0
Not marking the space at 0x000374ac as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
jffs2_flush_wbuf(): Write failed with -5
In jffs2_wbuf_recover
Skipping node at 0x00036000(3)-0x0003698c which is either before 0x00037800 or obsolete
First node to be recovered is at 0x0003698c(3)-0x00037818
wbuf recover 0003698c-00037818 (3724 bytes in 1 nodes)
Write 0xe00 bytes at 0x0019c000 in wbuf recover
Recovery of wbuf succeeded to 0019c000
Refiling block of 00000e8c at 0003698c(3) to 0019c000
calling jffs2_gc_fetch_inode
wbuf recovery completed OK. wbuf_ofs 0x0019ce00, len 0x8c
Write of 1700 bytes at 0x00037818 failed. returned -5, retlen 0
Not marking the space at 0x00037818 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 4164 bytes at 0x00036cbc failed. returned -5, retlen 0
Not marking the space at 0x00036cbc as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
Write of 3352 bytes at 0x00037288 failed. returned -5, retlen 0
Not marking the space at 0x00037288 as dirty because the flash driver returned retlen zero
[nandsim] warning: simulating write failure in page 444
jffs2_flush_wbuf(): Write failed with -5
In jffs2_wbuf_recover
Skipping node at 0x00036000(3)-0x00036950 which is either before 0x00037800 or obsolete
First node to be recovered is at 0x00036950(2)-0x00037994
wbuf recover 00036950-00037994 (4164 bytes in 1 nodes)
Write 0x1000 bytes at 0x00554000 in wbuf recover
Recovery of wbuf succeeded to 00554000
Refiling block of 00001044 at 00036950(2) to 00554000
calling jffs2_gc_fetch_inode
wbuf recovery completed OK. wbuf_ofs 0x00555000, len 0x44
Write of 1548 bytes at 0x00037994 failed. returned -5, retlen 0
Not marking the space at 0x00037994 as dirty because the flash driver returned retlen zero
JFFS2 warning: (3229) jffs2_sum_write_sumnode: Empty summary info!!!
------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:824!
invalid opcode: 0000 [#1]
Modules linked in: jffs2 zlib_deflate nandsim nand nand_ids nand_ecc mtdpart mtdcore
CPU:    0
EIP:    0060:[<f8b0c5ef>]    Not tainted VLI
EFLAGS: 00010282   (2.6.20ded12one #14)
EIP is at jffs2_sum_write_sumnode+0x7e/0x169 [jffs2]
eax: 00000048   ebx: f657b400   ecx: 00000003   edx: 00000001
esi: f657b400   edi: 00001000   ebp: f6675998   esp: f667595c
ds: 007b   es: 007b   ss: 0068
Process integck (pid: 3229, ti=f6674000 task=f6c12070 task.ti=f6674000)
Stack: f8b1053c 00000c9d f8b10524 00000000 f657b574 f657b400 f6c12070 c06dcec0 
       f6c125e0 f6588a88 00000000 f6c12070 00000246 f657b400 f657b400 f66759d0 
       f8af7b34 00000000 00000002 00000000 f657b558 f6675a24 000000c4 f657b400 
Call Trace:
 [<c010340f>] show_trace_log_lvl+0x1a/0x30
 [<c01034ca>] show_stack_log_lvl+0xa5/0xca
 [<c01036ad>] show_registers+0x1be/0x2a3
 [<c010388b>] die+0xf9/0x235
 [<c0103a3a>] do_trap+0x73/0x9d
 [<c0104263>] do_invalid_op+0x97/0xa1
 [<c03405a4>] error_code+0x74/0x7c
 [<f8af7b34>] jffs2_do_reserve_space+0xab/0x32b [jffs2]
 [<f8af75cb>] jffs2_reserve_space_gc+0x48/0x86 [jffs2]
 [<f8b003da>] jffs2_garbage_collect_pristine+0x62/0x4c4 [jffs2]
 [<f8b00214>] jffs2_garbage_collect_live+0x1b8/0x31c [jffs2]
 [<f8afff35>] jffs2_garbage_collect_pass+0x840/0x967 [jffs2]
 [<f8af743c>] jffs2_reserve_space+0x1ec/0x333 [jffs2]
 [<f8afbcd2>] jffs2_write_inode_range+0x66/0x43b [jffs2]
 [<f8af434f>] jffs2_commit_write+0x19b/0x330 [jffs2]
 [<c0142fbb>] generic_file_buffered_write+0x309/0x666
 [<c01435ac>] __generic_file_aio_write_nolock+0x294/0x561
 [<c01438cf>] generic_file_aio_write+0x56/0xc2
 [<c015cfd2>] do_sync_write+0xcd/0x103
 [<c015d7bd>] vfs_write+0x8b/0x149
 [<c015dd42>] sys_write+0x3d/0x64
 [<c0102d58>] sysenter_past_esp+0x5d/0x99
 =======================
Code: 2e 65 a1 08 00 00 00 89 45 f0 8b 45 f0 8b 80 a4 00 00 00 c7 44 24 08 24 05 b1 f8 89 44 24 04 c7 04 24 3c 05 b1 f8 e8 82 a8 60 c7 <0f> 0b eb fe 8b 45 d8 8b 80 ac 02 00 00 8b 00 83 c0 08 89 45 dc 
EIP: [<f8b0c5ef>] jffs2_sum_write_sumnode+0x7e/0x169 [jffs2] SS:ESP 0068:f667595c
 
