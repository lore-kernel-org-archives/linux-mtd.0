Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmgln-0003k4-AW
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 10:27:58 +0000
Message-ID: <545C9E75.4050709@huawei.com>
Date: Fri, 7 Nov 2014 18:27:01 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Improve UBIFS nospc_retries
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: lijinyue@huawei.com, linux-mtd <linux-mtd@lists.infradead.org>,
 yuchangchun1@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I'm puzzling with *nospc_retries* in make_reservation() nowadays.
My colleagues in testing department use a less than 20M flash
and run lots of processes on it. These processes will read, write,
delete from flash and the flash is always in a nearly-full state.
The board only has one core.

So, the *nospc_retries* in make_reservation(), line 341 in journal.c
will easily reach 2 as we set and turn the filesystem to RO mode.

I know we can't perform an infinite loop here. Can we improve it?
Not only just turn current *2* to some larger number but also add
some useful mechanism to avoid filesystem turning to RO mode.

Thanks~!

Hu



sh-4.2# UBIFS error (pid 1132): make_reservation: cannot reserve 4144 bytes in jhead 2, error -28
CPU: 0 PID: 1132 Comm: cp Not tainted 3.10.53-HULK2 #10
[<c000ba99>] (unwind_backtrace+0x1/0x8c) from [<c000a8ff>] (show_stack+0xb/0xc)
[<c000a8ff>] (show_stack+0xb/0xc) from [<c00b27c3>] (make_reservation+0x233/0x274)
[<c00b27c3>] (make_reservation+0x233/0x274) from [<c00b2dc5>] (ubifs_jnl_write_data+0xf7/0x1a2)
[<c00b2dc5>] (ubifs_jnl_write_data+0xf7/0x1a2) from [<c00b4a45>] (do_writepage+0x85/0x160)
[<c00b4a45>] (do_writepage+0x85/0x160) from [<c0051149>] (__writepage+0xb/0x2a)
[<c0051149>] (__writepage+0xb/0x2a) from [<c00515c3>] (write_cache_pages+0x17b/0x228)
[<c00515c3>] (write_cache_pages+0x17b/0x228) from [<c0051691>] (generic_writepages+0x21/0x38)
[<c0051691>] (generic_writepages+0x21/0x38) from [<c004d243>] (__filemap_fdatawrite_range+0x3b/0x42)
[<c004d243>] (__filemap_fdatawrite_range+0x3b/0x42) from [<c004d2d3>] (filemap_write_and_wait_range+0x21/0x52)
[<c004d2d3>] (filemap_write_and_wait_range+0x21/0x52) from [<c00b4c75>] (ubifs_fsync+0x29/0x6c)
[<c00b4c75>] (ubifs_fsync+0x29/0x6c) from [<c007db27>] (vfs_fsync_range+0x1b/0x24)
[<c007db27>] (vfs_fsync_range+0x1b/0x24) from [<c007db99>] (generic_write_sync+0x4d/0x54)
[<c007db99>] (generic_write_sync+0x4d/0x54) from [<c004d6cd>] (generic_file_aio_write+0x4d/0x5c)
[<c004d6cd>] (generic_file_aio_write+0x4d/0x5c) from [<c00b4207>] (ubifs_aio_write+0xff/0x10c)
[<c00b4207>] (ubifs_aio_write+0xff/0x10c) from [<c0067f71>] (do_sync_write+0x4d/0x64)
[<c0067f71>] (do_sync_write+0x4d/0x64) from [<c00684e9>] (vfs_write+0x79/0xac)
[<c00684e9>] (vfs_write+0x79/0xac) from [<c0068643>] (SyS_write+0x27/0x44)
[<c0068643>] (SyS_write+0x27/0x44) from [<c0008961>] (ret_fast_syscall+0x1/0x46)
(pid 1132) Budgeting info: data budget sum 33784, total budget sum 34552
	budg_data_growth 16576, budg_dd_growth 17208, budg_idx_growth 768
	min_idx_lebs 9, old_idx_sz 336168, uncommitted_idx 0
	page_budget 4144, inode_budget 160, dent_budget 312
	nospace 0, nospace_rp 0
	dark_wm 6144, dead_wm 2048, max_idx_node_sz 192
	freeable_cnt 0, calc_idx_sz 335408, idx_gc_cnt 0
	dirty_pg_cnt 8, dirty_zn_cnt 6, clean_zn_cnt 1327
	gc_lnum 72, ihead_lnum 37
	jhead 0 (GC)	 LEB 19
	jhead 1 (base)	 LEB 165
	jhead 2 (data)	 LEB 48
	bud LEB 19
	bud LEB 48
	bud LEB 165
	old bud LEB 161
	old bud LEB 157
	old bud LEB 150
	old bud LEB 148
	old bud LEB 146
	old bud LEB 145
	old bud LEB 140
	old bud LEB 139
	old bud LEB 138
	old bud LEB 135
	old bud LEB 132
	old bud LEB 131
	old bud LEB 123
	old bud LEB 122
	old bud LEB 121
	old bud LEB 114
	old bud LEB 109
	old bud LEB 108
	old bud LEB 105
	old bud LEB 102
	old bud LEB 96
	old bud LEB 94
	old bud LEB 91
	old bud LEB 89
	old bud LEB 88
	old bud LEB 87
	old bud LEB 85
	old bud LEB 84
	old bud LEB 83
	old bud LEB 80
	old bud LEB 79
	old bud LEB 78
	old bud LEB 74
	old bud LEB 73
	old bud LEB 69
	old bud LEB 66
	old bud LEB 63
	old bud LEB 61
	old bud LEB 57
	old bud LEB 55
	old bud LEB 49
	old bud LEB 46
	old bud LEB 44
	old bud LEB 38
	old bud LEB 34
	old bud LEB 22
	old bud LEB 20
	old bud LEB 13
	old bud LEB 12
	old bud LEB 11
	commit state 4
