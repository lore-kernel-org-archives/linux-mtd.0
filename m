Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NZVXT-0001Qt-M2
	for linux-mtd@lists.infradead.org; Mon, 25 Jan 2010 20:28:04 +0000
From: Eric Millbrandt <emillbrandt@dekaresearch.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 25 Jan 2010 15:30:34 -0500
Subject: ubi_bgt0d: page allocation failure. order:8, mode:0xd0
Message-ID: <0A40042D85E7C84DB443060EC44B3FD3118B8DD2D4@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I have an embedded system that is running on a ubifs root filesystem which =
is dropping into read-only mode.  After a read of the mtd FAQ I found out t=
hat the filesystem has an unexpected error and that I should contact this l=
ist.  What could be causing this error?

I am running the following

- Freescale MPC5200B
- Micron MLC NAND flash
  - data lines attached to the LocalPlus Bus
  - control lines attached to gpios
- A custom MTD NAND board driver that maps the gpio/control lines to the up=
per MTD layers

The board driver was validated against the MTD tests.

Here is a snip of the relevant kernel messages

Linux v2raft06-ui 2.6.29.3-rt14 #1 PREEMPT RT Tue Jan 19 17:45:39 EST 2010 =
ppc GNU/Linux

[12734.558945] UBI error: ubi_io_write: error -5 while writing 4096 bytes t=
o PEB 1986:520192, written 0 bytes
[12734.569148] UBI warning: ubi_eba_write_leb: failed to write data to PEB =
1986
[12734.586932] UBI: recover PEB 1986, move data to PEB 3335
[12736.022779] UBI: run torture test for PEB 1986
[12736.088112] UBI: data was successfully recovered
[12742.043671] UBI: PEB 1986 passed torture test, do not mark it a bad
[13479.030880] UBI error: ubi_io_write: error -5 while writing 4096 bytes t=
o PEB 2361:446464, written 0 bytes
[13479.041096] UBI warning: ubi_eba_write_leb: failed to write data to PEB =
2361
[13479.052961] UBI: recover PEB 2361, move data to PEB 3336
[13480.286813] UBI: run torture test for PEB 2361
[13480.351575] UBI: data was successfully recovered
[13486.311802] UBI: PEB 2361 passed torture test, do not mark it a bad
[13763.880720] wm97xx-ts 0-0:WM9712: No IRQ specified
[13770.280900] asoc: AC97 Aux <-> SPDIF No matching formats
[13770.611377] asoc: AC97 Aux <-> SPDIF No matching formats
[15328.829150] UBI error: ubi_io_write: error -5 while writing 4096 bytes t=
o PEB 1346:495616, written 0 bytes
[15328.854631] UBI warning: ubi_eba_write_leb: failed to write data to PEB =
1346
[15328.876289] UBI: recover PEB 1346, move data to PEB 3337
[15330.238984] UBI: run torture test for PEB 1346
[15330.304158] UBI: data was successfully recovered
[15336.333717] UBI: PEB 1346 passed torture test, do not mark it a bad
[16253.348719] wm97xx-ts 0-0:WM9712: No IRQ specified
[16259.718557] asoc: AC97 Aux <-> SPDIF No matching formats
[16260.061242] asoc: AC97 Aux <-> SPDIF No matching formats
[19059.220300] UBI error: ubi_io_write: error -5 while writing 4096 bytes t=
o PEB 1818:36864, written 0 bytes
[19059.233659] UBI warning: ubi_eba_write_leb: failed to write data to PEB =
1818
[19059.244697] UBI: recover PEB 1818, move data to PEB 3338
[19059.386162] UBI: run torture test for PEB 1818
[19059.474621] UBI: data was successfully recovered
[19060.194621] UBI error: ubi_io_write: error -5 while writing 524288 bytes=
 to PEB 1818:0, written 36864 bytes
