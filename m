Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MWip-0003Ye-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 15:57:31 +0000
Message-ID: <30724FF712DFD2119E6200104B244892011975B4@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: "'sankumar96@lycos.com'" <sankumar96@lycos.com>,
	linux-mtd@lists.infradead.org
Subject: RE: Problem in changing  the starting location of JFFS2 for AMD f
	lash
Date: Fri, 4 Jan 2002 10:02:37 -0600 
MIME-Version: 1.0
Content-Type: text/plain
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

You don't want to mess around in the JFFS2 code for partitioning the raw
flash.

See the various map drivers in mtd/drivers/map for examples on how to
partition the flash into separate logical /dev/mtdx devices.

Then you just mount JFFS2 on the device you want leaving the other device(s)
for your raw stuff.

Keep in mind that things will work best if you partition the devices to end
on a physical erase boundary.

Vipin

-----Original Message-----
From: Sanjay Kumar [mailto:sankumar96@lycos.com]
Sent: Friday, January 04, 2002 9:46 AM
To: linux-mtd@lists.infradead.org
Subject: Problem in changing the starting location of JFFS2 for AMD
flash
Importance: High


Hi All,
I am using AMD flash of 4M size and keeping starting 1/2 MB for RAW data.
Then for the remaining I want to use JFFS2. That is JFF2 will start from 0.5
MB to 4MB. For that I am making changes in super.c of JFFS2 for function
jffs2_read_super. The changes are -    
c->free_size = c->mtd->size - jffs2_start_addr;
c->flash_size = c->mtd->size - jffs2_start_addr;
c->nr_blocks = c->flash_size / c->sector_size;
c->blocks[i].offset = i * c->sector_size + jffs2_start_addr;

where am keeping jffs2_start_addr = 0x80000.

I am using linux 2.4.2.

Now I am able to mount the jffs2 file system and able to create a empty
file. But when I go for writing into the created empty file, it is crashing.

The dump of the log message is as follows -

