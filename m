Message-ID: <4A7696F8.1090509@nokia.com>
Date: Mon, 03 Aug 2009 10:51:20 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: UBIFS abnormal unaligned access at OneNAND 4KiB page
References: <9c9fda240908022235l4b50f154jab11f4224412d472@mail.gmail.com>	
	<4A7683C2.9070005@nokia.com>	
	<9c9fda240908022334q3e64037co604fb126559cdf82@mail.gmail.com>	
	<4A768677.4030100@nokia.com>
	<9c9fda240908030000nd0c4b3fp6adc6ac57584748b@mail.gmail.com>
In-Reply-To: <9c9fda240908030000nd0c4b3fp6adc6ac57584748b@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park wrote:
> On Mon, Aug 3, 2009 at 3:40 PM, Adrian Hunter<adrian.hunter@nokia.com> wrote:
>> Kyungmin Park wrote:
>>> On Mon, Aug 3, 2009 at 3:29 PM, Adrian Hunter<adrian.hunter@nokia.com>
>>> wrote:
>>>> Kyungmin Park wrote:
>>>>> Now I'm working with 4KiB pagesize OneNAND, I got problem with
>>>>> unaligned byte align again.
>>>>>
>>>>> <7>UBIFS DBG (pid 1): read_znode: LEB 78:205824, level 0, 8 branch
>>>>> <7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:206016, indexing node,
>>>>> length 48
>>>>> onenand_mlc_read_ops_nolock[1108] buf c41bda80 1216 48
>>>>> <7>UBIFS DBG (pid 1): read_znode: LEB 78:206016, level 0, 1 branch
>>>>> onenand_mlc_read_ops_nolock[1108] buf c40a68c0 441 13
>>>>> onenand_read_bufferram[674] area 0x400, buffer c40a68c0, offset 441,
>>>>> count
>>>>> 13
>>>>> <1>Unhandled fault: external abort on non-linefetch (0x1008) at
>>>>> 0xc58805ba
>>>>>
>>>>> In the previous time, we got the similar case. but the problem gone
>>>>> with some patch. but it happens again.
>>>>>
>>>>> Do you have any idea?
>>>> It is up to your driver to meet your bus requirements.  If the bus
>>>> requires
>>>> word (2 bytes) aligned accesses then you must check the alignment in the
>>>> driver and read the ends words separately.
>>> It's onenand_base.c. Only change is page size is 4KiB. others are same.
>>>
>>>> UBIFS does make unaligned reads to the LPT e.g. reading 13 bytes at
>>>> offset
>>>> 441
>>> I think so. but now I got the these unaligned reads.
>>> That's mystery
>> Well, onenand_read_bufferram seems to check only the 'count', not the
>> 'offset'
> 
> I added the handling of offset also

Show me

>> Also perhaps the alignment is 32-bits?
> 
> 16-bits
> 
> For more information.
> Note that 4KiB pagesize has 1 NOP.
> 
> I also suspect the superblock overwrite since block 89, 90 is maybe
> superblock. Is it right?
> 
> UBI is written at offset 0x1580000, size 0x1440000
> 
> * first boot
> 
> <5>UBI: attaching mtd4 to ubi0
> <5>UBI: physical eraseblock size:   262144 bytes (256 KiB)
> <5>UBI: logical eraseblock size:    253952 bytes
> <5>UBI: smallest flash I/O unit:    4096
> <5>UBI: VID header offset:          4096 (aligned 4096)
> <5>UBI: data offset:                8192
> <5>UBI: attached mtd4 to ubi0
> <5>UBI: MTD device name:            "UBI"
> <5>UBI: MTD device size:            490 MiB
> <5>UBI: number of good PEBs:        1955
> <5>UBI: number of bad PEBs:         7
> <5>UBI: max. allowed volumes:       128
> <5>UBI: wear-leveling threshold:    4096
> <5>UBI: number of internal volumes: 1
> <5>UBI: number of user volumes:     1
> <5>UBI: available PEBs:             0
> <5>UBI: total number of reserved PEBs: 1955
> <5>UBI: number of PEBs reserved for bad PEB handling: 19
> <5>UBI: max/mean erase counter: 1/0
> <5>UBI: image sequence number: 0
> <5>UBI: background thread "ubi_bgt0d" started, PID 925
> ...
> <7>UBIFS DBG (pid 1): ubifs_get_sb: name ubi0!rootfs, flags 0x8000
> <7>UBIFS DBG (pid 1): ubifs_get_sb: opened ubi0_1
> <7>UBIFS DBG (pid 1): ubifs_read_superblock: Auto resizing (sb) from 79 LEBs to
> 1932 LEBs
> <7>UBIFS DBG (pid 970): ubifs_bg_thread: background thread "ubifs_bgt0_1" starte
> d, PID 970
> <7>UBIFS DBG (pid 1): ubifs_read_master: Auto resizing (master) from 79 LEBs to
> 1932 LEBs
> onenand_read_bufferram[675] area 0x400, buffer c413cc20, offset 441, count 13
> <3>UBIFS error (pid 1): check_lpt_type: invalid type (11) in LPT node type 1

