Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFW4c-0004BW-3C
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 08:09:25 -0400
Message-ID: <432812E8.2030807@mw-itcon.de>
Date: Wed, 14 Sep 2005 14:09:12 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I loose files, which I write on a jffs2 filesystem.

I start with a freshly erased mtd partition. Then I start the following 
sequence:

mount /conf
echo aaa > /conf/aaa
echo aaa > /conf/aaa
umount /conf
mount /conf

After remounting, the file gets lost (I think because the GC removes the 
inode). I use kernel 2.6.13 with mtd out of cvs of today.
The machine is a AT91RM9200 with a serial dataflash. I used already
jffs2 (most time readonly) as rootfs here for months without problems. 
The only specialty is, that the dataflash has a unfamiliar erase size of 
8448 bytes.

Maybe someone can give me a pointer, what might be wrong.

Best regards
Peter

Here a log of the problem:
(The lines PM: are write and erase logs at the mtd device)

mount /conf
JFFS2 write-buffering enabled (8448)
[JFFS2 DBG] (109) __jffs2_dbg_dump_block_lists_nolock: dump JFFS2 blocks 
lists:
[JFFS2 DBG] (109) __jffs2_dbg_dump_block_lists_nolock: dump JFFS2 blocks 
lists:
[JFFS2 DBG] (109) jffs2_do_read_inode: read inode #1
[JFFS2 DBG] (109) jffs2_do_read_inode: creating inocache for root inode
[JFFS2 DBG] (109) jffs2_add_ino_cache: add c0e213c4 (ino #1)
[JFFS2 DBG] (109) jffs2_do_read_inode_internal: ino #1 nlink is 1
[JFFS2 DBG] (109) jffs2_get_inode_nodes: ino #1
[JFFS2 DBG] (109) jffs2_get_inode_nodes: nodes of inode #1 were read, 
the highest version is 0, latest_mctime 3221420188, mctime_ver 0.
[root@armbox /root]$echo  aaa > /conf/aaa
[JFFS2 DBG] (94) jffs2_add_ino_cache: add c0e213dc (ino #2)
[JFFS2 DBG] (94) jffs2_add_fd_to_list: add dirent "aaa", ino #2
[JFFS2 DBG] (111) jffs2_add_full_dnode_to_inode: adding node 0x00-0x04 
@0x006a1770 on flash, newfrag *c0f343b8
[root@armbox /root]$
jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they all?
jffs2: Couldn't find erase block to garbage collect!
PM: dataflash_write: 8574720 .. 8583168

[root@armbox /root]$echo aaa > /conf/aaa
[JFFS2 DBG] (94) jffs2_truncate_fragtree: truncating fragtree to 
0x00000000 bytes
[JFFS2 DBG] (112) jffs2_add_full_dnode_to_inode: adding node 0x00-0x04 
@0x006a17fc on flash, newfrag *c0f343b8
[root@armbox /root]$jffs2: No clean, dirty _or_ erasable blocks to GC 
from! Where are they all?
jffs2: Couldn't find erase block to garbage collect!
PM: dataflash_write: 8574720 .. 8583168

[root@armbox /root]$umount /conf
[JFFS2 DBG] (113) jffs2_kill_fragtree: killing
[root@armbox /root]$mount /conf
JFFS2 write-buffering enabled (8448)
[JFFS2 DBG] (114) jffs2_scan_eraseblock: no summary found in jeb 
0x006a1700. Apply original scan.
[JFFS2 DBG] (114) jffs2_add_ino_cache: add c0f933c4 (ino #2)
[JFFS2 DBG] (114) __jffs2_dbg_dump_block_lists_nolock: dump JFFS2 blocks 
lists:
[JFFS2 DBG] (114) __jffs2_dbg_dump_block_lists_nolock: dump JFFS2 blocks 
lists:
[JFFS2 DBG] (114) jffs2_do_read_inode: read inode #1
[JFFS2 DBG] (114) jffs2_do_read_inode: creating inocache for root inode
[JFFS2 DBG] (114) jffs2_add_ino_cache: add c0f933ac (ino #1)
[JFFS2 DBG] (114) jffs2_do_read_inode_internal: ino #1 nlink is 1
[JFFS2 DBG] (114) jffs2_get_inode_nodes: ino #1
[JFFS2 DBG] (114) jffs2_get_inode_nodes: nodes of inode #1 were read, 
the highest version is 0, latest_mctime 3221420188, mctime_ver 0.
[JFFS2 DBG] (8) jffs2_del_ino_cache: del c0f933c4 (ino #2)

PM: dataflash_erase: addr=8574720 len=8448

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
