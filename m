Received: from [208.28.249.7] (helo=ktc_internet)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ekGU-0007KB-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2002 23:35:50 +0100
Subject: JFFS2 Page Fault Problem Report
To: dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Message-ID: <OFC661DE72.85EF7A4C-ON88256C14.007953C1@LocalDomain>
From: Steve_Chen@kingston.com
Date: Tue, 13 Aug 2002 15:31:11 -0700
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
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

Hi,
I need help.  I am wondering if anyone has experienced the same problem.
After mounting the JFFS2 on an empty NAND flash chip, a page fault
occurred.  The Linux kernel version is 2.4.6.  Here is the error log:

-------------------------------------------------------------------------------------------

[root@RedHat7 /root]# mount -t jffs2 /dev/mtdblock2 /mnt2
jffs2: read_super for device 1f:01
jffs2_do_fill_super:..entry point
jffs2_do_mount_fs():..entry point
jffs2_scan_medium():empty_blocks 1792, bad_blocks 0, c->nr_blocks 1792
erasing_blocks = 1792,
Scanned flash completely
Pass 1 complete
Pass 2 complete
Pass 3 complete
jffs2_do_fill_super(): Getting root inode
jffs2_do_fill_super(): d_alloc_root()
jffs2_write_super(): flush_wbuf before gc-trigger
root@RedHat7 /mnt2]# Oops in fault.c:do_page_fault, line 172:
$0 : 00000000 10008400 00000029 8028a048
$4 : 8025c0d0 00000000 00000001 0000000a
$8 : 80272960 0000003c 00000003 00000003
$12: 8111dee8 8111e848 00000000 8111e840
$16: 81042e24 81042e08 00000031 00000001
$20: 00000000 8028a048 8028a04c 00000000
$24: 00000001 2ab93310
$28: 83fc6000 83fc7f70 00000000 8005d3bc
epc   : 8005d3c8
Status: 10008403
Cause : 1000000c
Process kswapd (pid: 3, stackpage=83fc6000)
Stack: 801c3eb4 00000001 00000004 8025d3e8 83fc6000 80266cd0 00000000
8005d830
       00000000 00000000 00000000 8005d8f8 00000000 00000000 00000700
00000010
       00010f00 80253268 80028924 83fc7fe0 00000000 80216b14 802531d4
80253268
       80028914 8002801c 10008403 00000020 ffffffbe fffffff7 ffffffbf
efffffbf
       fff5ffdf fffffbf5 f7ffffff fdbfffbf
Call Trace: [<801c3eb4>] [<8005d830>] [<8005d8f8>] [<80028924>]
[<80028914>] [<8
002801c>]
Code: 8e050004  8e030000  ac650004 <aca30000> 3c028029  8c429e68  2442ffff
3c01
8029  ac229e68

-------------------------------------------------------------------------------------------------

Thanks.

Regards,
Steve
