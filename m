Received: from fmfdns02.fm.intel.com ([132.233.247.11] helo=thalia.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16XkWw-0005j6-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Feb 2002 14:55:39 +0000
Received: from fmsmsxvs041.fm.intel.com (fmsmsxv041-1.fm.intel.com [132.233.48.109])
	by thalia.fm.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.49 2002/01/25 02:16:58 root Exp $) with SMTP id PAA11135
	for <linux-mtd@lists.infradead.org>; Mon, 4 Feb 2002 15:06:47 GMT
Received: from fmsmsx29.FM.INTEL.COM ([132.233.42.29])
 by fmsmsxvs041.fm.intel.com (NAVGW 2.5.1.16) with SMTP id M2002020407073804834
 for <linux-mtd@lists.infradead.org>; Mon, 04 Feb 2002 07:07:38 -0800
Message-ID: <413FBB0BA5AED1119122000083234B1A01DD2972@alpha.igk.intel.com>
From: "Kolakowski, Mikolaj" <Mikolaj.Kolakowski@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Problem with files removing
Date: Mon, 4 Feb 2002 16:06:24 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
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

I have a problem with file deleting. I was writting a huge file to JFFS2
partition. During writting i have got message "Not enough free space...".
1. The file which I was writting didn't disapear and it partitialy exist on
jffs2 partition
2. After I remove this partial file, jffs2 doesn't free the space that was
used by the file, it happend after remounting partition.
 
This is a log from deleting file:
Maybe someone would see what is wrong with it?

Dec 31 20:03:25 Linux kern.debug STATFS:
<7>flash_size: 001a0000
<7>used_size: 000fdfe8
<7>dirty_size: 0000b4b8
<7>free_size: 00096b60
<7>erasing_size: 00000000
<7>bad_size: 00000000
<7>sector_size: 00020000
<7>nextblock: 0x00060000
<7>gcblock: 0x00140000
<7>clean_list: 00080000
<7>clean_list: 00040000
<7>clean_list: 000a0000
<7>clean_list: 00120000
<7>clean_list: 00100000
<7>clean_list: 000c0000
<7>dirty_list: 000e0000
<7>erasing_list: empty
<7>erase_pending_list: empty
<7>free_list: 00020000
<7>free_list: 00000000
<7>free_list: 00160000
<7>free_list: 00180000
<7>bad_list: empty
<7>bad_used_list: empty
 
Dec 31 20:03:39 Linux kern.debug jffs2_reserve_space(): Requested 0x30 bytes
<7>jffs2_reserve_space(): alloc sem got
<7>jffs2_do_reserve_space(): Giving 0x16b90 bytes at 0x69470
<7>jffs2_write_dirent(ino #16, name at *0xc1550ca0 "zImage"->ino #0,
name_crc 0x6867f2e1)
 
Dec 31 20:03:39 Linux kern.debug jffs2_add_physical_node_ref(): Node at
0x69470, size 0x30
<7>jffs2_complete_reservation()
<7>thread_should_wake(): nr_free_blocks 4, nr_erasing_blocks 0, dirty_size
0xb4b8
<7>jffs2_add_fd_to_list( c16c6100, c175f4ac (->c16c6280))
<7>Marking old dirent node (ino #20) obsolete
<7>Eraseblock at 0x00100000 is freshly dirtied. Removing from clean list...
<7>...and adding to dirty_list
<7>obliterating obsoleted node at 0x001057a0
 
Dec 31 20:03:39 Linux kern.debug Dirent "zImage" (hash 0x07efb715, ino #0
 
Dec 31 20:03:44 Linux kern.debug STATFS:
<7>flash_size: 001a0000
<7>used_size: 000fdfe8
<7>dirty_size: 0000b4e8
<7>free_size: 00096b30
<7>erasing_size: 00000000
<7>bad_size: 00000000
<7>sector_size: 00020000
<7>nextblock: 0x00060000
<7>gcblock: 0x00140000
<7>clean_list: 00080000
<7>clean_list: 00040000
<7>clean_list: 000a0000
<7>clean_list: 00120000
<7>clean_list: 000c0000
<7>dirty_list: 000e0000
<7>dirty_list: 00100000
<7>erasing_list: empty
<7>erase_pending_list: empty
<7>free_list: 00020000
<7>free_list: 00000000
<7>free_list: 00160000
<7>free_list: 00180000
<7>bad_list: empty
<7>bad_used_list: empty
 
 
Thanks
Mikolaj