[19060.218432] UBI error: erase_worker: failed to erase PEB 1818, error -5
[19060.231833] UBI: mark PEB 1818 as bad
[19060.410471] ubi_bgt0d: page allocation failure. order:8, mode:0xd0
[19060.417233] Call Trace:
[19060.420073] [cf139d20] [c00088f4] show_stack+0x4c/0x16c (unreliable)
[19060.427345] [cf139d60] [c0065c4c] __alloc_pages_internal+0x2a8/0x488
[19060.434082] [cf139de0] [c00823ac] cache_alloc_refill+0x3d0/0x670
[19060.440631] [cf139e50] [c0082878] __kmalloc+0x22c/0x234
[19060.446169] [cf139e90] [c0257974] nand_update_bbt+0x90/0x1b4
[19060.453359] [cf139ed0] [c0254fc0] nand_default_block_markbad+0x80/0x128
[19060.464686] [cf139f00] [c025390c] nand_block_markbad+0x60/0x74
[19060.487414] [cf139f20] [c0243c18] part_block_markbad+0x84/0x9c
[19060.508992] [cf139f30] [c0260b3c] ubi_io_mark_bad+0x68/0xc0
[19060.533342] [cf139f40] [c0262c1c] erase_worker+0x454/0x4bc
[19060.539157] [cf139f70] [c02620c4] do_work+0xc0/0x10c
[19060.544422] [cf139f90] [c02630a0] ubi_thread+0xe0/0x154
[19060.550834] [cf139fd0] [c003c42c] kthread+0x48/0x84
[19060.565383] [cf139ff0] [c0011cb4] original_kernel_thread+0x4c/0x68
[19060.622445] Mem-Info:
[19060.622470] DMA per-cpu:
[19060.626334] CPU    0: hi:   90, btch:  15 usd:  57
[19060.633508] Active_anon:5767 active_file:2996 inactive_anon:5823
[19060.633524]  inactive_file:28819 unevictable:0 dirty:0 writeback:0 unsta=
ble:0
[19060.633536]  free:14979 slab:1504 mapped:5267 pagetables:213 bounce:0
[19060.663513] DMA free:59916kB min:2036kB low:2544kB high:3052kB active_an=
on:23068kB inactive_anon:23292kB active_file:11984kB inactive_file:115276kB=
 unevictable:0kB present:260096kB pages_scanned:0 all_unreclaimable? no
[19060.685307] lowmem_reserve[]: 0 0 0
[19060.689165] DMA: 1257*4kB 1059*8kB 719*16kB 357*32kB 141*64kB 53*128kB 1=
8*256kB 2*512kB 2*1024kB 0*2048kB 0*4096kB =3D 59916kB
[19060.702972] 33109 total pagecache pages
[19060.861338] 65536 pages RAM
[19060.861359] 2057 pages reserved
[19060.861370] 9850 pages shared
[19060.861381] 42768 pages non-shared
[19060.861397] nand_update_bbt: Out of memory
[19060.868886] UBI error: ubi_io_mark_bad: cannot mark PEB 1818 bad, error =
-12
[19060.885052] UBI warning: ubi_ro_mode: switch to read-only mode
[19060.889704] UBIFS error (pid 780): ubifs_wbuf_sync_nolock: cannot write =
4096 bytes to LEB 927:20480
[19060.889734] UBIFS warning (pid 780): ubifs_ro_mode: switched to read-onl=
y mode, error -30
[19060.940411] UBI error: do_work: work failed with error code -12
[19060.947671] UBI error: ubi_thread: ubi_bgt0d: work failed with error cod=
e -12
[19071.729577] UBIFS error (pid 1321): make_reservation: cannot reserve 392=
 bytes in jhead 1, error -30
[19071.762776] UBIFS error (pid 1321): ubifs_create: cannot create regular =
file, error -30
[19089.939003] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[19089.950269] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
11519, error -30
[19104.939103] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[19104.948764] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
13325, error -30
[19104.958267] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[19104.968680] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
11496, error -30
[19104.977796] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[19105.005127] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
12330, error -30
[19105.015706] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[19105.025768] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
13324, error -30
[19105.034884] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[19105.044945] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
11520, error -30
[19154.939597] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[19154.949266] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
11479, error -30
[19454.942616] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[19454.952367] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
11479, error -30
[19754.945628] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[19754.955221] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
11479, error -30
[20054.948682] UBIFS error (pid 149): make_reservation: cannot reserve 160 =
bytes in jhead 1, error -30
[20054.958319] UBIFS error (pid 149): ubifs_write_inode: can't write inode =
11479, error -30


Thanks
Eric Millbrandt

_________________________________________________

Please ignore the following message from IT and the attorneys...


This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