mountJffs("/flash0")
jffs2: read_super for device 1f:00
jffs2_scan_eraseblock(): Scanning block at 0x80000
Found empty flash at 0x8000c
Empty flash detected from 0x0008000c to 0x00090000
Block at 0x00080000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x90000
Found empty flash at 0x9000c
Empty flash detected from 0x0009000c to 0x000a0000
Block at 0x00090000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0xa0000
Found empty flash at 0xa000c
Empty flash detected from 0x000a000c to 0x000b0000
Block at 0x000a0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0xb0000
Found empty flash at 0xb000c
Empty flash detected from 0x000b000c to 0x000c0000
Block at 0x000b0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0xc0000
Found empty flash at 0xc000c
Empty flash detected from 0x000c000c to 0x000d0000
Block at 0x000c0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0xd0000
Found empty flash at 0xd000c
Empty flash detected from 0x000d000c to 0x000e0000
Block at 0x000d0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0xe0000
Found empty flash at 0xe000c
Empty flash detected from 0x000e000c to 0x000f0000
Block at 0x000e0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0xf0000
Found empty flash at 0xf000c
Empty flash detected from 0x000f000c to 0x00100000
Block at 0x000f0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x100000
Found empty flash at 0x10000c
Empty flash detected from 0x0010000c to 0x00110000
Block at 0x00100000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x110000
Found empty flash at 0x11000c
Empty flash detected from 0x0011000c to 0x00120000
Block at 0x00110000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x120000
Found empty flash at 0x12000c
Empty flash detected from 0x0012000c to 0x00130000
Block at 0x00120000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x130000
Found empty flash at 0x13000c
Empty flash detected from 0x0013000c to 0x00140000
Block at 0x00130000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x140000
Found empty flash at 0x14000c
Empty flash detected from 0x0014000c to 0x00150000
Block at 0x00140000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x150000
Found empty flash at 0x15000c
Empty flash detected from 0x0015000c to 0x00160000
Block at 0x00150000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x160000
Found empty flash at 0x16000c
Empty flash detected from 0x0016000c to 0x00170000
Block at 0x00160000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x170000
Found empty flash at 0x17000c
Empty flash detected from 0x0017000c to 0x00180000
Block at 0x00170000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x180000
Found empty flash at 0x18000c
Empty flash detected from 0x0018000c to 0x00190000
Block at 0x00180000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x190000
Found empty flash at 0x19000c
Empty flash detected from 0x0019000c to 0x001a0000
Block at 0x00190000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x1a0000
Found empty flash at 0x1a000c
Empty flash detected from 0x001a000c to 0x001b0000
Block at 0x001a0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x1b0000
Found empty flash at 0x1b000c
Empty flash detected from 0x001b000c to 0x001c0000
Block at 0x001b0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x1c0000
Found empty flash at 0x1c000c
Empty flash detected from 0x001c000c to 0x001d0000
Block at 0x001c0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x1d0000
Found empty flash at 0x1d000c
Empty flash detected from 0x001d000c to 0x001e0000
Block at 0x001d0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x1e0000
Found empty flash at 0x1e000c
Empty flash detected from 0x001e000c to 0x001f0000
Block at 0x001e0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x1f0000
Found empty flash at 0x1f000c
Empty flash detected from 0x001f000c to 0x00200000
Block at 0x001f0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x200000
Found empty flash at 0x20000c
Empty flash detected from 0x0020000c to 0x00210000
Block at 0x00200000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x210000
Found empty flash at 0x21000c
Empty flash detected from 0x0021000c to 0x00220000
Block at 0x00210000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x220000
Found empty flash at 0x22000c
Empty flash detected from 0x0022000c to 0x00230000
Block at 0x00220000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x230000
Found empty flash at 0x23000c
Empty flash detected from 0x0023000c to 0x00240000
Block at 0x00230000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x240000
Found empty flash at 0x24000c
Empty flash detected from 0x0024000c to 0x00250000
Block at 0x00240000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x250000
Found empty flash at 0x25000c
Empty flash detected from 0x0025000c to 0x00260000
Block at 0x00250000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x260000
Found empty flash at 0x26000c
Empty flash detected from 0x0026000c to 0x00270000
Block at 0x00260000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x270000
Found empty flash at 0x27000c
Empty flash detected from 0x0027000c to 0x00280000
Block at 0x00270000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x280000
Found empty flash at 0x28000c
Empty flash detected from 0x0028000c to 0x00290000
Block at 0x00280000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x290000
Found empty flash at 0x29000c
Empty flash detected from 0x0029000c to 0x002a0000
Block at 0x00290000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x2a0000
Found empty flash at 0x2a000c
Empty flash detected from 0x002a000c to 0x002b0000
Block at 0x002a0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x2b0000
Found empty flash at 0x2b000c
Empty flash detected from 0x002b000c to 0x002c0000
Block at 0x002b0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x2c0000
Found empty flash at 0x2c000c
Empty flash detected from 0x002c000c to 0x002d0000
Block at 0x002c0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x2d0000
Found empty flash at 0x2d000c
Empty flash detected from 0x002d000c to 0x002e0000
Block at 0x002d0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x2e0000
Found empty flash at 0x2e000c
Empty flash detected from 0x002e000c to 0x002f0000
Block at 0x002e0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x2f0000
Found empty flash at 0x2f000c
Empty flash detected from 0x002f000c to 0x00300000
Block at 0x002f0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x300000
Found empty flash at 0x30000c
Empty flash detected from 0x0030000c to 0x00310000
Block at 0x00300000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x310000
Found empty flash at 0x31000c
Empty flash detected from 0x0031000c to 0x00320000
Block at 0x00310000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x320000
Found empty flash at 0x32000c
Empty flash detected from 0x0032000c to 0x00330000
Block at 0x00320000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x330000
Found empty flash at 0x33000c
Empty flash detected from 0x0033000c to 0x00340000
Block at 0x00330000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x340000
Found empty flash at 0x34000c
Empty flash detected from 0x0034000c to 0x00350000
Block at 0x00340000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x350000
Found empty flash at 0x35000c
Empty flash detected from 0x0035000c to 0x00360000
Block at 0x00350000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x360000
Found empty flash at 0x36000c
Empty flash detected from 0x0036000c to 0x00370000
Block at 0x00360000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x370000
Found empty flash at 0x37000c
Empty flash detected from 0x0037000c to 0x00380000
Block at 0x00370000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x380000
Found empty flash at 0x38000c
Empty flash detected from 0x0038000c to 0x00390000
Block at 0x00380000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x390000
Found empty flash at 0x39000c
Empty flash detected from 0x0039000c to 0x003a0000
Block at 0x00390000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x3a0000
Found empty flash at 0x3a000c
Empty flash detected from 0x003a000c to 0x003b0000
Block at 0x003a0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x3b0000
Found empty flash at 0x3b000c
Empty flash detected from 0x003b000c to 0x003c0000
Block at 0x003b0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x3c0000
Found empty flash at 0x3c000c
Empty flash detected from 0x003c000c to 0x003d0000
Block at 0x003c0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x3d0000
Found empty flash at 0x3d000c
Empty flash detected from 0x003d000c to 0x003e0000
Block at 0x003d0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x3e0000
Found empty flash at 0x3e000c
Empty flash detected from 0x003e000c to 0x003f0000
Block at 0x003e0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
jffs2_scan_eraseblock(): Scanning block at 0x3f0000
Found empty flash at 0x3f000c
Empty flash detected from 0x003f000c to 0x00400000
Block at 0x003f0000: free 0x0000fff4, dirty 0x00000000, used 0x0000000c
Scanned flash completely
Pass 1 complete
Pass 2 (re)starting
Pass 2 complete
Pass 3 complete
jffs2_read_super(): Getting root inode
jffs2_read_inode(): inode->i_ino == 1
getting inocache
jffs2_get_ino_cache(): ino 1
jffs2_get_ino_cache found 00000000 for ino 1
jffs2_read_inode(): Got inocache at 00000000
Allocated inocache at 80bc12c0
jffs2_read_inode(): Creating inocache for root inode
jffs2_add_ino_cache: Add 80bc12c0 (ino #1)
jffs2_read_inode(): ino #1 nlink is 1
jffs2_read_inode() returning #1
jffs2_read_super(): d_alloc_root()
JFFS2: Garbage collect thread is pid 10
thread_should_wake(): nr_free_blocks 56, nr_erasing_blocks 0, dirty_size 0x0
jffs2_garbage_collect_thread sleeping...
value = 0 = 0x0
->
>createJffsFile("/flash0/hello.txt")
jffs2_lookup()
jffs2_create()
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xfff4 bytes at 0x3f000c
jffs2_create(): reserved 0xfff4 bytes
jffs2_new_inode(): dir_i 1, mode 0x8000
Allocated inocache at 80bc02d4
jffs2_new_inode(): Assigned ino# 2
jffs2_add_ino_cache: Add 80bc02d4 (ino #2)
jffs2_add_physical_node_ref(): Node at 0x3f000c, size 0x44
jffs2_write_dnode wrote node at 0x003f000c with dsize 0x0, csize 0x0,
node_crc 0
xfef3c9ce, data_crc 0x00000000, totlen 0x00000044
jffs2_create created file with mode 0x8000
jffs2_write_dirent(ino #1, name "hello.txt"->ino #2
jffs2_add_physical_node_ref(): Node at 0x3f0050, size 0x34
jffs2_complete_reservation()ace
thread_should_wake(): nr_free_blocks 55, nr_erasing_blocks 0, dirty_size 0x0
jffs2_add_fd_to_list( 80b3e610, 80bd518c (->00000000))
Dirent "hello.txt" (hash 0x709521d5, ino #2
jffs2_create: Created ino #2 with mode 100000, nlink 1(1). nrpages 0
File descriptor = 5value = 0 = 0x0
->
sys_write(5,"hello",5)
<6>jffs2_prepare_write() nrpages 1
jffs2_do_readpage_nolock(): ino #2, page at offset 0x0
jffs2_readpage: offset 0, end 4096
Filling non-frag hole from 0-4096
readpage finishing
readpage finished
end prepare_write(). nrpages 1
jffs2_commit_write() loop: 0x5 to write to 0x0ge 0-5, nrpages 1
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xfff4 bytes at 0x3f000c
ARGH. About to write node to 0x003f000c on flash, but there's data already
there
:
0x003f000c: 19 85 e0 02 00 00 00 44 a4 ef 22 3e 00 00 00 02
Last[2] is ff86, datum is 49
Write of 73 bytes at 0x003f000c failed. returned 0, retlen 6
jffs2_add_physical_node_ref(): Node at 0x3f000c, size 0x4c
raw node at 0x003f000c is off the end of device!
kernel BUG at nodemgmt.c:301!
Unable to handle kernel paging request at virtual address 00000000, epc ==
809a6
180, ra == 809a6180
Oops in fault.c:do_page_fault, line 189:



And so I am not able to proceed. If anyone has any idea this problem or any
suggestions?
Thanks,
Sanjay


--
Click here for your very own create-a-date adventure from MatchMaker
Go to http://ecard.matchmaker.com/dating.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
