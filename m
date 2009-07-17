Received: from an-out-0708.google.com ([209.85.132.247])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRpC2-0003RN-O6
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 15:17:58 +0000
Received: by an-out-0708.google.com with SMTP id c38so566385ana.27
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Jul 2009 08:17:49 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 17 Jul 2009 23:17:49 +0800
Message-ID: <e8775dd00907170817t7a7340a6qb8ede2fa20a11253@mail.gmail.com>
Subject: UBIFS corrupt when do bonnie++ test
From: Jason Liu <liu.h.jason@gmail.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,Artem
    UBIFS corrupt when do bonnie++ test for 215 times. The nand flash
we used is: 4K page size MLC nand flash.

The following is the log message:
======Sucess===========
214
Thu Jan  1 04:38:08 UTC 1970
===================
Using uid:0, gid:0.
Writing with putc()...done
Writing intelligently...done
Rewriting...done
Reading with getc()...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...done.
Stat files in sequential order...
UBI: scrubbed PEB 2608, data moved to PEB 41
done.
Delete files in sequential order...done.
Create files in random order...done.
Stat files in random order...done.
Delete files in random order...
UBI: scrubbed PEB 2623, data moved to PEB 60
UBI: scrubbed PEB 60, data moved to PEB 1067
done.
Version 1.03d       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
FSL             32M  6542  93 +++++ +++ +++++ +++  7175  98 +++++ +++ +++++ +++
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16  5927  96  2426  95  5600  99  5415  89 +++++ +++  1585  94
FSL,32M,6542,93,+++++,+++,+++++,+++,7175,98,+++++,+++,+++++,+++,16,5927,96,2426,95,5600,99,5415,89,
+++++,+++,1585,94
======Sucess===========
215
Thu Jan  1 04:38:50 UTC 1970
===================
Using uid:0, gid:0.
Writing with putc()...done
Writing intelligently...done
Rewriting...done
Reading with getc()...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...done.
Stat files in sequential order...
UBI: scrubbed PEB 2662, data moved to PEB 60
UBIFS error (pid 4139): ubifs_check_node: bad CRC: calculated
0xd868a75, read 0x56fbc40b
UBIFS error (pid 4139): ubifs_check_node: bad node at LEB 83:163384
	magic          0x6101831
	crc            0x56fbc40b
	node_type      2 (direntry node)
	group_type     1 (in node group)
	sqnum          1590124
	len            65
	key            (7078819, direntry, 0x16695f6c)
	inum           7093652
	type           0
	nlen           8
	name           0014832w
[<c002c7ec>] (dump_stack+0x0/0x14) from [<c015a454>]
(ubifs_check_node+0x29c/0x2e4)
[<c015a1b8>] (ubifs_check_node+0x0/0x2e4) from [<c015a70c>]
(ubifs_read_node+0x270/0x36c)
 r8:00000041 r7:00000002 r6:ded0c120 r5:dea13a60 r4:00000000
[<c015a49c>] (ubifs_read_node+0x0/0x36c) from [<c015bd54>]
(ubifs_read_node_wbuf+0x224/0x424)
[<c015bb30>] (ubifs_read_node_wbuf+0x0/0x424) from [<c017f5b0>]
(ubifs_tnc_read_node+0x50/0x1d4)
[<c017f560>] (ubifs_tnc_read_node+0x0/0x1d4) from [<c015e0a0>]
(tnc_read_node_nm+0xd4/0x228)
 r8:de376000 r7:ded0c120 r6:ded0c120 r5:de376000 r4:dea13a60
[<c015dfcc>] (tnc_read_node_nm+0x0/0x228) from [<c015f374>]
(ubifs_tnc_next_ent+0x238/0x290)
 r7:dea13a00 r6:ded0c120 r5:00000060 r4:dea13a60
[<c015f13c>] (ubifs_tnc_next_ent+0x0/0x290) from [<c01533a8>]
(ubifs_readdir+0x5a4/0x670)
[<c0152e04>] (ubifs_readdir+0x0/0x670) from [<c00b1530>] (vfs_readdir+0x74/0xa8)
[<c00b14bc>] (vfs_readdir+0x0/0xa8) from [<c00b168c>] (sys_getdents+0x6c/0xb4)
[<c00b1620>] (sys_getdents+0x0/0xb4) from [<c0028f00>]
(ret_fast_syscall+0x0/0x2c)
 r7:0000008d r6:00000002 r5:0002cfc0 r4:0002cfc8
UBIFS error (pid 4139): ubifs_read_node: expected node type 2
UBIFS error (pid 4139): ubifs_readdir: cannot find next direntry, error -117

The nand driver has passed the following nand_tests without errors
mtd_oobtest.ko      mtd_speedtest.ko   mtd_readtest.ko
mtd_pagetest.ko     mtd_stresstest.ko   mtd_torturetest,ko

Could  you please give me some hint about what's going wrong with UBIFS? Thanks