This is the first problem.

> [<c002d8e0>] (unwind_backtrace+0x0/0xdc) from [<c0116f00>] (check_lpt_type+0x58/
> 0x6c)
> [<c0116f00>] (check_lpt_type+0x58/0x6c) from [<c0118044>] (ubifs_unpack_nnode+0x
> 34/0xd0)
> [<c0118044>] (ubifs_unpack_nnode+0x34/0xd0) from [<c01182c4>] (ubifs_read_nnode+
> 0xc4/0x180)
> [<c01182c4>] (ubifs_read_nnode+0xc4/0x180) from [<c0118dc8>] (ubifs_lpt_lookup_d
> irty+0x20/0x32c)
> [<c0118dc8>] (ubifs_lpt_lookup_dirty+0x20/0x32c) from [<c0109da8>] (ubifs_replay
> _journal+0x24/0x1a74)
> [<c0109da8>] (ubifs_replay_journal+0x24/0x1a74) from [<c00fe514>] (ubifs_fill_su
> per+0xbc0/0x1954)
> [<c00fe514>] (ubifs_fill_super+0xbc0/0x1954) from [<c00ff540>] (ubifs_get_sb+0x2
> 98/0x310)
> [<c00ff540>] (ubifs_get_sb+0x298/0x310) from [<c008f214>] (vfs_kern_mount+0x4c/0
> x9c)
> [<c008f214>] (vfs_kern_mount+0x4c/0x9c) from [<c008f2a8>] (do_kern_mount+0x34/0x
> d8)
> [<c008f2a8>] (do_kern_mount+0x34/0xd8) from [<c00a3ec8>] (do_mount+0x674/0x6e0)
> [<c00a3ec8>] (do_mount+0x674/0x6e0) from [<c00a3fb8>] (sys_mount+0x84/0xcc)
> [<c00a3fb8>] (sys_mount+0x84/0xcc) from [<c0008e68>] (mount_block_root+0x100/0x2
> ac)
> [<c0008e68>] (mount_block_root+0x100/0x2ac) from [<c00090fc>] (prepare_namespace
> +0x88/0x1bc)
> [<c00090fc>] (prepare_namespace+0x88/0x1bc) from [<c00085bc>] (kernel_init+0xd4/
> 0x108)
> [<c00085bc>] (kernel_init+0xd4/0x108) from [<c0028e08>] (kernel_thread_exit+0x0/
> 0x8)
> <3>UBIFS error (pid 1): ubifs_read_nnode: error -22 reading nnode at 7:441
> <7>UBIFS DBG (pid 970): ubifs_bg_thread: background thread "ubifs_bgt0_1" stops
> 
> * second boot
> <7>UBIFS DBG (pid 1): ubifs_get_sb: name ubi0!rootfs, flags 0x8000
> <7>UBIFS DBG (pid 1): ubifs_get_sb: opened ubi0_1
> <7>UBIFS DBG (pid 970): ubifs_bg_thread: background thread "ubifs_bgt0_1" starte
> d, PID 970
> onenand_wait[519] state 1, block 89
> <3>onenand_wait: controller error = 0x0400
> onenand_wait[519] state 1, block 89
> <3>onenand_wait: controller error = 0x0400
> onenand_wait[519] state 1, block 89
> <3>onenand_wait: controller error = 0x0400
> onenand_wait[519] state 1, block 89
> <3>onenand_wait: controller error = 0x0400
> <3>UBI error: ubi_io_read: error -5 while reading 253952 bytes from PEB 3:8192,
> read 4096 bytes
> <3>UBIFS error (pid 1): ubifs_start_scan: cannot read 253952 bytes from LEB 1:0,
>  error -5
> onenand_wait[519] state 1, block 89
> <3>onenand_wait: controller error = 0x0400
> onenand_wait[519] state 1, block 89
> <3>onenand_wait: controller error = 0x0400
> onenand_wait[519] state 1, block 89
> <3>onenand_wait: controller error = 0x0400
> onenand_wait[519] state 1, block 89
> <3>onenand_wait: controller error = 0x0400
> <3>UBI error: ubi_io_read: error -5 while reading 253952 bytes from PEB 3:8192,
> read 4096 bytes
> <3>UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master node
> <7>UBIFS DBG (pid 970): ubifs_bg_thread: background thread "ubifs_bgt0_1" stops
> 
