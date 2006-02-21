Received: from mail.wiscore.com ([210.241.236.27] helo=server3.wiscore.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FBM9s-0004o9-TS
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 20:17:46 -0500
Received: from [192.168.0.75] (milk.wiscore.com [210.241.236.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server3.wiscore.com (Postfix) with ESMTP id CA2A2122
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Feb 2006 09:17:29 +0800 (CST)
Message-ID: <43FA6A26.8000005@wiscore.com>
Date: Tue, 21 Feb 2006 09:17:26 +0800
From: Robert Liu <robertliu@wiscore.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: do R/W tests on JFFS2 and suffer  segmentation fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, All:

I am doing some read/write tests on JFFS2 partition, and find there may be
a bug in jffs2_remove_from_hash_table().

My platform is Intel IXP-based board with 32MB NAND flash.
The testing script is:
[code]
#!/bin/sh

START=`date`
it=1
run=1000

while [ $it -le $run ]; do
        echo "#$it (`date`)"
        dd if=/dev/mem of=data bs=4k count=1280
        sleep 1
        sync
        # md5sum data
        dd if=data of=/dev/null
        sleep 1
        rm -f data
        sync
        sleep 1
        it=`expr "$it" + 1`
done

echo "START: $START"
echo "  END: `date`"
[/code]

Tests sometimes failed with segmentation fault.
I set the JFFS2 debug level to 1, and add several debug infomation in 
jffs2_remove_from_hash_table().
It seems jffs2 try to remove an entry with prev is 0x200200 and next is 
0x100100.

the modification of jffs2_remove_from_hash_table()
void jffs2_remove_from_hash_table(struct jffs2_sb_info *c, struct 
jffs2_eraseblock *jeb, uint8_t flag)
{
        struct jffs2_blocks_bucket *hash_table;
        uint32_t index, *current_index_p, i;

        if (flag == 1) {
                hash_table = c->used_blocks;
                current_index_p = &(c->used_blocks_current_index);

                D1(printk(KERN_DEBUG "c: %X, jeb: %X, index: %d\n", 
(int) c, (int) jeb, (jeb->erase_count >> BUCKET_RANGE_BIT_LEN)););
                D1(printk(KERN_DEBUG "hash_table: %X, curr_index_p: 
%X(%d)\n", (int) hash_table, (int) current_index_p, *current_index_p););

                D1(index = (jeb->erase_count >> BUCKET_RANGE_BIT_LEN););
                D1(printk(KERN_DEBUG "index: %d, num: %d, hash_list: 
%X\n", index, hash_table[index].number, (int) &jeb->hash_list););
                D1(printk(KERN_DEBUG "prev_entry: %X, 
next_entry:%X\n",(int) ((struct list_head *) (&jeb->hash_list))->prev, 
(int) ((struct list_head *) (&jeb->hash_list))->next););
        }else if (flag == 2) {
                hash_table = c->free_blocks;
                current_index_p = &(c->free_blocks_current_index);
        }else {
                return;
        }

        index = (jeb->erase_count >> BUCKET_RANGE_BIT_LEN);
        if (index >= HASH_SIZE) {
                return;
        }

        hash_table[index].number--;
        list_del(&jeb->hash_list);

        if (hash_table[index].number == 0) {
                for (i = index + 1; i < HASH_SIZE; i++) {
                        D1(if (flag == 1) printk(KERN_DEBUG "i: %d, 
table[i].number: %d\n", i, hash_table[i].number););
                        if (hash_table[i].number != 0) {
                                *current_index_p = i;
                                break;
                        }
                }
                if (i == HASH_SIZE) {
                        *current_index_p = HASH_SIZE;
                }
                D1(if (flag == 1) printk(KERN_DEBUG "i: %d, 
curr_index_p: %d\n", i, *current_index_p););
        }
        return;
}

I past some of the kernel log. If more infomation is needed, please tell me.

[log]
Feb 20 17:16:05 kernel: jffs2_reserve_space(): Requested 0x2c bytes
Feb 20 17:16:05 kernel: jffs2_reserve_space(): alloc sem got
Feb 20 17:16:05 kernel: [JFFS2 DBG] (818) jffs2_do_reserve_space: 
minsize=44 , jeb->free=1024 ,summary->size=72 , sumsize=28
Feb 20 17:16:05 kernel: jffs2_do_reserve_space(): Giving 0x374 bytes at 
0x417c00
Feb 20 17:16:05 kernel: jffs2_write_dirent(ino #1, name at *0xc02f5fd0 
"data"->ino #0, name_crc 0x8cb72c7f)
Feb 20 17:16:05 kernel: [JFFS2 DBG] (818) jffs2_sum_add_mem: dirent (0) 
added to summary
Feb 20 17:16:05 kernel: jffs2_add_physical_node_ref(): Node at 
0x417c00(2), size 0x2c
Feb 20 17:16:05 kernel: [JFFS2 DBG] (818) jffs2_add_fd_to_list: add 
dirent "data", ino #0
Feb 20 17:16:05 kernel: [JFFS2 DBG] (818) jffs2_add_fd_to_list: marking 
old dirent "data", ino #63 bsolete
Feb 20 17:16:05 kernel: Obsoleting node at 0x0094e844 of len 0x2c: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x0094c000 not moved anywhere. 
(free 0x00000000, dirty 0x0000268c, used 0x00001974)
Feb 20 17:16:05 kernel: jffs2_complete_reservation()
Feb 20 17:16:05 kernel: jffs2_thread_should_wake(): nr_free_blocks 1417, 
nr_erasing_blocks 1, dirty_size 0x4907b0: no
Feb 20 17:16:05 kernel: jffs2_clear_inode(): ino #63 mode 100644
Feb 20 17:16:05 kernel: [JFFS2 DBG] (818) jffs2_kill_fragtree: killing
Feb 20 17:16:05 kernel: Obsoleting node at 0x0094e870 of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x0094c000 not moved anywhere. 
(free 0x00000000, dirty 0x000036d0, used 0x00000930)
Feb 20 17:16:05 kernel: Obsoleting node at 0x00948000 of len 0xa38: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00948000 is freshly dirtied. 
Removing from clean list...
Feb 20 17:16:05 kernel: ...and adding to dirty_list
Feb 20 17:16:05 kernel: Obsoleting node at 0x0094f8b4 of len 0x650: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x0094c000 not moved anywhere. 
(free 0x00000000, dirty 0x00003d20, used 0x000002e0)
Feb 20 17:16:05 kernel: Obsoleting node at 0x00949a7c of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00948000 not moved anywhere. 
(free 0x00000000, dirty 0x00001a7c, used 0x00002584)
Feb 20 17:16:05 kernel: Obsoleting node at 0x0094bb04 of len 0x478: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00948000 not moved anywhere. 
(free 0x00000000, dirty 0x00001ef4, used 0x0000210c)
Feb 20 17:16:05 kernel: Obsoleting node at 0x0094aac0 of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00948000 is now very dirty. 
Removing from dirty list...
Feb 20 17:16:05 kernel: ...and adding to very_dirty_list
Feb 20 17:16:05 kernel: Obsoleting node at 0x00948a38 of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00948000 not moved anywhere. 
(free 0x00000000, dirty 0x00003f7c, used 0x00000084)
Feb 20 17:16:05 kernel: Obsoleting node at 0x00944c10 of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00944000 is freshly dirtied. 
Removing from clean list...
Feb 20 17:16:05 kernel: ...and adding to dirty_list
Feb 20 17:16:05 kernel: Obsoleting node at 0x00946c98 of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00944000 is now very dirty. 
Removing from dirty list...
Feb 20 17:16:05 kernel: ...and adding to very_dirty_list
Feb 20 17:16:05 kernel: Obsoleting node at 0x00945c54 of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00944000 not moved anywhere. 
(free 0x00000000, dirty 0x000030cc, used 0x00000f34)
Feb 20 17:16:05 kernel: Obsoleting node at 0x00940000 of len 0xde8: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00940000 is freshly dirtied. 
Removing from clean list...
Feb 20 17:16:05 kernel: ...and adding to dirty_list
Feb 20 17:16:05 kernel: Obsoleting node at 0x00941e2c of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00940000 not moved anywhere. 
(free 0x00000000, dirty 0x00001e2c, used 0x000021d4)
Feb 20 17:16:05 kernel: Obsoleting node at 0x00940de8 of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00940000 is now very dirty. 
Removing from dirty list...
Feb 20 17:16:05 kernel: ...and adding to very_dirty_list
Feb 20 17:16:05 kernel: Obsoleting node at 0x00947cdc of len 0x2a0: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00944000 not moved anywhere. 
(free 0x00000000, dirty 0x0000336c, used 0x00000c94)
Feb 20 17:16:05 kernel: Obsoleting node at 0x00944000 of len 0xc10: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00944000 not moved anywhere. 
(free 0x00000000, dirty 0x00003f7c, used 0x00000084)
Feb 20 17:16:05 kernel: Obsoleting node at 0x00943eb4 of len 0xc8: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00940000 not moved anywhere. 
(free 0x00000000, dirty 0x00002f38, used 0x000010c8)
Feb 20 17:16:05 kernel: Obsoleting node at 0x00938000 of len 0x1044: 
<7>Dirtying
Feb 20 17:16:05 kernel: Eraseblock at 0x00938000 is freshly dirtied. 
Removing from clean list...
Feb 20 17:16:05 kernel: ...and adding to dirty_list
Feb 20 17:16:05 kernel: Obsoleting node at 0x0093c000 of len 0xfc0: 
<7>Dirtying
Feb 20 17:16:05 kernel: c1f9a948 is on list at c1a800d8
Feb 20 17:16:05 kernel: Leaving block at 0093c000 on the bad_used_list
Feb 20 17:16:05 kernel: Eraseblock at 0x0093c000 completely dirtied. 
Removing from (dirty?) list...
Feb 20 17:16:05 kernel: c: C1A80000, jeb: C1F9A948, index: 0
Feb 20 17:16:05 kernel: hash_table: C1A80150, curr_index_p: C1A80148(0)
Feb 20 17:16:05 kernel: index: 0, num: 620, hash_list: C1F9A950
Feb 20 17:16:05 kernel: prev_entry: 200200, next_entry:100100
Feb 20 17:16:05 kernel: Unable to handle kernel paging request at 
virtual address 00200200
Feb 20 17:16:05 kernel: pgd = c1e48000
Feb 20 17:16:05 kernel: [00200200] *pgd=00000000
Feb 20 17:16:05 kernel: Internal error: Oops: 8f5 [#1]
Feb 20 17:16:05 kernel: Modules linked in:
Feb 20 17:16:05 kernel: CPU: 0
Feb 20 17:16:05 kernel: PC is at jffs2_remove_from_hash_table+0x88/0x198
Feb 20 17:16:05 kernel: LR is at 0xc
Feb 20 17:16:05 kernel: pc : [<c010fea0>]    lr : [<0000000c>]    Not 
tainted
Feb 20 17:16:05 kernel: sp : c1c97e50  ip : 00000000  fp : c1c97e78
Feb 20 17:16:05 kernel: r10: 000001ff  r9 : c1a80148  r8 : c1f9a950
Feb 20 17:16:05 kernel: r7 : 00000001  r6 : c1a80150  r5 : c1f9a948  r4 
: 00000000
Feb 20 17:16:05 kernel: r3 : 00100100  r2 : 00100100  r1 : 00200200  r0 
: 00200200
Feb 20 17:16:05 kernel: Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  
Segment user
Feb 20 17:16:05 kernel: Control: 39FF  Table: 01E48000  DAC: 00000015
Feb 20 17:16:05 kernel: Process rm (pid: 818, stack limit = 0xc1c96190)
Feb 20 17:16:05 kernel: Stack: (0xc1c97e50 to 0xc1c98000)
Feb 20 17:16:05 kernel: 7e40:                                     
0093c003 00000fc0 c1f9a948 c1a80000
Feb 20 17:16:05 kernel: 7e60: c17f2704 00000000 00000000 c1c97ebc 
c1c97e7c c0101a44 c010fe24 c1c96000
Feb 20 17:16:05 kernel: 7e80: c1fcb854 00000000 000002cc d62f2d80 
c1fcb480 c198924c c198924c c1c96000
Feb 20 17:16:05 kernel: 7ea0: c1a80000 00000000 c1c96000 4021a000 
c1c97ee0 c1c97ec0 c0100694 c01016b0
Feb 20 17:16:05 kernel: 7ec0: 00000001 c1a36190 c1a80000 c1c97f44 
c02f5f6c c1c97efc c1c97ee4 c0102bdc
Feb 20 17:16:05 kernel: 7ee0: c01005e8 c1a361bc 00000000 c1a361bc 
c1c97f10 c1c97f00 c00bdff8 c0102b54
Feb 20 17:16:05 kernel: 7f00: c1a361bc c1c97f28 c1c97f14 c00bf23c 
c00bdf00 c1a361bc c02069f0 c1c97f40
Feb 20 17:16:05 kernel: 7f20: c1c97f2c c00be4b8 c00bf168 c1c20000 
00000000 c1c97fa4 c1c97f44 c00b48fc
Feb 20 17:16:05 kernel: 7f40: c00be438 c02f55dc c02d4ba0 018a2149 
00000004 c1c20000 00000010 00000000
Feb 20 17:16:05 kernel: 7f60: 00000000 c1c97fac c1c97f74 c005a26c 
c011f09c 00000000 c00504ac c1c97fb0
Feb 20 17:16:05 kernel: 7f80: 00000000 00000001 00000008 beffff90 
0000000a c00538c4 00000000 c1c97fa8
Feb 20 17:16:05 kernel: 7fa0: c0053740 c00b47d0 00000001 c005a170 
beffff90 0000003f 0000003f 00000001
Feb 20 17:16:05 kernel: 7fc0: 00000001 00000008 beffff90 00000003 
befffed4 000b6854 4021a000 0000cb6c
Feb 20 17:16:05 kernel: 7fe0: 401b7fb0 befffe00 0008a860 401b7fb4 
60000010 beffff90 00000000 00000000
Feb 20 17:16:05 kernel: Backtrace:
Feb 20 17:16:05 kernel: [<c010fe18>] 
(jffs2_remove_from_hash_table+0x0/0x198) from [<c0101a44>] 
(jffs2_mark_node_obsolete+0x3a0/0xa40)
Feb 20 17:16:05 kernel: [<c01016a4>] 
(jffs2_mark_node_obsolete+0x0/0xa40) from [<c0100694>] 
(jffs2_kill_fragtree+0xb8/0x104)
Feb 20 17:16:05 kernel: [<c01005dc>] (jffs2_kill_fragtree+0x0/0x104) 
from [<c0102bdc>] (jffs2_do_clear_inode+0x94/0x14c)
Feb 20 17:16:05 kernel:  r8 = C02F5F6C  r7 = C1C97F44  r6 = C1A80000  r5 
= C1A36190
Feb 20 17:16:05 kernel:  r4 = 00000001
Feb 20 17:16:05 kernel: [<c0102b48>] (jffs2_do_clear_inode+0x0/0x14c) 
from [<c00bdff8>] (clear_inode+0x104/0x110)
Feb 20 17:16:05 kernel:  r6 = C1A361BC  r5 = 00000000  r4 = C1A361BC
Feb 20 17:16:05 kernel: [<c00bdef4>] (clear_inode+0x0/0x110) from 
[<c00bf23c>] (generic_delete_inode+0xe0/0x100)
Feb 20 17:16:05 kernel:  r4 = C1A361BC
Feb 20 17:16:05 kernel: [<c00bf15c>] (generic_delete_inode+0x0/0x100) 
from [<c00be4b8>] (iput+0x8c/0xc0)
Feb 20 17:16:05 kernel:  r5 = C02069F0  r4 = C1A361BC
Feb 20 17:16:05 kernel: [<c00be42c>] (iput+0x0/0xc0) from [<c00b48fc>] 
(sys_unlink+0x138/0x184)
Feb 20 17:16:05 kernel:  r5 = 00000000  r4 = C1C20000
Feb 20 17:16:05 kernel: [<c00b47c4>] (sys_unlink+0x0/0x184) from 
[<c0053740>] (ret_fast_syscall+0x0/0x2c)
Feb 20 17:16:05 kernel:  r8 = C00538C4  r7 = 0000000A  r6 = BEFFFF90  r5 
= 00000008
Feb 20 17:16:05 kernel:  r4 = 00000001
Feb 20 17:16:05 kernel: Code: e78c3006 e5953008 e5980004 e2811c02 
(e5803000)
Feb 20 17:16:05 kernel:  <7>jffs2_write_super()
Feb 20 17:16:05 kernel: jffs2_thread_should_wake(): nr_free_blocks 1417, 
nr_erasing_blocks 1, dirty_size 0x49ec78: no
Feb 20 17:16:05 kernel: Starting erase of pending block 0x008bc000
Feb 20 17:16:05 kernel: Freeing all node refs for eraseblock offset 
0x008bc000
Feb 20 17:16:05 kernel: Removed nodes in range 0x008bc000-0x008c0000 
from ino #63
Feb 20 17:16:05 kernel: jffs2_erase_block(): erase block 0x8bc000 (range 
0x8bc000-0x8c0000)
Feb 20 17:16:05 kernel: Erase completed successfully at 0x008bc000
Feb 20 17:16:05 kernel: Verifying erase at 0x008bc000
Feb 20 17:16:05 kernel: Writing eraseblock header to block at 0x008bc000
Feb 20 17:16:05 kernel: jffs2_erase_pending_blocks completed
Feb 20 17:16:05 kernel: jffs2_flush_wbuf_gc() called for ino #0...
Feb 20 17:16:05 kernel: jffs2_flush_wbuf_gc() calls gc pass
Feb 20 17:16:05 kernel: Picking block from bad_used_list to GC next
Feb 20 17:16:05 kernel: Converting wasted_size 00003e3c to dirty_size
Feb 20 17:16:05 kernel: GC from block 008cc000, used_size 000001c4, 
dirty_size 00003e3c, free_size 00000000
Feb 20 17:16:05 kernel: Nextblock at  00414000, used_size 00003bf4, 
dirty_size 00000000, wasted_size 00000038, free_size 000003d4
Feb 20 17:16:05 kernel: Going to garbage collect node at 0x008cc000
Feb 20 17:16:05 kernel: jffs2_garbage_collect_pass collecting from block 
@0x008cc000. Node @0x008cc000(3), ino #63
[/log]

finally, sorry for my poor English.

Regards,
Robert