Budgeting predictions:
	available: 169688, outstanding 33784, free 128381
(pid 1132) start dumping LEB properties
(pid 1132) Lprops statistics: empty_lebs 1, idx_lebs  10
	taken_empty_lebs 1, total_free 411648, total_dirty 1333016
	total_used 17601208, total_dark 156560, total_dead 96992
LEB 11      free 2048     dirty 384      used 124544   free + dirty 2432     dark 2432 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 12      free 0        dirty 2656     used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 13      free 2048     dirty 512      used 124416   free + dirty 2560     dark 2560 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 14      free 0        dirty 1952     used 125024   free + dirty 1952     dark 0    dead 1952 nodes fit 0   flags 0x0  (not categorized)
LEB 15      free 0        dirty 1856     used 125120   free + dirty 1856     dark 0    dead 1856 nodes fit 0   flags 0x0  (not categorized)
LEB 16      free 0        dirty 32       used 126944   free + dirty 32       dark 0    dead 32   nodes fit 0   flags 0x0  (not categorized)
LEB 17      free 0        dirty 16       used 126960   free + dirty 16       dark 0    dead 16   nodes fit 0   flags 0x0  (not categorized)
LEB 18      free 0        dirty 1040     used 125936   free + dirty 1040     dark 0    dead 1040 nodes fit 0   flags 0x0  (not categorized)
LEB 19      free 83968    dirty 1512     used 41496    free + dirty 85480    dark 6144 dead 0    nodes fit 20  flags 0x10 (taken, jhead 0 (GC))
LEB 20      free 0        dirty 2656     used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 21      free 16384    dirty 91064    used 19528    free + dirty 107448   flags 0x22 (dirty index)
LEB 22      free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 23      free 0        dirty 1984     used 124992   free + dirty 1984     dark 0    dead 1984 nodes fit 0   flags 0x0  (not categorized)
LEB 24      free 0        dirty 352      used 126624   free + dirty 352      dark 0    dead 352  nodes fit 0   flags 0x0  (not categorized)
LEB 25      free 0        dirty 1232     used 125744   free + dirty 1232     dark 0    dead 1232 nodes fit 0   flags 0x0  (not categorized)
LEB 26      free 14336    dirty 86520    used 26120    free + dirty 100856   flags 0x22 (dirty index)
LEB 27      free 0        dirty 1232     used 125744   free + dirty 1232     dark 0    dead 1232 nodes fit 0   flags 0x0  (not categorized)
LEB 28      free 0        dirty 352      used 126624   free + dirty 352      dark 0    dead 352  nodes fit 0   flags 0x0  (not categorized)
LEB 29      free 0        dirty 1904     used 125072   free + dirty 1904     dark 0    dead 1904 nodes fit 0   flags 0x0  (not categorized)
LEB 30      free 0        dirty 1128     used 125848   free + dirty 1128     dark 0    dead 1128 nodes fit 0   flags 0x0  (not categorized)
LEB 31      free 0        dirty 1552     used 125424   free + dirty 1552     dark 0    dead 1552 nodes fit 0   flags 0x0  (not categorized)
LEB 32      free 0        dirty 1712     used 125264   free + dirty 1712     dark 0    dead 1712 nodes fit 0   flags 0x0  (not categorized)
LEB 33      free 0        dirty 1952     used 125024   free + dirty 1952     dark 0    dead 1952 nodes fit 0   flags 0x0  (not categorized)
LEB 34      free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 35      free 0        dirty 832      used 126144   free + dirty 832      dark 0    dead 832  nodes fit 0   flags 0x0  (not categorized)
LEB 36      free 0        dirty 80       used 126896   free + dirty 80       dark 0    dead 80   nodes fit 0   flags 0x0  (not categorized)
LEB 37      free 0        dirty 76704    used 50272    free + dirty 76704    flags 0x30 (index, taken)
LEB 38      free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 39      free 0        dirty 1904     used 125072   free + dirty 1904     dark 0    dead 1904 nodes fit 0   flags 0x0  (not categorized)
LEB 40      free 0        dirty 2000     used 124976   free + dirty 2000     dark 0    dead 2000 nodes fit 0   flags 0x0  (not categorized)
LEB 41      free 0        dirty 1376     used 125600   free + dirty 1376     dark 0    dead 1376 nodes fit 0   flags 0x0  (not categorized)
LEB 42      free 0        dirty 1472     used 125504   free + dirty 1472     dark 0    dead 1472 nodes fit 0   flags 0x0  (not categorized)
LEB 43      free 0        dirty 1120     used 125856   free + dirty 1120     dark 0    dead 1120 nodes fit 0   flags 0x0  (not categorized)
LEB 44      free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 45      free 0        dirty 1920     used 125056   free + dirty 1920     dark 0    dead 1920 nodes fit 0   flags 0x0  (not categorized)
LEB 46      free 0        dirty 2560     used 124416   free + dirty 2560     dark 2560 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 47      free 0        dirty 1712     used 125264   free + dirty 1712     dark 0    dead 1712 nodes fit 0   flags 0x0  (not categorized)
LEB 48      free 0        dirty 126112   used 864      free + dirty 126112   dark 6144 dead 0    nodes fit 29  flags 0x10 (taken, jhead 2 (data))
LEB 49      free 2048     dirty 512      used 124416   free + dirty 2560     dark 2560 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 50      free 0        dirty 2040     used 124936   free + dirty 2040     dark 0    dead 2040 nodes fit 0   flags 0x0  (not categorized)
LEB 51      free 0        dirty 1664     used 125312   free + dirty 1664     dark 0    dead 1664 nodes fit 0   flags 0x0  (not categorized)
LEB 52      free 0        dirty 1808     used 125168   free + dirty 1808     dark 0    dead 1808 nodes fit 0   flags 0x0  (not categorized)
LEB 53      free 0        dirty 176      used 126800   free + dirty 176      dark 0    dead 176  nodes fit 0   flags 0x0  (not categorized)
LEB 54      free 0        dirty 1824     used 125152   free + dirty 1824     dark 0    dead 1824 nodes fit 0   flags 0x0  (not categorized)
LEB 55      free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 56      free 0        dirty 1840     used 125136   free + dirty 1840     dark 0    dead 1840 nodes fit 0   flags 0x0  (not categorized)
LEB 57      free 0        dirty 2496     used 124480   free + dirty 2496     dark 2496 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 58      free 0        dirty 1824     used 125152   free + dirty 1824     dark 0    dead 1824 nodes fit 0   flags 0x0  (not categorized)
LEB 59      free 0        dirty 1888     used 125088   free + dirty 1888     dark 0    dead 1888 nodes fit 0   flags 0x0  (not categorized)
LEB 60      free 0        dirty 160      used 126816   free + dirty 160      dark 0    dead 160  nodes fit 0   flags 0x0  (not categorized)
LEB 61      free 2048     dirty 480      used 124448   free + dirty 2528     dark 2528 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 62      free 0        dirty 832      used 126144   free + dirty 832      dark 0    dead 832  nodes fit 0   flags 0x0  (not categorized)
LEB 63      free 2048     dirty 352      used 124576   free + dirty 2400     dark 2400 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 64      free 0        dirty 95760    used 31216    free + dirty 95760    flags 0x22 (dirty index)
LEB 65      free 0        dirty 1808     used 125168   free + dirty 1808     dark 0    dead 1808 nodes fit 0   flags 0x0  (not categorized)
LEB 66      free 2048     dirty 416      used 124512   free + dirty 2464     dark 2464 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 67      free 86016    dirty 1104     used 39856    free + dirty 87120    flags 0x30 (index, taken)
LEB 68      free 0        dirty 64       used 126912   free + dirty 64       dark 0    dead 64   nodes fit 0   flags 0x0  (not categorized)
LEB 69      free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 70      free 0        dirty 1648     used 125328   free + dirty 1648     dark 0    dead 1648 nodes fit 0   flags 0x0  (not categorized)
LEB 71      free 0        dirty 16       used 126960   free + dirty 16       dark 0    dead 16   nodes fit 0   flags 0x0  (not categorized)
LEB 72      free 126976   dirty 0        used 0        free + dirty 126976   dark 6144 dead 0    nodes fit 29  flags 0x10 (taken, GC LEB)
LEB 73      free 2048     dirty 416      used 124512   free + dirty 2464     dark 2464 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 74      free 0        dirty 2656     used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 75      free 0        dirty 1952     used 125024   free + dirty 1952     dark 0    dead 1952 nodes fit 0   flags 0x0  (not categorized)
LEB 76      free 0        dirty 752      used 126224   free + dirty 752      dark 0    dead 752  nodes fit 0   flags 0x0  (not categorized)
LEB 77      free 0        dirty 80       used 126896   free + dirty 80       dark 0    dead 80   nodes fit 0   flags 0x0  (not categorized)
LEB 78      free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 79      free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 80      free 2048     dirty 352      used 124576   free + dirty 2400     dark 2400 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 81      free 0        dirty 832      used 126144   free + dirty 832      dark 0    dead 832  nodes fit 0   flags 0x0  (not categorized)
LEB 82      free 0        dirty 80       used 126896   free + dirty 80       dark 0    dead 80   nodes fit 0   flags 0x0  (not categorized)
LEB 83      free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 84      free 2048     dirty 344      used 124584   free + dirty 2392     dark 2392 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 85      free 2048     dirty 224      used 124704   free + dirty 2272     dark 2272 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 86      free 0        dirty 928      used 126048   free + dirty 928      dark 0    dead 928  nodes fit 0   flags 0x0  (not categorized)
LEB 87      free 2048     dirty 440      used 124488   free + dirty 2488     dark 2488 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 88      free 2048     dirty 384      used 124544   free + dirty 2432     dark 2432 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 89      free 0        dirty 2560     used 124416   free + dirty 2560     dark 2560 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 90      free 0        dirty 704      used 126272   free + dirty 704      dark 0    dead 704  nodes fit 0   flags 0x0  (not categorized)
LEB 91      free 0        dirty 126312   used 664      free + dirty 126312   dark 6144 dead 0    nodes fit 29  flags 0x10 (taken)
LEB 92      free 0        dirty 80       used 126896   free + dirty 80       dark 0    dead 80   nodes fit 0   flags 0x0  (not categorized)
LEB 93      free 0        dirty 1808     used 125168   free + dirty 1808     dark 0    dead 1808 nodes fit 0   flags 0x0  (not categorized)
LEB 94      free 2048     dirty 416      used 124512   free + dirty 2464     dark 2464 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 95      free 0        dirty 1616     used 125360   free + dirty 1616     dark 0    dead 1616 nodes fit 0   flags 0x0  (not categorized)
LEB 96      free 0        dirty 40       used 126936   free + dirty 40       dark 0    dead 40   nodes fit 0   flags 0x10 (taken)
LEB 97      free 0        dirty 496      used 126480   free + dirty 496      dark 0    dead 496  nodes fit 0   flags 0x0  (not categorized)
LEB 98      free 0        dirty 1808     used 125168   free + dirty 1808     dark 0    dead 1808 nodes fit 0   flags 0x0  (not categorized)
LEB 99      free 0        dirty 440      used 126536   free + dirty 440      dark 0    dead 440  nodes fit 0   flags 0x0  (not categorized)
LEB 100     free 0        dirty 100648   used 26328    free + dirty 100648   flags 0x22 (dirty index)
LEB 101     free 0        dirty 1232     used 125744   free + dirty 1232     dark 0    dead 1232 nodes fit 0   flags 0x0  (not categorized)
LEB 102     free 0        dirty 2656     used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 103     free 0        dirty 448      used 126528   free + dirty 448      dark 0    dead 448  nodes fit 0   flags 0x0  (not categorized)
LEB 104     free 0        dirty 1024     used 125952   free + dirty 1024     dark 0    dead 1024 nodes fit 0   flags 0x0  (not categorized)
LEB 105     free 0        dirty 2560     used 124416   free + dirty 2560     dark 2560 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 106     free 0        dirty 2000     used 124976   free + dirty 2000     dark 0    dead 2000 nodes fit 0   flags 0x0  (not categorized)
LEB 107     free 14336    dirty 89952    used 22688    free + dirty 104288   flags 0x22 (dirty index)
LEB 108     free 2048     dirty 288      used 124640   free + dirty 2336     dark 2336 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 109     free 0        dirty 7736     used 119240   free + dirty 7736     dark 6144 dead 0    nodes fit 1   flags 0x10 (taken)
LEB 110     free 0        dirty 1504     used 125472   free + dirty 1504     dark 0    dead 1504 nodes fit 0   flags 0x0  (not categorized)
LEB 111     free 0        dirty 2016     used 124960   free + dirty 2016     dark 0    dead 2016 nodes fit 0   flags 0x0  (not categorized)
LEB 112     free 0        dirty 576      used 126400   free + dirty 576      dark 0    dead 576  nodes fit 0   flags 0x0  (not categorized)
LEB 113     free 0        dirty 1312     used 125664   free + dirty 1312     dark 0    dead 1312 nodes fit 0   flags 0x0  (not categorized)
LEB 114     free 0        dirty 2656     used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 115     free 0        dirty 85968    used 41008    free + dirty 85968    flags 0x22 (dirty index)
LEB 116     free 0        dirty 160      used 126816   free + dirty 160      dark 0    dead 160  nodes fit 0   flags 0x0  (not categorized)
LEB 117     free 0        dirty 48       used 126928   free + dirty 48       dark 0    dead 48   nodes fit 0   flags 0x0  (not categorized)
LEB 118     free 0        dirty 752      used 126224   free + dirty 752      dark 0    dead 752  nodes fit 0   flags 0x0  (not categorized)
LEB 119     free 0        dirty 1064     used 125912   free + dirty 1064     dark 0    dead 1064 nodes fit 0   flags 0x0  (not categorized)
LEB 120     free 0        dirty 1984     used 124992   free + dirty 1984     dark 0    dead 1984 nodes fit 0   flags 0x0  (not categorized)
LEB 121     free 0        dirty 2432     used 124544   free + dirty 2432     dark 2432 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 122     free 2048     dirty 512      used 124416   free + dirty 2560     dark 2560 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 123     free 0        dirty 2432     used 124544   free + dirty 2432     dark 2432 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 124     free 0        dirty 48       used 126928   free + dirty 48       dark 0    dead 48   nodes fit 0   flags 0x0  (not categorized)
LEB 125     free 0        dirty 1712     used 125264   free + dirty 1712     dark 0    dead 1712 nodes fit 0   flags 0x0  (not categorized)
LEB 126     free 0        dirty 880      used 126096   free + dirty 880      dark 0    dead 880  nodes fit 0   flags 0x0  (not categorized)
LEB 127     free 0        dirty 176      used 126800   free + dirty 176      dark 0    dead 176  nodes fit 0   flags 0x0  (not categorized)
LEB 128     free 0        dirty 272      used 126704   free + dirty 272      dark 0    dead 272  nodes fit 0   flags 0x0  (not categorized)
LEB 129     free 6144     dirty 91848    used 28984    free + dirty 97992    flags 0x22 (dirty index)
LEB 130     free 0        dirty 1792     used 125184   free + dirty 1792     dark 0    dead 1792 nodes fit 0   flags 0x0  (not categorized)
LEB 131     free 0        dirty 2464     used 124512   free + dirty 2464     dark 2464 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 132     free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 133     free 0        dirty 608      used 126368   free + dirty 608      dark 0    dead 608  nodes fit 0   flags 0x0  (not categorized)
LEB 134     free 0        dirty 1152     used 125824   free + dirty 1152     dark 0    dead 1152 nodes fit 0   flags 0x0  (not categorized)
LEB 135     free 0        dirty 2560     used 124416   free + dirty 2560     dark 2560 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 136     free 0        dirty 16       used 126960   free + dirty 16       dark 0    dead 16   nodes fit 0   flags 0x0  (not categorized)
LEB 137     free 0        dirty 40       used 126936   free + dirty 40       dark 0    dead 40   nodes fit 0   flags 0x0  (not categorized)
LEB 138     free 0        dirty 2656     used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 139     free 0        dirty 2464     used 124512   free + dirty 2464     dark 2464 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 140     free 2048     dirty 608      used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 141     free 0        dirty 64       used 126912   free + dirty 64       dark 0    dead 64   nodes fit 0   flags 0x0  (not categorized)
LEB 142     free 0        dirty 104      used 126872   free + dirty 104      dark 0    dead 104  nodes fit 0   flags 0x0  (not categorized)
LEB 143     free 0        dirty 1136     used 125840   free + dirty 1136     dark 0    dead 1136 nodes fit 0   flags 0x0  (not categorized)
LEB 144     free 0        dirty 432      used 126544   free + dirty 432      dark 0    dead 432  nodes fit 0   flags 0x0  (not categorized)
LEB 145     free 0        dirty 2656     used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 146     free 0        dirty 2272     used 124704   free + dirty 2272     dark 2272 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 147     free 0        dirty 2032     used 124944   free + dirty 2032     dark 0    dead 2032 nodes fit 0   flags 0x0  (not categorized)
LEB 148     free 0        dirty 2656     used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 149     free 0        dirty 1952     used 125024   free + dirty 1952     dark 0    dead 1952 nodes fit 0   flags 0x0  (not categorized)
LEB 150     free 0        dirty 2656     used 124320   free + dirty 2656     dark 2656 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 151     free 0        dirty 1040     used 125936   free + dirty 1040     dark 0    dead 1040 nodes fit 0   flags 0x0  (not categorized)
LEB 152     free 0        dirty 352      used 126624   free + dirty 352      dark 0    dead 352  nodes fit 0   flags 0x0  (not categorized)
LEB 153     free 0        dirty 1384     used 125592   free + dirty 1384     dark 0    dead 1384 nodes fit 0   flags 0x0  (not categorized)
LEB 154     free 0        dirty 1648     used 125328   free + dirty 1648     dark 0    dead 1648 nodes fit 0   flags 0x0  (not categorized)
LEB 155     free 0        dirty 1616     used 125360   free + dirty 1616     dark 0    dead 1616 nodes fit 0   flags 0x0  (not categorized)
LEB 156     free 0        dirty 864      used 126112   free + dirty 864      dark 0    dead 864  nodes fit 0   flags 0x0  (not categorized)
LEB 157     free 2048     dirty 416      used 124512   free + dirty 2464     dark 2464 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 158     free 0        dirty 32       used 126944   free + dirty 32       dark 0    dead 32   nodes fit 0   flags 0x0  (not categorized)
LEB 159     free 0        dirty 320      used 126656   free + dirty 320      dark 0    dead 320  nodes fit 0   flags 0x0  (not categorized)
LEB 160     free 0        dirty 1408     used 125568   free + dirty 1408     dark 0    dead 1408 nodes fit 0   flags 0x0  (not categorized)
LEB 161     free 0        dirty 2560     used 124416   free + dirty 2560     dark 2560 dead 0    nodes fit 0   flags 0x10 (taken)
LEB 162     free 0        dirty 77568    used 49408    free + dirty 77568    flags 0x22 (dirty index)
LEB 163     free 0        dirty 448      used 126528   free + dirty 448      dark 0    dead 448  nodes fit 0   flags 0x0  (not categorized)
LEB 164     free 0        dirty 1424     used 125552   free + dirty 1424     dark 0    dead 1424 nodes fit 0   flags 0x0  (not categorized)
LEB 165     free 8192     dirty 112816   used 5968     free + dirty 121008   dark 6144 dead 0    nodes fit 28  flags 0x10 (taken, jhead 1 (base))
(pid 1132) finish dumping LEB properties
UBIFS error (pid 1132): do_writepage: cannot write page 221 of inode 326811, error -28
UBIFS warning (pid 1132): ubifs_ro_mode: switched to read-only mode, error -28
CPU: 0 PID: 1132 Comm: cp Not tainted 3.10.53-HULK2 #10
[<c000ba99>] (unwind_backtrace+0x1/0x8c) from [<c000a8ff>] (show_stack+0xb/0xc)
[<c000a8ff>] (show_stack+0xb/0xc) from [<c00b4a83>] (do_writepage+0xc3/0x160)
[<c00b4a83>] (do_writepage+0xc3/0x160) from [<c0051149>] (__writepage+0xb/0x2a)
[<c0051149>] (__writepage+0xb/0x2a) from [<c00515c3>] (write_cache_pages+0x17b/0x228)
[<c00515c3>] (write_cache_pages+0x17b/0x228) from [<c0051691>] (generic_writepages+0x21/0x38)
[<c0051691>] (generic_writepages+0x21/0x38) from [<c004d243>] (__filemap_fdatawrite_range+0x3b/0x42)
[<c004d243>] (__filemap_fdatawrite_range+0x3b/0x42) from [<c004d2d3>] (filemap_write_and_wait_range+0x21/0x52)
[<c004d2d3>] (filemap_write_and_wait_range+0x21/0x52) from [<c00b4c75>] (ubifs_fsync+0x29/0x6c)
[<c00b4c75>] (ubifs_fsync+0x29/0x6c) from [<c007db27>] (vfs_fsync_range+0x1b/0x24)
[<c007db27>] (vfs_fsync_range+0x1b/0x24) from [<c007db99>] (generic_write_sync+0x4d/0x54)
[<c007db99>] (generic_write_sync+0x4d/0x54) from [<c004d6cd>] (generic_file_aio_write+0x4d/0x5c)
[<c004d6cd>] (generic_file_aio_write+0x4d/0x5c) from [<c00b4207>] (ubifs_aio_write+0xff/0x10c)
[<c00b4207>] (ubifs_aio_write+0xff/0x10c) from [<c0067f71>] (do_sync_write+0x4d/0x64)
[<c0067f71>] (do_sync_write+0x4d/0x64) from [<c00684e9>] (vfs_write+0x79/0xac)
[<c00684e9>] (vfs_write+0x79/0xac) from [<c0068643>] (SyS_write+0x27/0x44)
[<c0068643>] (SyS_write+0x27/0x44) from [<c0008961>] (ret_fast_syscall+0x1/0x46)
UBIFS error (pid 2026): make_reservation: cannot reserve 384 bytes in jhead 1, error -30
UBIFS error (pid 1959): do_commit: commit failed, error -30
UBIFS error (pid 136): make_reservation: cannot reserve 53 bytes in jhead 2, error -30
UBIFS error (pid 136): do_writepage: cannot write page 0 of inode 327225, error -30
UBIFS error (pid 135): make_reservation: cannot reserve 53 bytes in jhead 2, error -30
UBIFS error (pid 135): do_writepage: cannot write page 0 of inode 327222, error -30
UBIFS error (pid 134): make_reservation: cannot reserve 53 bytes in jhead 2, error -30
UBIFS error (pid 134): do_writepage: cannot write page 0 of inode 327219, error -30
