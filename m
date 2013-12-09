Received: from mail-pd0-f176.google.com ([209.85.192.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vpqi8-0001ZY-9t
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 02:37:54 +0000
Received: by mail-pd0-f176.google.com with SMTP id w10so4290285pde.21
 for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2013 18:36:11 -0800 (PST)
Message-ID: <1386556564.19311.1.camel@phoenix>
Subject: Mount jffs2 on spi nor flash issue
From: Axel Lin <axel.lin@ingics.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 09 Dec 2013 10:36:04 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,
I'm trying to mount a jffs2 on a spi nor flash but I got hangup after below messages:

VFS: Mounted root (jffs2 filesystem) on device 31:1.
devtmpfs: mounted
Freeing unused kernel memory: 92K (00364000 - 0037b000)

( I can mount the jffs2 image on my host using mtdram to test mount.
However, I got hang up when using jffs on my target machine.
The nor-flash is compatible to MX25L3205D.)

After setting CONFIG_JFFS2_FS_DEBUG=1, I got below messages:

[JFFS2 DBG] (1) jffs2_sum_init: returned successfully
[JFFS2 DBG] (1) jffs2_build_filesystem: build FS data structures
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00000000 at 0x0000ee00 (0x1200 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00000000-0x0000002b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c018 (ino #1)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b000 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b000 (fffffffe becomes 00000000,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "bin", ino #2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000002c-0x00000070
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c030 (ino #2)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b000 is (00000000,01c5c018)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b008 (fffffffe becomes 0000002c,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00000070-0x0000009b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b008 is (0000002c,01c5c030)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b010 (fffffffe becomes 00000070,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dev", ino #3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000009c-0x000000e0
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c048 (ino #3)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b010 is (00000070,01e5b000)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b018 (fffffffe becomes 0000009c,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000000e0-0x0000010b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b018 is (0000009c,01c5c048)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b020 (fffffffe becomes 000000e0,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "etc", ino #4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000010c-0x00000150
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c060 (ino #4)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b020 is (000000e0,01e5b010)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b028 (fffffffe becomes 0000010c,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00000150-0x0000017c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b028 is (0000010c,01c5c060)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b030 (fffffffe becomes 00000150,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "home", ino #5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000017c-0x000001c0
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c078 (ino #5)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b030 is (00000150,01e5b020)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b038 (fffffffe becomes 0000017c,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000001c0-0x000001eb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b038 is (0000017c,01c5c078)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b040 (fffffffe becomes 000001c0,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lib", ino #6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000001ec-0x00000230
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c090 (ino #6)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b040 is (000001c0,01e5b030)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b048 (fffffffe becomes 000001ec,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00000230-0x0000025d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b048 is (000001ec,01c5c090)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b050 (fffffffe becomes 00000230,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lib32", ino #7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00000260-0x000002a7
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c0a8 (ino #7)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b050 is (00000230,01e5b040)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b058 (fffffffe becomes 00000260,  (null)) len 0x48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000002a8-0x000002d7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b058 is (00000260,01c5c0a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b060 (fffffffe becomes 000002a8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "linuxrc", ino #8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000002d8-0x00000327
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c0c0 (ino #8)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b060 is (000002a8,01e5b050)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b068 (fffffffe becomes 000002d8,  (null)) len 0x50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00000328-0x00000355
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b068 is (000002d8,01c5c0c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b070 (fffffffe becomes 00000328,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "media", ino #9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00000358-0x0000039c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c0d8 (ino #9)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b070 is (00000328,01e5b060)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b078 (fffffffe becomes 00000358,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0000039c-0x000003c7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b078 is (00000358,01c5c0d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b080 (fffffffe becomes 0000039c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mnt", ino #10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000003c8-0x0000040c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c0f0 (ino #10)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b080 is (0000039c,01e5b070)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b088 (fffffffe becomes 000003c8,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0000040c-0x00000437
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b088 is (000003c8,01c5c0f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b090 (fffffffe becomes 0000040c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "opt", ino #11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00000438-0x0000047c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c108 (ino #11)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b090 is (0000040c,01e5b080)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b098 (fffffffe becomes 00000438,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0000047c-0x000004a8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b098 is (00000438,01c5c108)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0a0 (fffffffe becomes 0000047c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "proc", ino #12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000004a8-0x000004ec
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c120 (ino #12)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0a0 is (0000047c,01e5b090)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0a8 (fffffffe becomes 000004a8,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000004ec-0x00000518
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0a8 is (000004a8,01c5c120)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0b0 (fffffffe becomes 000004ec,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "root", ino #13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00000518-0x0000055c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c138 (ino #13)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0b0 is (000004ec,01e5b0a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0b8 (fffffffe becomes 00000518,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0000055c-0x00000587
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0b8 is (00000518,01c5c138)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0c0 (fffffffe becomes 0000055c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "run", ino #14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00000588-0x000005cf
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c150 (ino #14)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0c0 is (0000055c,01e5b0b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0c8 (fffffffe becomes 00000588,  (null)) len 0x48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 26
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000005d0-0x000005fc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0c8 is (00000588,01c5c150)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0d0 (fffffffe becomes 000005d0,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sbin", ino #15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 27
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000005fc-0x00000640
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c168 (ino #15)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0d0 is (000005d0,01e5b0c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0d8 (fffffffe becomes 000005fc,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 28
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00000640-0x0000066b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0d8 is (000005fc,01c5c168)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0e0 (fffffffe becomes 00000640,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sys", ino #16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 29
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000066c-0x000006b0
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c180 (ino #16)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0e0 is (00000640,01e5b0d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0e8 (fffffffe becomes 0000066c,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000006b0-0x000006db
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0e8 is (0000066c,01c5c180)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b0f8 (fffffffe becomes 000006b0,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tmp", ino #17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 31
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000006dc-0x00000720
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c198 (ino #17)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b0f8 is (000006b0,01e5b0e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b100 (fffffffe becomes 000006dc,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 32
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00000720-0x0000074b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b100 is (000006dc,01c5c198)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b108 (fffffffe becomes 00000720,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "usr", ino #18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 33
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000074c-0x00000790
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c1b0 (ino #18)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b108 is (00000720,01e5b0f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b110 (fffffffe becomes 0000074c,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00000790-0x000007bb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b110 is (0000074c,01c5c1b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b118 (fffffffe becomes 00000790,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "var", ino #19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 35
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000007bc-0x00000800
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c1c8 (ino #19)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b118 is (00000790,01e5b108)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b120 (fffffffe becomes 000007bc,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 36
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00000800-0x0000082f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b120 is (000007bc,01c5c1c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b128 (fffffffe becomes 00000800,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "busybox", ino #20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 37
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00000830-0x0000124c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c1e0 (ino #20)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b128 is (00000800,01e5b008)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b130 (fffffffe becomes 00000830,  (null)) len 0xa1c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 38
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000124c-0x00001cb8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b130 is (00000830,01c5c1e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b138 (fffffffe becomes 0000124c,  (null)) len 0xa6c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 39
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00001cb8-0x0000269c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b138 is (0000124c,01e5b130)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b140 (fffffffe becomes 00001cb8,  (null)) len 0x9e4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000269c-0x00002d20
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b140 is (00001cb8,01e5b138)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b148 (fffffffe becomes 0000269c,  (null)) len 0x684
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 41
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00002d20-0x00003493
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b148 is (0000269c,01e5b140)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b150 (fffffffe becomes 00002d20,  (null)) len 0x774
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 42
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00003494-0x00003e57
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b150 is (00002d20,01e5b148)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b158 (fffffffe becomes 00003494,  (null)) len 0x9c4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 43
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00003e58-0x000048f9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b158 is (00003494,01e5b150)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b160 (fffffffe becomes 00003e58,  (null)) len 0xaa4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000048fc-0x0000535e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b160 is (00003e58,01e5b158)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b168 (fffffffe becomes 000048fc,  (null)) len 0xa64
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 45
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00005360-0x00005ded
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b168 is (000048fc,01e5b160)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b170 (fffffffe becomes 00005360,  (null)) len 0xa90
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 46
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00005df0-0x00006881
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b170 is (00005360,01e5b168)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b178 (fffffffe becomes 00005df0,  (null)) len 0xa94
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 47
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00006884-0x000072ed
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b178 is (00005df0,01e5b170)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b180 (fffffffe becomes 00006884,  (null)) len 0xa6c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000072f0-0x00007b85
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b180 is (00006884,01e5b178)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b188 (fffffffe becomes 000072f0,  (null)) len 0x898
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 49
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00007b88-0x00008690
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b188 is (000072f0,01e5b180)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b190 (fffffffe becomes 00007b88,  (null)) len 0xb08
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00008690-0x0000914b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b190 is (00007b88,01e5b188)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b198 (fffffffe becomes 00008690,  (null)) len 0xabc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 51
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000914c-0x00009bd2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b198 is (00008690,01e5b190)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1a0 (fffffffe becomes 0000914c,  (null)) len 0xa88
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 52
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00009bd4-0x0000a5ea
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b1a0 is (0000914c,01e5b198)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1a8 (fffffffe becomes 00009bd4,  (null)) len 0xa18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 53
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000a5ec-0x0000b070
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b1a8 is (00009bd4,01e5b1a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1b0 (fffffffe becomes 0000a5ec,  (null)) len 0xa84
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000b070-0x0000bafd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b1b0 is (0000a5ec,01e5b1a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1b8 (fffffffe becomes 0000b070,  (null)) len 0xa90
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 55
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000bb00-0x0000c5e5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b1b8 is (0000b070,01e5b1b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1c0 (fffffffe becomes 0000bb00,  (null)) len 0xae8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 56
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000c5e8-0x0000d0ef
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b1c0 is (0000bb00,01e5b1b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1c8 (fffffffe becomes 0000c5e8,  (null)) len 0xb08
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 57
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000d0f0-0x0000d959
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b1c8 is (0000c5e8,01e5b1c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1d0 (fffffffe becomes 0000d0f0,  (null)) len 0x86c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000d95c-0x0000e329
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b1d0 is (0000d0f0,01e5b1c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1d8 (fffffffe becomes 0000d95c,  (null)) len 0x9d0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 59
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0000e32c-0x0000edfe
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b1d8 is (0000d95c,01e5b1d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1e0 (fffffffe becomes 0000e32c,  (null)) len 0xad4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b1e0 is (0000e32c,01e5b1d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b1f0 (fffffffe becomes 0000ee03,  (null)) len 0x1200
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00010000 at 0x0001ee60 (0x11a0 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00010000-0x000109e6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b2e8 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b2e8 (fffffffe becomes 00010000,  (null)) len 0x9e8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000109e8-0x000111fb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b2e8 is (00010000,01e5b1e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b2f0 (fffffffe becomes 000109e8,  (null)) len 0x814
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000111fc-0x0001146d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b2f0 is (000109e8,01e5b2e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b2f8 (fffffffe becomes 000111fc,  (null)) len 0x274
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00011470-0x00011e69
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b2f8 is (000111fc,01e5b2f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b300 (fffffffe becomes 00011470,  (null)) len 0x9fc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00011e6c-0x000128da
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b300 is (00011470,01e5b2f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b308 (fffffffe becomes 00011e6c,  (null)) len 0xa70
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000128dc-0x000133c3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b308 is (00011e6c,01e5b300)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b310 (fffffffe becomes 000128dc,  (null)) len 0xae8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000133c4-0x00013edf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b310 is (000128dc,01e5b308)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b318 (fffffffe becomes 000133c4,  (null)) len 0xb1c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00013ee0-0x000147ef
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b318 is (000133c4,01e5b310)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b320 (fffffffe becomes 00013ee0,  (null)) len 0x910
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000147f0-0x0001529a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b320 is (00013ee0,01e5b318)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b328 (fffffffe becomes 000147f0,  (null)) len 0xaac
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0001529c-0x00015d02
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b328 is (000147f0,01e5b320)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b330 (fffffffe becomes 0001529c,  (null)) len 0xa68
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00015d04-0x00016601
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b330 is (0001529c,01e5b328)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b338 (fffffffe becomes 00015d04,  (null)) len 0x900
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00016604-0x00016ef3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b338 is (00015d04,01e5b330)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b340 (fffffffe becomes 00016604,  (null)) len 0x8f0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00016ef4-0x000179c9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b340 is (00016604,01e5b338)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b348 (fffffffe becomes 00016ef4,  (null)) len 0xad8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000179cc-0x00018467
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b348 is (00016ef4,01e5b340)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b350 (fffffffe becomes 000179cc,  (null)) len 0xa9c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00018468-0x00018f94
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b350 is (000179cc,01e5b348)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b358 (fffffffe becomes 00018468,  (null)) len 0xb2c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00018f94-0x00019a2d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b358 is (00018468,01e5b350)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b360 (fffffffe becomes 00018f94,  (null)) len 0xa9c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00019a30-0x0001a54a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b360 is (00018f94,01e5b358)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b368 (fffffffe becomes 00019a30,  (null)) len 0xb1c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0001a54c-0x0001afed
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b368 is (00019a30,01e5b360)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b370 (fffffffe becomes 0001a54c,  (null)) len 0xaa4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0001aff0-0x0001b92a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b370 is (0001a54c,01e5b368)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b378 (fffffffe becomes 0001aff0,  (null)) len 0x93c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0001b92c-0x0001c2c6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b378 is (0001aff0,01e5b370)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b380 (fffffffe becomes 0001b92c,  (null)) len 0x99c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0001c2c8-0x0001ce06
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b380 is (0001b92c,01e5b378)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b388 (fffffffe becomes 0001c2c8,  (null)) len 0xb40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0001ce08-0x0001d8f6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b388 is (0001c2c8,01e5b380)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b390 (fffffffe becomes 0001ce08,  (null)) len 0xaf0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0001d8f8-0x0001e368
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b390 is (0001ce08,01e5b388)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b398 (fffffffe becomes 0001d8f8,  (null)) len 0xa70
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0001e368-0x0001ee5e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b398 is (0001d8f8,01e5b390)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b3a0 (fffffffe becomes 0001e368,  (null)) len 0xaf8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b3a0 is (0001e368,01e5b398)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b3a8 (fffffffe becomes 0001ee63,  (null)) len 0x11a0
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00020000 at 0x0002eb90 (0x1470 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00020000-0x00020aeb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b3e0 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b3e0 (fffffffe becomes 00020000,  (null)) len 0xaec
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00020aec-0x0002149e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b3e0 is (00020000,01e5b3a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b3e8 (fffffffe becomes 00020aec,  (null)) len 0x9b4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000214a0-0x00021f7b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b3e8 is (00020aec,01e5b3e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b3f0 (fffffffe becomes 000214a0,  (null)) len 0xadc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00021f7c-0x00022398
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b3f0 is (000214a0,01e5b3e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b3f8 (fffffffe becomes 00021f7c,  (null)) len 0x41c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00022398-0x00022b13
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b3f8 is (00021f7c,01e5b3f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b400 (fffffffe becomes 00022398,  (null)) len 0x77c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00022b14-0x000235c4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b400 is (00022398,01e5b3f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b408 (fffffffe becomes 00022b14,  (null)) len 0xab0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000235c4-0x00024090
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b408 is (00022b14,01e5b400)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b410 (fffffffe becomes 000235c4,  (null)) len 0xacc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00024090-0x00024b3b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b410 is (000235c4,01e5b408)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b418 (fffffffe becomes 00024090,  (null)) len 0xaac
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00024b3c-0x000256a0
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b418 is (00024090,01e5b410)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b420 (fffffffe becomes 00024b3c,  (null)) len 0xb64
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000256a0-0x00026092
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b420 is (00024b3c,01e5b418)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b428 (fffffffe becomes 000256a0,  (null)) len 0x9f4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00026094-0x00026b30
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b428 is (000256a0,01e5b420)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b430 (fffffffe becomes 00026094,  (null)) len 0xa9c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00026b30-0x000275a1
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b430 is (00026094,01e5b428)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b438 (fffffffe becomes 00026b30,  (null)) len 0xa74
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000275a4-0x000280ac
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b438 is (00026b30,01e5b430)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b440 (fffffffe becomes 000275a4,  (null)) len 0xb08
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000280ac-0x00028ae5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b440 is (000275a4,01e5b438)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b448 (fffffffe becomes 000280ac,  (null)) len 0xa3c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00028ae8-0x00029580
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b448 is (000280ac,01e5b440)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b450 (fffffffe becomes 00028ae8,  (null)) len 0xa98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00029580-0x0002a0be
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b450 is (00028ae8,01e5b448)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b458 (fffffffe becomes 00029580,  (null)) len 0xb40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0002a0c0-0x0002ab90
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b458 is (00029580,01e5b450)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b460 (fffffffe becomes 0002a0c0,  (null)) len 0xad0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0002ab90-0x0002b6cc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b460 is (0002a0c0,01e5b458)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b468 (fffffffe becomes 0002ab90,  (null)) len 0xb3c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0002b6cc-0x0002c18b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b468 is (0002ab90,01e5b460)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b470 (fffffffe becomes 0002b6cc,  (null)) len 0xac0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0002c18c-0x0002cc4a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b470 is (0002b6cc,01e5b468)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b478 (fffffffe becomes 0002c18c,  (null)) len 0xac0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0002cc4c-0x0002d730
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b478 is (0002c18c,01e5b470)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b480 (fffffffe becomes 0002cc4c,  (null)) len 0xae4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0002d730-0x0002e1a4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b480 is (0002cc4c,01e5b478)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b488 (fffffffe becomes 0002d730,  (null)) len 0xa74
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0002e1a4-0x0002eb8d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b488 is (0002d730,01e5b480)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b490 (fffffffe becomes 0002e1a4,  (null)) len 0x9ec
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b490 is (0002e1a4,01e5b488)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b498 (fffffffe becomes 0002eb93,  (null)) len 0x1470
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00030000 at 0x0003f180 (0xe80 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00030000-0x00030a4b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b4d8 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b4d8 (fffffffe becomes 00030000,  (null)) len 0xa4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00030a4c-0x0003139b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b4d8 is (00030000,01e5b490)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b4e0 (fffffffe becomes 00030a4c,  (null)) len 0x950
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0003139c-0x00031de3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b4e0 is (00030a4c,01e5b4d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b4e8 (fffffffe becomes 0003139c,  (null)) len 0xa48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00031de4-0x00032924
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b4e8 is (0003139c,01e5b4e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b4f0 (fffffffe becomes 00031de4,  (null)) len 0xb40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00032924-0x0003343d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b4f0 is (00031de4,01e5b4e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b4f8 (fffffffe becomes 00032924,  (null)) len 0xb1c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00033440-0x00033804
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b4f8 is (00032924,01e5b4f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b500 (fffffffe becomes 00033440,  (null)) len 0x3c4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00033804-0x00033fab
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b500 is (00033440,01e5b4f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b508 (fffffffe becomes 00033804,  (null)) len 0x7a8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00033fac-0x00034a54
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b508 is (00033804,01e5b500)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b510 (fffffffe becomes 00033fac,  (null)) len 0xaa8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00034a54-0x00035581
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b510 is (00033fac,01e5b508)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b518 (fffffffe becomes 00034a54,  (null)) len 0xb30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00035584-0x00035f80
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b518 is (00034a54,01e5b510)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b520 (fffffffe becomes 00035584,  (null)) len 0x9fc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00035f80-0x000368df
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b520 is (00035584,01e5b518)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b528 (fffffffe becomes 00035f80,  (null)) len 0x960
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000368e0-0x00037347
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b528 is (00035f80,01e5b520)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b530 (fffffffe becomes 000368e0,  (null)) len 0xa68
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00037348-0x00037d10
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b530 is (000368e0,01e5b528)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b538 (fffffffe becomes 00037348,  (null)) len 0x9c8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00037d10-0x00038766
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b538 is (00037348,01e5b530)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b540 (fffffffe becomes 00037d10,  (null)) len 0xa58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00038768-0x000391fb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b540 is (00037d10,01e5b538)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b548 (fffffffe becomes 00038768,  (null)) len 0xa94
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000391fc-0x00039cd5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b548 is (00038768,01e5b540)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b550 (fffffffe becomes 000391fc,  (null)) len 0xadc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00039cd8-0x0003a7b8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b550 is (000391fc,01e5b548)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b558 (fffffffe becomes 00039cd8,  (null)) len 0xae0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0003a7b8-0x0003b2c8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b558 is (00039cd8,01e5b550)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b560 (fffffffe becomes 0003a7b8,  (null)) len 0xb10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0003b2c8-0x0003bd79
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b560 is (0003a7b8,01e5b558)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b568 (fffffffe becomes 0003b2c8,  (null)) len 0xab4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0003bd7c-0x0003c744
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b568 is (0003b2c8,01e5b560)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b570 (fffffffe becomes 0003bd7c,  (null)) len 0x9c8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0003c744-0x0003d1dd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b570 is (0003bd7c,01e5b568)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b578 (fffffffe becomes 0003c744,  (null)) len 0xa9c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0003d1e0-0x0003dcdc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b578 is (0003c744,01e5b570)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b580 (fffffffe becomes 0003d1e0,  (null)) len 0xafc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0003dcdc-0x0003e763
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b580 is (0003d1e0,01e5b578)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b588 (fffffffe becomes 0003dcdc,  (null)) len 0xa88
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0003e764-0x0003f17f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b588 is (0003dcdc,01e5b580)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b590 (fffffffe becomes 0003e764,  (null)) len 0xa1c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b590 is (0003e764,01e5b588)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b598 (fffffffe becomes 0003f183,  (null)) len 0xe80
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00040000 at 0x0004ecec (0x1314 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00040000-0x00040bad
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b5d0 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b5d0 (fffffffe becomes 00040000,  (null)) len 0xbb0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00040bb0-0x000416e2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b5d0 is (00040000,01e5b590)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b5d8 (fffffffe becomes 00040bb0,  (null)) len 0xb34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000416e4-0x000421ae
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b5d8 is (00040bb0,01e5b5d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b5e0 (fffffffe becomes 000416e4,  (null)) len 0xacc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000421b0-0x00042c7d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b5e0 is (000416e4,01e5b5d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b5e8 (fffffffe becomes 000421b0,  (null)) len 0xad0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00042c80-0x0004383a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b5e8 is (000421b0,01e5b5e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b5f0 (fffffffe becomes 00042c80,  (null)) len 0xbbc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0004383c-0x000442b7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b5f0 is (00042c80,01e5b5e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b5f8 (fffffffe becomes 0004383c,  (null)) len 0xa7c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000442b8-0x00044680
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b5f8 is (0004383c,01e5b5f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b600 (fffffffe becomes 000442b8,  (null)) len 0x3c8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00044680-0x00044eb8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b600 is (000442b8,01e5b5f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b608 (fffffffe becomes 00044680,  (null)) len 0x838
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00044eb8-0x0004596d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b608 is (00044680,01e5b600)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b610 (fffffffe becomes 00044eb8,  (null)) len 0xab8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00045970-0x000463a3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b610 is (00044eb8,01e5b608)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b618 (fffffffe becomes 00045970,  (null)) len 0xa34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000463a4-0x00046e10
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b618 is (00045970,01e5b610)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b620 (fffffffe becomes 000463a4,  (null)) len 0xa6c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00046e10-0x00047933
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b620 is (000463a4,01e5b618)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b628 (fffffffe becomes 00046e10,  (null)) len 0xb24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00047934-0x0004846f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b628 is (00046e10,01e5b620)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b630 (fffffffe becomes 00047934,  (null)) len 0xb3c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00048470-0x00048f26
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b630 is (00047934,01e5b628)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b638 (fffffffe becomes 00048470,  (null)) len 0xab8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00048f28-0x000498f7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b638 is (00048470,01e5b630)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b640 (fffffffe becomes 00048f28,  (null)) len 0x9d0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000498f8-0x0004a383
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b640 is (00048f28,01e5b638)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b648 (fffffffe becomes 000498f8,  (null)) len 0xa8c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0004a384-0x0004ae41
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b648 is (000498f8,01e5b640)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b650 (fffffffe becomes 0004a384,  (null)) len 0xac0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0004ae44-0x0004b893
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b650 is (0004a384,01e5b648)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b658 (fffffffe becomes 0004ae44,  (null)) len 0xa50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0004b894-0x0004c33e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b658 is (0004ae44,01e5b650)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b660 (fffffffe becomes 0004b894,  (null)) len 0xaac
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0004c340-0x0004cd55
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b660 is (0004b894,01e5b658)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b668 (fffffffe becomes 0004c340,  (null)) len 0xa18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0004cd58-0x0004d7c5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b668 is (0004c340,01e5b660)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b670 (fffffffe becomes 0004cd58,  (null)) len 0xa70
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0004d7c8-0x0004e266
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b670 is (0004cd58,01e5b668)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b678 (fffffffe becomes 0004d7c8,  (null)) len 0xaa0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0004e268-0x0004ece9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b678 is (0004d7c8,01e5b670)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b680 (fffffffe becomes 0004e268,  (null)) len 0xa84
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b680 is (0004e268,01e5b678)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b688 (fffffffe becomes 0004ecef,  (null)) len 0x1314
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00050000 at 0x0005ebe0 (0x1420 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00050000-0x00050af2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b6c8 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b6c8 (fffffffe becomes 00050000,  (null)) len 0xaf4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00050af4-0x00051618
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b6c8 is (00050000,01e5b680)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b6d0 (fffffffe becomes 00050af4,  (null)) len 0xb24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00051618-0x000520a5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b6d0 is (00050af4,01e5b6c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b6d8 (fffffffe becomes 00051618,  (null)) len 0xa90
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000520a8-0x00052b58
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b6d8 is (00051618,01e5b6d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b6e0 (fffffffe becomes 000520a8,  (null)) len 0xab0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00052b58-0x00053618
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b6e0 is (000520a8,01e5b6d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b6e8 (fffffffe becomes 00052b58,  (null)) len 0xac0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00053618-0x0005410d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b6e8 is (00052b58,01e5b6e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b6f0 (fffffffe becomes 00053618,  (null)) len 0xaf8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00054110-0x00054b44
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b6f0 is (00053618,01e5b6e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b6f8 (fffffffe becomes 00054110,  (null)) len 0xa34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00054b44-0x00055676
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b6f8 is (00054110,01e5b6f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b700 (fffffffe becomes 00054b44,  (null)) len 0xb34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00055678-0x00055990
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b700 is (00054b44,01e5b6f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b708 (fffffffe becomes 00055678,  (null)) len 0x318
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00055990-0x00056296
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b708 is (00055678,01e5b700)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b710 (fffffffe becomes 00055990,  (null)) len 0x908
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00056298-0x00056dbb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b710 is (00055990,01e5b708)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b718 (fffffffe becomes 00056298,  (null)) len 0xb24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00056dbc-0x000578a4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b718 is (00056298,01e5b710)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b720 (fffffffe becomes 00056dbc,  (null)) len 0xae8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000578a4-0x000582fe
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b720 is (00056dbc,01e5b718)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b728 (fffffffe becomes 000578a4,  (null)) len 0xa5c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00058300-0x00058d7c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b728 is (000578a4,01e5b720)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b730 (fffffffe becomes 00058300,  (null)) len 0xa7c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00058d7c-0x00059839
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b730 is (00058300,01e5b728)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b738 (fffffffe becomes 00058d7c,  (null)) len 0xac0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0005983c-0x0005a2c7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b738 is (00058d7c,01e5b730)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b740 (fffffffe becomes 0005983c,  (null)) len 0xa8c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0005a2c8-0x0005ac8d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b740 is (0005983c,01e5b738)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b748 (fffffffe becomes 0005a2c8,  (null)) len 0x9c8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0005ac90-0x0005b735
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b748 is (0005a2c8,01e5b740)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b750 (fffffffe becomes 0005ac90,  (null)) len 0xaa8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0005b738-0x0005c19d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b750 is (0005ac90,01e5b748)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b758 (fffffffe becomes 0005b738,  (null)) len 0xa68
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0005c1a0-0x0005cc8c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b758 is (0005b738,01e5b750)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b760 (fffffffe becomes 0005c1a0,  (null)) len 0xaec
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0005cc8c-0x0005d730
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b760 is (0005c1a0,01e5b758)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b768 (fffffffe becomes 0005cc8c,  (null)) len 0xaa4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0005d730-0x0005e138
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b768 is (0005cc8c,01e5b760)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b770 (fffffffe becomes 0005d730,  (null)) len 0xa08
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0005e138-0x0005ebde
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b770 is (0005d730,01e5b768)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b778 (fffffffe becomes 0005e138,  (null)) len 0xaa8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b778 is (0005e138,01e5b770)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b780 (fffffffe becomes 0005ebe3,  (null)) len 0x1420
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00060000 at 0x0006edd0 (0x1230 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00060000-0x00060ab8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b7c0 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b7c0 (fffffffe becomes 00060000,  (null)) len 0xab8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00060ab8-0x00061567
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b7c0 is (00060000,01e5b778)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b7c8 (fffffffe becomes 00060ab8,  (null)) len 0xab0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00061568-0x00061fc3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b7c8 is (00060ab8,01e5b7c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b7d0 (fffffffe becomes 00061568,  (null)) len 0xa5c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00061fc4-0x00062a3b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b7d0 is (00061568,01e5b7c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b7d8 (fffffffe becomes 00061fc4,  (null)) len 0xa78
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00062a3c-0x0006343b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b7d8 is (00061fc4,01e5b7d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b7e0 (fffffffe becomes 00062a3c,  (null)) len 0xa00
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006343c-0x00063ee5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b7e0 is (00062a3c,01e5b7d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b7e8 (fffffffe becomes 0006343c,  (null)) len 0xaac
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00063ee8-0x000649c1
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b7e8 is (0006343c,01e5b7e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b7f0 (fffffffe becomes 00063ee8,  (null)) len 0xadc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000649c4-0x00065507
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b7f0 is (00063ee8,01e5b7e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b7f8 (fffffffe becomes 000649c4,  (null)) len 0xb44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00065508-0x00066053
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b7f8 is (000649c4,01e5b7f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b800 (fffffffe becomes 00065508,  (null)) len 0xb4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00066054-0x00066a97
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b800 is (00065508,01e5b7f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b808 (fffffffe becomes 00066054,  (null)) len 0xa44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00066a98-0x00066daa
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b808 is (00066054,01e5b800)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b810 (fffffffe becomes 00066a98,  (null)) len 0x314
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00066dac-0x00067645
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b810 is (00066a98,01e5b808)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b818 (fffffffe becomes 00066dac,  (null)) len 0x89c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00067648-0x00067f6e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b818 is (00066dac,01e5b810)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b820 (fffffffe becomes 00067648,  (null)) len 0x928
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00067f70-0x000689ef
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b820 is (00067648,01e5b818)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b828 (fffffffe becomes 00067f70,  (null)) len 0xa80
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000689f0-0x00069162
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b828 is (00067f70,01e5b820)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b830 (fffffffe becomes 000689f0,  (null)) len 0x774
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00069164-0x00069ae4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b830 is (000689f0,01e5b828)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b838 (fffffffe becomes 00069164,  (null)) len 0x980
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00069ae4-0x0006a30f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b838 is (00069164,01e5b830)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b840 (fffffffe becomes 00069ae4,  (null)) len 0x82c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006a310-0x0006abcd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b840 is (00069ae4,01e5b838)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b848 (fffffffe becomes 0006a310,  (null)) len 0x8c0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006abd0-0x0006b456
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b848 is (0006a310,01e5b840)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b850 (fffffffe becomes 0006abd0,  (null)) len 0x888
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006b458-0x0006bcdd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b850 is (0006abd0,01e5b848)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b858 (fffffffe becomes 0006b458,  (null)) len 0x888
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006bce0-0x0006c509
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b858 is (0006b458,01e5b850)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b860 (fffffffe becomes 0006bce0,  (null)) len 0x82c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006c50c-0x0006cc68
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b860 is (0006bce0,01e5b858)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b868 (fffffffe becomes 0006c50c,  (null)) len 0x75c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006cc68-0x0006d4df
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b868 is (0006c50c,01e5b860)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b870 (fffffffe becomes 0006cc68,  (null)) len 0x878
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006d4e0-0x0006dd41
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b870 is (0006cc68,01e5b868)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b878 (fffffffe becomes 0006d4e0,  (null)) len 0x864
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006dd44-0x0006e5e3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b878 is (0006d4e0,01e5b870)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b880 (fffffffe becomes 0006dd44,  (null)) len 0x8a0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0006e5e4-0x0006edd0
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b880 is (0006dd44,01e5b878)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b888 (fffffffe becomes 0006e5e4,  (null)) len 0x7ec
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b888 is (0006e5e4,01e5b880)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b890 (fffffffe becomes 0006edd3,  (null)) len 0x1230
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00070000 at 0x0007fad0 (0x530 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00070000-0x000708cf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8b8 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b8b8 (fffffffe becomes 00070000,  (null)) len 0x8d0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000708d0-0x00071164
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8b8 is (00070000,01e5b888)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b8c0 (fffffffe becomes 000708d0,  (null)) len 0x894
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00071164-0x00071bac
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8c0 is (000708d0,01e5b8b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b8c8 (fffffffe becomes 00071164,  (null)) len 0xa48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00071bac-0x000723e4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8c8 is (00071164,01e5b8c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b8d0 (fffffffe becomes 00071bac,  (null)) len 0x838
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000723e4-0x00072cbe
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8d0 is (00071bac,01e5b8c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b8d8 (fffffffe becomes 000723e4,  (null)) len 0x8dc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00072cc0-0x000735f2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8d8 is (000723e4,01e5b8d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b8e0 (fffffffe becomes 00072cc0,  (null)) len 0x934
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000735f4-0x00073e93
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8e0 is (00072cc0,01e5b8d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b8e8 (fffffffe becomes 000735f4,  (null)) len 0x8a0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00073e94-0x00074751
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8e8 is (000735f4,01e5b8e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b8f0 (fffffffe becomes 00073e94,  (null)) len 0x8c0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00074754-0x000750df
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8f0 is (00073e94,01e5b8e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b8f8 (fffffffe becomes 00074754,  (null)) len 0x98c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000750e0-0x000759b3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b8f8 is (00074754,01e5b8f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b900 (fffffffe becomes 000750e0,  (null)) len 0x8d4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000759b4-0x00076310
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b900 is (000750e0,01e5b8f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b908 (fffffffe becomes 000759b4,  (null)) len 0x95c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00076310-0x00076c8c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b908 is (000759b4,01e5b900)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b910 (fffffffe becomes 00076310,  (null)) len 0x97c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00076c8c-0x00077520
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b910 is (00076310,01e5b908)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b918 (fffffffe becomes 00076c8c,  (null)) len 0x894
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00077520-0x00077ebb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b918 is (00076c8c,01e5b910)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b920 (fffffffe becomes 00077520,  (null)) len 0x99c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00077ebc-0x00077fd7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b920 is (00077520,01e5b918)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b928 (fffffffe becomes 00077ebc,  (null)) len 0x11c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00077fd8-0x00078896
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b928 is (00077ebc,01e5b920)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b930 (fffffffe becomes 00077fd8,  (null)) len 0x8c0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00078898-0x00079307
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b930 is (00077fd8,01e5b928)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b938 (fffffffe becomes 00078898,  (null)) len 0xa70
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00079308-0x00079c94
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b938 is (00078898,01e5b930)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b940 (fffffffe becomes 00079308,  (null)) len 0x98c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00079c94-0x0007a991
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b940 is (00079308,01e5b938)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b948 (fffffffe becomes 00079c94,  (null)) len 0xd00
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007a994-0x0007b23d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b948 is (00079c94,01e5b940)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b950 (fffffffe becomes 0007a994,  (null)) len 0x8ac
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007b240-0x0007bb8b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b950 is (0007a994,01e5b948)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b958 (fffffffe becomes 0007b240,  (null)) len 0x94c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007bb8c-0x0007c526
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b958 is (0007b240,01e5b950)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b960 (fffffffe becomes 0007bb8c,  (null)) len 0x99c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007c528-0x0007cee8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b960 is (0007bb8c,01e5b958)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b968 (fffffffe becomes 0007c528,  (null)) len 0x9c0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007cee8-0x0007d8a5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b968 is (0007c528,01e5b960)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b970 (fffffffe becomes 0007cee8,  (null)) len 0x9c0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007d8a8-0x0007e21f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b970 is (0007cee8,01e5b968)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b978 (fffffffe becomes 0007d8a8,  (null)) len 0x978
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007e220-0x0007ebc3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b978 is (0007d8a8,01e5b970)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b980 (fffffffe becomes 0007e220,  (null)) len 0x9a4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 26
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007ebc4-0x0007f373
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b980 is (0007e220,01e5b978)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b988 (fffffffe becomes 0007ebc4,  (null)) len 0x7b0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 27
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f374-0x0007f39f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b988 is (0007ebc4,01e5b980)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b990 (fffffffe becomes 0007f374,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cat", ino #21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 28
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f3a0-0x0007f3eb
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c1f8 (ino #21)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b990 is (0007f374,01e5b128)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b998 (fffffffe becomes 0007f3a0,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 29
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f3ec-0x0007f418
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b998 is (0007f3a0,01c5c1f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9a0 (fffffffe becomes 0007f3ec,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "catv", ino #22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f418-0x0007f463
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c210 (ino #22)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9a0 is (0007f3ec,01e5b990)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9b0 (fffffffe becomes 0007f418,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 31
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f464-0x0007f492
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9b0 is (0007f418,01c5c210)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9b8 (fffffffe becomes 0007f464,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chattr", ino #23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 32
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f494-0x0007f4df
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c228 (ino #23)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9b8 is (0007f464,01e5b9a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9c0 (fffffffe becomes 0007f494,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 33
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f4e0-0x0007f50d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9c0 is (0007f494,01c5c228)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9c8 (fffffffe becomes 0007f4e0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chgrp", ino #24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f510-0x0007f55b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c240 (ino #24)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9c8 is (0007f4e0,01e5b9b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9d0 (fffffffe becomes 0007f510,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 35
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f55c-0x0007f589
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9d0 is (0007f510,01c5c240)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9d8 (fffffffe becomes 0007f55c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chmod", ino #25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 36
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f58c-0x0007f5d7
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c258 (ino #25)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9d8 is (0007f55c,01e5b9c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9e0 (fffffffe becomes 0007f58c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 37
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f5d8-0x0007f605
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9e0 is (0007f58c,01c5c258)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9e8 (fffffffe becomes 0007f5d8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chown", ino #26
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 38
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f608-0x0007f653
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c270 (ino #26)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9e8 is (0007f5d8,01e5b9d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9f0 (fffffffe becomes 0007f608,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 39
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f654-0x0007f67e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9f0 is (0007f608,01c5c270)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5b9f8 (fffffffe becomes 0007f654,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cp", ino #27
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f680-0x0007f6cb
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c288 (ino #27)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5b9f8 is (0007f654,01e5b9e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba00 (fffffffe becomes 0007f680,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 41
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f6cc-0x0007f6f8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba00 is (0007f680,01c5c288)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba08 (fffffffe becomes 0007f6cc,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cpio", ino #28
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 42
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f6f8-0x0007f743
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c2a0 (ino #28)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba08 is (0007f6cc,01e5b9f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba10 (fffffffe becomes 0007f6f8,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 43
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f744-0x0007f770
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba10 is (0007f6f8,01c5c2a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba18 (fffffffe becomes 0007f744,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "date", ino #29
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f770-0x0007f7bb
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c2b8 (ino #29)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba18 is (0007f744,01e5ba08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba20 (fffffffe becomes 0007f770,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 45
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f7bc-0x0007f7e6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba20 is (0007f770,01c5c2b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba28 (fffffffe becomes 0007f7bc,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dd", ino #30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 46
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f7e8-0x0007f833
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c2d0 (ino #30)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba28 is (0007f7bc,01e5ba18)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba30 (fffffffe becomes 0007f7e8,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 47
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f834-0x0007f85e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba30 is (0007f7e8,01c5c2d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba38 (fffffffe becomes 0007f834,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "df", ino #31
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f860-0x0007f8ab
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c2e8 (ino #31)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba38 is (0007f834,01e5ba28)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba40 (fffffffe becomes 0007f860,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 49
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f8ac-0x0007f8d9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba40 is (0007f860,01c5c2e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba48 (fffffffe becomes 0007f8ac,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dmesg", ino #32
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f8dc-0x0007f927
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c300 (ino #32)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba48 is (0007f8ac,01e5ba38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba50 (fffffffe becomes 0007f8dc,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 51
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f928-0x0007f95d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba50 is (0007f8dc,01c5c300)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba58 (fffffffe becomes 0007f928,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dnsdomainname", ino #33
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 52
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f960-0x0007f9ab
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c318 (ino #33)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba58 is (0007f928,01e5ba48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba60 (fffffffe becomes 0007f960,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 53
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007f9ac-0x0007f9dc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba60 is (0007f960,01c5c318)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba68 (fffffffe becomes 0007f9ac,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dumpkmap", ino #34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007f9dc-0x0007fa27
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c330 (ino #34)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba68 is (0007f9ac,01e5ba58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba70 (fffffffe becomes 0007f9dc,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 55
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007fa28-0x0007fa54
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba70 is (0007f9dc,01c5c330)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba78 (fffffffe becomes 0007fa28,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "echo", ino #35
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 56
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0007fa54-0x0007fa9f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c348 (ino #35)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba78 is (0007fa28,01e5ba68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba80 (fffffffe becomes 0007fa54,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 57
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0007faa0-0x0007facd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba80 is (0007fa54,01c5c348)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba88 (fffffffe becomes 0007faa0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "egrep", ino #36
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5ba88 is (0007faa0,01e5ba78)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5ba90 (fffffffe becomes 0007fad3,  (null)) len 0x530
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00080000 at 0x0008d208 (0x2df8 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080000-0x0008004b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c360 (ino #36)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5baa8 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5baa8 (fffffffe becomes 00080000,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0008004c-0x00080079
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5baa8 is (00080000,01c5c360)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bab0 (fffffffe becomes 0008004c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "false", ino #37
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008007c-0x000800c7
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c378 (ino #37)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bab0 is (0008004c,01e5ba88)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bab8 (fffffffe becomes 0008007c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000800c8-0x000800f7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bab8 is (0008007c,01c5c378)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bac0 (fffffffe becomes 000800c8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "fdflush", ino #38
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000800f8-0x00080143
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c390 (ino #38)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bac0 is (000800c8,01e5bab0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bac8 (fffffffe becomes 000800f8,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080144-0x00080171
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bac8 is (000800f8,01c5c390)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bad0 (fffffffe becomes 00080144,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "fgrep", ino #39
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080174-0x000801bf
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c3a8 (ino #39)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bad0 is (00080144,01e5bac0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bad8 (fffffffe becomes 00080174,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000801c0-0x000801ee
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bad8 is (00080174,01c5c3a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bae0 (fffffffe becomes 000801c0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "getopt", ino #40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000801f0-0x0008023b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c3c0 (ino #40)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bae0 is (000801c0,01e5bad0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bae8 (fffffffe becomes 000801f0,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0008023c-0x00080268
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bae8 is (000801f0,01c5c3c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5baf0 (fffffffe becomes 0008023c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "grep", ino #41
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080268-0x000802b3
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c3d8 (ino #41)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5baf0 is (0008023c,01e5bae0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5baf8 (fffffffe becomes 00080268,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000802b4-0x000802e2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5baf8 is (00080268,01c5c3d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb00 (fffffffe becomes 000802b4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "gunzip", ino #42
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000802e4-0x0008032f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c3f0 (ino #42)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb00 is (000802b4,01e5baf0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb08 (fffffffe becomes 000802e4,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080330-0x0008035c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb08 is (000802e4,01c5c3f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb10 (fffffffe becomes 00080330,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "gzip", ino #43
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008035c-0x000803a7
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c408 (ino #43)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb10 is (00080330,01e5bb00)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb18 (fffffffe becomes 0008035c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000803a8-0x000803d8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb18 is (0008035c,01c5c408)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb20 (fffffffe becomes 000803a8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hostname", ino #44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000803d8-0x00080423
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c420 (ino #44)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb20 is (000803a8,01e5bb10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb28 (fffffffe becomes 000803d8,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080424-0x00080450
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb28 is (000803d8,01c5c420)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb30 (fffffffe becomes 00080424,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hush", ino #45
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080450-0x0008049b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c438 (ino #45)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb30 is (00080424,01e5bb20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb38 (fffffffe becomes 00080450,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0008049c-0x000804c8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb38 is (00080450,01c5c438)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb40 (fffffffe becomes 0008049c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "kill", ino #46
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000804c8-0x00080513
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c450 (ino #46)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb40 is (0008049c,01e5bb30)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb48 (fffffffe becomes 000804c8,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080514-0x00080543
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb48 is (000804c8,01c5c450)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb50 (fffffffe becomes 00080514,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "linux32", ino #47
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080544-0x0008058f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c468 (ino #47)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb50 is (00080514,01e5bb40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb58 (fffffffe becomes 00080544,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080590-0x000805bf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb58 is (00080544,01c5c468)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb60 (fffffffe becomes 00080590,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "linux64", ino #48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000805c0-0x0008060b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c480 (ino #48)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb60 is (00080590,01e5bb50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb68 (fffffffe becomes 000805c0,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0008060c-0x00080636
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb68 is (000805c0,01c5c480)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb70 (fffffffe becomes 0008060c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ln", ino #49
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 26
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080638-0x00080683
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c498 (ino #49)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb70 is (0008060c,01e5bb60)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb78 (fffffffe becomes 00080638,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 27
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080684-0x000806b1
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb78 is (00080638,01c5c498)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb80 (fffffffe becomes 00080684,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "login", ino #50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 28
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000806b4-0x000806ff
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c4b0 (ino #50)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb80 is (00080684,01e5bb70)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb88 (fffffffe becomes 000806b4,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 29
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080700-0x0008072a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb88 is (000806b4,01c5c4b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bb90 (fffffffe becomes 00080700,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ls", ino #51
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008072c-0x00080777
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c4c8 (ino #51)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bb90 is (00080700,01e5bb80)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bba0 (fffffffe becomes 0008072c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 31
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080778-0x000807a6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bba0 is (0008072c,01c5c4c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bba8 (fffffffe becomes 00080778,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lsattr", ino #52
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 32
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000807a8-0x000807f3
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c4e0 (ino #52)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bba8 is (00080778,01e5bb90)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbb0 (fffffffe becomes 000807a8,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 33
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000807f4-0x00080821
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbb0 is (000807a8,01c5c4e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbb8 (fffffffe becomes 000807f4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mkdir", ino #53
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080824-0x0008086f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c4f8 (ino #53)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbb8 is (000807f4,01e5bba8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbc0 (fffffffe becomes 00080824,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 35
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080870-0x0008089d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbc0 is (00080824,01c5c4f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbc8 (fffffffe becomes 00080870,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mknod", ino #54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 36
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000808a0-0x000808eb
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c510 (ino #54)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbc8 is (00080870,01e5bbb8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbd0 (fffffffe becomes 000808a0,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 37
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000808ec-0x0008091a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbd0 is (000808a0,01c5c510)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbd8 (fffffffe becomes 000808ec,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mktemp", ino #55
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 38
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008091c-0x00080967
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c528 (ino #55)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbd8 is (000808ec,01e5bbc8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbe0 (fffffffe becomes 0008091c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 39
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080968-0x00080994
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbe0 is (0008091c,01c5c528)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbe8 (fffffffe becomes 00080968,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "more", ino #56
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080994-0x000809df
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c540 (ino #56)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbe8 is (00080968,01e5bbd8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbf0 (fffffffe becomes 00080994,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 41
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000809e0-0x00080a0d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbf0 is (00080994,01c5c540)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bbf8 (fffffffe becomes 000809e0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mount", ino #57
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 42
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080a10-0x00080a5b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c558 (ino #57)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bbf8 is (000809e0,01e5bbe8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc00 (fffffffe becomes 00080a10,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 43
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080a5c-0x00080a8e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc00 is (00080a10,01c5c558)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc08 (fffffffe becomes 00080a5c,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mountpoint", ino #58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080a90-0x00080adb
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c570 (ino #58)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc08 is (00080a5c,01e5bbf8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc10 (fffffffe becomes 00080a90,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 45
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080adc-0x00080b06
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc10 is (00080a90,01c5c570)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc18 (fffffffe becomes 00080adc,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mt", ino #59
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 46
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080b08-0x00080b53
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c588 (ino #59)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc18 is (00080adc,01e5bc08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc20 (fffffffe becomes 00080b08,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 47
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080b54-0x00080b7e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc20 is (00080b08,01c5c588)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc28 (fffffffe becomes 00080b54,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mv", ino #60
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080b80-0x00080bcb
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c5a0 (ino #60)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc28 is (00080b54,01e5bc18)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc30 (fffffffe becomes 00080b80,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 49
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080bcc-0x00080bfb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc30 is (00080b80,01c5c5a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc38 (fffffffe becomes 00080bcc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "netstat", ino #61
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080bfc-0x00080c47
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c5b8 (ino #61)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc38 is (00080bcc,01e5bc28)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc40 (fffffffe becomes 00080bfc,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 51
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080c48-0x00080c74
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc40 is (00080bfc,01c5c5b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc48 (fffffffe becomes 00080c48,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "nice", ino #62
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 52
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080c74-0x00080cbf
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c5d0 (ino #62)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc48 is (00080c48,01e5bc38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc50 (fffffffe becomes 00080c74,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 53
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080cc0-0x00080ced
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc50 is (00080c74,01c5c5d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc58 (fffffffe becomes 00080cc0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pidof", ino #63
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080cf0-0x00080d3b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c5e8 (ino #63)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc58 is (00080cc0,01e5bc48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc60 (fffffffe becomes 00080cf0,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 55
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080d3c-0x00080d68
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc60 is (00080cf0,01c5c5e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc68 (fffffffe becomes 00080d3c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ping", ino #64
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 56
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080d68-0x00080db3
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c600 (ino #64)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc68 is (00080d3c,01e5bc58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc70 (fffffffe becomes 00080d68,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 57
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080db4-0x00080de9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc70 is (00080d68,01c5c600)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc78 (fffffffe becomes 00080db4,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pipe_progress", ino #65
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080dec-0x00080e37
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c618 (ino #65)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc78 is (00080db4,01e5bc68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc80 (fffffffe becomes 00080dec,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 59
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080e38-0x00080e68
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc80 is (00080dec,01c5c618)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc88 (fffffffe becomes 00080e38,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "printenv", ino #66
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 60
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080e68-0x00080eb3
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c630 (ino #66)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc88 is (00080e38,01e5bc78)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bc98 (fffffffe becomes 00080e68,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 61
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080eb4-0x00080ede
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bc98 is (00080e68,01c5c630)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bca0 (fffffffe becomes 00080eb4,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ps", ino #67
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 62
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080ee0-0x00080f2b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c648 (ino #67)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bca0 is (00080eb4,01e5bc88)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bca8 (fffffffe becomes 00080ee0,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 63
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080f2c-0x00080f57
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bca8 is (00080ee0,01c5c648)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bcb0 (fffffffe becomes 00080f2c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pwd", ino #68
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 64
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080f58-0x00080fa3
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c660 (ino #68)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bcb0 is (00080f2c,01e5bca0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bcb8 (fffffffe becomes 00080f58,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 65
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00080fa4-0x00080fce
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bcb8 is (00080f58,01c5c660)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bcc0 (fffffffe becomes 00080fa4,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "rm", ino #69
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 66
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00080fd0-0x0008101b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c678 (ino #69)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bcc0 is (00080fa4,01e5bcb0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bcc8 (fffffffe becomes 00080fd0,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 67
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0008101c-0x00081049
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bcc8 is (00080fd0,01c5c678)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bcd0 (fffffffe becomes 0008101c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "rmdir", ino #70
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 68
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008104c-0x00081097
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c690 (ino #70)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bcd0 is (0008101c,01e5bcc0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bcd8 (fffffffe becomes 0008104c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 69
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081098-0x000810c9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bcd8 is (0008104c,01c5c690)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bce0 (fffffffe becomes 00081098,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "run-parts", ino #71
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 70
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000810cc-0x00081117
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c6a8 (ino #71)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bce0 is (00081098,01e5bcd0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bce8 (fffffffe becomes 000810cc,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 71
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081118-0x00081143
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bce8 is (000810cc,01c5c6a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bcf0 (fffffffe becomes 00081118,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sed", ino #72
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 72
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081144-0x0008118f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c6c0 (ino #72)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bcf0 is (00081118,01e5bce0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bcf8 (fffffffe becomes 00081144,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 73
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081190-0x000811bf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bcf8 is (00081144,01c5c6c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd00 (fffffffe becomes 00081190,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "setarch", ino #73
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 74
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000811c0-0x0008120b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c6d8 (ino #73)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd00 is (00081190,01e5bcf0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd08 (fffffffe becomes 000811c0,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 75
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0008120c-0x0008123d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd08 is (000811c0,01c5c6d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd10 (fffffffe becomes 0008120c,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "setserial", ino #74
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 76
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081240-0x0008128b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c6f0 (ino #74)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd10 is (0008120c,01e5bd00)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd18 (fffffffe becomes 00081240,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 77
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0008128c-0x000812b6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd18 is (00081240,01c5c6f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd20 (fffffffe becomes 0008128c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sh", ino #75
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 78
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000812b8-0x00081303
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c708 (ino #75)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd20 is (0008128c,01e5bd10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd28 (fffffffe becomes 000812b8,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 79
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081304-0x00081331
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd28 is (000812b8,01c5c708)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd30 (fffffffe becomes 00081304,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sleep", ino #76
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 80
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081334-0x0008137f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c720 (ino #76)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd30 is (00081304,01e5bd20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd38 (fffffffe becomes 00081334,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 81
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081380-0x000813ac
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd38 is (00081334,01c5c720)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd40 (fffffffe becomes 00081380,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "stty", ino #77
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 82
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000813ac-0x000813f7
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c738 (ino #77)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd40 is (00081380,01e5bd30)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd48 (fffffffe becomes 000813ac,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 83
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000813f8-0x00081422
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd48 is (000813ac,01c5c738)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd50 (fffffffe becomes 000813f8,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "su", ino #78
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 84
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081424-0x0008146f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c750 (ino #78)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd50 is (000813f8,01e5bd40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd58 (fffffffe becomes 00081424,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 85
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081470-0x0008149c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd58 is (00081424,01c5c750)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd60 (fffffffe becomes 00081470,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sync", ino #79
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 86
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008149c-0x000814e7
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c768 (ino #79)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd60 is (00081470,01e5bd50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd68 (fffffffe becomes 0008149c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 87
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000814e8-0x00081513
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd68 is (0008149c,01c5c768)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd70 (fffffffe becomes 000814e8,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tar", ino #80
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 88
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081514-0x0008155f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c780 (ino #80)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd70 is (000814e8,01e5bd60)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd78 (fffffffe becomes 00081514,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 89
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081560-0x0008158d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd78 is (00081514,01c5c780)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd80 (fffffffe becomes 00081560,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "touch", ino #81
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 90
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081590-0x000815db
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c798 (ino #81)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd80 is (00081560,01e5bd70)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd90 (fffffffe becomes 00081590,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 91
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000815dc-0x00081608
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd90 is (00081590,01c5c798)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bd98 (fffffffe becomes 000815dc,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "true", ino #82
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 92
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081608-0x00081653
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c7b0 (ino #82)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bd98 is (000815dc,01e5bd80)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bda0 (fffffffe becomes 00081608,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 93
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081654-0x00081682
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bda0 is (00081608,01c5c7b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bda8 (fffffffe becomes 00081654,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "umount", ino #83
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 94
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081684-0x000816cf
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c7c8 (ino #83)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bda8 is (00081654,01e5bd98)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bdb0 (fffffffe becomes 00081684,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 95
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000816d0-0x000816fd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bdb0 is (00081684,01c5c7c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bdb8 (fffffffe becomes 000816d0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "uname", ino #84
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 96
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081700-0x0008174b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c7e0 (ino #84)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bdb8 is (000816d0,01e5bda8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bdc0 (fffffffe becomes 00081700,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 97
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0008174c-0x0008177a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bdc0 is (00081700,01c5c7e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bdc8 (fffffffe becomes 0008174c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "usleep", ino #85
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008177c-0x000817c7
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c7f8 (ino #85)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bdc8 is (0008174c,01e5bdb8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bdd0 (fffffffe becomes 0008177c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 99
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000817c8-0x000817f2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bdd0 is (0008177c,01c5c7f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bdd8 (fffffffe becomes 000817c8,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "vi", ino #86
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 100
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000817f4-0x0008183f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c810 (ino #86)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bdd8 is (000817c8,01e5bdc8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bde0 (fffffffe becomes 000817f4,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 101
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081840-0x0008186d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bde0 is (000817f4,01c5c810)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bde8 (fffffffe becomes 00081840,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "watch", ino #87
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 102
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081870-0x000818bb
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c828 (ino #87)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bde8 is (00081840,01e5bdd8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bdf0 (fffffffe becomes 00081870,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 103
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000818bc-0x000818e8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bdf0 is (00081870,01c5c828)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bdf8 (fffffffe becomes 000818bc,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "zcat", ino #88
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 104
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000818e8-0x00081933
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c840 (ino #88)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bdf8 is (000818bc,01e5bde8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be00 (fffffffe becomes 000818e8,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 105
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081934-0x00081963
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be00 is (000818e8,01c5c840)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be08 (fffffffe becomes 00081934,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "console", ino #89
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 106
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081964-0x000819aa
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c858 (ino #89)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be08 is (00081934,01e5b018)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be10 (fffffffe becomes 00081964,  (null)) len 0x48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 107
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000819ac-0x000819d7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be10 is (00081964,01c5c858)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be18 (fffffffe becomes 000819ac,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "log", ino #90
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 108
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000819d8-0x00081a26
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c870 (ino #90)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be18 is (000819ac,01e5be08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be20 (fffffffe becomes 000819d8,  (null)) len 0x50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 109
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081a28-0x00081a53
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be20 is (000819d8,01c5c870)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be28 (fffffffe becomes 00081a28,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pts", ino #91
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 110
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081a54-0x00081a98
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c888 (ino #91)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be28 is (00081a28,01e5be18)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be30 (fffffffe becomes 00081a54,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 111
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081a98-0x00081ac8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be30 is (00081a54,01c5c888)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be38 (fffffffe becomes 00081a98,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "firmware", ino #92
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 112
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081ac8-0x00081b0c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c8a0 (ino #92)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be38 is (00081a98,01e5b028)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be40 (fffffffe becomes 00081ac8,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 113
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081b0c-0x00081b39
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be40 is (00081ac8,01c5c8a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be48 (fffffffe becomes 00081b0c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "fstab", ino #93
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 114
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081b3c-0x00081c6c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c8b8 (ino #93)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be48 is (00081b0c,01e5be38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be50 (fffffffe becomes 00081b3c,  (null)) len 0x130
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 115
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081c6c-0x00081c99
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be50 is (00081b3c,01c5c8b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be58 (fffffffe becomes 00081c6c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "group", ino #94
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 116
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081c9c-0x00081dc3
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c8d0 (ino #94)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be58 is (00081c6c,01e5be48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be60 (fffffffe becomes 00081c9c,  (null)) len 0x128
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 117
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081dc4-0x00081df4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be60 is (00081c9c,01c5c8d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be68 (fffffffe becomes 00081dc4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hostname", ino #95
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 118
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081df4-0x00081e42
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c8e8 (ino #95)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be68 is (00081dc4,01e5be58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be70 (fffffffe becomes 00081df4,  (null)) len 0x50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 119
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081e44-0x00081e71
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be70 is (00081df4,01c5c8e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be78 (fffffffe becomes 00081e44,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hosts", ino #96
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 120
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081e74-0x00081ee0
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c900 (ino #96)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be78 is (00081e44,01e5be68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be88 (fffffffe becomes 00081e74,  (null)) len 0x6c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 121
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081ee0-0x00081f0e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be88 is (00081e74,01c5c900)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be90 (fffffffe becomes 00081ee0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "init.d", ino #97
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 122
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081f10-0x00081f54
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c918 (ino #97)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be90 is (00081ee0,01e5be78)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5be98 (fffffffe becomes 00081f10,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 123
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00081f54-0x00081f83
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5be98 is (00081f10,01c5c918)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bea0 (fffffffe becomes 00081f54,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "inittab", ino #98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 124
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00081f84-0x0008220f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c930 (ino #98)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bea0 is (00081f54,01e5be90)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bea8 (fffffffe becomes 00081f84,  (null)) len 0x28c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 125
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00082210-0x0008223f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bea8 is (00081f84,01c5c930)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5beb0 (fffffffe becomes 00082210,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "inputrc", ino #99
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 126
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00082240-0x000824ae
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c948 (ino #99)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5beb0 is (00082210,01e5bea0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5beb8 (fffffffe becomes 00082240,  (null)) len 0x270
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 127
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000824b0-0x000824dd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5beb8 is (00082240,01c5c948)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bec0 (fffffffe becomes 000824b0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "issue", ino #100
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 128
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000824e0-0x00082539
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c960 (ino #100)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bec0 is (000824b0,01e5beb0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bec8 (fffffffe becomes 000824e0,  (null)) len 0x5c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 129
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x0008253c-0x0008256f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bec8 is (000824e0,01c5c960)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bed0 (fffffffe becomes 0008253c,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ld.so.cache", ino #101
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 130
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00082570-0x000825e5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c978 (ino #101)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bed0 is (0008253c,01e5bec0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bed8 (fffffffe becomes 00082570,  (null)) len 0x78
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 131
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000825e8-0x0008261a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bed8 is (00082570,01c5c978)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bee0 (fffffffe becomes 000825e8,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ld.so.conf", ino #102
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 132
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008261c-0x00082660
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c990 (ino #102)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bee0 is (000825e8,01e5bed0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bee8 (fffffffe becomes 0008261c,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 133
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00082660-0x00082694
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bee8 is (0008261c,01c5c990)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bef0 (fffffffe becomes 00082660,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ld.so.conf.d", ino #103
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 134
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00082694-0x000826d8
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c9a8 (ino #103)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bef0 is (00082660,01e5bee0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bef8 (fffffffe becomes 00082694,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 135
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000826d8-0x00082709
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bef8 is (00082694,01c5c9a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf00 (fffffffe becomes 000826d8,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mdev.conf", ino #104
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 136
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008270c-0x000828b2
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c9c0 (ino #104)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf00 is (000826d8,01e5bef0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf08 (fffffffe becomes 0008270c,  (null)) len 0x1a8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 137
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000828b4-0x000828e0
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf08 is (0008270c,01c5c9c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf10 (fffffffe becomes 000828b4,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mtab", ino #105
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 138
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000828e0-0x00082930
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c9d8 (ino #105)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf10 is (000828b4,01e5bf00)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf18 (fffffffe becomes 000828e0,  (null)) len 0x50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 139
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00082930-0x0008295f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf18 is (000828e0,01c5c9d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf20 (fffffffe becomes 00082930,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "network", ino #106
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 140
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00082960-0x000829a4
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5c9f0 (ino #106)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf20 is (00082930,01e5bf10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf28 (fffffffe becomes 00082960,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 141
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000829a4-0x000829d9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf28 is (00082960,01c5c9f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf30 (fffffffe becomes 000829a4,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "nsswitch.conf", ino #107
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 142
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000829dc-0x00082b1d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ca08 (ino #107)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf30 is (000829a4,01e5bf20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf38 (fffffffe becomes 000829dc,  (null)) len 0x144
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 143
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00082b20-0x00082b52
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf38 is (000829dc,01c5ca08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf40 (fffffffe becomes 00082b20,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "os-release", ino #108
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 144
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00082b54-0x00082bea
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ca20 (ino #108)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf40 is (00082b20,01e5bf30)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf48 (fffffffe becomes 00082b54,  (null)) len 0x98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 145
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00082bec-0x00082c1a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf48 is (00082b54,01c5ca20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf50 (fffffffe becomes 00082bec,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "passwd", ino #109
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 146
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00082c1c-0x00082d7b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ca38 (ino #109)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf50 is (00082bec,01e5bf40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf58 (fffffffe becomes 00082c1c,  (null)) len 0x160
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 147
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00082d7c-0x00082dab
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf58 is (00082c1c,01c5ca38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf60 (fffffffe becomes 00082d7c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "profile", ino #110
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 148
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00082dac-0x00083177
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ca50 (ino #110)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf60 is (00082d7c,01e5bf50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf68 (fffffffe becomes 00082dac,  (null)) len 0x3cc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 149
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00083178-0x000831a9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf68 is (00082dac,01c5ca50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e5bf70 (fffffffe becomes 00083178,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "protocols", ino #111
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 150
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000831ac-0x00083795
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ca68 (ino #111)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e5bf70 is (00083178,01e5bf60)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72000 (fffffffe becomes 000831ac,  (null)) len 0x5ec
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 151
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00083798-0x000837cb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72000 is (000831ac,01c5ca68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72008 (fffffffe becomes 00083798,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "random-seed", ino #112
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 152
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000837cc-0x00083a10
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ca80 (ino #112)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72008 is (00083798,01e5bf70)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72010 (fffffffe becomes 000837cc,  (null)) len 0x244
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 153
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00083a10-0x00083a43
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72010 is (000837cc,01c5ca80)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72018 (fffffffe becomes 00083a10,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "resolv.conf", ino #113
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 154
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00083a44-0x00083a9a
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ca98 (ino #113)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72018 is (00083a10,01e72008)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72020 (fffffffe becomes 00083a44,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 155
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00083a9c-0x00083acd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72020 is (00083a44,01c5ca98)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72028 (fffffffe becomes 00083a9c,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "securetty", ino #114
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 156
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00083ad0-0x00083bbb
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cab0 (ino #114)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72028 is (00083a9c,01e72018)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72030 (fffffffe becomes 00083ad0,  (null)) len 0xec
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 157
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00083bbc-0x00083bec
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72030 is (00083ad0,01c5cab0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72038 (fffffffe becomes 00083bbc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "services", ino #115
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 158
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00083bec-0x00084385
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cac8 (ino #115)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72038 is (00083bbc,01e72028)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72040 (fffffffe becomes 00083bec,  (null)) len 0x79c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 159
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00084388-0x00084ac6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72040 is (00083bec,01c5cac8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72048 (fffffffe becomes 00084388,  (null)) len 0x740
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 160
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00084ac8-0x00084ebb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72048 is (00084388,01e72040)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72050 (fffffffe becomes 00084ac8,  (null)) len 0x3f4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 161
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00084ebc-0x00084eea
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72050 is (00084ac8,01e72048)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72058 (fffffffe becomes 00084ebc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "shadow", ino #116
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 162
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00084eec-0x00084fa2
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cae0 (ino #116)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72058 is (00084ebc,01e72038)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72060 (fffffffe becomes 00084eec,  (null)) len 0xb8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 163
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00084fa4-0x00084fdf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72060 is (00084eec,01c5cae0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72068 (fffffffe becomes 00084fa4,  (null)) len 0x3c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "wpa_supplicant.conf", ino #117
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 164
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00084fe0-0x00085072
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5caf8 (ino #117)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72068 is (00084fa4,01e72058)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72070 (fffffffe becomes 00084fe0,  (null)) len 0x94
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 165
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x00085074-0x000850a9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72070 is (00084fe0,01c5caf8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72078 (fffffffe becomes 00085074,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "WIFI_RAM_CODE", ino #118
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 166
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000850ac-0x00085fe5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cb10 (ino #118)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72078 is (00085074,01e5be40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72080 (fffffffe becomes 000850ac,  (null)) len 0xf3c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 167
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00085fe8-0x0008702c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72080 is (000850ac,01c5cb10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72088 (fffffffe becomes 00085fe8,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 168
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008702c-0x00088070
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72088 is (00085fe8,01e72080)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72090 (fffffffe becomes 0008702c,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 169
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00088070-0x00088508
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72090 is (0008702c,01e72088)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72098 (fffffffe becomes 00088070,  (null)) len 0x498
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 170
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00088508-0x000890f8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72098 is (00088070,01e72090)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e720a0 (fffffffe becomes 00088508,  (null)) len 0xbf0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 171
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000890f8-0x0008a13c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e720a0 is (00088508,01e72098)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e720a8 (fffffffe becomes 000890f8,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 172
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008a13c-0x0008b180
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e720a8 is (000890f8,01e720a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e720b0 (fffffffe becomes 0008a13c,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 173
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008b180-0x0008c1c4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e720b0 is (0008a13c,01e720a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e720b8 (fffffffe becomes 0008b180,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 174
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0008c1c4-0x0008d208
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e720b8 is (0008b180,01e720b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e720c0 (fffffffe becomes 0008c1c4,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e720c0 is (0008c1c4,01e720b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e720c8 (fffffffe becomes 0008d20b,  (null)) len 0x2df8
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x00090000 at 0x0009e3b8 (0x1c48 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00090000-0x00091044
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e720f8 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e720f8 (fffffffe becomes 00090000,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00091044-0x00092088
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e720f8 is (00090000,01e720c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72100 (fffffffe becomes 00091044,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00092088-0x000930cc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72100 is (00091044,01e720f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72108 (fffffffe becomes 00092088,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000930cc-0x00094110
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72108 is (00092088,01e72100)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72110 (fffffffe becomes 000930cc,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00094110-0x00095154
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72110 is (000930cc,01e72108)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72118 (fffffffe becomes 00094110,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00095154-0x00096198
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72118 is (00094110,01e72110)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72120 (fffffffe becomes 00095154,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00096198-0x000971dc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72120 is (00095154,01e72118)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72128 (fffffffe becomes 00096198,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000971dc-0x00098220
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72128 is (00096198,01e72120)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72130 (fffffffe becomes 000971dc,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00098220-0x00099264
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72130 is (000971dc,01e72128)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72138 (fffffffe becomes 00098220,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x00099264-0x0009a2a8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72138 is (00098220,01e72130)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72140 (fffffffe becomes 00099264,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0009a2a8-0x0009b2ec
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72140 is (00099264,01e72138)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72148 (fffffffe becomes 0009a2a8,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0009b2ec-0x0009c330
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72148 is (0009a2a8,01e72140)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72150 (fffffffe becomes 0009b2ec,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0009c330-0x0009d374
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72150 is (0009b2ec,01e72148)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72158 (fffffffe becomes 0009c330,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x0009d374-0x0009e3b8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72158 is (0009c330,01e72150)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72160 (fffffffe becomes 0009d374,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72160 is (0009d374,01e72158)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72168 (fffffffe becomes 0009e3bb,  (null)) len 0x1c48
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x000a0000 at 0x000aec2c (0x13d4 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a0000-0x000a1044
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e721f0 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e721f0 (fffffffe becomes 000a0000,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a1044-0x000a2088
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e721f0 is (000a0000,01e72160)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e721f8 (fffffffe becomes 000a1044,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a2088-0x000a30cc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e721f8 is (000a1044,01e721f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72200 (fffffffe becomes 000a2088,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a30cc-0x000a4110
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72200 is (000a2088,01e721f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72208 (fffffffe becomes 000a30cc,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a4110-0x000a5154
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72208 is (000a30cc,01e72200)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72210 (fffffffe becomes 000a4110,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a5154-0x000a612b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72210 is (000a4110,01e72208)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72218 (fffffffe becomes 000a5154,  (null)) len 0xfd8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a612c-0x000a6ef6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72218 is (000a5154,01e72210)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72220 (fffffffe becomes 000a612c,  (null)) len 0xdcc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a6ef8-0x000a7e11
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72220 is (000a612c,01e72218)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72228 (fffffffe becomes 000a6ef8,  (null)) len 0xf1c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a7e14-0x000a8e58
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72228 is (000a6ef8,01e72220)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72230 (fffffffe becomes 000a7e14,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a8e58-0x000a9e9c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72230 is (000a7e14,01e72228)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72238 (fffffffe becomes 000a8e58,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000a9e9c-0x000aaee0
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72238 is (000a8e58,01e72230)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72240 (fffffffe becomes 000a9e9c,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000aaee0-0x000abf24
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72240 is (000a9e9c,01e72238)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72248 (fffffffe becomes 000aaee0,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000abf24-0x000ac168
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72248 is (000aaee0,01e72240)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72250 (fffffffe becomes 000abf24,  (null)) len 0x244
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ac168-0x000ac19a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72250 is (000abf24,01e72248)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72258 (fffffffe becomes 000ac168,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "S01logging", ino #119
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ac19c-0x000ac2ce
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cb28 (ino #119)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72258 is (000ac168,01e5be98)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72260 (fffffffe becomes 000ac19c,  (null)) len 0x134
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ac2d0-0x000ac302
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72260 is (000ac19c,01c5cb28)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72268 (fffffffe becomes 000ac2d0,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "S20urandom", ino #120
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ac304-0x000ac5c2
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cb40 (ino #120)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72268 is (000ac2d0,01e72258)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72270 (fffffffe becomes 000ac304,  (null)) len 0x2c0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ac5c4-0x000ac5f6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72270 is (000ac304,01c5cb40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72278 (fffffffe becomes 000ac5c4,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "S40network", ino #121
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ac5f8-0x000ac6f2
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cb58 (ino #121)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72278 is (000ac5c4,01e72268)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72280 (fffffffe becomes 000ac5f8,  (null)) len 0xfc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ac6f4-0x000ac71f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72280 is (000ac5f8,01c5cb58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72288 (fffffffe becomes 000ac6f4,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "rcK", ino #122
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ac720-0x000ac888
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cb70 (ino #122)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72288 is (000ac6f4,01e72278)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72290 (fffffffe becomes 000ac720,  (null)) len 0x168
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ac888-0x000ac8b3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72290 is (000ac720,01c5cb70)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72298 (fffffffe becomes 000ac888,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "rcS", ino #123
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ac8b4-0x000aca10
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cb88 (ino #123)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72298 is (000ac888,01e72288)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722a0 (fffffffe becomes 000ac8b4,  (null)) len 0x15c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000aca10-0x000aca3f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722a0 is (000ac8b4,01c5cb88)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722a8 (fffffffe becomes 000aca10,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "s10mdev", ino #124
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000aca40-0x000acb32
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cba0 (ino #124)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722a8 is (000aca10,01e72298)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722b0 (fffffffe becomes 000aca40,  (null)) len 0xf4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000acb34-0x000acb65
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722b0 is (000aca40,01c5cba0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722b8 (fffffffe becomes 000acb34,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "if-down.d", ino #125
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 26
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000acb68-0x000acbac
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cbb8 (ino #125)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722b8 is (000acb34,01e5bf28)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722c0 (fffffffe becomes 000acb68,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 27
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000acbac-0x000acbe2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722c0 is (000acb68,01c5cbb8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722c8 (fffffffe becomes 000acbac,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "if-post-down.d", ino #126
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 28
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000acbe4-0x000acc28
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cbd0 (ino #126)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722c8 is (000acbac,01e722b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722d0 (fffffffe becomes 000acbe4,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 29
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000acc28-0x000acc5c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722d0 is (000acbe4,01c5cbd0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722d8 (fffffffe becomes 000acc28,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "if-post-up.d", ino #127
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000acc5c-0x000acca0
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cbe8 (ino #127)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722d8 is (000acc28,01e722c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722e8 (fffffffe becomes 000acc5c,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 31
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000acca0-0x000accd5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722e8 is (000acc5c,01c5cbe8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722f0 (fffffffe becomes 000acca0,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "if-pre-down.d", ino #128
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 32
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000accd8-0x000acd1c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cc00 (ino #128)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722f0 is (000acca0,01e722d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e722f8 (fffffffe becomes 000accd8,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 33
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000acd1c-0x000acd4f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e722f8 is (000accd8,01c5cc00)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72300 (fffffffe becomes 000acd1c,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "if-pre-up.d", ino #129
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000acd50-0x000acd94
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cc18 (ino #129)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72300 is (000acd1c,01e722f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72308 (fffffffe becomes 000acd50,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 35
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000acd94-0x000acdc3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72308 is (000acd50,01c5cc18)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72310 (fffffffe becomes 000acd94,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "if-up.d", ino #130
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 36
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000acdc4-0x000ace08
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cc30 (ino #130)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72310 is (000acd94,01e72300)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72318 (fffffffe becomes 000acdc4,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 37
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ace08-0x000ace3a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72318 is (000acdc4,01c5cc30)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72320 (fffffffe becomes 000ace08,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "interfaces", ino #131
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 38
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ace3c-0x000aceb5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cc48 (ino #131)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72320 is (000ace08,01e72310)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72328 (fffffffe becomes 000ace3c,  (null)) len 0x7c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 39
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000aceb8-0x000acee7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72328 is (000ace3c,01c5cc48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72330 (fffffffe becomes 000aceb8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "default", ino #132
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000acee8-0x000acf2c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cc60 (ino #132)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72330 is (000aceb8,01e5b038)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72338 (fffffffe becomes 000acee8,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 41
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000acf2c-0x000acf57
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72338 is (000acee8,01c5cc60)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72340 (fffffffe becomes 000acf2c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ftp", ino #133
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 42
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000acf58-0x000acf9c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cc78 (ino #133)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72340 is (000acf2c,01e72330)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72348 (fffffffe becomes 000acf58,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 43
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000acf9c-0x000acfcc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72348 is (000acf58,01c5cc78)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72350 (fffffffe becomes 000acf9c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "firmware", ino #134
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000acfcc-0x000ad01f
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cc90 (ino #134)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72350 is (000acf9c,01e5b048)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72358 (fffffffe becomes 000acfcc,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 45
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ad020-0x000ad058
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72358 is (000acfcc,01c5cc90)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72360 (fffffffe becomes 000ad020,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mt5931_loader.ko", ino #135
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 46
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ad058-0x000ad9fe
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cca8 (ino #135)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72360 is (000ad020,01e72350)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72368 (fffffffe becomes 000ad058,  (null)) len 0x9a8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 47
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ada00-0x000ae3fe
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72368 is (000ad058,01c5cca8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72370 (fffffffe becomes 000ada00,  (null)) len 0xa00
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ae400-0x000aec2a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72370 is (000ada00,01e72368)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72378 (fffffffe becomes 000ae400,  (null)) len 0x82c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72378 is (000ae400,01e72370)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72380 (fffffffe becomes 000aec2f,  (null)) len 0x13d4
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x000b0000 at 0x000be52c (0x1ad4 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b0000-0x000b0797
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e723e0 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e723e0 (fffffffe becomes 000b0000,  (null)) len 0x798
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b0798-0x000b0ebd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e723e0 is (000b0000,01e72378)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e723e8 (fffffffe becomes 000b0798,  (null)) len 0x728
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b0ec0-0x000b1345
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e723e8 is (000b0798,01e723e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e723f0 (fffffffe becomes 000b0ec0,  (null)) len 0x488
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1348-0x000b145b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e723f0 is (000b0ec0,01e723e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e723f8 (fffffffe becomes 000b1348,  (null)) len 0x114
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b145c-0x000b1491
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e723f8 is (000b1348,01e723f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72400 (fffffffe becomes 000b145c,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent ".bash_history", ino #136
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1494-0x000b14d8
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ccc0 (ino #136)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72400 is (000b145c,01e5b0b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72408 (fffffffe becomes 000b1494,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b14d8-0x000b150c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72408 is (000b1494,01c5ccc0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72410 (fffffffe becomes 000b14d8,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent ".bash_logout", ino #137
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b150c-0x000b15e6
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ccd8 (ino #137)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72410 is (000b14d8,01e72400)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72418 (fffffffe becomes 000b150c,  (null)) len 0xdc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b15e8-0x000b161d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72418 is (000b150c,01c5ccd8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72420 (fffffffe becomes 000b15e8,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent ".bash_profile", ino #138
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1620-0x000b16e5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ccf0 (ino #138)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72420 is (000b15e8,01e72410)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72428 (fffffffe becomes 000b1620,  (null)) len 0xc8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b16e8-0x000b1715
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72428 is (000b1620,01c5ccf0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72430 (fffffffe becomes 000b16e8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "blkid", ino #139
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1718-0x000b176a
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cd08 (ino #139)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72430 is (000b16e8,01e5b0d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72438 (fffffffe becomes 000b1718,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b176c-0x000b179a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72438 is (000b1718,01c5cd08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72440 (fffffffe becomes 000b176c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "devmem", ino #140
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b179c-0x000b17ee
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cd20 (ino #140)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72440 is (000b176c,01e72430)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72448 (fffffffe becomes 000b179c,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b17f0-0x000b1823
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72448 is (000b179c,01c5cd20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72450 (fffffffe becomes 000b17f0,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "freeramdisk", ino #141
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1824-0x000b1876
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cd38 (ino #141)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72450 is (000b17f0,01e72440)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72458 (fffffffe becomes 000b1824,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1878-0x000b18a4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72458 is (000b1824,01c5cd38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72460 (fffffffe becomes 000b1878,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "fsck", ino #142
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b18a4-0x000b18f6
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cd50 (ino #142)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72460 is (000b1878,01e72450)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72468 (fffffffe becomes 000b18a4,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b18f8-0x000b1925
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72468 is (000b18a4,01c5cd50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72470 (fffffffe becomes 000b18f8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "getty", ino #143
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1928-0x000b197a
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cd68 (ino #143)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72470 is (000b18f8,01e72460)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72478 (fffffffe becomes 000b1928,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b197c-0x000b19a8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72478 is (000b1928,01c5cd68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72480 (fffffffe becomes 000b197c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "halt", ino #144
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b19a8-0x000b19fa
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cd80 (ino #144)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72480 is (000b197c,01e72470)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72488 (fffffffe becomes 000b19a8,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b19fc-0x000b1a2a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72488 is (000b19a8,01c5cd80)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72490 (fffffffe becomes 000b19fc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hdparm", ino #145
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1a2c-0x000b1a7e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cd98 (ino #145)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72490 is (000b19fc,01e72480)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72498 (fffffffe becomes 000b1a2c,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1a80-0x000b1aaf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72498 is (000b1a2c,01c5cd98)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724a0 (fffffffe becomes 000b1a80,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hwclock", ino #146
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1ab0-0x000b1b02
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cdb0 (ino #146)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724a0 is (000b1a80,01e72490)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724a8 (fffffffe becomes 000b1ab0,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 26
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1b04-0x000b1b34
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724a8 is (000b1ab0,01c5cdb0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724b0 (fffffffe becomes 000b1b04,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ifconfig", ino #147
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 27
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1b34-0x000b1b86
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cdc8 (ino #147)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724b0 is (000b1b04,01e724a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724b8 (fffffffe becomes 000b1b34,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 28
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1b88-0x000b1bb6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724b8 is (000b1b34,01c5cdc8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724c0 (fffffffe becomes 000b1b88,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ifdown", ino #148
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 29
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1bb8-0x000b1c0a
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cde0 (ino #148)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724c0 is (000b1b88,01e724b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724c8 (fffffffe becomes 000b1bb8,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1c0c-0x000b1c38
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724c8 is (000b1bb8,01c5cde0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724d8 (fffffffe becomes 000b1c0c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ifup", ino #149
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 31
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1c38-0x000b1c8a
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cdf8 (ino #149)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724d8 is (000b1c0c,01e724c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724e0 (fffffffe becomes 000b1c38,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 32
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1c8c-0x000b1cb8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724e0 is (000b1c38,01c5cdf8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724e8 (fffffffe becomes 000b1c8c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "init", ino #150
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 33
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1cb8-0x000b1d0a
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ce10 (ino #150)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724e8 is (000b1c8c,01e724d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724f0 (fffffffe becomes 000b1cb8,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1d0c-0x000b1d3a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724f0 is (000b1cb8,01c5ce10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e724f8 (fffffffe becomes 000b1d0c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "insmod", ino #151
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 35
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1d3c-0x000b1d8e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ce28 (ino #151)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e724f8 is (000b1d0c,01e724e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72500 (fffffffe becomes 000b1d3c,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 36
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1d90-0x000b1dba
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72500 is (000b1d3c,01c5ce28)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72508 (fffffffe becomes 000b1d90,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ip", ino #152
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 37
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1dbc-0x000b1e0e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ce40 (ino #152)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72508 is (000b1d90,01e724f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72510 (fffffffe becomes 000b1dbc,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 38
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1e10-0x000b1e3e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72510 is (000b1dbc,01c5ce40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72518 (fffffffe becomes 000b1e10,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ipaddr", ino #153
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 39
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1e40-0x000b1e92
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ce58 (ino #153)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72518 is (000b1e10,01e72508)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72520 (fffffffe becomes 000b1e40,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1e94-0x000b1ec2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72520 is (000b1e40,01c5ce58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72528 (fffffffe becomes 000b1e94,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "iplink", ino #154
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 41
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1ec4-0x000b1f16
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ce70 (ino #154)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72528 is (000b1e94,01e72518)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72530 (fffffffe becomes 000b1ec4,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 42
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1f18-0x000b1f47
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72530 is (000b1ec4,01c5ce70)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72538 (fffffffe becomes 000b1f18,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "iproute", ino #155
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 43
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1f48-0x000b1f9a
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ce88 (ino #155)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72538 is (000b1f18,01e72528)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72540 (fffffffe becomes 000b1f48,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b1f9c-0x000b1fca
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72540 is (000b1f48,01c5ce88)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72548 (fffffffe becomes 000b1f9c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "iprule", ino #156
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 45
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b1fcc-0x000b201e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cea0 (ino #156)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72548 is (000b1f9c,01e72538)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72550 (fffffffe becomes 000b1fcc,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 46
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b2020-0x000b2050
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72550 is (000b1fcc,01c5cea0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72558 (fffffffe becomes 000b2020,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "iptunnel", ino #157
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 47
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b2050-0x000b20a2
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ceb8 (ino #157)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72558 is (000b2020,01e72548)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72560 (fffffffe becomes 000b2050,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000b20a4-0x000b20d4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72560 is (000b2050,01c5ceb8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72568 (fffffffe becomes 000b20a4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "iwconfig", ino #158
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 49
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b20d4-0x000b2aa2
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5ced0 (ino #158)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72568 is (000b20a4,01e72558)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72570 (fffffffe becomes 000b20d4,  (null)) len 0x9d0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b2aa4-0x000b353b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72570 is (000b20d4,01c5ced0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72578 (fffffffe becomes 000b2aa4,  (null)) len 0xa98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 51
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b353c-0x000b3f3b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72578 is (000b2aa4,01e72570)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72580 (fffffffe becomes 000b353c,  (null)) len 0xa00
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 52
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b3f3c-0x000b495d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72580 is (000b353c,01e72578)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72588 (fffffffe becomes 000b3f3c,  (null)) len 0xa24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 53
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b4960-0x000b53f6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72588 is (000b3f3c,01e72580)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72590 (fffffffe becomes 000b4960,  (null)) len 0xa98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b53f8-0x000b5e17
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72590 is (000b4960,01e72588)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72598 (fffffffe becomes 000b53f8,  (null)) len 0xa20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 55
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b5e18-0x000b67d1
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72598 is (000b53f8,01e72590)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725a0 (fffffffe becomes 000b5e18,  (null)) len 0x9bc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 56
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b67d4-0x000b7269
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725a0 is (000b5e18,01e72598)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725a8 (fffffffe becomes 000b67d4,  (null)) len 0xa98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 57
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b726c-0x000b7dc0
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725a8 is (000b67d4,01e725a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725b0 (fffffffe becomes 000b726c,  (null)) len 0xb54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b7dc0-0x000b87e8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725b0 is (000b726c,01e725a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725b8 (fffffffe becomes 000b7dc0,  (null)) len 0xa28
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 59
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b87e8-0x000b9115
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725b8 is (000b7dc0,01e725b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725c0 (fffffffe becomes 000b87e8,  (null)) len 0x930
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 60
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b9118-0x000b9a20
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725c0 is (000b87e8,01e725b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725d0 (fffffffe becomes 000b9118,  (null)) len 0x908
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 61
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000b9a20-0x000ba45d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725d0 is (000b9118,01e725c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725d8 (fffffffe becomes 000b9a20,  (null)) len 0xa40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 62
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ba460-0x000baf14
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725d8 is (000b9a20,01e725d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725e0 (fffffffe becomes 000ba460,  (null)) len 0xab4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 63
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000baf14-0x000bb99e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725e0 is (000ba460,01e725d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725e8 (fffffffe becomes 000baf14,  (null)) len 0xa8c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 64
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000bb9a0-0x000bc3ec
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725e8 is (000baf14,01e725e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725f0 (fffffffe becomes 000bb9a0,  (null)) len 0xa4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 65
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000bc3ec-0x000bced9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725f0 is (000bb9a0,01e725e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e725f8 (fffffffe becomes 000bc3ec,  (null)) len 0xaf0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 66
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000bcedc-0x000bd9b4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e725f8 is (000bc3ec,01e725f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72600 (fffffffe becomes 000bcedc,  (null)) len 0xad8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 67
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000bd9b4-0x000be2fb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72600 is (000bcedc,01e725f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72608 (fffffffe becomes 000bd9b4,  (null)) len 0x948
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 68
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000be2fc-0x000be529
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72608 is (000bd9b4,01e72600)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72610 (fffffffe becomes 000be2fc,  (null)) len 0x230
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72610 is (000be2fc,01e72608)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72618 (fffffffe becomes 000be52f,  (null)) len 0x1ad4
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x000c0000 at 0x000ce808 (0x17f8 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c0000-0x000c0a53
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e726c8 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e726c8 (fffffffe becomes 000c0000,  (null)) len 0xa54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c0a54-0x000c142a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e726c8 is (000c0000,01e72610)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e726d0 (fffffffe becomes 000c0a54,  (null)) len 0x9d8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c142c-0x000c1f60
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e726d0 is (000c0a54,01e726c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e726d8 (fffffffe becomes 000c142c,  (null)) len 0xb34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c1f60-0x000c2990
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e726d8 is (000c142c,01e726d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e726e0 (fffffffe becomes 000c1f60,  (null)) len 0xa30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c2990-0x000c345a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e726e0 is (000c1f60,01e726d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e726e8 (fffffffe becomes 000c2990,  (null)) len 0xacc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c345c-0x000c3e48
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e726e8 is (000c2990,01e726e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e726f0 (fffffffe becomes 000c345c,  (null)) len 0x9ec
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c3e48-0x000c48dc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e726f0 is (000c345c,01e726e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e726f8 (fffffffe becomes 000c3e48,  (null)) len 0xa94
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c48dc-0x000c52da
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e726f8 is (000c3e48,01e726f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72700 (fffffffe becomes 000c48dc,  (null)) len 0xa00
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c52dc-0x000c58e4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72700 is (000c48dc,01e726f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72708 (fffffffe becomes 000c52dc,  (null)) len 0x608
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c58e4-0x000c6200
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72708 is (000c52dc,01e72700)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72710 (fffffffe becomes 000c58e4,  (null)) len 0x91c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c6200-0x000c6831
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72710 is (000c58e4,01e72708)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72718 (fffffffe becomes 000c6200,  (null)) len 0x634
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c6834-0x000c6e75
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72718 is (000c6200,01e72710)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72720 (fffffffe becomes 000c6834,  (null)) len 0x644
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c6e78-0x000c761b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72720 is (000c6834,01e72718)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72728 (fffffffe becomes 000c6e78,  (null)) len 0x7a4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c761c-0x000c7f0a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72728 is (000c6e78,01e72720)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72730 (fffffffe becomes 000c761c,  (null)) len 0x8f0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c7f0c-0x000c81ec
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72730 is (000c761c,01e72728)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72738 (fffffffe becomes 000c7f0c,  (null)) len 0x2e0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c81ec-0x000c821b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72738 is (000c7f0c,01e72730)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72740 (fffffffe becomes 000c81ec,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "iwgetid", ino #159
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c821c-0x000c8268
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cee8 (ino #159)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72740 is (000c81ec,01e72568)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72748 (fffffffe becomes 000c821c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8268-0x000c8296
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72748 is (000c821c,01c5cee8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72750 (fffffffe becomes 000c8268,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "iwlist", ino #160
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8298-0x000c82e4
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cf00 (ino #160)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72750 is (000c8268,01e72740)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72758 (fffffffe becomes 000c8298,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c82e4-0x000c8312
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72758 is (000c8298,01c5cf00)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72760 (fffffffe becomes 000c82e4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "iwpriv", ino #161
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8314-0x000c8360
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cf18 (ino #161)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72760 is (000c82e4,01e72750)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72768 (fffffffe becomes 000c8314,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8360-0x000c838d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72768 is (000c8314,01c5cf18)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72770 (fffffffe becomes 000c8360,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "iwspy", ino #162
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8390-0x000c83dc
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cf30 (ino #162)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72770 is (000c8360,01e72760)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72778 (fffffffe becomes 000c8390,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c83dc-0x000c8409
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72778 is (000c8390,01c5cf30)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72780 (fffffffe becomes 000c83dc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "klogd", ino #163
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c840c-0x000c845e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cf48 (ino #163)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72780 is (000c83dc,01e72770)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72788 (fffffffe becomes 000c840c,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8460-0x000c8490
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72788 is (000c840c,01c5cf48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72790 (fffffffe becomes 000c8460,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "loadkmap", ino #164
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 26
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8490-0x000c84e2
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cf60 (ino #164)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72790 is (000c8460,01e72780)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72798 (fffffffe becomes 000c8490,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 27
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c84e4-0x000c8513
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72798 is (000c8490,01c5cf60)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727a0 (fffffffe becomes 000c84e4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "losetup", ino #165
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 28
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8514-0x000c8566
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cf78 (ino #165)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727a0 is (000c84e4,01e72790)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727a8 (fffffffe becomes 000c8514,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 29
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8568-0x000c8595
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727a8 is (000c8514,01c5cf78)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727b0 (fffffffe becomes 000c8568,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lsmod", ino #166
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8598-0x000c85ea
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cf90 (ino #166)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727b0 is (000c8568,01e727a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727c0 (fffffffe becomes 000c8598,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 31
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c85ec-0x000c861c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727c0 is (000c8598,01c5cf90)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727c8 (fffffffe becomes 000c85ec,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "makedevs", ino #167
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 32
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c861c-0x000c866e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cfa8 (ino #167)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727c8 is (000c85ec,01e727b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727d0 (fffffffe becomes 000c861c,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 33
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8670-0x000c869c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727d0 is (000c861c,01c5cfa8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727d8 (fffffffe becomes 000c8670,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mdev", ino #168
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c869c-0x000c86ee
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cfc0 (ino #168)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727d8 is (000c8670,01e727c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727e0 (fffffffe becomes 000c869c,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 35
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c86f0-0x000c871e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727e0 is (000c869c,01c5cfc0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727e8 (fffffffe becomes 000c86f0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mkswap", ino #169
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 36
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8720-0x000c8772
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01c5cfd8 (ino #169)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727e8 is (000c86f0,01e727d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727f0 (fffffffe becomes 000c8720,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 37
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8774-0x000c87a4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727f0 is (000c8720,01c5cfd8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e727f8 (fffffffe becomes 000c8774,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "modprobe", ino #170
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 38
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c87a4-0x000c87f6
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73000 (ino #170)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e727f8 is (000c8774,01e727e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72800 (fffffffe becomes 000c87a4,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 39
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c87f8-0x000c8826
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72800 is (000c87a4,01e73000)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72808 (fffffffe becomes 000c87f8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "nameif", ino #171
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8828-0x000c887a
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73018 (ino #171)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72808 is (000c87f8,01e727f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72810 (fffffffe becomes 000c8828,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 41
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c887c-0x000c88ae
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72810 is (000c8828,01e73018)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72818 (fffffffe becomes 000c887c,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pivot_root", ino #172
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 42
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c88b0-0x000c8902
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73030 (ino #172)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72818 is (000c887c,01e72808)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72820 (fffffffe becomes 000c88b0,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 43
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8904-0x000c8934
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72820 is (000c88b0,01e73030)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72828 (fffffffe becomes 000c8904,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "poweroff", ino #173
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8934-0x000c8986
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73048 (ino #173)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72828 is (000c8904,01e72818)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72830 (fffffffe becomes 000c8934,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 45
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8988-0x000c89b6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72830 is (000c8934,01e73048)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72838 (fffffffe becomes 000c8988,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "reboot", ino #174
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 46
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c89b8-0x000c8a0a
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73060 (ino #174)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72838 is (000c8988,01e72828)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72840 (fffffffe becomes 000c89b8,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 47
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8a0c-0x000c8a39
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72840 is (000c89b8,01e73060)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72848 (fffffffe becomes 000c8a0c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "rmmod", ino #175
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8a3c-0x000c8a8e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73078 (ino #175)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72848 is (000c8a0c,01e72838)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72850 (fffffffe becomes 000c8a3c,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 49
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8a90-0x000c8abd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72850 is (000c8a3c,01e73078)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72858 (fffffffe becomes 000c8a90,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "route", ino #176
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8ac0-0x000c8b12
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73090 (ino #176)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72858 is (000c8a90,01e72848)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72860 (fffffffe becomes 000c8ac0,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 51
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8b14-0x000c8b44
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72860 is (000c8ac0,01e73090)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72868 (fffffffe becomes 000c8b14,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "runlevel", ino #177
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 52
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8b44-0x000c8b96
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e730a8 (ino #177)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72868 is (000c8b14,01e72858)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72870 (fffffffe becomes 000c8b44,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 53
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8b98-0x000c8bca
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72870 is (000c8b44,01e730a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72878 (fffffffe becomes 000c8b98,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "setconsole", ino #178
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8bcc-0x000c8c1e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e730c0 (ino #178)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72878 is (000c8b98,01e72868)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72880 (fffffffe becomes 000c8bcc,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 55
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8c20-0x000c8c59
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72880 is (000c8bcc,01e730c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72888 (fffffffe becomes 000c8c20,  (null)) len 0x3c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "start-stop-daemon", ino #179
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 56
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8c5c-0x000c8cae
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e730d8 (ino #179)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72888 is (000c8c20,01e72878)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72890 (fffffffe becomes 000c8c5c,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 57
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8cb0-0x000c8cdf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72890 is (000c8c5c,01e730d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72898 (fffffffe becomes 000c8cb0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sulogin", ino #180
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8ce0-0x000c8d32
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e730f0 (ino #180)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72898 is (000c8cb0,01e72888)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728a0 (fffffffe becomes 000c8ce0,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 59
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8d34-0x000c8d67
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728a0 is (000c8ce0,01e730f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728a8 (fffffffe becomes 000c8d34,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "switch_root", ino #181
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 60
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8d68-0x000c8dba
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73108 (ino #181)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728a8 is (000c8d34,01e72898)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728b8 (fffffffe becomes 000c8d68,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 61
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8dbc-0x000c8dea
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728b8 is (000c8d68,01e73108)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728c0 (fffffffe becomes 000c8dbc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sysctl", ino #182
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 62
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8dec-0x000c8e3e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73120 (ino #182)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728c0 is (000c8dbc,01e728a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728c8 (fffffffe becomes 000c8dec,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 63
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8e40-0x000c8e6f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728c8 is (000c8dec,01e73120)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728d0 (fffffffe becomes 000c8e40,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "syslogd", ino #183
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 64
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8e70-0x000c8ec2
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73138 (ino #183)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728d0 is (000c8e40,01e728c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728d8 (fffffffe becomes 000c8e70,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 65
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8ec4-0x000c8ef2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728d8 is (000c8e70,01e73138)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728e0 (fffffffe becomes 000c8ec4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "udhcpc", ino #184
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 66
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8ef4-0x000c8f46
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73150 (ino #184)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728e0 is (000c8ec4,01e728d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728e8 (fffffffe becomes 000c8ef4,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 67
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8f48-0x000c8f77
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728e8 is (000c8ef4,01e73150)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728f0 (fffffffe becomes 000c8f48,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "vconfig", ino #185
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 68
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8f78-0x000c8fca
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73168 (ino #185)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728f0 is (000c8f48,01e728e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e728f8 (fffffffe becomes 000c8f78,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 69
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c8fcc-0x000c8ffc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e728f8 is (000c8f78,01e73168)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72900 (fffffffe becomes 000c8fcc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "watchdog", ino #186
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 70
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c8ffc-0x000c904e
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73180 (ino #186)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72900 is (000c8fcc,01e728f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72908 (fffffffe becomes 000c8ffc,  (null)) len 0x54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 71
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9050-0x000c9080
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72908 is (000c8ffc,01e73180)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72910 (fffffffe becomes 000c9050,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ldconfig", ino #187
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 72
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9080-0x000c90c4
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73198 (ino #187)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72910 is (000c9050,01e5b100)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72918 (fffffffe becomes 000c9080,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 73
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c90c4-0x000c90f5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72918 is (000c9080,01e73198)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72920 (fffffffe becomes 000c90c4,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "aux-cache", ino #188
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 74
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c90f8-0x000c915d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e731b0 (ino #188)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72920 is (000c90c4,01e72918)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72928 (fffffffe becomes 000c90f8,  (null)) len 0x68
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 75
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9160-0x000c918b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72928 is (000c90f8,01e731b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72930 (fffffffe becomes 000c9160,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "bin", ino #189
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 76
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c918c-0x000c91d0
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e731c8 (ino #189)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72930 is (000c9160,01e5b110)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72938 (fffffffe becomes 000c918c,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 77
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c91d0-0x000c91fb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72938 is (000c918c,01e731c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72940 (fffffffe becomes 000c91d0,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lib", ino #190
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 78
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c91fc-0x000c9240
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e731e0 (ino #190)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72940 is (000c91d0,01e72930)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72948 (fffffffe becomes 000c91fc,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 79
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9240-0x000c926d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72948 is (000c91fc,01e731e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72950 (fffffffe becomes 000c9240,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lib32", ino #191
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 80
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9270-0x000c92b7
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e731f8 (ino #191)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72950 is (000c9240,01e72940)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72958 (fffffffe becomes 000c9270,  (null)) len 0x48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 81
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c92b8-0x000c92e4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72958 is (000c9270,01e731f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72960 (fffffffe becomes 000c92b8,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sbin", ino #192
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 82
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c92e4-0x000c9328
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73210 (ino #192)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72960 is (000c92b8,01e72950)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72968 (fffffffe becomes 000c92e4,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 83
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9328-0x000c9355
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72968 is (000c92e4,01e73210)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72970 (fffffffe becomes 000c9328,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "share", ino #193
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 84
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9358-0x000c939c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73228 (ino #193)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72970 is (000c9328,01e72960)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72978 (fffffffe becomes 000c9358,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 85
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c939c-0x000c93c5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72978 is (000c9358,01e73228)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72980 (fffffffe becomes 000c939c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "[", ino #194
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 86
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c93c8-0x000c941d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73240 (ino #194)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72980 is (000c939c,01e72938)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72988 (fffffffe becomes 000c93c8,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 87
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9420-0x000c944a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72988 is (000c93c8,01e73240)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72990 (fffffffe becomes 000c9420,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "[[", ino #195
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 88
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c944c-0x000c94a1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73258 (ino #195)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72990 is (000c9420,01e72980)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72998 (fffffffe becomes 000c944c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 89
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c94a4-0x000c94ce
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72998 is (000c944c,01e73258)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729a0 (fffffffe becomes 000c94a4,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ar", ino #196
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 90
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c94d0-0x000c9525
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73270 (ino #196)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729a0 is (000c94a4,01e72990)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729b0 (fffffffe becomes 000c94d0,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 91
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9528-0x000c9553
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729b0 is (000c94d0,01e73270)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729b8 (fffffffe becomes 000c9528,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "awk", ino #197
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 92
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9554-0x000c95a9
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73288 (ino #197)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729b8 is (000c9528,01e729a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729c0 (fffffffe becomes 000c9554,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 93
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c95ac-0x000c95dc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729c0 is (000c9554,01e73288)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729c8 (fffffffe becomes 000c95ac,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "basename", ino #198
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 94
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c95dc-0x000c9631
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e732a0 (ino #198)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729c8 is (000c95ac,01e729b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729d0 (fffffffe becomes 000c95dc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 95
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9634-0x000c9663
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729d0 is (000c95dc,01e732a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729d8 (fffffffe becomes 000c9634,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "bunzip2", ino #199
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 96
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9664-0x000c96b9
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e732b8 (ino #199)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729d8 is (000c9634,01e729c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729e0 (fffffffe becomes 000c9664,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 97
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c96bc-0x000c96e9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729e0 is (000c9664,01e732b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729e8 (fffffffe becomes 000c96bc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "bzcat", ino #200
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c96ec-0x000c9741
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e732d0 (ino #200)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729e8 is (000c96bc,01e729d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729f0 (fffffffe becomes 000c96ec,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 99
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9744-0x000c9770
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729f0 is (000c96ec,01e732d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e729f8 (fffffffe becomes 000c9744,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chrt", ino #201
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 100
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9770-0x000c97c5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e732e8 (ino #201)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e729f8 is (000c9744,01e729e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a00 (fffffffe becomes 000c9770,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 101
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c97c8-0x000c97f4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a00 is (000c9770,01e732e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a08 (fffffffe becomes 000c97c8,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chvt", ino #202
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 102
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c97f4-0x000c9849
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73300 (ino #202)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a08 is (000c97c8,01e729f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a10 (fffffffe becomes 000c97f4,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 103
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c984c-0x000c9879
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a10 is (000c97f4,01e73300)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a18 (fffffffe becomes 000c984c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cksum", ino #203
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 104
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c987c-0x000c98d1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73318 (ino #203)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a18 is (000c984c,01e72a08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a20 (fffffffe becomes 000c987c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 105
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c98d4-0x000c9901
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a20 is (000c987c,01e73318)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a28 (fffffffe becomes 000c98d4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "clear", ino #204
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 106
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9904-0x000c9959
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73330 (ino #204)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a28 is (000c98d4,01e72a18)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a30 (fffffffe becomes 000c9904,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 107
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c995c-0x000c9987
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a30 is (000c9904,01e73330)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a38 (fffffffe becomes 000c995c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cmp", ino #205
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 108
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9988-0x000c99dd
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73348 (ino #205)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a38 is (000c995c,01e72a28)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a40 (fffffffe becomes 000c9988,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 109
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c99e0-0x000c9a0f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a40 is (000c9988,01e73348)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a48 (fffffffe becomes 000c99e0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "crontab", ino #206
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 110
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9a10-0x000c9a65
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73360 (ino #206)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a48 is (000c99e0,01e72a38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a50 (fffffffe becomes 000c9a10,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 111
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9a68-0x000c9a93
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a50 is (000c9a10,01e73360)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a58 (fffffffe becomes 000c9a68,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cut", ino #207
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 112
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9a94-0x000c9ae9
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73378 (ino #207)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a58 is (000c9a68,01e72a48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a60 (fffffffe becomes 000c9a94,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 113
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9aec-0x000c9b16
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a60 is (000c9a94,01e73378)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a68 (fffffffe becomes 000c9aec,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dc", ino #208
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 114
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9b18-0x000c9b6d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73390 (ino #208)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a68 is (000c9aec,01e72a58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a70 (fffffffe becomes 000c9b18,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 115
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9b70-0x000c9ba1
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a70 is (000c9b18,01e73390)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a78 (fffffffe becomes 000c9b70,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "deallocvt", ino #209
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 116
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9ba4-0x000c9bf9
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e733a8 (ino #209)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a78 is (000c9b70,01e72a68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a80 (fffffffe becomes 000c9ba4,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 117
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9bfc-0x000c9c28
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a80 is (000c9ba4,01e733a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a88 (fffffffe becomes 000c9bfc,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "diff", ino #210
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 118
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9c28-0x000c9c7d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e733c0 (ino #210)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a88 is (000c9bfc,01e72a78)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a90 (fffffffe becomes 000c9c28,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 119
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9c80-0x000c9caf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a90 is (000c9c28,01e733c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72a98 (fffffffe becomes 000c9c80,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dirname", ino #211
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 120
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9cb0-0x000c9d05
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e733d8 (ino #211)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72a98 is (000c9c80,01e72a88)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72aa8 (fffffffe becomes 000c9cb0,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 121
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9d08-0x000c9d38
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72aa8 is (000c9cb0,01e733d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ab0 (fffffffe becomes 000c9d08,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dos2unix", ino #212
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 122
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9d38-0x000c9d8d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e733f0 (ino #212)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ab0 is (000c9d08,01e72a98)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ab8 (fffffffe becomes 000c9d38,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 123
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9d90-0x000c9dba
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ab8 is (000c9d38,01e733f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ac0 (fffffffe becomes 000c9d90,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "du", ino #213
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 124
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9dbc-0x000c9e11
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73408 (ino #213)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ac0 is (000c9d90,01e72ab0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ac8 (fffffffe becomes 000c9dbc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 125
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9e14-0x000c9e3f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ac8 is (000c9dbc,01e73408)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ad0 (fffffffe becomes 000c9e14,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "env", ino #214
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 126
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9e40-0x000c9e95
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73420 (ino #214)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ad0 is (000c9e14,01e72ac0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ad8 (fffffffe becomes 000c9e40,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 127
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9e98-0x000c9ec4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ad8 is (000c9e40,01e73420)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ae0 (fffffffe becomes 000c9e98,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "expr", ino #215
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 128
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9ec4-0x000c9f19
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73438 (ino #215)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ae0 is (000c9e98,01e72ad0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ae8 (fffffffe becomes 000c9ec4,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 129
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9f1c-0x000c9f48
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ae8 is (000c9ec4,01e73438)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72af0 (fffffffe becomes 000c9f1c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "find", ino #216
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 130
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9f48-0x000c9f9d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73450 (ino #216)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72af0 is (000c9f1c,01e72ae0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72af8 (fffffffe becomes 000c9f48,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 131
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000c9fa0-0x000c9fcc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72af8 is (000c9f48,01e73450)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b00 (fffffffe becomes 000c9fa0,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "fold", ino #217
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 132
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000c9fcc-0x000ca021
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73468 (ino #217)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b00 is (000c9fa0,01e72af0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b08 (fffffffe becomes 000c9fcc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 133
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ca024-0x000ca050
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b08 is (000c9fcc,01e73468)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b10 (fffffffe becomes 000ca024,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "free", ino #218
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 134
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ca050-0x000ca0a5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73480 (ino #218)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b10 is (000ca024,01e72b00)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b18 (fffffffe becomes 000ca050,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 135
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ca0a8-0x000ca0d5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b18 is (000ca050,01e73480)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b20 (fffffffe becomes 000ca0a8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "fuser", ino #219
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 136
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ca0d8-0x000ca12d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73498 (ino #219)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b20 is (000ca0a8,01e72b10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b28 (fffffffe becomes 000ca0d8,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 137
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ca130-0x000ca15f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b28 is (000ca0d8,01e73498)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b30 (fffffffe becomes 000ca130,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "getconf", ino #220
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 138
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ca160-0x000cabf7
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e734b0 (ino #220)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b30 is (000ca130,01e72b20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b38 (fffffffe becomes 000ca160,  (null)) len 0xa98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 139
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000cabf8-0x000cb6ce
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b38 is (000ca160,01e734b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b40 (fffffffe becomes 000cabf8,  (null)) len 0xad8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 140
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000cb6d0-0x000cbff4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b40 is (000cabf8,01e72b38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b48 (fffffffe becomes 000cb6d0,  (null)) len 0x924
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 141
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000cbff4-0x000cc8de
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b48 is (000cb6d0,01e72b40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b50 (fffffffe becomes 000cbff4,  (null)) len 0x8ec
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 142
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000cc8e0-0x000cd373
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b50 is (000cbff4,01e72b48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b58 (fffffffe becomes 000cc8e0,  (null)) len 0xa94
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 143
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000cd374-0x000cddb3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b58 is (000cc8e0,01e72b50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b60 (fffffffe becomes 000cd374,  (null)) len 0xa40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 144
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000cddb4-0x000ce807
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b60 is (000cd374,01e72b58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b68 (fffffffe becomes 000cddb4,  (null)) len 0xa54
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72b68 is (000cddb4,01e72b60)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72b70 (fffffffe becomes 000ce80b,  (null)) len 0x17f8
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x000d0000 at 0x000ddde0 (0x2220 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d0000-0x000d0a86
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ba0 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ba0 (fffffffe becomes 000d0000,  (null)) len 0xa88
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d0a88-0x000d12d4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ba0 is (000d0000,01e72b68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ba8 (fffffffe becomes 000d0a88,  (null)) len 0x84c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d12d4-0x000d15c2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ba8 is (000d0a88,01e72ba0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72bb0 (fffffffe becomes 000d12d4,  (null)) len 0x2f0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d15c4-0x000d197c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72bb0 is (000d12d4,01e72ba8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72bb8 (fffffffe becomes 000d15c4,  (null)) len 0x3b8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d197c-0x000d21cf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72bb8 is (000d15c4,01e72bb0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72bc0 (fffffffe becomes 000d197c,  (null)) len 0x854
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d21d0-0x000d269a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72bc0 is (000d197c,01e72bb8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72bc8 (fffffffe becomes 000d21d0,  (null)) len 0x4cc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d269c-0x000d2e67
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72bc8 is (000d21d0,01e72bc0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72bd0 (fffffffe becomes 000d269c,  (null)) len 0x7cc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d2e68-0x000d2fbf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72bd0 is (000d269c,01e72bc8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72bd8 (fffffffe becomes 000d2e68,  (null)) len 0x158
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d2fc0-0x000d2fec
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72bd8 is (000d2e68,01e72bd0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72be0 (fffffffe becomes 000d2fc0,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "head", ino #221
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d2fec-0x000d3041
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e734c8 (ino #221)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72be0 is (000d2fc0,01e72b30)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72be8 (fffffffe becomes 000d2fec,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3044-0x000d3073
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72be8 is (000d2fec,01e734c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72bf0 (fffffffe becomes 000d3044,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hexdump", ino #222
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3074-0x000d30c9
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e734e0 (ino #222)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72bf0 is (000d3044,01e72be0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72bf8 (fffffffe becomes 000d3074,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d30cc-0x000d30fa
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72bf8 is (000d3074,01e734e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c00 (fffffffe becomes 000d30cc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hostid", ino #223
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d30fc-0x000d3151
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e734f8 (ino #223)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c00 is (000d30cc,01e72bf0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c08 (fffffffe becomes 000d30fc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3154-0x000d317e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c08 is (000d30fc,01e734f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c10 (fffffffe becomes 000d3154,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "id", ino #224
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3180-0x000d31d5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73510 (ino #224)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c10 is (000d3154,01e72c00)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c18 (fffffffe becomes 000d3180,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d31d8-0x000d3207
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c18 is (000d3180,01e73510)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c20 (fffffffe becomes 000d31d8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "install", ino #225
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3208-0x000d325d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73528 (ino #225)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c20 is (000d31d8,01e72c10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c28 (fffffffe becomes 000d3208,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3260-0x000d328d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c28 is (000d3208,01e73528)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c30 (fffffffe becomes 000d3260,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ipcrm", ino #226
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3290-0x000d32e5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73540 (ino #226)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c30 is (000d3260,01e72c20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c38 (fffffffe becomes 000d3290,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d32e8-0x000d3314
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c38 is (000d3290,01e73540)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c40 (fffffffe becomes 000d32e8,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ipcs", ino #227
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3314-0x000d3369
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73558 (ino #227)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c40 is (000d32e8,01e72c30)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c48 (fffffffe becomes 000d3314,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d336c-0x000d339b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c48 is (000d3314,01e73558)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c50 (fffffffe becomes 000d336c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "killall", ino #228
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d339c-0x000d33f1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73570 (ino #228)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c50 is (000d336c,01e72c40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c58 (fffffffe becomes 000d339c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d33f4-0x000d3420
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c58 is (000d339c,01e73570)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c60 (fffffffe becomes 000d33f4,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "last", ino #229
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3420-0x000d3475
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73588 (ino #229)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c60 is (000d33f4,01e72c50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c68 (fffffffe becomes 000d3420,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 26
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3478-0x000d34a4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c68 is (000d3420,01e73588)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c70 (fffffffe becomes 000d3478,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "less", ino #230
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 27
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d34a4-0x000d34f9
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e735a0 (ino #230)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c70 is (000d3478,01e72c60)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c78 (fffffffe becomes 000d34a4,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 28
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d34fc-0x000d352a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c78 is (000d34a4,01e735a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c80 (fffffffe becomes 000d34fc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "logger", ino #231
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 29
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d352c-0x000d3581
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e735b8 (ino #231)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c80 is (000d34fc,01e72c70)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c88 (fffffffe becomes 000d352c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 30
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3584-0x000d35b3
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c88 is (000d352c,01e735b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72c98 (fffffffe becomes 000d3584,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "logname", ino #232
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 31
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d35b4-0x000d3609
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e735d0 (ino #232)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72c98 is (000d3584,01e72c80)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ca0 (fffffffe becomes 000d35b4,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 32
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d360c-0x000d3638
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ca0 is (000d35b4,01e735d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ca8 (fffffffe becomes 000d360c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lsof", ino #233
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 33
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3638-0x000d368d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e735e8 (ino #233)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ca8 is (000d360c,01e72c98)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72cb0 (fffffffe becomes 000d3638,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 34
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3690-0x000d36bd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72cb0 is (000d3638,01e735e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72cb8 (fffffffe becomes 000d3690,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lspci", ino #234
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 35
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d36c0-0x000d3715
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73600 (ino #234)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72cb8 is (000d3690,01e72ca8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72cc0 (fffffffe becomes 000d36c0,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 36
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3718-0x000d3745
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72cc0 is (000d36c0,01e73600)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72cc8 (fffffffe becomes 000d3718,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lsusb", ino #235
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 37
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3748-0x000d379d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73618 (ino #235)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72cc8 is (000d3718,01e72cb8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72cd0 (fffffffe becomes 000d3748,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 38
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d37a0-0x000d37cd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72cd0 is (000d3748,01e73618)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72cd8 (fffffffe becomes 000d37a0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lzcat", ino #236
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 39
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d37d0-0x000d3825
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73630 (ino #236)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72cd8 is (000d37a0,01e72cc8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ce0 (fffffffe becomes 000d37d0,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 40
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3828-0x000d3854
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ce0 is (000d37d0,01e73630)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ce8 (fffffffe becomes 000d3828,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lzma", ino #237
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 41
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3854-0x000d38a9
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73648 (ino #237)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ce8 is (000d3828,01e72cd8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72cf0 (fffffffe becomes 000d3854,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 42
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d38ac-0x000d38da
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72cf0 is (000d3854,01e73648)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72cf8 (fffffffe becomes 000d38ac,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "md5sum", ino #238
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 43
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d38dc-0x000d3931
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73660 (ino #238)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72cf8 is (000d38ac,01e72ce8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d00 (fffffffe becomes 000d38dc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 44
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3934-0x000d3960
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d00 is (000d38dc,01e73660)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d08 (fffffffe becomes 000d3934,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mesg", ino #239
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 45
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3960-0x000d39b5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73678 (ino #239)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d08 is (000d3934,01e72cf8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d10 (fffffffe becomes 000d3960,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 46
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d39b8-0x000d39e8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d10 is (000d3960,01e73678)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d18 (fffffffe becomes 000d39b8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "microcom", ino #240
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 47
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d39e8-0x000d3a3d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73690 (ino #240)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d18 is (000d39b8,01e72d08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d20 (fffffffe becomes 000d39e8,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 48
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3a40-0x000d3a6e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d20 is (000d39e8,01e73690)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d28 (fffffffe becomes 000d3a40,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mkfifo", ino #241
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 49
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3a70-0x000d3ac5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e736a8 (ino #241)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d28 is (000d3a40,01e72d18)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d30 (fffffffe becomes 000d3a70,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3ac8-0x000d3af5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d30 is (000d3a70,01e736a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d38 (fffffffe becomes 000d3ac8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "nohup", ino #242
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 51
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3af8-0x000d3b4d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e736c0 (ino #242)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d38 is (000d3ac8,01e72d28)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d40 (fffffffe becomes 000d3af8,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 52
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3b50-0x000d3b80
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d40 is (000d3af8,01e736c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d48 (fffffffe becomes 000d3b50,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "nslookup", ino #243
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 53
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3b80-0x000d3bd5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e736d8 (ino #243)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d48 is (000d3b50,01e72d38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d50 (fffffffe becomes 000d3b80,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 54
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3bd8-0x000d3c02
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d50 is (000d3b80,01e736d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d58 (fffffffe becomes 000d3bd8,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "od", ino #244
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 55
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3c04-0x000d3c59
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e736f0 (ino #244)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d58 is (000d3bd8,01e72d48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d60 (fffffffe becomes 000d3c04,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 56
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3c5c-0x000d3c8a
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d60 is (000d3c04,01e736f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d68 (fffffffe becomes 000d3c5c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "openvt", ino #245
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 57
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3c8c-0x000d3ce1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73708 (ino #245)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d68 is (000d3c5c,01e72d58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d70 (fffffffe becomes 000d3c8c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3ce4-0x000d3d12
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d70 is (000d3c8c,01e73708)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d78 (fffffffe becomes 000d3ce4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "passwd", ino #246
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 59
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3d14-0x000d3d69
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73720 (ino #246)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d78 is (000d3ce4,01e72d68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d80 (fffffffe becomes 000d3d14,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 60
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3d6c-0x000d3d99
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d80 is (000d3d14,01e73720)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d90 (fffffffe becomes 000d3d6c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "patch", ino #247
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 61
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3d9c-0x000d3df1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73738 (ino #247)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d90 is (000d3d6c,01e72d78)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72d98 (fffffffe becomes 000d3d9c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 62
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3df4-0x000d3e22
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72d98 is (000d3d9c,01e73738)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72da0 (fffffffe becomes 000d3df4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "printf", ino #248
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 63
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3e24-0x000d3e79
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73750 (ino #248)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72da0 is (000d3df4,01e72d90)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72da8 (fffffffe becomes 000d3e24,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 64
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3e7c-0x000d3eac
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72da8 is (000d3e24,01e73750)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72db0 (fffffffe becomes 000d3e7c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "readlink", ino #249
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 65
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3eac-0x000d3f01
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73768 (ino #249)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72db0 is (000d3e7c,01e72da0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72db8 (fffffffe becomes 000d3eac,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 66
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3f04-0x000d3f34
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72db8 is (000d3eac,01e73768)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72dc0 (fffffffe becomes 000d3f04,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "realpath", ino #250
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 67
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3f34-0x000d3f89
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73780 (ino #250)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72dc0 is (000d3f04,01e72db0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72dc8 (fffffffe becomes 000d3f34,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 68
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d3f8c-0x000d3fba
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72dc8 is (000d3f34,01e73780)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72dd0 (fffffffe becomes 000d3f8c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "renice", ino #251
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 69
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d3fbc-0x000d4011
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73798 (ino #251)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72dd0 is (000d3f8c,01e72dc0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72dd8 (fffffffe becomes 000d3fbc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 70
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4014-0x000d4041
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72dd8 is (000d3fbc,01e73798)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72de0 (fffffffe becomes 000d4014,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "reset", ino #252
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 71
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4044-0x000d4099
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e737b0 (ino #252)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72de0 is (000d4014,01e72dd0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72de8 (fffffffe becomes 000d4044,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 72
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d409c-0x000d40ca
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72de8 is (000d4044,01e737b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72df0 (fffffffe becomes 000d409c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "resize", ino #253
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 73
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d40cc-0x000d4121
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e737c8 (ino #253)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72df0 is (000d409c,01e72de0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72df8 (fffffffe becomes 000d40cc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 74
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4124-0x000d414f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72df8 is (000d40cc,01e737c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e00 (fffffffe becomes 000d4124,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "seq", ino #254
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 75
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4150-0x000d41a5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e737e0 (ino #254)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e00 is (000d4124,01e72df0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e08 (fffffffe becomes 000d4150,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 76
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d41a8-0x000d41db
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e08 is (000d4150,01e737e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e10 (fffffffe becomes 000d41a8,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "setkeycodes", ino #255
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 77
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d41dc-0x000d4231
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e737f8 (ino #255)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e10 is (000d41a8,01e72e00)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e18 (fffffffe becomes 000d41dc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 78
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4234-0x000d4262
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e18 is (000d41dc,01e737f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e20 (fffffffe becomes 000d4234,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "setsid", ino #256
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 79
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4264-0x000d42b9
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73810 (ino #256)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e20 is (000d4234,01e72e10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e28 (fffffffe becomes 000d4264,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 80
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d42bc-0x000d42eb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e28 is (000d4264,01e73810)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e30 (fffffffe becomes 000d42bc,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sha1sum", ino #257
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 81
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d42ec-0x000d4341
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73828 (ino #257)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e30 is (000d42bc,01e72e20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e38 (fffffffe becomes 000d42ec,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 82
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4344-0x000d4375
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e38 is (000d42ec,01e73828)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e40 (fffffffe becomes 000d4344,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sha256sum", ino #258
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 83
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4378-0x000d43cd
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73840 (ino #258)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e40 is (000d4344,01e72e30)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e48 (fffffffe becomes 000d4378,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 84
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d43d0-0x000d43ff
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e48 is (000d4378,01e73840)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e50 (fffffffe becomes 000d43d0,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sha3sum", ino #259
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 85
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4400-0x000d4455
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73858 (ino #259)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e50 is (000d43d0,01e72e40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e58 (fffffffe becomes 000d4400,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 86
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4458-0x000d4489
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e58 is (000d4400,01e73858)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e60 (fffffffe becomes 000d4458,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sha512sum", ino #260
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 87
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d448c-0x000d44e1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73870 (ino #260)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e60 is (000d4458,01e72e50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e68 (fffffffe becomes 000d448c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 88
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d44e4-0x000d4510
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e68 is (000d448c,01e73870)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e70 (fffffffe becomes 000d44e4,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sort", ino #261
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 89
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4510-0x000d4565
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73888 (ino #261)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e70 is (000d44e4,01e72e60)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e78 (fffffffe becomes 000d4510,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 90
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4568-0x000d4597
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e78 is (000d4510,01e73888)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e88 (fffffffe becomes 000d4568,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "strings", ino #262
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 91
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4598-0x000d45ed
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e738a0 (ino #262)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e88 is (000d4568,01e72e70)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e90 (fffffffe becomes 000d4598,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 92
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d45f0-0x000d461c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e90 is (000d4598,01e738a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72e98 (fffffffe becomes 000d45f0,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tail", ino #263
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 93
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d461c-0x000d4671
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e738b8 (ino #263)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72e98 is (000d45f0,01e72e88)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ea0 (fffffffe becomes 000d461c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 94
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4674-0x000d469f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ea0 is (000d461c,01e738b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ea8 (fffffffe becomes 000d4674,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tee", ino #264
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 95
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d46a0-0x000d46f5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e738d0 (ino #264)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ea8 is (000d4674,01e72e98)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72eb0 (fffffffe becomes 000d46a0,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 96
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d46f8-0x000d4726
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72eb0 is (000d46a0,01e738d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72eb8 (fffffffe becomes 000d46f8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "telnet", ino #265
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 97
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4728-0x000d477d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e738e8 (ino #265)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72eb8 is (000d46f8,01e72ea8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ec0 (fffffffe becomes 000d4728,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 98
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4780-0x000d47ac
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ec0 is (000d4728,01e738e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ec8 (fffffffe becomes 000d4780,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "test", ino #266
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 99
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d47ac-0x000d4801
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73900 (ino #266)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ec8 is (000d4780,01e72eb8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ed0 (fffffffe becomes 000d47ac,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 100
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4804-0x000d4830
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ed0 is (000d47ac,01e73900)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ed8 (fffffffe becomes 000d4804,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tftp", ino #267
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 101
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4830-0x000d4885
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73918 (ino #267)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ed8 is (000d4804,01e72ec8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ee0 (fffffffe becomes 000d4830,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 102
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4888-0x000d48b4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ee0 is (000d4830,01e73918)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ee8 (fffffffe becomes 000d4888,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "time", ino #268
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 103
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d48b4-0x000d4909
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73930 (ino #268)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ee8 is (000d4888,01e72ed8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ef0 (fffffffe becomes 000d48b4,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 104
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d490c-0x000d4937
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ef0 is (000d48b4,01e73930)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72ef8 (fffffffe becomes 000d490c,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "top", ino #269
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 105
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4938-0x000d498d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73948 (ino #269)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72ef8 is (000d490c,01e72ee8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f00 (fffffffe becomes 000d4938,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 106
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4990-0x000d49ba
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f00 is (000d4938,01e73948)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f08 (fffffffe becomes 000d4990,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tr", ino #270
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 107
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d49bc-0x000d4a11
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73960 (ino #270)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f08 is (000d4990,01e72ef8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f10 (fffffffe becomes 000d49bc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 108
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4a14-0x000d4a46
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f10 is (000d49bc,01e73960)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f18 (fffffffe becomes 000d4a14,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "traceroute", ino #271
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 109
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4a48-0x000d4a9d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73978 (ino #271)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f18 is (000d4a14,01e72f08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f20 (fffffffe becomes 000d4a48,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 110
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4aa0-0x000d4acb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f20 is (000d4a48,01e73978)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f28 (fffffffe becomes 000d4aa0,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tty", ino #272
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 111
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4acc-0x000d4b21
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73990 (ino #272)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f28 is (000d4aa0,01e72f18)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f30 (fffffffe becomes 000d4acc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 112
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4b24-0x000d4b50
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f30 is (000d4acc,01e73990)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f38 (fffffffe becomes 000d4b24,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "uniq", ino #273
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 113
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4b50-0x000d4ba5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e739a8 (ino #273)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f38 is (000d4b24,01e72f28)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f40 (fffffffe becomes 000d4b50,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 114
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4ba8-0x000d4bd8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f40 is (000d4b50,01e739a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f48 (fffffffe becomes 000d4ba8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "unix2dos", ino #274
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 115
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4bd8-0x000d4c2d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e739c0 (ino #274)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f48 is (000d4ba8,01e72f38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f50 (fffffffe becomes 000d4bd8,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 116
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4c30-0x000d4c5e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f50 is (000d4bd8,01e739c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f58 (fffffffe becomes 000d4c30,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "unlzma", ino #275
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 117
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4c60-0x000d4cb5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e739d8 (ino #275)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f58 is (000d4c30,01e72f48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f60 (fffffffe becomes 000d4c60,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 118
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4cb8-0x000d4ce4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f60 is (000d4c60,01e739d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f68 (fffffffe becomes 000d4cb8,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "unxz", ino #276
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 119
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4ce4-0x000d4d39
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e739f0 (ino #276)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f68 is (000d4cb8,01e72f58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e72f70 (fffffffe becomes 000d4ce4,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 120
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4d3c-0x000d4d69
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e72f70 is (000d4ce4,01e739f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75000 (fffffffe becomes 000d4d3c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "unzip", ino #277
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 121
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4d6c-0x000d4dc1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73a08 (ino #277)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75000 is (000d4d3c,01e72f68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75008 (fffffffe becomes 000d4d6c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 122
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4dc4-0x000d4df2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75008 is (000d4d6c,01e73a08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75010 (fffffffe becomes 000d4dc4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "uptime", ino #278
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 123
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4df4-0x000d4e49
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73a20 (ino #278)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75010 is (000d4dc4,01e75000)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75018 (fffffffe becomes 000d4df4,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 124
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4e4c-0x000d4e7c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75018 is (000d4df4,01e73a20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75020 (fffffffe becomes 000d4e4c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "uudecode", ino #279
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 125
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4e7c-0x000d4ed1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73a38 (ino #279)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75020 is (000d4e4c,01e75010)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75028 (fffffffe becomes 000d4e7c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 126
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4ed4-0x000d4f04
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75028 is (000d4e7c,01e73a38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75030 (fffffffe becomes 000d4ed4,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "uuencode", ino #280
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 127
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4f04-0x000d4f59
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73a50 (ino #280)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75030 is (000d4ed4,01e75020)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75038 (fffffffe becomes 000d4f04,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 128
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4f5c-0x000d4f89
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75038 is (000d4f04,01e73a50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75040 (fffffffe becomes 000d4f5c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "vlock", ino #281
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 129
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d4f8c-0x000d4fe1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73a68 (ino #281)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75040 is (000d4f5c,01e75030)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75048 (fffffffe becomes 000d4f8c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 130
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d4fe4-0x000d500e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75048 is (000d4f8c,01e73a68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75050 (fffffffe becomes 000d4fe4,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "wc", ino #282
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 131
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5010-0x000d5065
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73a80 (ino #282)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75050 is (000d4fe4,01e75040)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75058 (fffffffe becomes 000d5010,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 132
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5068-0x000d5094
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75058 is (000d5010,01e73a80)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75060 (fffffffe becomes 000d5068,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "wget", ino #283
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 133
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5094-0x000d50e9
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73a98 (ino #283)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75060 is (000d5068,01e75050)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75068 (fffffffe becomes 000d5094,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 134
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d50ec-0x000d5119
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75068 is (000d5094,01e73a98)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75070 (fffffffe becomes 000d50ec,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "which", ino #284
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 135
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d511c-0x000d5171
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73ab0 (ino #284)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75070 is (000d50ec,01e75060)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75078 (fffffffe becomes 000d511c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 136
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5174-0x000d519f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75078 is (000d511c,01e73ab0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75080 (fffffffe becomes 000d5174,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "who", ino #285
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 137
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d51a0-0x000d51f5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73ac8 (ino #285)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75080 is (000d5174,01e75070)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75088 (fffffffe becomes 000d51a0,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 138
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d51f8-0x000d5226
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75088 is (000d51a0,01e73ac8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75090 (fffffffe becomes 000d51f8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "whoami", ino #286
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 139
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5228-0x000d527d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73ae0 (ino #286)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75090 is (000d51f8,01e75080)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75098 (fffffffe becomes 000d5228,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 140
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5280-0x000d52ad
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75098 is (000d5228,01e73ae0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750a0 (fffffffe becomes 000d5280,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "xargs", ino #287
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 141
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d52b0-0x000d5305
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73af8 (ino #287)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750a0 is (000d5280,01e75090)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750a8 (fffffffe becomes 000d52b0,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 142
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5308-0x000d5332
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750a8 is (000d52b0,01e73af8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750b0 (fffffffe becomes 000d5308,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "xz", ino #288
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 143
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5334-0x000d5389
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73b10 (ino #288)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750b0 is (000d5308,01e750a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750b8 (fffffffe becomes 000d5334,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 144
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d538c-0x000d53b9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750b8 is (000d5334,01e73b10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750c0 (fffffffe becomes 000d538c,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "xzcat", ino #289
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 145
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d53bc-0x000d5411
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73b28 (ino #289)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750c0 is (000d538c,01e750b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750c8 (fffffffe becomes 000d53bc,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 146
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5414-0x000d543f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750c8 is (000d53bc,01e73b28)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750d0 (fffffffe becomes 000d5414,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "yes", ino #290
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 147
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5440-0x000d5495
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73b40 (ino #290)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750d0 is (000d5414,01e750c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750d8 (fffffffe becomes 000d5440,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 148
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5498-0x000d54c8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750d8 is (000d5440,01e73b40)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750e0 (fffffffe becomes 000d5498,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "addgroup", ino #291
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 149
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d54c8-0x000d551d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73b58 (ino #291)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750e0 is (000d5498,01e72968)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750e8 (fffffffe becomes 000d54c8,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 150
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5520-0x000d554f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750e8 is (000d54c8,01e73b58)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e750f8 (fffffffe becomes 000d5520,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "adduser", ino #292
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 151
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5550-0x000d55a5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73b70 (ino #292)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e750f8 is (000d5520,01e750e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75100 (fffffffe becomes 000d5550,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 152
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d55a8-0x000d55d6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75100 is (000d5550,01e73b70)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75108 (fffffffe becomes 000d55a8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "arping", ino #293
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 153
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d55d8-0x000d562d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73b88 (ino #293)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75108 is (000d55a8,01e750f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75110 (fffffffe becomes 000d55d8,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 154
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5630-0x000d565e
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75110 is (000d55d8,01e73b88)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75118 (fffffffe becomes 000d5630,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chroot", ino #294
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 155
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5660-0x000d56b5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73ba0 (ino #294)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75118 is (000d5630,01e75108)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75120 (fffffffe becomes 000d5660,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 156
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d56b8-0x000d56e5
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75120 is (000d5660,01e73ba0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75128 (fffffffe becomes 000d56b8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "crond", ino #295
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 157
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d56e8-0x000d573d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73bb8 (ino #295)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75128 is (000d56b8,01e75118)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75130 (fffffffe becomes 000d56e8,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 158
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5740-0x000d5770
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75130 is (000d56e8,01e73bb8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75138 (fffffffe becomes 000d5740,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "delgroup", ino #296
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 159
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5770-0x000d57c5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73bd0 (ino #296)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75138 is (000d5740,01e75128)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75140 (fffffffe becomes 000d5770,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 160
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d57c8-0x000d57f7
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75140 is (000d5770,01e73bd0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75148 (fffffffe becomes 000d57c8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "deluser", ino #297
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 161
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d57f8-0x000d584d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73be8 (ino #297)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75148 is (000d57c8,01e75138)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75150 (fffffffe becomes 000d57f8,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 162
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5850-0x000d587c
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75150 is (000d57f8,01e73be8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75158 (fffffffe becomes 000d5850,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dnsd", ino #298
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 163
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d587c-0x000d58d1
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73c00 (ino #298)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75158 is (000d5850,01e75148)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75160 (fffffffe becomes 000d587c,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 164
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d58d4-0x000d5906
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75160 is (000d587c,01e73c00)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75168 (fffffffe becomes 000d58d4,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ether-wake", ino #299
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 165
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5908-0x000d595d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73c18 (ino #299)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75168 is (000d58d4,01e75158)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75170 (fffffffe becomes 000d5908,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 166
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5960-0x000d5990
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75170 is (000d5908,01e73c18)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75178 (fffffffe becomes 000d5960,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "fdformat", ino #300
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 167
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5990-0x000d59e5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73c30 (ino #300)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75178 is (000d5960,01e75168)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75180 (fffffffe becomes 000d5990,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 168
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d59e8-0x000d5a15
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75180 is (000d5990,01e73c30)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75188 (fffffffe becomes 000d59e8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "inetd", ino #301
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 169
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5a18-0x000d5a6d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73c48 (ino #301)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75188 is (000d59e8,01e75178)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75190 (fffffffe becomes 000d5a18,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 170
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5a70-0x000d5aa0
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75190 is (000d5a18,01e73c48)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75198 (fffffffe becomes 000d5a70,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "killall5", ino #302
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 171
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5aa0-0x000d5af5
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73c60 (ino #302)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75198 is (000d5a70,01e75188)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751a0 (fffffffe becomes 000d5aa0,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 172
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5af8-0x000d5b28
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751a0 is (000d5aa0,01e73c60)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751a8 (fffffffe becomes 000d5af8,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "loadfont", ino #303
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 173
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5b28-0x000d5b7d
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73c78 (ino #303)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751a8 is (000d5af8,01e75198)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751b0 (fffffffe becomes 000d5b28,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 174
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000d5b80-0x000d5bb2
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751b0 is (000d5b28,01e73c78)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751b8 (fffffffe becomes 000d5b80,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mkfs.jffs2", ino #304
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 175
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d5bb4-0x000d65ee
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73c90 (ino #304)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751b8 is (000d5b80,01e751a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751c0 (fffffffe becomes 000d5bb4,  (null)) len 0xa3c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 176
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d65f0-0x000d6f17
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751c0 is (000d5bb4,01e73c90)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751c8 (fffffffe becomes 000d65f0,  (null)) len 0x928
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 177
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d6f18-0x000d78fb
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751c8 is (000d65f0,01e751c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751d0 (fffffffe becomes 000d6f18,  (null)) len 0x9e4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 178
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d78fc-0x000d82c4
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751d0 is (000d6f18,01e751c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751d8 (fffffffe becomes 000d78fc,  (null)) len 0x9c8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 179
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d82c4-0x000d8d24
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751d8 is (000d78fc,01e751d0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751e0 (fffffffe becomes 000d82c4,  (null)) len 0xa60
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 180
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d8d24-0x000d9790
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751e0 is (000d82c4,01e751d8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751f0 (fffffffe becomes 000d8d24,  (null)) len 0xa6c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 181
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000d9790-0x000da144
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751f0 is (000d8d24,01e751e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e751f8 (fffffffe becomes 000d9790,  (null)) len 0x9b4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 182
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000da144-0x000da9ee
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e751f8 is (000d9790,01e751f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75200 (fffffffe becomes 000da144,  (null)) len 0x8ac
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 183
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000da9f0-0x000db549
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75200 is (000da144,01e751f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75208 (fffffffe becomes 000da9f0,  (null)) len 0xb5c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 184
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000db54c-0x000dbfac
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75208 is (000da9f0,01e75200)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75210 (fffffffe becomes 000db54c,  (null)) len 0xa60
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 185
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000dbfac-0x000dc9bf
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75210 is (000db54c,01e75208)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75218 (fffffffe becomes 000dbfac,  (null)) len 0xa14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 186
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000dc9c0-0x000dd323
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75218 is (000dbfac,01e75210)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75220 (fffffffe becomes 000dc9c0,  (null)) len 0x964
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 187
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000dd324-0x000dddde
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75220 is (000dc9c0,01e75218)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75228 (fffffffe becomes 000dd324,  (null)) len 0xabc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75228 is (000dd324,01e75220)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75230 (fffffffe becomes 000ddde3,  (null)) len 0x2220
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_scan_sumnode: summary found for 0x000e0000 at 0x000ef010 (0xff0 bytes)
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e0000-0x000e0abe
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e752e8 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e752e8 (fffffffe becomes 000e0000,  (null)) len 0xac0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 1
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e0ac0-0x000e1574
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e752e8 is (000e0000,01e75228)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e752f0 (fffffffe becomes 000e0ac0,  (null)) len 0xab4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 2
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e1574-0x000e1e85
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e752f0 is (000e0ac0,01e752e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e752f8 (fffffffe becomes 000e1574,  (null)) len 0x914
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 3
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e1e88-0x000e2761
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e752f8 is (000e1574,01e752f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75300 (fffffffe becomes 000e1e88,  (null)) len 0x8dc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e2764-0x000e3215
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75300 is (000e1e88,01e752f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75308 (fffffffe becomes 000e2764,  (null)) len 0xab4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 5
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e3218-0x000e37de
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75308 is (000e2764,01e75300)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75310 (fffffffe becomes 000e3218,  (null)) len 0x5c8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 6
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e37e0-0x000e3e53
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75310 is (000e3218,01e75308)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75318 (fffffffe becomes 000e37e0,  (null)) len 0x674
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 7
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e3e54-0x000e487f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75318 is (000e37e0,01e75310)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75320 (fffffffe becomes 000e3e54,  (null)) len 0xa2c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e4880-0x000e532f
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75320 is (000e3e54,01e75318)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75328 (fffffffe becomes 000e4880,  (null)) len 0xab0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 9
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e5330-0x000e5c8b
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75328 is (000e4880,01e75320)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75330 (fffffffe becomes 000e5330,  (null)) len 0x95c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 10
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e5c8c-0x000e654d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75330 is (000e5330,01e75328)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75338 (fffffffe becomes 000e5c8c,  (null)) len 0x8c4
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 11
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e6550-0x000e6f51
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75338 is (000e5c8c,01e75330)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75340 (fffffffe becomes 000e6550,  (null)) len 0xa04
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 12
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e6f54-0x000e79be
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75340 is (000e6550,01e75338)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75348 (fffffffe becomes 000e6f54,  (null)) len 0xa6c
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 13
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e79c0-0x000e83b6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75348 is (000e6f54,01e75340)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75350 (fffffffe becomes 000e79c0,  (null)) len 0x9f8
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e83b8-0x000e8b65
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75350 is (000e79c0,01e75348)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75358 (fffffffe becomes 000e83b8,  (null)) len 0x7b0
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 15
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e8b68-0x000e9687
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75358 is (000e83b8,01e75350)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75360 (fffffffe becomes 000e8b68,  (null)) len 0xb20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 16
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000e9688-0x000ea6cc
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75360 is (000e8b68,01e75358)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75368 (fffffffe becomes 000e9688,  (null)) len 0x1044
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 17
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ea6cc-0x000eb2df
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75368 is (000e9688,01e75360)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75370 (fffffffe becomes 000ea6cc,  (null)) len 0xc14
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 18
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000eb2e0-0x000eb9f8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75370 is (000ea6cc,01e75368)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75378 (fffffffe becomes 000eb2e0,  (null)) len 0x718
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 19
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000eb9f8-0x000ec189
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75378 is (000eb2e0,01e75370)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75380 (fffffffe becomes 000eb9f8,  (null)) len 0x794
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 20
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ec18c-0x000ecafa
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75380 is (000eb9f8,01e75378)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75388 (fffffffe becomes 000ec18c,  (null)) len 0x970
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 21
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ecafc-0x000ed1c6
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75388 is (000ec18c,01e75380)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75390 (fffffffe becomes 000ecafc,  (null)) len 0x6cc
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 22
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Dirent at 0x000ed1c8-0x000ed1f9
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75390 is (000ecafc,01e75388)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75398 (fffffffe becomes 000ed1c8,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "nandwrite", ino #305
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 23
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ed1fc-0x000edc4b
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73ca8 (ino #305)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75398 is (000ed1c8,01e751b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e753a0 (fffffffe becomes 000ed1fc,  (null)) len 0xa50
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 24
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000edc4c-0x000ee5cd
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e753a0 is (000ed1fc,01e73ca8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e753a8 (fffffffe becomes 000edc4c,  (null)) len 0x984
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: processing summary index 25
[JFFS2 DBG] (1) jffs2_sum_process_sum_data: Inode at 0x000ee5d0-0x000ef00d
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e753a8 is (000edc4c,01e753a0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e753b0 (fffffffe becomes 000ee5d0,  (null)) len 0xa40
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e753b0 is (000ee5d0,01e753a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e753b8 (fffffffe becomes 000ef013,  (null)) len 0xff0
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_scan_eraseblock: no summary found in jeb 0x000f0000. Apply original scan.
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e753e0 is (fffffffe,  (null))
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e753e0 (fffffffe becomes 000f0000,  (null)) len 0xac4
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e753e0 is (000f0000,01e753b0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e753e8 (fffffffe becomes 000f0ac4,  (null)) len 0xaac
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e753e8 is (000f0ac4,01e753e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e753f0 (fffffffe becomes 000f1570,  (null)) len 0x994
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e753f0 is (000f1570,01e753e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e753f8 (fffffffe becomes 000f1f04,  (null)) len 0xaf0
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e753f8 is (000f1f04,01e753f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75400 (fffffffe becomes 000f29f4,  (null)) len 0xae4
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75400 is (000f29f4,01e753f8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75408 (fffffffe becomes 000f34d8,  (null)) len 0xa2c
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75408 is (000f34d8,01e75400)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75410 (fffffffe becomes 000f3f04,  (null)) len 0x8c8
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75410 is (000f3f04,01e75408)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75418 (fffffffe becomes 000f47cc,  (null)) len 0x2cc
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75418 is (000f47cc,01e75410)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75420 (fffffffe becomes 000f4a98,  (null)) len 0xaa4
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75420 is (000f4a98,01e75418)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75428 (fffffffe becomes 000f553c,  (null)) len 0x968
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75428 is (000f553c,01e75420)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75430 (fffffffe becomes 000f5ea4,  (null)) len 0xab4
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75430 is (000f5ea4,01e75428)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75438 (fffffffe becomes 000f6958,  (null)) len 0x8d0
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75438 is (000f6958,01e75430)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75440 (fffffffe becomes 000f7228,  (null)) len 0x7f4
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75440 is (000f7228,01e75438)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75448 (fffffffe becomes 000f7a1c,  (null)) len 0x644
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75448 is (000f7a1c,01e75440)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75450 (fffffffe becomes 000f8060,  (null)) len 0x588
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (305) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75450 is (000f8060,01e75448)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75458 (fffffffe becomes 000f85ea,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "rdate", ino #306
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (306) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73cc0 (ino #306)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75458 is (000f85ea,01e75398)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75460 (fffffffe becomes 000f8618,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (306) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75460 is (000f8618,01e73cc0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75468 (fffffffe becomes 000f8672,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "readprofile", ino #307
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (307) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73cd8 (ino #307)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75468 is (000f8672,01e75458)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75470 (fffffffe becomes 000f86a4,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (307) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75470 is (000f86a4,01e73cd8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75478 (fffffffe becomes 000f86fe,  (null)) len 0x34
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "setlogcons", ino #308
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (308) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73cf0 (ino #308)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75478 is (000f86fe,01e75468)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75480 (fffffffe becomes 000f8730,  (null)) len 0x58
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (308) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75480 is (000f8730,01e73cf0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75488 (fffffffe becomes 000f878a,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "udhcpc", ino #309
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (309) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73d08 (ino #309)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75488 is (000f878a,01e72978)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75490 (fffffffe becomes 000f87b8,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (309) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75490 is (000f87b8,01e73d08)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75498 (fffffffe becomes 000f87fe,  (null)) len 0x38
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "default.script", ino #310
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (310) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73d20 (ino #310)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75498 is (000f87fe,01e75490)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754a0 (fffffffe becomes 000f8834,  (null)) len 0x2b4
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (310) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754a0 is (000f8834,01e73d20)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754a8 (fffffffe becomes 000f8aea,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cache", ino #311
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (311) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73d38 (ino #311)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754a8 is (000f8aea,01e5b120)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754b0 (fffffffe becomes 000f8b18,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (311) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754b0 is (000f8b18,01e73d38)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754b8 (fffffffe becomes 000f8b66,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lib", ino #312
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (312) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73d50 (ino #312)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754b8 is (000f8b66,01e754a8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754c0 (fffffffe becomes 000f8b90,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (312) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754c0 is (000f8b90,01e73d50)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754c8 (fffffffe becomes 000f8bd6,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lock", ino #313
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (313) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73d68 (ino #313)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754c8 is (000f8bd6,01e754b8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754d8 (fffffffe becomes 000f8c00,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (313) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754d8 is (000f8c00,01e73d68)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754e0 (fffffffe becomes 000f8c4e,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "log", ino #314
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (314) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73d80 (ino #314)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754e0 is (000f8c4e,01e754c8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754e8 (fffffffe becomes 000f8c78,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (314) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754e8 is (000f8c78,01e73d80)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754f0 (fffffffe becomes 000f8cc6,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pcmcia", ino #315
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (315) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73d98 (ino #315)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754f0 is (000f8cc6,01e754e0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e754f8 (fffffffe becomes 000f8cf4,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (315) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e754f8 is (000f8cf4,01e73d98)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75500 (fffffffe becomes 000f8d42,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "run", ino #316
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (316) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73db0 (ino #316)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75500 is (000f8d42,01e754f0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75508 (fffffffe becomes 000f8d6c,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (316) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75508 is (000f8d6c,01e73db0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75510 (fffffffe becomes 000f8dba,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "spool", ino #317
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (317) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73dc8 (ino #317)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75510 is (000f8dba,01e75500)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75518 (fffffffe becomes 000f8de8,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (317) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75518 is (000f8de8,01e73dc8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75520 (fffffffe becomes 000f8e36,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tmp", ino #318
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (318) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73de0 (ino #318)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75520 is (000f8e36,01e75510)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75528 (fffffffe becomes 000f8e60,  (null)) len 0x4c
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (318) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75528 is (000f8e60,01e73de0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75530 (fffffffe becomes 000f8eae,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "www", ino #319
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (319) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73df8 (ino #319)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75530 is (000f8eae,01e75520)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75538 (fffffffe becomes 000f8ed8,  (null)) len 0x44
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (319) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75538 is (000f8ed8,01e73df8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75540 (fffffffe becomes 000f8f1e,  (null)) len 0x2c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "misc", ino #320
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (320) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73e10 (ino #320)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75540 is (000f8f1e,01e754c0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75548 (fffffffe becomes 000f8f48,  (null)) len 0x50
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (320) added to summary
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75548 is (000f8f48,01e73e10)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75550 (fffffffe becomes 000f8f9a,  (null)) len 0x30
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pcmcia", ino #321
[JFFS2 DBG] (1) jffs2_sum_add_mem: dirent (321) added to summary
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 01e73e28 (ino #321)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 01e75550 is (000f8f9a,01e75540)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 01e75558 (fffffffe becomes 000f8fc8,  (null)) len 0x50
[JFFS2 DBG] (1) jffs2_sum_add_mem: inode (321) added to summary
[JFFS2 DBG] (1) jffs2_sum_move_collected: oldsize=0x0 oldnum=0 => newsize=0x409 newnum=47
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_sum_reset_collected: called
[JFFS2 DBG] (1) jffs2_sum_clean_collected: already empty
[JFFS2 DBG] (1) jffs2_build_filesystem: scanned flash completely
[JFFS2 DBG] dump JFFS2 blocks lists:
flash_size: 0x300000
used_size: 0x014b08
dirty_size: 0x000000
wasted_size: 0x000000
unchecked_size: 0x0e4510
free_size: 0x206fe8
erasing_size: 0x000000
bad_size: 0x000000
sector_size: 0x010000
jffs2_reserved_blocks size: 0x000000
nextblock: 0x0f0000 (used 0x0002f4, dirty 0x000000, wasted 0x000000, unchecked 0x008d24, free 0x006fe8)
gcblock: NULL
clean_list: 0x0e0000 (used 0x000ff0, dirty 0x000000, wasted 0x000000, unchecked 0x00f010, free 0x000000)
clean_list: 0x0d0000 (used 0x002220, dirty 0x000000, wasted 0x000000, unchecked 0x00dde0, free 0x000000)
clean_list: 0x0c0000 (used 0x0017f8, dirty 0x000000, wasted 0x000000, unchecked 0x00e808, free 0x000000)
clean_list: 0x0b0000 (used 0x001ad4, dirty 0x000000, wasted 0x000000, unchecked 0x00e52c, free 0x000000)
clean_list: 0x0a0000 (used 0x0013d4, dirty 0x000000, wasted 0x000000, unchecked 0x00ec2c, free 0x000000)
clean_list: 0x090000 (used 0x001c48, dirty 0x000000, wasted 0x000000, unchecked 0x00e3b8, free 0x000000)
clean_list: 0x080000 (used 0x002df8, dirty 0x000000, wasted 0x000000, unchecked 0x00d208, free 0x000000)
clean_list: 0x070000 (used 0x000530, dirty 0x000000, wasted 0x000000, unchecked 0x00fad0, free 0x000000)
clean_list: 0x060000 (used 0x001230, dirty 0x000000, wasted 0x000000, unchecked 0x00edd0, free 0x000000)
clean_list: 0x050000 (used 0x001420, dirty 0x000000, wasted 0x000000, unchecked 0x00ebe0, free 0x000000)
clean_list: 0x040000 (used 0x001314, dirty 0x000000, wasted 0x000000, unchecked 0x00ecec, free 0x000000)
clean_list: 0x030000 (used 0x000e80, dirty 0x000000, wasted 0x000000, unchecked 0x00f180, free 0x000000)
clean_list: 0x020000 (used 0x001470, dirty 0x000000, wasted 0x000000, unchecked 0x00eb90, free 0x000000)
clean_list: 0x010000 (used 0x0011a0, dirty 0x000000, wasted 0x000000, unchecked 0x00ee60, free 0x000000)
clean_list: 0x000000 (used 0x001200, dirty 0x000000, wasted 0x000000, unchecked 0x00ee00, free 0x000000)
Contains 15 blocks with total wasted size 0, average wasted size: 0
very_dirty_list: empty
dirty_list: empty
erasable_list: empty
erasing_list: empty
erase_checking_list: empty
erasable_pending_wbuf_list: empty
free_list: empty
bad_list: empty
bad_used_list: empty
[JFFS2 DBG] (1) jffs2_build_filesystem: pass 1 starting
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #1
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "bin" (ino #2)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "dev" (ino #3)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "etc" (ino #4)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lib" (ino #6)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mnt" (ino #10)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "opt" (ino #11)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "run" (ino #14)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "tmp" (ino #17)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sys" (ino #16)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "var" (ino #19)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "usr" (ino #18)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "home" (ino #5)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "proc" (ino #12)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sbin" (ino #15)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "root" (ino #13)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lib32" (ino #7)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "media" (ino #9)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "linuxrc" (ino #8)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #2
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "dd" (ino #30)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "cp" (ino #27)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "df" (ino #31)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ln" (ino #49)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ls" (ino #51)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mt" (ino #59)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mv" (ino #60)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ps" (ino #67)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "rm" (ino #69)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sh" (ino #75)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "su" (ino #78)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "vi" (ino #86)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "cat" (ino #21)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "pwd" (ino #68)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sed" (ino #72)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "tar" (ino #80)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "catv" (ino #22)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "date" (ino #29)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "cpio" (ino #28)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "echo" (ino #35)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "grep" (ino #41)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "gzip" (ino #43)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "hush" (ino #45)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "kill" (ino #46)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "more" (ino #56)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "nice" (ino #62)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ping" (ino #64)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "stty" (ino #77)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sync" (ino #79)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "true" (ino #82)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "zcat" (ino #88)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "chgrp" (ino #24)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "chmod" (ino #25)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "chown" (ino #26)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "dmesg" (ino #32)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "egrep" (ino #36)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "false" (ino #37)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "fgrep" (ino #39)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "login" (ino #50)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mkdir" (ino #53)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mknod" (ino #54)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mount" (ino #57)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "pidof" (ino #63)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "rmdir" (ino #70)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sleep" (ino #76)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "touch" (ino #81)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "uname" (ino #84)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "watch" (ino #87)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "pipe_progress" (ino #65)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "setarch" (ino #73)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "fdflush" (ino #38)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "setserial" (ino #74)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mountpoint" (ino #58)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "hostname" (ino #44)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "run-parts" (ino #71)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "dumpkmap" (ino #34)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "linux32" (ino #47)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "linux64" (ino #48)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "chattr" (ino #23)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "getopt" (ino #40)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "netstat" (ino #61)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "gunzip" (ino #42)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lsattr" (ino #52)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mktemp" (ino #55)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "dnsdomainname" (ino #33)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "umount" (ino #83)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "usleep" (ino #85)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "printenv" (ino #66)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "busybox" (ino #20)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #3
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "log" (ino #90)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "pts" (ino #91)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "console" (ino #89)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #4
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mtab" (ino #105)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "securetty" (ino #114)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "fstab" (ino #93)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "group" (ino #94)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "hosts" (ino #96)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "issue" (ino #100)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mdev.conf" (ino #104)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "firmware" (ino #92)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "hostname" (ino #95)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ld.so.conf" (ino #102)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "services" (ino #115)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "random-seed" (ino #112)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "inittab" (ino #98)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "inputrc" (ino #99)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "nsswitch.conf" (ino #107)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "os-release" (ino #108)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ld.so.conf.d" (ino #103)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "network" (ino #106)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "init.d" (ino #97)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "passwd" (ino #109)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "shadow" (ino #116)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ld.so.cache" (ino #101)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "wpa_supplicant.conf" (ino #117)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "protocols" (ino #111)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "resolv.conf" (ino #113)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "profile" (ino #110)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #5
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ftp" (ino #133)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "default" (ino #132)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #6
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mt5931_loader.ko" (ino #135)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "firmware" (ino #134)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #13
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child ".bash_profile" (ino #138)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child ".bash_logout" (ino #137)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child ".bash_history" (ino #136)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #15
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ip" (ino #152)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "fsck" (ino #142)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "halt" (ino #144)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ifup" (ino #149)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "init" (ino #150)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mdev" (ino #168)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "switch_root" (ino #181)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "blkid" (ino #139)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "getty" (ino #143)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "iwspy" (ino #162)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "klogd" (ino #163)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lsmod" (ino #166)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "rmmod" (ino #175)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "route" (ino #176)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "freeramdisk" (ino #141)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "iptunnel" (ino #157)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "modprobe" (ino #170)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "makedevs" (ino #167)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sulogin" (ino #180)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "syslogd" (ino #183)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "watchdog" (ino #186)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ifconfig" (ino #147)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "pivot_root" (ino #172)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "vconfig" (ino #185)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "loadkmap" (ino #164)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "hwclock" (ino #146)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "iproute" (ino #155)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "iwgetid" (ino #159)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "iwconfig" (ino #158)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "setconsole" (ino #178)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "start-stop-daemon" (ino #179)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "losetup" (ino #165)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "runlevel" (ino #177)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "poweroff" (ino #173)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "devmem" (ino #140)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "hdparm" (ino #145)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ifdown" (ino #148)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "insmod" (ino #151)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ipaddr" (ino #153)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "iplink" (ino #154)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "iprule" (ino #156)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "iwlist" (ino #160)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "iwpriv" (ino #161)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mkswap" (ino #169)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "nameif" (ino #171)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "reboot" (ino #174)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "udhcpc" (ino #184)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sysctl" (ino #182)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #17
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ldconfig" (ino #187)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #18
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "bin" (ino #189)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lib" (ino #190)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sbin" (ino #192)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lib32" (ino #191)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "share" (ino #193)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #19
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lib" (ino #312)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "log" (ino #314)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "run" (ino #316)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "tmp" (ino #318)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "www" (ino #319)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lock" (ino #313)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "cache" (ino #311)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "spool" (ino #317)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "pcmcia" (ino #315)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #309
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "default.script" (ino #310)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #312
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "misc" (ino #320)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "pcmcia" (ino #321)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #187
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "aux-cache" (ino #188)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #189
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "[" (ino #194)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "[[" (ino #195)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ar" (ino #196)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "dc" (ino #208)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "du" (ino #213)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "id" (ino #224)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "od" (ino #244)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "tr" (ino #270)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "wc" (ino #282)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "xz" (ino #288)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "awk" (ino #197)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "cmp" (ino #205)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "cut" (ino #207)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "env" (ino #214)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "seq" (ino #254)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "tee" (ino #264)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "top" (ino #269)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "tty" (ino #272)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "who" (ino #285)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "yes" (ino #290)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "chrt" (ino #201)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "chvt" (ino #202)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "diff" (ino #210)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "find" (ino #216)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "expr" (ino #215)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "fold" (ino #217)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "free" (ino #218)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "head" (ino #221)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ipcs" (ino #227)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "last" (ino #229)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "less" (ino #230)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mesg" (ino #239)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lsof" (ino #233)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lzma" (ino #237)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "tail" (ino #263)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sort" (ino #261)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "test" (ino #266)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "tftp" (ino #267)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "time" (ino #268)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "uniq" (ino #273)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "unxz" (ino #276)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "wget" (ino #283)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "uudecode" (ino #279)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "dos2unix" (ino #212)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "crontab" (ino #206)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "uuencode" (ino #280)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "dirname" (ino #211)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "clear" (ino #204)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "cksum" (ino #203)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "bzcat" (ino #200)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "fuser" (ino #219)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ipcrm" (ino #226)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lspci" (ino #234)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lsusb" (ino #235)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "lzcat" (ino #236)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "nohup" (ino #242)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "patch" (ino #247)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "reset" (ino #252)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "unzip" (ino #277)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "vlock" (ino #281)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "which" (ino #284)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "xargs" (ino #287)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "xzcat" (ino #289)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sha1sum" (ino #257)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sha3sum" (ino #259)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "strings" (ino #262)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "getconf" (ino #220)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "nslookup" (ino #243)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "hexdump" (ino #222)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "readlink" (ino #249)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "install" (ino #225)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "basename" (ino #198)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "realpath" (ino #250)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "deallocvt" (ino #209)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "killall" (ino #228)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "unix2dos" (ino #274)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "traceroute" (ino #271)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "logname" (ino #232)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "microcom" (ino #240)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "hostid" (ino #223)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "md5sum" (ino #238)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "logger" (ino #231)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sha256sum" (ino #258)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mkfifo" (ino #241)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "passwd" (ino #246)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "openvt" (ino #245)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "sha512sum" (ino #260)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "printf" (ino #248)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "renice" (ino #251)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "resize" (ino #253)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "setsid" (ino #256)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "telnet" (ino #265)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "unlzma" (ino #275)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "uptime" (ino #278)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "whoami" (ino #286)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "setkeycodes" (ino #255)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "bunzip2" (ino #199)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #192
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "dnsd" (ino #298)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "deluser" (ino #297)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "nandwrite" (ino #305)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "crond" (ino #295)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "inetd" (ino #301)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "rdate" (ino #306)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "killall5" (ino #302)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "setlogcons" (ino #308)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "delgroup" (ino #296)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "loadfont" (ino #303)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "ether-wake" (ino #299)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "arping" (ino #293)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "chroot" (ino #294)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "addgroup" (ino #291)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "fdformat" (ino #300)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "adduser" (ino #292)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "readprofile" (ino #307)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "mkfs.jffs2" (ino #304)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #193
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "udhcpc" (ino #309)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #92
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "WIFI_RAM_CODE" (ino #118)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #97
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "rcK" (ino #122)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "rcS" (ino #123)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "S01logging" (ino #119)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "S40network" (ino #121)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "S20urandom" (ino #120)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "s10mdev" (ino #124)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: building directory inode #106
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "if-post-down.d" (ino #126)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "if-pre-down.d" (ino #128)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "if-up.d" (ino #130)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "if-down.d" (ino #125)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "interfaces" (ino #131)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "if-pre-up.d" (ino #129)
[JFFS2 DBG] (1) jffs2_build_inode_pass1: increased nlink for child "if-post-up.d" (ino #127)
[JFFS2 DBG] (1) jffs2_build_filesystem: pass 1 complete
[JFFS2 DBG] (1) jffs2_build_filesystem: pass 2 starting
[JFFS2 DBG] (1) jffs2_build_filesystem: pass 2a starting
[JFFS2 DBG] (1) jffs2_build_filesystem: pass 2a complete
[JFFS2 DBG] (1) jffs2_build_filesystem: freeing temporary data structures
[JFFS2 DBG] (1) jffs2_build_filesystem: FS build complete
[JFFS2 DBG] (1) jffs2_calc_trigger_levels: trigger levels (size 3072 KiB, block size 64 KiB, 48 blocks)
[JFFS2 DBG] (1) jffs2_calc_trigger_levels: Blocks required to allow deletion:    2 (128 KiB)
[JFFS2 DBG] (1) jffs2_calc_trigger_levels: Blocks required to allow writes:      4 (256 KiB)
[JFFS2 DBG] (1) jffs2_calc_trigger_levels: Blocks required to quiesce GC thread: 5 (320 KiB)
[JFFS2 DBG] (1) jffs2_calc_trigger_levels: Blocks required to allow GC merges:   3 (192 KiB)
[JFFS2 DBG] (1) jffs2_calc_trigger_levels: Blocks required to GC bad blocks:     0 (0 KiB)
[JFFS2 DBG] (1) jffs2_calc_trigger_levels: Amount of dirty space required to GC: 96993 bytes
[JFFS2 DBG] (1) jffs2_calc_trigger_levels: Very dirty blocks before GC triggered: 5
[JFFS2 DBG] (1) jffs2_do_read_inode: read inode #1
[JFFS2 DBG] (1) jffs2_do_read_inode_internal: ino #1 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: ino #1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000790(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "var", ino #19
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000720(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "usr", ino #18
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0006b0(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tmp", ino #17
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000640(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sys", ino #16
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0005d0(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sbin", ino #15
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00055c(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "run", ino #14
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0004ec(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "root", ino #13
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00047c(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "proc", ino #12
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00040c(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "opt", ino #11
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00039c(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mnt", ino #10
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000328(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "media", ino #9
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0002a8(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "linuxrc", ino #8
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000230(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lib32", ino #7
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0001c0(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lib", ino #6
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000150(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "home", ino #5
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0000e0(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "etc", ino #4
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000070(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dev", ino #3
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000000(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "bin", ino #2
[JFFS2 DBG] (1) jffs2_get_inode_nodes: nodes of inode #1 were read, the highest version is 17, latest_mctime 1385528014, mctime_ver 17.
VFS: Mounted root (jffs2 filesystem) on device 31:1.
[JFFS2 DBG] (1) jffs2_do_read_inode: read inode #3
[JFFS2 DBG] (1) jffs2_do_read_inode_internal: ino #3 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: ino #3
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081a28(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pts", ino #91
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0819ac(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "log", ino #90
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081934(0).
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #2 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "console", ino #89
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00009c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) read_dnode: the node has no data.
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 0000009c
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: nodes of inode #3 were read, the highest version is 89, latest_mctime 1383875710, mctime_ver 89.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e74280
devtmpfs: mounted
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #2
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0818bc(0).
Freeing unused kernel memory: 92K (003ab000 - 003c2000)
[JFFS2 DBG] (1) jffs2_do_read_inode: read inode #2
[JFFS2 DBG] (1) jffs2_do_read_inode: waiting for ino #2 in state 1
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "zcat", ino #88
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081840(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "watch", ino #87
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0817c8(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "vi", ino #86
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x08174c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "usleep", ino #85
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0816d0(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "uname", ino #84
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081654(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "umount", ino #83
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0815dc(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "true", ino #82
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081560(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "touch", ino #81
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0814e8(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "tar", ino #80
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081470(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "sync", ino #79
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0813f8(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "su", ino #78
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081380(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "stty", ino #77
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081304(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "sleep", ino #76
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x08128c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "sh", ino #75
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x08120c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "setserial", ino #74
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081190(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "setarch", ino #73
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081118(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "sed", ino #72
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081098(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "run-parts", ino #71
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x08101c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "rmdir", ino #70
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080fa4(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "rm", ino #69
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080f2c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "pwd", ino #68
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080eb4(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ps", ino #67
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080e38(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "printenv", ino #66
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080db4(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "pipe_progress", ino #65
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080d3c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ping", ino #64
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080cc0(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "pidof", ino #63
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080c48(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "nice", ino #62
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080bcc(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "netstat", ino #61
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080b54(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mv", ino #60
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080adc(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mt", ino #59
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080a5c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mountpoint", ino #58
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0809e0(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mount", ino #57
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080968(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "more", ino #56
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0808ec(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mktemp", ino #55
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080870(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mknod", ino #54
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0807f4(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mkdir", ino #53
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080778(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "lsattr", ino #52
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080700(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ls", ino #51
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080684(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "login", ino #50
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x08060c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ln", ino #49
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080590(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "linux64", ino #48
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080514(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "linux32", ino #47
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x08049c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "kill", ino #46
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080424(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "hush", ino #45
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0803a8(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "hostname", ino #44
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080330(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "gzip", ino #43
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0802b4(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "gunzip", ino #42
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x08023c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "grep", ino #41
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0801c0(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "getopt", ino #40
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x080144(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "fgrep", ino #39
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0800c8(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "fdflush", ino #38
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x08004c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "false", ino #37
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07faa0(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "egrep", ino #36
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07fa28(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "echo", ino #35
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f9ac(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "dumpkmap", ino #34
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f928(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "dnsdomainname", ino #33
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f8ac(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "dmesg", ino #32
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f834(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "df", ino #31
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f7bc(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "dd", ino #30
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f744(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "date", ino #29
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f6cc(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "cpio", ino #28
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f654(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "cp", ino #27
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f5d8(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "chown", ino #26
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f55c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "chmod", ino #25
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f4e0(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "chgrp", ino #24
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f464(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "chattr", ino #23
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f3ec(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "catv", ino #22
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x07f374(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "cat", ino #21
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x000800(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "busybox", ino #20
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x00002c(0).
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 0000002c
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #2 were read, the highest version is 86, latest_mctime 1385610024, mctime_ver 86.
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e74f40
[JFFS2 DBG] (1) jffs2_do_read_inode_internal: ino #2 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: ino #2
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0818bc(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "zcat", ino #88
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081840(2).
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #4 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "watch", ino #87
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0817c8(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "vi", ino #86
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x08174c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "usleep", ino #85
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0816d0(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "uname", ino #84
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #4
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x084fa4(0).
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081654(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "umount", ino #83
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0815dc(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "true", ino #82
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081560(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "touch", ino #81
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0814e8(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "tar", ino #80
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081470(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sync", ino #79
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0813f8(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "su", ino #78
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081380(2).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "wpa_supplicant.conf", ino #117
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "stty", ino #77
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081304(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sleep", ino #76
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x08128c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sh", ino #75
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x08120c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "setserial", ino #74
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081190(2).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x084ebc(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "setarch", ino #73
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081118(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "sed", ino #72
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x081098(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "run-parts", ino #71
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x08101c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "rmdir", ino #70
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080fa4(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "rm", ino #69
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080f2c(2).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "shadow", ino #116
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pwd", ino #68
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080eb4(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ps", ino #67
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080e38(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "printenv", ino #66
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080db4(2).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x083bbc(0).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pipe_progress", ino #65
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080d3c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ping", ino #64
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080cc0(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "pidof", ino #63
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080c48(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "nice", ino #62
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080bcc(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "netstat", ino #61
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080b54(2).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "services", ino #115
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mv", ino #60
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080adc(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mt", ino #59
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080a5c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mountpoint", ino #58
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0809e0(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mount", ino #57
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x083a9c(0).
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080968(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "more", ino #56
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0808ec(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mktemp", ino #55
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080870(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mknod", ino #54
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0807f4(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "mkdir", ino #53
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080778(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "lsattr", ino #52
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080700(2).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "securetty", ino #114
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ls", ino #51
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080684(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "login", ino #50
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x08060c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ln", ino #49
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080590(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "linux64", ino #48
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x083a10(0).
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080514(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "linux32", ino #47
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x08049c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "kill", ino #46
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080424(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hush", ino #45
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0803a8(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "hostname", ino #44
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080330(2).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "resolv.conf", ino #113
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "gzip", ino #43
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0802b4(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "gunzip", ino #42
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x08023c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "grep", ino #41
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0801c0(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "getopt", ino #40
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x083798(0).
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x080144(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "fgrep", ino #39
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0800c8(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "fdflush", ino #38
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x08004c(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "false", ino #37
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07faa0(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "egrep", ino #36
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07fa28(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "echo", ino #35
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f9ac(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dumpkmap", ino #34
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f928(2).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "random-seed", ino #112
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dnsdomainname", ino #33
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f8ac(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dmesg", ino #32
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f834(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "df", ino #31
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f7bc(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "dd", ino #30
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x083178(0).
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f744(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "date", ino #29
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f6cc(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cpio", ino #28
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f654(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cp", ino #27
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f5d8(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chown", ino #26
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f55c(2).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "protocols", ino #111
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chmod", ino #25
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f4e0(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chgrp", ino #24
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f464(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "chattr", ino #23
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f3ec(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "catv", ino #22
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x082d7c(0).
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07f374(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "cat", ino #21
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000800(2).
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "busybox", ino #20
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00002c(3).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 0000002c
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: nodes of inode #2 were read, the highest version is 86, latest_mctime 1385610024, mctime_ver 86.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e74f60
[JFFS2 DBG] (1) jffs2_do_read_inode: read inode #75
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "profile", ino #110
[JFFS2 DBG] (1) jffs2_do_read_inode_internal: ino #75 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: ino #75
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0812b8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x00-0x07, ver 1 at 000812b8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 0
[JFFS2 DBG] (1) jffs2_get_inode_nodes: nodes of inode #75 were read, the highest version is 1, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e74f60 ver 1 range 0x0-0x7 ov 0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x082bec(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x00-0x07, phys offs 0x0812b8
[JFFS2 DBG] (1) check_node_data: check node at 0x0812b8, data length 7, partial CRC 0x000000, correct CRC 0x186b259f, data starts at 0x0812f5, start checking from 0x0812fc - 7 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e74f60 (v 1, 0x0-0x7, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x00-0x07 @0x000812b8 on flash, newfrag *01e73e40
[JFFS2 DBG] (1) jffs2_do_read_inode_internal: symlink's target 'busybox' cached
[JFFS2 DBG] (1) jffs2_do_read_inode: read inode #20
[JFFS2 DBG] (1) jffs2_do_read_inode_internal: ino #20 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: ino #20
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07ebc4(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "passwd", ino #109
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb9000-0xb9dc4, ver 193 at 0007ebc4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 757760
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07e220(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb8000-0xb9000, ver 192 at 0007e220
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 753664
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb9000-0xb9dc4 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 193, 0xb9000-0xdc4
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x082b20(0).
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07d8a8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb7000-0xb8000, ver 191 at 0007d8a8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 749568
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb8000-0xb9000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 192, 0xb8000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07cee8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb6000-0xb7000, ver 190 at 0007cee8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 745472
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb7000-0xb8000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 191, 0xb7000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07c528(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "os-release", ino #108
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb5000-0xb6000, ver 189 at 0007c528
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 741376
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb6000-0xb7000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 190, 0xb6000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07bb8c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb4000-0xb5000, ver 188 at 0007bb8c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 737280
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb5000-0xb6000 (data)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0829a4(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 189, 0xb5000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07b240(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb3000-0xb4000, ver 187 at 0007b240
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 733184
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb4000-0xb5000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 188, 0xb4000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x07a994(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb2000-0xb3000, ver 186 at 0007a994
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 729088
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb3000-0xb4000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 187, 0xb3000-0x1000
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "nsswitch.conf", ino #107
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x079c94(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb1000-0xb2000, ver 185 at 00079c94
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 724992
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb2000-0xb3000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 186, 0xb2000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x079308(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb0000-0xb1000, ver 184 at 00079308
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 720896
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x082930(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb1000-0xb2000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 185, 0xb1000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x078898(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xaf000-0xb0000, ver 183 at 00078898
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 716800
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb0000-0xb1000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 184, 0xb0000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x077fd8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xae105-0xaf000, ver 182 at 00077fd8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 712965
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "network", ino #106
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xaf000-0xb0000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 183, 0xaf000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x077ebc(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xae000-0xae105, ver 181 at 00077ebc
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 712704
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xae105-0xaf000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 182, 0xae105-0xefb
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x077520(0).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0828b4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xad000-0xae000, ver 180 at 00077520
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 708608
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xae000-0xae105 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 181, 0xae000-0x105
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x076c8c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xac000-0xad000, ver 179 at 00076c8c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 704512
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xad000-0xae000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 180, 0xad000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x076310(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mtab", ino #105
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xab000-0xac000, ver 178 at 00076310
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 700416
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xac000-0xad000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 179, 0xac000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0759b4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xaa000-0xab000, ver 177 at 000759b4
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0826d8(0).
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 696320
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xab000-0xac000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 178, 0xab000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0750e0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa9000-0xaa000, ver 176 at 000750e0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 692224
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xaa000-0xab000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 177, 0xaa000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x074754(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa8000-0xa9000, ver 175 at 00074754
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 688128
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa9000-0xaa000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 176, 0xa9000-0x1000
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mdev.conf", ino #104
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x073e94(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa7000-0xa8000, ver 174 at 00073e94
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 684032
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa8000-0xa9000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 175, 0xa8000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0735f4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa6000-0xa7000, ver 173 at 000735f4
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x082660(0).
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 679936
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa7000-0xa8000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 174, 0xa7000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x072cc0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa5000-0xa6000, ver 172 at 00072cc0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 675840
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa6000-0xa7000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 173, 0xa6000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0723e4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa4000-0xa5000, ver 171 at 000723e4
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ld.so.conf.d", ino #103
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 671744
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa5000-0xa6000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 172, 0xa5000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x071bac(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa3000-0xa4000, ver 170 at 00071bac
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 667648
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa4000-0xa5000 (data)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0825e8(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 171, 0xa4000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x071164(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa2000-0xa3000, ver 169 at 00071164
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 663552
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa3000-0xa4000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 170, 0xa3000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0708d0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa1000-0xa2000, ver 168 at 000708d0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 659456
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa2000-0xa3000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 169, 0xa2000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x070000(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ld.so.conf", ino #102
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa0000-0xa1000, ver 167 at 00070000
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 655360
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa1000-0xa2000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 168, 0xa1000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06e5e4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x9f000-0xa0000, ver 166 at 0006e5e4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 651264
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x08253c(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa0000-0xa1000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 167, 0xa0000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06dd44(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x9e000-0x9f000, ver 165 at 0006dd44
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 647168
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x9f000-0xa0000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 166, 0x9f000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06d4e0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x9d000-0x9e000, ver 164 at 0006d4e0
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ld.so.cache", ino #101
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 643072
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x9e000-0x9f000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 165, 0x9e000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06cc68(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x9c000-0x9d000, ver 163 at 0006cc68
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 638976
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x9d000-0x9e000 (data)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0824b0(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 164, 0x9d000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06c50c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x9b000-0x9c000, ver 162 at 0006c50c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 634880
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x9c000-0x9d000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 163, 0x9c000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06bce0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x9a000-0x9b000, ver 161 at 0006bce0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 630784
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x9b000-0x9c000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 162, 0x9b000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06b458(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "issue", ino #100
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x99000-0x9a000, ver 160 at 0006b458
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 626688
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x9a000-0x9b000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 161, 0x9a000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06abd0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x98000-0x99000, ver 159 at 0006abd0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 622592
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x082210(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x99000-0x9a000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 160, 0x99000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06a310(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x97000-0x98000, ver 158 at 0006a310
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 618496
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x98000-0x99000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 159, 0x98000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x069ae4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x96000-0x97000, ver 157 at 00069ae4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 614400
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "inputrc", ino #99
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x97000-0x98000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 158, 0x97000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x069164(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x95000-0x96000, ver 156 at 00069164
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 610304
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x96000-0x97000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 157, 0x96000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0689f0(0).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081f54(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x94000-0x95000, ver 155 at 000689f0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 606208
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x95000-0x96000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 156, 0x95000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x067f70(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x93000-0x94000, ver 154 at 00067f70
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 602112
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x94000-0x95000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 155, 0x94000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x067648(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "inittab", ino #98
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x92000-0x93000, ver 153 at 00067648
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 598016
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x93000-0x94000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 154, 0x93000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x066dac(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x9140a-0x92000, ver 152 at 00066dac
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 594954
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081ee0(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x92000-0x93000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 153, 0x92000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x066a98(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x91000-0x9140a, ver 151 at 00066a98
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 593920
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x9140a-0x92000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 152, 0x9140a-0xbf6
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x066054(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x90000-0x91000, ver 150 at 00066054
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 589824
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "init.d", ino #97
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x91000-0x9140a (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 151, 0x91000-0x40a
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x065508(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x8f000-0x90000, ver 149 at 00065508
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 585728
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x90000-0x91000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 150, 0x90000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0649c4(0).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081e44(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x8e000-0x8f000, ver 148 at 000649c4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 581632
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x8f000-0x90000 (data)
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "hosts", ino #96
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 149, 0x8f000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x063ee8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x8d000-0x8e000, ver 147 at 00063ee8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 577536
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x8e000-0x8f000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 148, 0x8e000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x06343c(0).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081dc4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x8c000-0x8d000, ver 146 at 0006343c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 573440
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x8d000-0x8e000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 147, 0x8d000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x062a3c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x8b000-0x8c000, ver 145 at 00062a3c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 569344
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x8c000-0x8d000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 146, 0x8c000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x061fc4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "hostname", ino #95
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x8a000-0x8b000, ver 144 at 00061fc4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 565248
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x8b000-0x8c000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 145, 0x8b000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x061568(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x89000-0x8a000, ver 143 at 00061568
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 561152
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081c6c(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x8a000-0x8b000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 144, 0x8a000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x060ab8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x88000-0x89000, ver 142 at 00060ab8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 557056
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x89000-0x8a000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 143, 0x89000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x060000(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x87000-0x88000, ver 141 at 00060000
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 552960
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "group", ino #94
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x88000-0x89000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 142, 0x88000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x05e138(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x86000-0x87000, ver 140 at 0005e138
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 548864
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x87000-0x88000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 141, 0x87000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x05d730(0).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081b0c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x85000-0x86000, ver 139 at 0005d730
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 544768
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x86000-0x87000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 140, 0x86000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x05cc8c(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "fstab", ino #93
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x84000-0x85000, ver 138 at 0005cc8c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 540672
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x85000-0x86000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 139, 0x85000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x05c1a0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x83000-0x84000, ver 137 at 0005c1a0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x081a98(0).
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 536576
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x84000-0x85000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 138, 0x84000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x05b738(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x82000-0x83000, ver 136 at 0005b738
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "firmware", ino #92
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 532480
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x83000-0x84000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 137, 0x83000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x05ac90(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x81000-0x82000, ver 135 at 0005ac90
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 528384
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x82000-0x83000 (data)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x00010c(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 136, 0x82000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x05a2c8(0).
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x80000-0x81000, ver 134 at 0005a2c8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 524288
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x81000-0x82000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 135, 0x81000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x05983c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x7f000-0x80000, ver 133 at 0005983c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 520192
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x80000-0x81000 (data)
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 134, 0x80000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x058d7c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x7e000-0x7f000, ver 132 at 00058d7c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 516096
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x7f000-0x80000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 133, 0x7f000-0x1000
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 0000010c
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x058300(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x7d000-0x7e000, ver 131 at 00058300
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 512000
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x7e000-0x7f000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 132, 0x7e000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0578a4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x7c000-0x7d000, ver 130 at 000578a4
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #4 were read, the highest version is 115, latest_mctime 1385527995, mctime_ver 115.
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 507904
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x7d000-0x7e000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 131, 0x7d000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x056dbc(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x7b000-0x7c000, ver 129 at 00056dbc
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 503808
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x7c000-0x7d000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 130, 0x7c000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x056298(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x7a000-0x7b000, ver 128 at 00056298
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 499712
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x7b000-0x7c000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 129, 0x7b000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x055990(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x793b4-0x7a000, ver 127 at 00055990
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 496564
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x7a000-0x7b000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 128, 0x7a000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x055678(0).
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e70fa0
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x79000-0x793b4, ver 126 at 00055678
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 495616
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x793b4-0x7a000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 127, 0x793b4-0xc4c
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x054b44(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x78000-0x79000, ver 125 at 00054b44
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 491520
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x79000-0x793b4 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 126, 0x79000-0x3b4
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x054110(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x77000-0x78000, ver 124 at 00054110
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 487424
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x78000-0x79000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 125, 0x78000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x053618(0).
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #5 pino/nlink is 1
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x76000-0x77000, ver 123 at 00053618
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 483328
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x77000-0x78000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 124, 0x77000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x052b58(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x75000-0x76000, ver 122 at 00052b58
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #5
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 479232
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x76000-0x77000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 123, 0x76000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0520a8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x74000-0x75000, ver 121 at 000520a8
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0acf2c(0).
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 475136
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x75000-0x76000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 122, 0x75000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x051618(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x73000-0x74000, ver 120 at 00051618
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 471040
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x74000-0x75000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 121, 0x74000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x050af4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x72000-0x73000, ver 119 at 00050af4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 466944
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x73000-0x74000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 120, 0x73000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x050000(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ftp", ino #133
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x71000-0x72000, ver 118 at 00050000
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 462848
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x72000-0x73000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 119, 0x72000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x04e268(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x70000-0x71000, ver 117 at 0004e268
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0aceb8(0).
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 458752
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x71000-0x72000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 118, 0x71000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x04d7c8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x6f000-0x70000, ver 116 at 0004d7c8
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "default", ino #132
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 454656
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x70000-0x71000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 117, 0x70000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x04cd58(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x6e000-0x6f000, ver 115 at 0004cd58
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 450560
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x6f000-0x70000 (data)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x00017c(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 116, 0x6f000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x04c340(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x6d000-0x6e000, ver 114 at 0004c340
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 446464
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x6e000-0x6f000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 115, 0x6e000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x04b894(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x6c000-0x6d000, ver 113 at 0004b894
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 442368
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x6d000-0x6e000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 114, 0x6d000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x04ae44(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x6b000-0x6c000, ver 112 at 0004ae44
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 438272
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x6c000-0x6d000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 113, 0x6c000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x04a384(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x6a000-0x6b000, ver 111 at 0004a384
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 0000017c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 434176
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x6b000-0x6c000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 112, 0x6b000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0498f8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x69000-0x6a000, ver 110 at 000498f8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 430080
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x6a000-0x6b000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 111, 0x6a000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x048f28(0).
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x68000-0x69000, ver 109 at 00048f28
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 425984
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x69000-0x6a000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 110, 0x69000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x048470(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #5 were read, the highest version is 131, latest_mctime 1383875710, mctime_ver 131.
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x67000-0x68000, ver 108 at 00048470
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 421888
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x68000-0x69000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 109, 0x68000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x047934(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x66000-0x67000, ver 107 at 00047934
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 417792
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x67000-0x68000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 108, 0x67000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x046e10(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x65000-0x66000, ver 106 at 00046e10
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 413696
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x66000-0x67000 (data)
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e70ba0
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 107, 0x66000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0463a4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x64000-0x65000, ver 105 at 000463a4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 409600
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x65000-0x66000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 106, 0x65000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x045970(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x63000-0x64000, ver 104 at 00045970
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 405504
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x64000-0x65000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 105, 0x64000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x044eb8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x62000-0x63000, ver 103 at 00044eb8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 401408
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x63000-0x64000 (data)
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #6 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 104, 0x63000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x044680(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x61478-0x62000, ver 102 at 00044680
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 398456
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x62000-0x63000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 103, 0x62000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0442b8(0).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #6
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0ad020(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x61000-0x61478, ver 101 at 000442b8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 397312
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x61478-0x62000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 102, 0x61478-0xb88
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x04383c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x60000-0x61000, ver 100 at 0004383c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 393216
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x61000-0x61478 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 101, 0x61000-0x478
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x042c80(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x5f000-0x60000, ver 99 at 00042c80
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 389120
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x60000-0x61000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 100, 0x60000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0421b0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mt5931_loader.ko", ino #135
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x5e000-0x5f000, ver 98 at 000421b0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 385024
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x5f000-0x60000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 99, 0x5f000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0416e4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x5d000-0x5e000, ver 97 at 000416e4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 380928
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x5e000-0x5f000 (data)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0acf9c(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 98, 0x5e000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x040bb0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x5c000-0x5d000, ver 96 at 00040bb0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 376832
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x5d000-0x5e000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 97, 0x5d000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x040000(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x5b000-0x5c000, ver 95 at 00040000
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 372736
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x5c000-0x5d000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 96, 0x5c000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x03e764(0).
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "firmware", ino #134
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x5a000-0x5b000, ver 94 at 0003e764
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 368640
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x5b000-0x5c000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 95, 0x5b000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x03dcdc(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x59000-0x5a000, ver 93 at 0003dcdc
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 364544
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0001ec(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x5a000-0x5b000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 94, 0x5a000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x03d1e0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x58000-0x59000, ver 92 at 0003d1e0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 360448
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x59000-0x5a000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 93, 0x59000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x03c744(0).
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x57000-0x58000, ver 91 at 0003c744
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 356352
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x58000-0x59000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 92, 0x58000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x03bd7c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x56000-0x57000, ver 90 at 0003bd7c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 352256
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x57000-0x58000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 91, 0x57000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x03b2c8(0).
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 000001ec
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x55000-0x56000, ver 89 at 0003b2c8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 348160
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x56000-0x57000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 90, 0x56000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x03a7b8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x54000-0x55000, ver 88 at 0003a7b8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 344064
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x55000-0x56000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 89, 0x55000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x039cd8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x53000-0x54000, ver 87 at 00039cd8
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 339968
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x54000-0x55000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 88, 0x54000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0391fc(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x52000-0x53000, ver 86 at 000391fc
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 335872
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x53000-0x54000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 87, 0x53000-0x1000
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #6 were read, the highest version is 133, latest_mctime 1385712857, mctime_ver 133.
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x038768(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x51000-0x52000, ver 85 at 00038768
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 331776
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x52000-0x53000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 86, 0x52000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x037d10(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x50000-0x51000, ver 84 at 00037d10
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 327680
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x51000-0x52000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 85, 0x51000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x037348(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e708c0
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x4f000-0x50000, ver 83 at 00037348
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 323584
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x50000-0x51000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 84, 0x50000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0368e0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x4e000-0x4f000, ver 82 at 000368e0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 319488
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x4f000-0x50000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 83, 0x4f000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x035f80(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x4d000-0x4e000, ver 81 at 00035f80
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 315392
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x4e000-0x4f000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 82, 0x4e000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x035584(0).
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #7 pino/nlink is 1
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x4c000-0x4d000, ver 80 at 00035584
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 311296
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x4d000-0x4e000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 81, 0x4d000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x034a54(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x4b000-0x4c000, ver 79 at 00034a54
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #7
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x000260(0).
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 307200
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x4c000-0x4d000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 80, 0x4c000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x033fac(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x4a000-0x4b000, ver 78 at 00033fac
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 303104
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x4b000-0x4c000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 79, 0x4b000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x033804(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x494cc-0x4a000, ver 77 at 00033804
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 300236
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x4a000-0x4b000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 78, 0x4a000-0x1000
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x033440(0).
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x03, ver 1 at 00000260
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x49000-0x494cc, ver 76 at 00033440
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 299008
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x494cc-0x4a000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 77, 0x494cc-0xb34
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x032924(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x48000-0x49000, ver 75 at 00032924
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 294912
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x49000-0x494cc (data)
[JFFS2 DBG] (38) jffs2_lookup_tn: root 01e5dd5c, offset 0
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 76, 0x49000-0x4cc
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x031de4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x47000-0x48000, ver 74 at 00031de4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 290816
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x48000-0x49000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 75, 0x48000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x03139c(0).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #7 were read, the highest version is 1, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x46000-0x47000, ver 73 at 0003139c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 286720
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x47000-0x48000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 74, 0x47000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x030a4c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x45000-0x46000, ver 72 at 00030a4c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 282624
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x46000-0x47000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 73, 0x46000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x030000(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: tn 01e709a0 ver 1 range 0x0-0x3 ov 0
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x44000-0x45000, ver 71 at 00030000
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 278528
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x45000-0x46000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 72, 0x45000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x02e1a4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x43000-0x44000, ver 70 at 0002e1a4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 274432
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x44000-0x45000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 71, 0x44000-0x1000
[JFFS2 DBG] (38) ver_insert: Link new node at 01e5dd84 (root is 01e5dd84)
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x02d730(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x42000-0x43000, ver 69 at 0002d730
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 270336
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x43000-0x44000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 70, 0x43000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x02cc4c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) check_tn_node: check node 0x00-0x03, phys offs 0x000260
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x41000-0x42000, ver 68 at 0002cc4c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 266240
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x42000-0x43000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 69, 0x42000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x02c18c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x40000-0x41000, ver 67 at 0002c18c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 262144
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x41000-0x42000 (data)
[JFFS2 DBG] (38) check_node_data: check node at 0x000260, data length 3, partial CRC 0x000000, correct CRC 0x564ee2de, data starts at 0x0002a1, start checking from 0x0002a4 - 3 bytes.
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 68, 0x41000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x02b6cc(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x3f000-0x40000, ver 66 at 0002b6cc
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 258048
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x40000-0x41000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 67, 0x40000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x02ab90(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x3e000-0x3f000, ver 65 at 0002ab90
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 253952
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x3f000-0x40000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 66, 0x3f000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x02a0c0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x3d000-0x3e000, ver 64 at 0002a0c0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 249856
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x3e000-0x3f000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 65, 0x3e000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x029580(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: Add 01e709a0 (v 1, 0x0-0x3, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x3c000-0x3d000, ver 63 at 00029580
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 245760
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x3d000-0x3e000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 64, 0x3d000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x028ae8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x3b000-0x3c000, ver 62 at 00028ae8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 241664
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x3c000-0x3d000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 63, 0x3c000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0280ac(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x3a000-0x3b000, ver 61 at 000280ac
[JFFS2 DBG] (38) jffs2_add_full_dnode_to_inode: adding node 0x00-0x03 @0x00000260 on flash, newfrag *01e73e40
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 237568
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x3b000-0x3c000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 62, 0x3b000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0275a4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x39000-0x3a000, ver 60 at 000275a4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 233472
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x3a000-0x3b000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 61, 0x3a000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x026b30(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x38000-0x39000, ver 59 at 00026b30
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 229376
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x39000-0x3a000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 60, 0x39000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x026094(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x37000-0x38000, ver 58 at 00026094
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 225280
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x38000-0x39000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 59, 0x38000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0256a0(0).
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #8 pino/nlink is 1
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x36000-0x37000, ver 57 at 000256a0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 221184
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x37000-0x38000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 58, 0x37000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x024b3c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x35000-0x36000, ver 56 at 00024b3c
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 217088
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x36000-0x37000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 57, 0x36000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x024090(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x34000-0x35000, ver 55 at 00024090
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0002d8(0).
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 212992
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x35000-0x36000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 56, 0x35000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0235c4(0).
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x33000-0x34000, ver 54 at 000235c4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 208896
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x34000-0x35000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 55, 0x34000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x022b14(0).
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x0b, ver 1 at 000002d8
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x32000-0x33000, ver 53 at 00022b14
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 204800
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x33000-0x34000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 54, 0x33000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x022398(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x31537-0x32000, ver 52 at 00022398
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 202039
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x32000-0x33000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 53, 0x32000-0x1000
[JFFS2 DBG] (38) jffs2_lookup_tn: root 01e5dd5c, offset 0
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x021f7c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x31000-0x31537, ver 51 at 00021f7c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 200704
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x31537-0x32000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 52, 0x31537-0xac9
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0214a0(0).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #8 were read, the highest version is 1, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x30000-0x31000, ver 50 at 000214a0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 196608
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x31000-0x31537 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 51, 0x31000-0x537
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x020aec(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x2f000-0x30000, ver 49 at 00020aec
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 192512
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x30000-0x31000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 50, 0x30000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x020000(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x2e000-0x2f000, ver 48 at 00020000
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 188416
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: tn 01e703a0 ver 1 range 0x0-0xb ov 0
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x2f000-0x30000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 49, 0x2f000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x01e368(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x2d000-0x2e000, ver 47 at 0001e368
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 184320
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x2e000-0x2f000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 48, 0x2e000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x01d8f8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x2c000-0x2d000, ver 46 at 0001d8f8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 180224
[JFFS2 DBG] (38) ver_insert: Link new node at 01e5dd84 (root is 01e5dd84)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x2d000-0x2e000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 47, 0x2d000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x01ce08(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x2b000-0x2c000, ver 45 at 0001ce08
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 176128
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x2c000-0x2d000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 46, 0x2c000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x01c2c8(0).
[JFFS2 DBG] (38) check_tn_node: check node 0x00-0x0b, phys offs 0x0002d8
[JFFS2 DBG] (38) check_node_data: check node at 0x0002d8, data length 11, partial CRC 0x000000, correct CRC 0x89d60f10, data starts at 0x000311, start checking from 0x00031c - 11 bytes.
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x2a000-0x2b000, ver 44 at 0001c2c8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 172032
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x2b000-0x2c000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 45, 0x2b000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x01b92c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x29000-0x2a000, ver 43 at 0001b92c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 167936
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x2a000-0x2b000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 44, 0x2a000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x01aff0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x28000-0x29000, ver 42 at 0001aff0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 163840
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x29000-0x2a000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 43, 0x29000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x01a54c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x27000-0x28000, ver 41 at 0001a54c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 159744
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x28000-0x29000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 42, 0x28000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x019a30(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x26000-0x27000, ver 40 at 00019a30
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 155648
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x27000-0x28000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 41, 0x27000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x018f94(0).
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: Add 01e703a0 (v 1, 0x0-0xb, ov 0) to fragtree
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x25000-0x26000, ver 39 at 00018f94
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 151552
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x26000-0x27000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 40, 0x26000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x018468(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x24000-0x25000, ver 38 at 00018468
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 147456
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x25000-0x26000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 39, 0x25000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0179cc(0).
[JFFS2 DBG] (38) jffs2_add_full_dnode_to_inode: adding node 0x00-0x0b @0x000002d8 on flash, newfrag *01e73e40
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x23000-0x24000, ver 37 at 000179cc
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 143360
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x24000-0x25000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 38, 0x24000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x016ef4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x22000-0x23000, ver 36 at 00016ef4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 139264
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x23000-0x24000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 37, 0x23000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x016604(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x21000-0x22000, ver 35 at 00016604
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 135168
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x22000-0x23000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 36, 0x22000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x015d04(0).
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #9 pino/nlink is 1
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x20000-0x21000, ver 34 at 00015d04
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 131072
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x21000-0x22000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 35, 0x21000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x01529c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x1f000-0x20000, ver 33 at 0001529c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 126976
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x20000-0x21000 (data)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #9
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 34, 0x20000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0147f0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x1e000-0x1f000, ver 32 at 000147f0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 122880
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x1f000-0x20000 (data)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x000358(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 33, 0x1f000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x013ee0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x1d000-0x1e000, ver 31 at 00013ee0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 118784
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x1e000-0x1f000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 32, 0x1e000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0133c4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x1c000-0x1d000, ver 30 at 000133c4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 114688
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x1d000-0x1e000 (data)
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 31, 0x1d000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0128dc(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x1b000-0x1c000, ver 29 at 000128dc
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 110592
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x1c000-0x1d000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 30, 0x1c000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x011e6c(0).
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x1a000-0x1b000, ver 28 at 00011e6c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 106496
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x1b000-0x1c000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 29, 0x1b000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x011470(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 00000358
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x19000-0x1a000, ver 27 at 00011470
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 102400
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x1a000-0x1b000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 28, 0x1a000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0111fc(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x18cc0-0x19000, ver 26 at 000111fc
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 101568
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x19000-0x1a000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 27, 0x19000-0x1000
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0109e8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x18000-0x18cc0, ver 25 at 000109e8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 98304
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x18cc0-0x19000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 26, 0x18cc0-0x340
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x010000(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #9 were read, the highest version is 1, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x17000-0x18000, ver 24 at 00010000
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 94208
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x18000-0x18cc0 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 25, 0x18000-0xcc0
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00e32c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x16000-0x17000, ver 23 at 0000e32c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 90112
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x17000-0x18000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 24, 0x17000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00d95c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x15000-0x16000, ver 22 at 0000d95c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 86016
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x16000-0x17000 (data)
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e703c0
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 23, 0x16000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00d0f0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x14000-0x15000, ver 21 at 0000d0f0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 81920
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x15000-0x16000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 22, 0x15000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00c5e8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x13000-0x14000, ver 20 at 0000c5e8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 77824
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x14000-0x15000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 21, 0x14000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00bb00(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x12000-0x13000, ver 19 at 0000bb00
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 73728
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x13000-0x14000 (data)
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #10 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 20, 0x13000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00b070(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x11000-0x12000, ver 18 at 0000b070
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 69632
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x12000-0x13000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 19, 0x12000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00a5ec(0).
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #10
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0003c8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x10000-0x11000, ver 17 at 0000a5ec
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 65536
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x11000-0x12000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 18, 0x11000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x009bd4(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xf000-0x10000, ver 16 at 00009bd4
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 61440
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x10000-0x11000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 17, 0x10000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00914c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xe000-0xf000, ver 15 at 0000914c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 57344
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xf000-0x10000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 16, 0xf000-0x1000
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x008690(0).
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xd000-0xe000, ver 14 at 00008690
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 53248
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xe000-0xf000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 15, 0xe000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x007b88(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xc000-0xd000, ver 13 at 00007b88
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 000003c8
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 49152
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xd000-0xe000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 14, 0xd000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0072f0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xb000-0xc000, ver 12 at 000072f0
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 45056
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xc000-0xd000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 13, 0xc000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x006884(0).
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0xa000-0xb000, ver 11 at 00006884
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 40960
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xb000-0xc000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 12, 0xb000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x005df0(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x9000-0xa000, ver 10 at 00005df0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #10 were read, the highest version is 1, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 36864
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0xa000-0xb000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 11, 0xa000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x005360(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x8000-0x9000, ver 9 at 00005360
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 32768
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x9000-0xa000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 10, 0x9000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x0048fc(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x7000-0x8000, ver 8 at 000048fc
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 28672
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x8000-0x9000 (data)
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e743a0
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 9, 0x8000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x003e58(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x6000-0x7000, ver 7 at 00003e58
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 24576
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x7000-0x8000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 8, 0x7000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x003494(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x5000-0x6000, ver 6 at 00003494
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 20480
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x6000-0x7000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 7, 0x6000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x002d20(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x4000-0x5000, ver 5 at 00002d20
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 16384
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x5000-0x6000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 6, 0x5000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00269c(0).
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #11 pino/nlink is 1
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x3000-0x4000, ver 4 at 0000269c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 12288
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x4000-0x5000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 5, 0x4000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x001cb8(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x2000-0x3000, ver 3 at 00001cb8
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #11
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 8192
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x3000-0x4000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 4, 0x3000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x00124c(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x1000-0x2000, ver 2 at 0000124c
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 4096
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x2000-0x3000 (data)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x000438(0).
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 3, 0x2000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 0x000830(0).
[JFFS2 DBG] (1) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: insert fragment 0x00-0x1000, ver 1 at 00000830
[JFFS2 DBG] (1) jffs2_lookup_tn: root 01c35c74, offset 0
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: 'this' found 0x1000-0x2000 (data)
[JFFS2 DBG] (1) jffs2_add_tn_to_tree: Ponder this ver 2, 0x1000-0x1000
[JFFS2 DBG] (1) jffs2_get_inode_nodes: nodes of inode #20 were read, the highest version is 193, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e74fc0 ver 193 range 0xb9000-0xb9dc4 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e74fe0 ver 192 range 0xb8000-0xb9000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39880 ver 191 range 0xb7000-0xb8000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e398a0 ver 190 range 0xb6000-0xb7000 ov 0
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39b80 ver 189 range 0xb5000-0xb6000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39f00 ver 188 range 0xb4000-0xb5000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39ec0 ver 187 range 0xb3000-0xb4000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39ce0 ver 186 range 0xb2000-0xb3000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39fa0 ver 185 range 0xb1000-0xb2000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39f80 ver 184 range 0xb0000-0xb1000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39e80 ver 183 range 0xaf000-0xb0000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39ea0 ver 182 range 0xae105-0xaf000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39e60 ver 181 range 0xae000-0xae105 ov 0
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 00000438
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39e40 ver 180 range 0xad000-0xae000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39e00 ver 179 range 0xac000-0xad000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39d20 ver 178 range 0xab000-0xac000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39d00 ver 177 range 0xaa000-0xab000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39f60 ver 176 range 0xa9000-0xaa000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39f40 ver 175 range 0xa8000-0xa9000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39f20 ver 174 range 0xa7000-0xa8000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39ee0 ver 173 range 0xa6000-0xa7000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39e20 ver 172 range 0xa5000-0xa6000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39d80 ver 171 range 0xa4000-0xa5000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39da0 ver 170 range 0xa3000-0xa4000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39cc0 ver 169 range 0xa2000-0xa3000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39ca0 ver 168 range 0xa1000-0xa2000 ov 0
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39fc0 ver 167 range 0xa0000-0xa1000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39de0 ver 166 range 0x9f000-0xa0000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39d60 ver 165 range 0x9e000-0x9f000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39dc0 ver 164 range 0x9d000-0x9e000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e399e0 ver 163 range 0x9c000-0x9d000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39a00 ver 162 range 0x9b000-0x9c000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e399c0 ver 161 range 0x9a000-0x9b000 ov 0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #11 were read, the highest version is 1, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39ae0 ver 160 range 0x99000-0x9a000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39a60 ver 159 range 0x98000-0x99000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39980 ver 158 range 0x97000-0x98000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39b60 ver 157 range 0x96000-0x97000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39b00 ver 156 range 0x95000-0x96000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39b20 ver 155 range 0x94000-0x95000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39ac0 ver 154 range 0x93000-0x94000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39a20 ver 153 range 0x92000-0x93000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e399a0 ver 152 range 0x9140a-0x92000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39960 ver 151 range 0x91000-0x9140a ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39920 ver 150 range 0x90000-0x91000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39900 ver 149 range 0x8f000-0x90000 ov 0
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e77180
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70640 ver 148 range 0x8e000-0x8f000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70620 ver 147 range 0x8d000-0x8e000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70600 ver 146 range 0x8c000-0x8d000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70c20 ver 145 range 0x8b000-0x8c000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70fe0 ver 144 range 0x8a000-0x8b000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70ee0 ver 143 range 0x89000-0x8a000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70f80 ver 142 range 0x88000-0x89000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70ec0 ver 141 range 0x87000-0x88000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70e80 ver 140 range 0x86000-0x87000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70e60 ver 139 range 0x85000-0x86000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70c40 ver 138 range 0x84000-0x85000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70ca0 ver 137 range 0x83000-0x84000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70cc0 ver 136 range 0x82000-0x83000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70d80 ver 135 range 0x81000-0x82000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70d00 ver 134 range 0x80000-0x81000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70fc0 ver 133 range 0x7f000-0x80000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70f60 ver 132 range 0x7e000-0x7f000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70ea0 ver 131 range 0x7d000-0x7e000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70e40 ver 130 range 0x7c000-0x7d000 ov 0
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #12 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70e20 ver 129 range 0x7b000-0x7c000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70de0 ver 128 range 0x7a000-0x7b000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70e00 ver 127 range 0x793b4-0x7a000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70d60 ver 126 range 0x79000-0x793b4 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70c80 ver 125 range 0x78000-0x79000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70660 ver 124 range 0x77000-0x78000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70f20 ver 123 range 0x76000-0x77000 ov 0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #12
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70f40 ver 122 range 0x75000-0x76000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70fa0 ver 121 range 0x74000-0x75000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70c60 ver 120 range 0x73000-0x74000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70d20 ver 119 range 0x72000-0x73000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70ce0 ver 118 range 0x71000-0x72000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70c00 ver 117 range 0x70000-0x71000 ov 0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0004a8(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70da0 ver 116 range 0x6f000-0x70000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70d40 ver 115 range 0x6e000-0x6f000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70be0 ver 114 range 0x6d000-0x6e000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70bc0 ver 113 range 0x6c000-0x6d000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70b80 ver 112 range 0x6b000-0x6c000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70b40 ver 111 range 0x6a000-0x6b000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70b60 ver 110 range 0x69000-0x6a000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70b20 ver 109 range 0x68000-0x69000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70b00 ver 108 range 0x67000-0x68000 ov 0
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70a80 ver 107 range 0x66000-0x67000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70ac0 ver 106 range 0x65000-0x66000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70a00 ver 105 range 0x64000-0x65000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70ba0 ver 104 range 0x63000-0x64000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70f00 ver 103 range 0x62000-0x63000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70dc0 ver 102 range 0x61478-0x62000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e709e0 ver 101 range 0x61000-0x61478 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e709c0 ver 100 range 0x60000-0x61000 ov 0
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70900 ver 99 range 0x5f000-0x60000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e708e0 ver 98 range 0x5e000-0x5f000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e708a0 ver 97 range 0x5d000-0x5e000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70860 ver 96 range 0x5c000-0x5d000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70840 ver 95 range 0x5b000-0x5c000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70800 ver 94 range 0x5a000-0x5b000 ov 0
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 000004a8
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e707a0 ver 93 range 0x59000-0x5a000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70760 ver 92 range 0x58000-0x59000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e706e0 ver 91 range 0x57000-0x58000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70960 ver 90 range 0x56000-0x57000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70880 ver 89 range 0x55000-0x56000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70780 ver 88 range 0x54000-0x55000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70ae0 ver 87 range 0x53000-0x54000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70aa0 ver 86 range 0x52000-0x53000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70a60 ver 85 range 0x51000-0x52000 ov 0
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70a40 ver 84 range 0x50000-0x51000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70a20 ver 83 range 0x4f000-0x50000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70980 ver 82 range 0x4e000-0x4f000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e708c0 ver 81 range 0x4d000-0x4e000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70940 ver 80 range 0x4c000-0x4d000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70920 ver 79 range 0x4b000-0x4c000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70720 ver 78 range 0x4a000-0x4b000 ov 0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #12 were read, the highest version is 1, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e706c0 ver 77 range 0x494cc-0x4a000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e707e0 ver 76 range 0x49000-0x494cc ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e707c0 ver 75 range 0x48000-0x49000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70740 ver 74 range 0x47000-0x48000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70700 ver 73 range 0x46000-0x47000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70820 ver 72 range 0x45000-0x46000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70680 ver 71 range 0x44000-0x45000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e706a0 ver 70 range 0x43000-0x44000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e705c0 ver 69 range 0x42000-0x43000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e705e0 ver 68 range 0x41000-0x42000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e705a0 ver 67 range 0x40000-0x41000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e704e0 ver 66 range 0x3f000-0x40000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70580 ver 65 range 0x3e000-0x3f000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70520 ver 64 range 0x3d000-0x3e000 ov 0
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e77180
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70500 ver 63 range 0x3c000-0x3d000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70540 ver 62 range 0x3b000-0x3c000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e704c0 ver 61 range 0x3a000-0x3b000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e704a0 ver 60 range 0x39000-0x3a000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70480 ver 59 range 0x38000-0x39000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e709a0 ver 58 range 0x37000-0x38000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70560 ver 57 range 0x36000-0x37000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70420 ver 56 range 0x35000-0x36000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70460 ver 55 range 0x34000-0x35000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70440 ver 54 range 0x33000-0x34000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70360 ver 53 range 0x32000-0x33000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70080 ver 52 range 0x31537-0x32000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70020 ver 51 range 0x31000-0x31537 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70120 ver 50 range 0x30000-0x31000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70240 ver 49 range 0x2f000-0x30000 ov 0
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #13 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e703e0 ver 48 range 0x2e000-0x2f000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70380 ver 47 range 0x2d000-0x2e000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70320 ver 46 range 0x2c000-0x2d000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70280 ver 45 range 0x2b000-0x2c000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70200 ver 44 range 0x2a000-0x2b000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70160 ver 43 range 0x29000-0x2a000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e700c0 ver 42 range 0x28000-0x29000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70060 ver 41 range 0x27000-0x28000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70040 ver 40 range 0x26000-0x27000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70400 ver 39 range 0x25000-0x26000 ov 0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #13
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b15e8(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70340 ver 38 range 0x24000-0x25000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e702e0 ver 37 range 0x23000-0x24000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e702a0 ver 36 range 0x22000-0x23000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e703a0 ver 35 range 0x21000-0x22000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70180 ver 34 range 0x20000-0x21000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70140 ver 33 range 0x1f000-0x20000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e700a0 ver 32 range 0x1e000-0x1f000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70300 ver 31 range 0x1d000-0x1e000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70220 ver 30 range 0x1c000-0x1d000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e701c0 ver 29 range 0x1b000-0x1c000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e702c0 ver 28 range 0x1a000-0x1b000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70260 ver 27 range 0x19000-0x1a000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e701e0 ver 26 range 0x18cc0-0x19000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e701a0 ver 25 range 0x18000-0x18cc0 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70100 ver 24 range 0x17000-0x18000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e700e0 ver 23 range 0x16000-0x17000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e70000 ver 22 range 0x15000-0x16000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39940 ver 21 range 0x14000-0x15000 ov 0
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent ".bash_profile", ino #138
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39fe0 ver 20 range 0x13000-0x14000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39b40 ver 19 range 0x12000-0x13000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39a40 ver 18 range 0x11000-0x12000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39aa0 ver 17 range 0x10000-0x11000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e39d40 ver 16 range 0xf000-0x10000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e74f80 ver 15 range 0xe000-0xf000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e74fa0 ver 14 range 0xd000-0xe000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e703c0 ver 13 range 0xc000-0xd000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e77000 ver 12 range 0xb000-0xc000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e77020 ver 11 range 0xa000-0xb000 ov 0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b14d8(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e77040 ver 10 range 0x9000-0xa000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e77060 ver 9 range 0x8000-0x9000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e77080 ver 8 range 0x7000-0x8000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e770a0 ver 7 range 0x6000-0x7000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e770c0 ver 6 range 0x5000-0x6000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e770e0 ver 5 range 0x4000-0x5000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e77100 ver 4 range 0x3000-0x4000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e77120 ver 3 range 0x2000-0x3000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e77140 ver 2 range 0x1000-0x2000 ov 0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: tn 01e77160 ver 1 range 0x0-0x1000 ov 0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb9000-0xb9dc4, phys offs 0x07ebc4
[JFFS2 DBG] (1) check_node_data: check node at 0x07ebc4, data length 1899, partial CRC 0x000000, correct CRC 0xd3f7fe37, data starts at 0x07e49d, start checking from 0x07ec08 - 1899 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent ".bash_logout", ino #137
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e74fc0 (v 193, 0xb9000-0xb9dc4, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb9000-0xb9dc4 @0x0007ebc4 on flash, newfrag *01e73e40
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb8000-0xb9000, phys offs 0x07e220
[JFFS2 DBG] (1) check_node_data: check node at 0x07e220, data length 2399, partial CRC 0x000000, correct CRC 0xa55ab612, data starts at 0x07d905, start checking from 0x07e264 - 2399 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b145c(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e74fe0 (v 192, 0xb8000-0xb9000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb8000-0xb9000 @0x0007e220 on flash, newfrag *01e73e70
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb7000-0xb8000, phys offs 0x07d8a8
[JFFS2 DBG] (1) check_node_data: check node at 0x07d8a8, data length 2355, partial CRC 0x000000, correct CRC 0x1a09d851, data starts at 0x07cfb9, start checking from 0x07d8ec - 2355 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39880 (v 191, 0xb7000-0xb8000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb7000-0xb8000 @0x0007d8a8 on flash, newfrag *01e73e88
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent ".bash_history", ino #136
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb6000-0xb7000, phys offs 0x07cee8
[JFFS2 DBG] (1) check_node_data: check node at 0x07cee8, data length 2425, partial CRC 0x000000, correct CRC 0xc67d9072, data starts at 0x07c5b3, start checking from 0x07cf2c - 2425 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e398a0 (v 190, 0xb6000-0xb7000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb6000-0xb7000 @0x0007cee8 on flash, newfrag *01e73ea0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x000518(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb5000-0xb6000, phys offs 0x07c528
[JFFS2 DBG] (1) check_node_data: check node at 0x07c528, data length 2428, partial CRC 0x000000, correct CRC 0xc712b4f2, data starts at 0x07bbf0, start checking from 0x07c56c - 2428 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39b80 (v 189, 0xb5000-0xb6000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb5000-0xb6000 @0x0007c528 on flash, newfrag *01e73eb8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb4000-0xb5000, phys offs 0x07bb8c
[JFFS2 DBG] (1) check_node_data: check node at 0x07bb8c, data length 2390, partial CRC 0x000000, correct CRC 0xbfc70b43, data starts at 0x07b27a, start checking from 0x07bbd0 - 2390 bytes.
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39f00 (v 188, 0xb4000-0xb5000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb4000-0xb5000 @0x0007bb8c on flash, newfrag *01e73ed0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb3000-0xb4000, phys offs 0x07b240
[JFFS2 DBG] (1) check_node_data: check node at 0x07b240, data length 2311, partial CRC 0x000000, correct CRC 0x6731acf9, data starts at 0x07a97d, start checking from 0x07b284 - 2311 bytes.
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 00000518
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39ec0 (v 187, 0xb3000-0xb4000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb3000-0xb4000 @0x0007b240 on flash, newfrag *01e73ee8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb2000-0xb3000, phys offs 0x07a994
[JFFS2 DBG] (1) check_node_data: check node at 0x07a994, data length 2149, partial CRC 0x000000, correct CRC 0xca9c7e32, data starts at 0x07a173, start checking from 0x07a9d8 - 2149 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39ce0 (v 186, 0xb2000-0xb3000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb2000-0xb3000 @0x0007a994 on flash, newfrag *01e73f00
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #13 were read, the highest version is 136, latest_mctime 1383875710, mctime_ver 136.
[JFFS2 DBG] (1) check_tn_node: check node 0xb1000-0xb2000, phys offs 0x079c94
[JFFS2 DBG] (1) check_node_data: check node at 0x079c94, data length 3257, partial CRC 0x000000, correct CRC 0x767d260b, data starts at 0x07901f, start checking from 0x079cd8 - 3257 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39fa0 (v 185, 0xb1000-0xb2000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb1000-0xb2000 @0x00079c94 on flash, newfrag *01e73f18
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb0000-0xb1000, phys offs 0x079308
[JFFS2 DBG] (1) check_node_data: check node at 0x079308, data length 2376, partial CRC 0x000000, correct CRC 0x1d84ec6c, data starts at 0x078a04, start checking from 0x07934c - 2376 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39f80 (v 184, 0xb0000-0xb1000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb0000-0xb1000 @0x00079308 on flash, newfrag *01e73f30
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xaf000-0xb0000, phys offs 0x078898
[JFFS2 DBG] (1) check_node_data: check node at 0x078898, data length 2603, partial CRC 0x000000, correct CRC 0x18171f9f, data starts at 0x077eb1, start checking from 0x0788dc - 2603 bytes.
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e77180
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39e80 (v 183, 0xaf000-0xb0000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xaf000-0xb0000 @0x00078898 on flash, newfrag *01e73f48
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xae105-0xaf000, phys offs 0x077fd8
[JFFS2 DBG] (1) check_node_data: check node at 0x077fd8, data length 2170, partial CRC 0x000000, correct CRC 0xcbf1b37a, data starts at 0x0777a2, start checking from 0x07801c - 2170 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39ea0 (v 182, 0xae105-0xaf000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xae105-0xaf000 @0x00077fd8 on flash, newfrag *01e73f60
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xae000-0xae105, phys offs 0x077ebc
[JFFS2 DBG] (1) check_node_data: check node at 0x077ebc, data length 215, partial CRC 0x000000, correct CRC 0xc31ab13e, data starts at 0x077e29, start checking from 0x077f00 - 215 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39e60 (v 181, 0xae000-0xae105, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #14 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xae000-0xae105 @0x00077ebc on flash, newfrag *01e73f78
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xad000-0xae000, phys offs 0x077520
[JFFS2 DBG] (1) check_node_data: check node at 0x077520, data length 2391, partial CRC 0x000000, correct CRC 0x77c3c22a, data starts at 0x076c0d, start checking from 0x077564 - 2391 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39e40 (v 180, 0xad000-0xae000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #14
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xad000-0xae000 @0x00077520 on flash, newfrag *01e73f90
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xac000-0xad000, phys offs 0x076c8c
[JFFS2 DBG] (1) check_node_data: check node at 0x076c8c, data length 2128, partial CRC 0x000000, correct CRC 0x251507e7, data starts at 0x076480, start checking from 0x076cd0 - 2128 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x000588(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39e00 (v 179, 0xac000-0xad000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xac000-0xad000 @0x00076c8c on flash, newfrag *01e73fa8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xab000-0xac000, phys offs 0x076310
[JFFS2 DBG] (1) check_node_data: check node at 0x076310, data length 2360, partial CRC 0x000000, correct CRC 0x99fb0dac, data starts at 0x075a1c, start checking from 0x076354 - 2360 bytes.
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39d20 (v 178, 0xab000-0xac000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xab000-0xac000 @0x00076310 on flash, newfrag *01e73fc0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xaa000-0xab000, phys offs 0x0759b4
[JFFS2 DBG] (1) check_node_data: check node at 0x0759b4, data length 2328, partial CRC 0x000000, correct CRC 0x2100d4fc, data starts at 0x0750e0, start checking from 0x0759f8 - 2328 bytes.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x03, ver 1 at 00000588
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39d00 (v 177, 0xaa000-0xab000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xaa000-0xab000 @0x000759b4 on flash, newfrag *01e73fd8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa9000-0xaa000, phys offs 0x0750e0
[JFFS2 DBG] (1) check_node_data: check node at 0x0750e0, data length 2191, partial CRC 0x000000, correct CRC 0xc7b6fae8, data starts at 0x074895, start checking from 0x075124 - 2191 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39f60 (v 176, 0xa9000-0xaa000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_lookup_tn: root 01e5dd5c, offset 0
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa9000-0xaa000 @0x000750e0 on flash, newfrag *01e5e000
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa8000-0xa9000, phys offs 0x074754
[JFFS2 DBG] (1) check_node_data: check node at 0x074754, data length 2375, partial CRC 0x000000, correct CRC 0xee4eea3d, data starts at 0x073e51, start checking from 0x074798 - 2375 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #14 were read, the highest version is 1, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39f40 (v 175, 0xa8000-0xa9000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa8000-0xa9000 @0x00074754 on flash, newfrag *01e5e018
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa7000-0xa8000, phys offs 0x073e94
[JFFS2 DBG] (1) check_node_data: check node at 0x073e94, data length 2169, partial CRC 0x000000, correct CRC 0x79f8213b, data starts at 0x07365f, start checking from 0x073ed8 - 2169 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39f20 (v 174, 0xa7000-0xa8000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa7000-0xa8000 @0x00073e94 on flash, newfrag *01e5e030
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa6000-0xa7000, phys offs 0x0735f4
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: tn 01e77180 ver 1 range 0x0-0x3 ov 0
[JFFS2 DBG] (1) check_node_data: check node at 0x0735f4, data length 2139, partial CRC 0x000000, correct CRC 0x1a158912, data starts at 0x072ddd, start checking from 0x073638 - 2139 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39ee0 (v 173, 0xa6000-0xa7000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa6000-0xa7000 @0x000735f4 on flash, newfrag *01e5e048
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa5000-0xa6000, phys offs 0x072cc0
[JFFS2 DBG] (1) check_node_data: check node at 0x072cc0, data length 2286, partial CRC 0x000000, correct CRC 0x5381d666, data starts at 0x072416, start checking from 0x072d04 - 2286 bytes.
[JFFS2 DBG] (38) ver_insert: Link new node at 01e5dd84 (root is 01e5dd84)
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39e20 (v 172, 0xa5000-0xa6000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa5000-0xa6000 @0x00072cc0 on flash, newfrag *01e5e060
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa4000-0xa5000, phys offs 0x0723e4
[JFFS2 DBG] (1) check_node_data: check node at 0x0723e4, data length 2198, partial CRC 0x000000, correct CRC 0x6209ed3f, data starts at 0x071b92, start checking from 0x072428 - 2198 bytes.
[JFFS2 DBG] (38) check_tn_node: check node 0x00-0x03, phys offs 0x000588
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39d80 (v 171, 0xa4000-0xa5000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa4000-0xa5000 @0x000723e4 on flash, newfrag *01e5e078
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa3000-0xa4000, phys offs 0x071bac
[JFFS2 DBG] (1) check_node_data: check node at 0x071bac, data length 2036, partial CRC 0x000000, correct CRC 0x115a2391, data starts at 0x0713fc, start checking from 0x071bf0 - 2036 bytes.
[JFFS2 DBG] (38) check_node_data: check node at 0x000588, data length 3, partial CRC 0x000000, correct CRC 0xd3aea45a, data starts at 0x0005c9, start checking from 0x0005cc - 3 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39da0 (v 170, 0xa3000-0xa4000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa3000-0xa4000 @0x00071bac on flash, newfrag *01e5e090
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa2000-0xa3000, phys offs 0x071164
[JFFS2 DBG] (1) check_node_data: check node at 0x071164, data length 2564, partial CRC 0x000000, correct CRC 0x953ee089, data starts at 0x0707a4, start checking from 0x0711a8 - 2564 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39cc0 (v 169, 0xa2000-0xa3000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa2000-0xa3000 @0x00071164 on flash, newfrag *01e5e0a8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa1000-0xa2000, phys offs 0x0708d0
[JFFS2 DBG] (1) check_node_data: check node at 0x0708d0, data length 2128, partial CRC 0x000000, correct CRC 0x4d307463, data starts at 0x0700c4, start checking from 0x070914 - 2128 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39ca0 (v 168, 0xa1000-0xa2000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa1000-0xa2000 @0x000708d0 on flash, newfrag *01e5e0c0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa0000-0xa1000, phys offs 0x070000
[JFFS2 DBG] (1) check_node_data: check node at 0x070000, data length 2187, partial CRC 0x000000, correct CRC 0xc524c66c, data starts at 0x06f7b9, start checking from 0x070044 - 2187 bytes.
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: Add 01e77180 (v 1, 0x0-0x3, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39fc0 (v 167, 0xa0000-0xa1000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa0000-0xa1000 @0x00070000 on flash, newfrag *01e5e0d8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x9f000-0xa0000, phys offs 0x06e5e4
[JFFS2 DBG] (1) check_node_data: check node at 0x06e5e4, data length 1960, partial CRC 0x000000, correct CRC 0xec5ebb1f, data starts at 0x06de80, start checking from 0x06e628 - 1960 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39de0 (v 166, 0x9f000-0xa0000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_add_full_dnode_to_inode: adding node 0x00-0x03 @0x00000588 on flash, newfrag *01e5e0f0
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x9f000-0xa0000 @0x0006e5e4 on flash, newfrag *01e5e108
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x9e000-0x9f000, phys offs 0x06dd44
[JFFS2 DBG] (1) check_node_data: check node at 0x06dd44, data length 2139, partial CRC 0x000000, correct CRC 0xb4b64675, data starts at 0x06d52d, start checking from 0x06dd88 - 2139 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39d60 (v 165, 0x9e000-0x9f000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x9e000-0x9f000 @0x0006dd44 on flash, newfrag *01e5e120
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x9d000-0x9e000, phys offs 0x06d4e0
[JFFS2 DBG] (1) check_node_data: check node at 0x06d4e0, data length 2077, partial CRC 0x000000, correct CRC 0x21fabda5, data starts at 0x06cd07, start checking from 0x06d524 - 2077 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39dc0 (v 164, 0x9d000-0x9e000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x9d000-0x9e000 @0x0006d4e0 on flash, newfrag *01e5e0f0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x9c000-0x9d000, phys offs 0x06cc68
[JFFS2 DBG] (1) check_node_data: check node at 0x06cc68, data length 2099, partial CRC 0x000000, correct CRC 0xc9ce2172, data starts at 0x06c479, start checking from 0x06ccac - 2099 bytes.
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #15 pino/nlink is 1
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e399e0 (v 163, 0x9c000-0x9d000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x9c000-0x9d000 @0x0006cc68 on flash, newfrag *01e5e138
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x9b000-0x9c000, phys offs 0x06c50c
[JFFS2 DBG] (1) check_node_data: check node at 0x06c50c, data length 1816, partial CRC 0x000000, correct CRC 0x2462221f, data starts at 0x06be38, start checking from 0x06c550 - 1816 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #15
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39a00 (v 162, 0x9b000-0x9c000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x9b000-0x9c000 @0x0006c50c on flash, newfrag *01e5e150
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x9a000-0x9b000, phys offs 0x06bce0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8fcc(0).
[JFFS2 DBG] (1) check_node_data: check node at 0x06bce0, data length 2021, partial CRC 0x000000, correct CRC 0xca25d021, data starts at 0x06b53f, start checking from 0x06bd24 - 2021 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e399c0 (v 161, 0x9a000-0x9b000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x9a000-0x9b000 @0x0006bce0 on flash, newfrag *01e5e168
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x99000-0x9a000, phys offs 0x06b458
[JFFS2 DBG] (1) check_node_data: check node at 0x06b458, data length 2113, partial CRC 0x000000, correct CRC 0x88e8c9dd, data starts at 0x06ac5b, start checking from 0x06b49c - 2113 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39ae0 (v 160, 0x99000-0x9a000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x99000-0x9a000 @0x0006b458 on flash, newfrag *01e5e180
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x98000-0x99000, phys offs 0x06abd0
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "watchdog", ino #186
[JFFS2 DBG] (1) check_node_data: check node at 0x06abd0, data length 2114, partial CRC 0x000000, correct CRC 0xd1e83167, data starts at 0x06a3d2, start checking from 0x06ac14 - 2114 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39a60 (v 159, 0x98000-0x99000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x98000-0x99000 @0x0006abd0 on flash, newfrag *01e5e198
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x97000-0x98000, phys offs 0x06a310
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8f48(0).
[JFFS2 DBG] (1) check_node_data: check node at 0x06a310, data length 2169, partial CRC 0x000000, correct CRC 0xcd3e2112, data starts at 0x069adb, start checking from 0x06a354 - 2169 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39980 (v 158, 0x97000-0x98000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x97000-0x98000 @0x0006a310 on flash, newfrag *01e5e1b0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x96000-0x97000, phys offs 0x069ae4
[JFFS2 DBG] (1) check_node_data: check node at 0x069ae4, data length 2023, partial CRC 0x000000, correct CRC 0x534db9b0, data starts at 0x069341, start checking from 0x069b28 - 2023 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39b60 (v 157, 0x96000-0x97000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x96000-0x97000 @0x00069ae4 on flash, newfrag *01e5e1c8
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "vconfig", ino #185
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8ec4(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x95000-0x96000, phys offs 0x069164
[JFFS2 DBG] (1) check_node_data: check node at 0x069164, data length 2364, partial CRC 0x000000, correct CRC 0x782e573e, data starts at 0x06886c, start checking from 0x0691a8 - 2364 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39b00 (v 156, 0x95000-0x96000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x95000-0x96000 @0x00069164 on flash, newfrag *01e5e1e0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x94000-0x95000, phys offs 0x0689f0
[JFFS2 DBG] (1) check_node_data: check node at 0x0689f0, data length 1838, partial CRC 0x000000, correct CRC 0x4d38439d, data starts at 0x068306, start checking from 0x068a34 - 1838 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39b20 (v 155, 0x94000-0x95000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x94000-0x95000 @0x000689f0 on flash, newfrag *01e5e1f8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x93000-0x94000, phys offs 0x067f70
[JFFS2 DBG] (1) check_node_data: check node at 0x067f70, data length 2619, partial CRC 0x000000, correct CRC 0xfa2cfaae, data starts at 0x067579, start checking from 0x067fb4 - 2619 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "udhcpc", ino #184
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39ac0 (v 154, 0x93000-0x94000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x93000-0x94000 @0x00067f70 on flash, newfrag *01e5e210
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x92000-0x93000, phys offs 0x067648
[JFFS2 DBG] (1) check_node_data: check node at 0x067648, data length 2274, partial CRC 0x000000, correct CRC 0x83eca6e0, data starts at 0x066daa, start checking from 0x06768c - 2274 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8e40(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39a20 (v 153, 0x92000-0x93000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x92000-0x93000 @0x00067648 on flash, newfrag *01e5e228
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x9140a-0x92000, phys offs 0x066dac
[JFFS2 DBG] (1) check_node_data: check node at 0x066dac, data length 2133, partial CRC 0x000000, correct CRC 0xa8814e88, data starts at 0x06659b, start checking from 0x066df0 - 2133 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e399a0 (v 152, 0x9140a-0x92000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x9140a-0x92000 @0x00066dac on flash, newfrag *01e5e240
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x91000-0x9140a, phys offs 0x066a98
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "syslogd", ino #183
[JFFS2 DBG] (1) check_node_data: check node at 0x066a98, data length 718, partial CRC 0x000000, correct CRC 0x1a275822, data starts at 0x06680e, start checking from 0x066adc - 718 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39960 (v 151, 0x91000-0x9140a, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x91000-0x9140a @0x00066a98 on flash, newfrag *01e5e258
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x90000-0x91000, phys offs 0x066054
[JFFS2 DBG] (1) check_node_data: check node at 0x066054, data length 2559, partial CRC 0x000000, correct CRC 0xcc040964, data starts at 0x065699, start checking from 0x066098 - 2559 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8dbc(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39920 (v 150, 0x90000-0x91000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x90000-0x91000 @0x00066054 on flash, newfrag *01e5e270
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x8f000-0x90000, phys offs 0x065508
[JFFS2 DBG] (1) check_node_data: check node at 0x065508, data length 2823, partial CRC 0x000000, correct CRC 0xcb11df0c, data starts at 0x064a45, start checking from 0x06554c - 2823 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39900 (v 149, 0x8f000-0x90000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x8f000-0x90000 @0x00065508 on flash, newfrag *01e5e288
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x8e000-0x8f000, phys offs 0x0649c4
[JFFS2 DBG] (1) check_node_data: check node at 0x0649c4, data length 2815, partial CRC 0x000000, correct CRC 0x53c925a2, data starts at 0x063f09, start checking from 0x064a08 - 2815 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "sysctl", ino #182
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8d34(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70640 (v 148, 0x8e000-0x8f000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x8e000-0x8f000 @0x000649c4 on flash, newfrag *01e5e2a0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x8d000-0x8e000, phys offs 0x063ee8
[JFFS2 DBG] (1) check_node_data: check node at 0x063ee8, data length 2709, partial CRC 0x000000, correct CRC 0xf5cd1ecc, data starts at 0x063497, start checking from 0x063f2c - 2709 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70620 (v 147, 0x8d000-0x8e000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x8d000-0x8e000 @0x00063ee8 on flash, newfrag *01e5e2b8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x8c000-0x8d000, phys offs 0x06343c
[JFFS2 DBG] (1) check_node_data: check node at 0x06343c, data length 2661, partial CRC 0x000000, correct CRC 0xbd941fbe, data starts at 0x062a1b, start checking from 0x063480 - 2661 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70600 (v 146, 0x8c000-0x8d000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x8c000-0x8d000 @0x0006343c on flash, newfrag *01e5e2d0
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "switch_root", ino #181
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x8b000-0x8c000, phys offs 0x062a3c
[JFFS2 DBG] (1) check_node_data: check node at 0x062a3c, data length 2491, partial CRC 0x000000, correct CRC 0xfb5e92cf, data starts at 0x0620c5, start checking from 0x062a80 - 2491 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70c20 (v 145, 0x8b000-0x8c000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x8b000-0x8c000 @0x00062a3c on flash, newfrag *01e5e2e8
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8cb0(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x8a000-0x8b000, phys offs 0x061fc4
[JFFS2 DBG] (1) check_node_data: check node at 0x061fc4, data length 2611, partial CRC 0x000000, correct CRC 0xa1eb8fbe, data starts at 0x0615d5, start checking from 0x062008 - 2611 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70fe0 (v 144, 0x8a000-0x8b000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x8a000-0x8b000 @0x00061fc4 on flash, newfrag *01e5e300
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x89000-0x8a000, phys offs 0x061568
[JFFS2 DBG] (1) check_node_data: check node at 0x061568, data length 2583, partial CRC 0x000000, correct CRC 0xe7ea3e6c, data starts at 0x060b95, start checking from 0x0615ac - 2583 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "sulogin", ino #180
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70ee0 (v 143, 0x89000-0x8a000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x89000-0x8a000 @0x00061568 on flash, newfrag *01e5e318
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x88000-0x89000, phys offs 0x060ab8
[JFFS2 DBG] (1) check_node_data: check node at 0x060ab8, data length 2667, partial CRC 0x000000, correct CRC 0x8782f699, data starts at 0x060091, start checking from 0x060afc - 2667 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8c20(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70f80 (v 142, 0x88000-0x89000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x88000-0x89000 @0x00060ab8 on flash, newfrag *01e5e330
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x87000-0x88000, phys offs 0x060000
[JFFS2 DBG] (1) check_node_data: check node at 0x060000, data length 2676, partial CRC 0x000000, correct CRC 0xfc60e5ba, data starts at 0x05f5d0, start checking from 0x060044 - 2676 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70ec0 (v 141, 0x87000-0x88000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x87000-0x88000 @0x00060000 on flash, newfrag *01e5e348
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x86000-0x87000, phys offs 0x05e138
[JFFS2 DBG] (1) check_node_data: check node at 0x05e138, data length 2658, partial CRC 0x000000, correct CRC 0xafc2270f, data starts at 0x05d71a, start checking from 0x05e17c - 2658 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "start-stop-daemon", ino #179
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70e80 (v 140, 0x86000-0x87000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x86000-0x87000 @0x0005e138 on flash, newfrag *01e5e360
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x85000-0x86000, phys offs 0x05d730
[JFFS2 DBG] (1) check_node_data: check node at 0x05d730, data length 2500, partial CRC 0x000000, correct CRC 0x286b10d9, data starts at 0x05cdb0, start checking from 0x05d774 - 2500 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8b98(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70e60 (v 139, 0x85000-0x86000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x85000-0x86000 @0x0005d730 on flash, newfrag *01e5e378
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x84000-0x85000, phys offs 0x05cc8c
[JFFS2 DBG] (1) check_node_data: check node at 0x05cc8c, data length 2656, partial CRC 0x000000, correct CRC 0x5251c95f, data starts at 0x05c270, start checking from 0x05ccd0 - 2656 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70c40 (v 138, 0x84000-0x85000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x84000-0x85000 @0x0005cc8c on flash, newfrag *01e5e390
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "setconsole", ino #178
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x83000-0x84000, phys offs 0x05c1a0
[JFFS2 DBG] (1) check_node_data: check node at 0x05c1a0, data length 2728, partial CRC 0x000000, correct CRC 0x67a45003, data starts at 0x05b73c, start checking from 0x05c1e4 - 2728 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70ca0 (v 137, 0x83000-0x84000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x83000-0x84000 @0x0005c1a0 on flash, newfrag *01e5e3a8
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8b14(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x82000-0x83000, phys offs 0x05b738
[JFFS2 DBG] (1) check_node_data: check node at 0x05b738, data length 2593, partial CRC 0x000000, correct CRC 0x41afc4ff, data starts at 0x05ad5b, start checking from 0x05b77c - 2593 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70cc0 (v 136, 0x82000-0x83000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x82000-0x83000 @0x0005b738 on flash, newfrag *01e5e3c0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x81000-0x82000, phys offs 0x05ac90
[JFFS2 DBG] (1) check_node_data: check node at 0x05ac90, data length 2657, partial CRC 0x000000, correct CRC 0x7522ec87, data starts at 0x05a273, start checking from 0x05acd4 - 2657 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70d80 (v 135, 0x81000-0x82000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x81000-0x82000 @0x0005ac90 on flash, newfrag *01e5e3d8
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "runlevel", ino #177
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x80000-0x81000, phys offs 0x05a2c8
[JFFS2 DBG] (1) check_node_data: check node at 0x05a2c8, data length 2433, partial CRC 0x000000, correct CRC 0x17bb408a, data starts at 0x05998b, start checking from 0x05a30c - 2433 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70d00 (v 134, 0x80000-0x81000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x80000-0x81000 @0x0005a2c8 on flash, newfrag *01e5e3f0
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8a90(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x7f000-0x80000, phys offs 0x05983c
[JFFS2 DBG] (1) check_node_data: check node at 0x05983c, data length 2631, partial CRC 0x000000, correct CRC 0xf0021d4e, data starts at 0x058e39, start checking from 0x059880 - 2631 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70fc0 (v 133, 0x7f000-0x80000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x7f000-0x80000 @0x0005983c on flash, newfrag *01e5e408
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x7e000-0x7f000, phys offs 0x058d7c
[JFFS2 DBG] (1) check_node_data: check node at 0x058d7c, data length 2681, partial CRC 0x000000, correct CRC 0x5a491174, data starts at 0x058347, start checking from 0x058dc0 - 2681 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70f60 (v 132, 0x7e000-0x7f000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x7e000-0x7f000 @0x00058d7c on flash, newfrag *01e5e420
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x7d000-0x7e000, phys offs 0x058300
[JFFS2 DBG] (1) check_node_data: check node at 0x058300, data length 2616, partial CRC 0x000000, correct CRC 0x21113cfe, data starts at 0x05790c, start checking from 0x058344 - 2616 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "route", ino #176
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70ea0 (v 131, 0x7d000-0x7e000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x7d000-0x7e000 @0x00058300 on flash, newfrag *01e5e438
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x7c000-0x7d000, phys offs 0x0578a4
[JFFS2 DBG] (1) check_node_data: check node at 0x0578a4, data length 2582, partial CRC 0x000000, correct CRC 0x6cc350cb, data starts at 0x056ed2, start checking from 0x0578e8 - 2582 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8a0c(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70e40 (v 130, 0x7c000-0x7d000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x7c000-0x7d000 @0x000578a4 on flash, newfrag *01e5e450
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x7b000-0x7c000, phys offs 0x056dbc
[JFFS2 DBG] (1) check_node_data: check node at 0x056dbc, data length 2724, partial CRC 0x000000, correct CRC 0x569b968e, data starts at 0x05635c, start checking from 0x056e00 - 2724 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70e20 (v 129, 0x7b000-0x7c000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x7b000-0x7c000 @0x00056dbc on flash, newfrag *01e5e468
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "rmmod", ino #175
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x7a000-0x7b000, phys offs 0x056298
[JFFS2 DBG] (1) check_node_data: check node at 0x056298, data length 2783, partial CRC 0x000000, correct CRC 0x951dffc0, data starts at 0x0557fd, start checking from 0x0562dc - 2783 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70de0 (v 128, 0x7a000-0x7b000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x7a000-0x7b000 @0x00056298 on flash, newfrag *01e5e480
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8988(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x793b4-0x7a000, phys offs 0x055990
[JFFS2 DBG] (1) check_node_data: check node at 0x055990, data length 2242, partial CRC 0x000000, correct CRC 0x64d91fbe, data starts at 0x055112, start checking from 0x0559d4 - 2242 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70e00 (v 127, 0x793b4-0x7a000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x793b4-0x7a000 @0x00055990 on flash, newfrag *01e5e498
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x79000-0x793b4, phys offs 0x055678
[JFFS2 DBG] (1) check_node_data: check node at 0x055678, data length 724, partial CRC 0x000000, correct CRC 0x5828a50d, data starts at 0x0553e8, start checking from 0x0556bc - 724 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "reboot", ino #174
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70d60 (v 126, 0x79000-0x793b4, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x79000-0x793b4 @0x00055678 on flash, newfrag *01e5e4b0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x78000-0x79000, phys offs 0x054b44
[JFFS2 DBG] (1) check_node_data: check node at 0x054b44, data length 2798, partial CRC 0x000000, correct CRC 0x6d42f55f, data starts at 0x05409a, start checking from 0x054b88 - 2798 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70c80 (v 125, 0x78000-0x79000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8904(0).
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x78000-0x79000 @0x00054b44 on flash, newfrag *01e5e4c8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x77000-0x78000, phys offs 0x054110
[JFFS2 DBG] (1) check_node_data: check node at 0x054110, data length 2544, partial CRC 0x000000, correct CRC 0x6f4aa075, data starts at 0x053764, start checking from 0x054154 - 2544 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70660 (v 124, 0x77000-0x78000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x77000-0x78000 @0x00054110 on flash, newfrag *01e5e4e0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x76000-0x77000, phys offs 0x053618
[JFFS2 DBG] (1) check_node_data: check node at 0x053618, data length 2737, partial CRC 0x000000, correct CRC 0xc7e46abf, data starts at 0x052bab, start checking from 0x05365c - 2737 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "poweroff", ino #173
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70f20 (v 123, 0x76000-0x77000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x76000-0x77000 @0x00053618 on flash, newfrag *01e5e4f8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x75000-0x76000, phys offs 0x052b58
[JFFS2 DBG] (1) check_node_data: check node at 0x052b58, data length 2684, partial CRC 0x000000, correct CRC 0x7d469e48, data starts at 0x052120, start checking from 0x052b9c - 2684 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c887c(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70f40 (v 122, 0x75000-0x76000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x75000-0x76000 @0x00052b58 on flash, newfrag *01e5e510
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x74000-0x75000, phys offs 0x0520a8
[JFFS2 DBG] (1) check_node_data: check node at 0x0520a8, data length 2668, partial CRC 0x000000, correct CRC 0x42eddc7f, data starts at 0x051680, start checking from 0x0520ec - 2668 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70fa0 (v 121, 0x74000-0x75000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x74000-0x75000 @0x000520a8 on flash, newfrag *01e5e528
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "pivot_root", ino #172
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c87f8(0).
[JFFS2 DBG] (1) check_tn_node: check node 0x73000-0x74000, phys offs 0x051618
[JFFS2 DBG] (1) check_node_data: check node at 0x051618, data length 2633, partial CRC 0x000000, correct CRC 0xff70458c, data starts at 0x050c13, start checking from 0x05165c - 2633 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70c60 (v 120, 0x73000-0x74000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x73000-0x74000 @0x00051618 on flash, newfrag *01e5e540
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x72000-0x73000, phys offs 0x050af4
[JFFS2 DBG] (1) check_node_data: check node at 0x050af4, data length 2784, partial CRC 0x000000, correct CRC 0x37900d23, data starts at 0x050058, start checking from 0x050b38 - 2784 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70d20 (v 119, 0x72000-0x73000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x72000-0x73000 @0x00050af4 on flash, newfrag *01e5e558
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x71000-0x72000, phys offs 0x050000
[JFFS2 DBG] (1) check_node_data: check node at 0x050000, data length 2734, partial CRC 0x000000, correct CRC 0x751f0e63, data starts at 0x04f596, start checking from 0x050044 - 2734 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "nameif", ino #171
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70ce0 (v 118, 0x71000-0x72000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x71000-0x72000 @0x00050000 on flash, newfrag *01e5e570
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x70000-0x71000, phys offs 0x04e268
[JFFS2 DBG] (1) check_node_data: check node at 0x04e268, data length 2621, partial CRC 0x000000, correct CRC 0x9b78462b, data starts at 0x04d86f, start checking from 0x04e2ac - 2621 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8774(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70c00 (v 117, 0x70000-0x71000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x70000-0x71000 @0x0004e268 on flash, newfrag *01e5e588
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x6f000-0x70000, phys offs 0x04d7c8
[JFFS2 DBG] (1) check_node_data: check node at 0x04d7c8, data length 2650, partial CRC 0x000000, correct CRC 0x6ae28f8, data starts at 0x04cdb2, start checking from 0x04d80c - 2650 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70da0 (v 116, 0x6f000-0x70000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x6f000-0x70000 @0x0004d7c8 on flash, newfrag *01e5e5a0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x6e000-0x6f000, phys offs 0x04cd58
[JFFS2 DBG] (1) check_node_data: check node at 0x04cd58, data length 2601, partial CRC 0x000000, correct CRC 0x7c6983c7, data starts at 0x04c373, start checking from 0x04cd9c - 2601 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "modprobe", ino #170
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70d40 (v 115, 0x6e000-0x6f000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x6e000-0x6f000 @0x0004cd58 on flash, newfrag *01e5e5b8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x6d000-0x6e000, phys offs 0x04c340
[JFFS2 DBG] (1) check_node_data: check node at 0x04c340, data length 2513, partial CRC 0x000000, correct CRC 0xea87ccfe, data starts at 0x04b9b3, start checking from 0x04c384 - 2513 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c86f0(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70be0 (v 114, 0x6d000-0x6e000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x6d000-0x6e000 @0x0004c340 on flash, newfrag *01e5e5d0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x6c000-0x6d000, phys offs 0x04b894
[JFFS2 DBG] (1) check_node_data: check node at 0x04b894, data length 2662, partial CRC 0x000000, correct CRC 0xfb1258b, data starts at 0x04ae72, start checking from 0x04b8d8 - 2662 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70bc0 (v 113, 0x6c000-0x6d000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x6c000-0x6d000 @0x0004b894 on flash, newfrag *01e5e5e8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x6b000-0x6c000, phys offs 0x04ae44
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mkswap", ino #169
[JFFS2 DBG] (1) check_node_data: check node at 0x04ae44, data length 2571, partial CRC 0x000000, correct CRC 0xadaa3c0e, data starts at 0x04a47d, start checking from 0x04ae88 - 2571 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70b80 (v 112, 0x6b000-0x6c000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x6b000-0x6c000 @0x0004ae44 on flash, newfrag *01e5e600
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x6a000-0x6b000, phys offs 0x04a384
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8670(0).
[JFFS2 DBG] (1) check_node_data: check node at 0x04a384, data length 2681, partial CRC 0x000000, correct CRC 0x914f0ca7, data starts at 0x04994f, start checking from 0x04a3c8 - 2681 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70b40 (v 111, 0x6a000-0x6b000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x6a000-0x6b000 @0x0004a384 on flash, newfrag *01e5e618
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x69000-0x6a000, phys offs 0x0498f8
[JFFS2 DBG] (1) check_node_data: check node at 0x0498f8, data length 2631, partial CRC 0x000000, correct CRC 0xba583537, data starts at 0x048ef5, start checking from 0x04993c - 2631 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "mdev", ino #168
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70b60 (v 110, 0x69000-0x6a000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x69000-0x6a000 @0x000498f8 on flash, newfrag *01e5e630
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x68000-0x69000, phys offs 0x048f28
[JFFS2 DBG] (1) check_node_data: check node at 0x048f28, data length 2443, partial CRC 0x000000, correct CRC 0xb2f3c762, data starts at 0x0485e1, start checking from 0x048f6c - 2443 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c85ec(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70b20 (v 109, 0x68000-0x69000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x68000-0x69000 @0x00048f28 on flash, newfrag *01e5e648
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x67000-0x68000, phys offs 0x048470
[JFFS2 DBG] (1) check_node_data: check node at 0x048470, data length 2674, partial CRC 0x000000, correct CRC 0xdf56f7a3, data starts at 0x047a42, start checking from 0x0484b4 - 2674 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70b00 (v 108, 0x67000-0x68000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x67000-0x68000 @0x00048470 on flash, newfrag *01e5e660
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x66000-0x67000, phys offs 0x047934
[JFFS2 DBG] (1) check_node_data: check node at 0x047934, data length 2807, partial CRC 0x000000, correct CRC 0x8c404502, data starts at 0x046e81, start checking from 0x047978 - 2807 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "makedevs", ino #167
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70a80 (v 107, 0x66000-0x67000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x66000-0x67000 @0x00047934 on flash, newfrag *01e5e678
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x65000-0x66000, phys offs 0x046e10
[JFFS2 DBG] (1) check_node_data: check node at 0x046e10, data length 2783, partial CRC 0x000000, correct CRC 0xb2d9fc63, data starts at 0x046375, start checking from 0x046e54 - 2783 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8568(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70ac0 (v 106, 0x65000-0x66000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x65000-0x66000 @0x00046e10 on flash, newfrag *01e5e690
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x64000-0x65000, phys offs 0x0463a4
[JFFS2 DBG] (1) check_node_data: check node at 0x0463a4, data length 2600, partial CRC 0x000000, correct CRC 0x92bc3ea1, data starts at 0x0459c0, start checking from 0x0463e8 - 2600 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70a00 (v 105, 0x64000-0x65000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x64000-0x65000 @0x000463a4 on flash, newfrag *01e5e6a8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "lsmod", ino #166
[JFFS2 DBG] (1) check_tn_node: check node 0x63000-0x64000, phys offs 0x045970
[JFFS2 DBG] (1) check_node_data: check node at 0x045970, data length 2543, partial CRC 0x000000, correct CRC 0x301f91fc, data starts at 0x044fc5, start checking from 0x0459b4 - 2543 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70ba0 (v 104, 0x63000-0x64000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x63000-0x64000 @0x00045970 on flash, newfrag *01e5e6c0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x62000-0x63000, phys offs 0x044eb8
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c84e4(0).
[JFFS2 DBG] (1) check_node_data: check node at 0x044eb8, data length 2673, partial CRC 0x000000, correct CRC 0x1343af9, data starts at 0x04448b, start checking from 0x044efc - 2673 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70f00 (v 103, 0x62000-0x63000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x62000-0x63000 @0x00044eb8 on flash, newfrag *01e5e6d8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x61478-0x62000, phys offs 0x044680
[JFFS2 DBG] (1) check_node_data: check node at 0x044680, data length 2036, partial CRC 0x000000, correct CRC 0x4cadfa23, data starts at 0x043ed0, start checking from 0x0446c4 - 2036 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70dc0 (v 102, 0x61478-0x62000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "losetup", ino #165
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x61478-0x62000 @0x00044680 on flash, newfrag *01e5e6f0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x61000-0x61478, phys offs 0x0442b8
[JFFS2 DBG] (1) check_node_data: check node at 0x0442b8, data length 900, partial CRC 0x000000, correct CRC 0x29edffb0, data starts at 0x043f78, start checking from 0x0442fc - 900 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e709e0 (v 101, 0x61000-0x61478, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8460(0).
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x61000-0x61478 @0x000442b8 on flash, newfrag *01e5e708
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x60000-0x61000, phys offs 0x04383c
[JFFS2 DBG] (1) check_node_data: check node at 0x04383c, data length 2615, partial CRC 0x000000, correct CRC 0xb7e8a36f, data starts at 0x042e49, start checking from 0x043880 - 2615 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e709c0 (v 100, 0x60000-0x61000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x60000-0x61000 @0x0004383c on flash, newfrag *01e5e720
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x5f000-0x60000, phys offs 0x042c80
[JFFS2 DBG] (1) check_node_data: check node at 0x042c80, data length 2934, partial CRC 0x000000, correct CRC 0xde2a80be, data starts at 0x04214e, start checking from 0x042cc4 - 2934 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "loadkmap", ino #164
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70900 (v 99, 0x5f000-0x60000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x5f000-0x60000 @0x00042c80 on flash, newfrag *01e5e738
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x5e000-0x5f000, phys offs 0x0421b0
[JFFS2 DBG] (1) check_node_data: check node at 0x0421b0, data length 2697, partial CRC 0x000000, correct CRC 0x9f10b21b, data starts at 0x04176b, start checking from 0x0421f4 - 2697 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c83dc(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e708e0 (v 98, 0x5e000-0x5f000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x5e000-0x5f000 @0x000421b0 on flash, newfrag *01e5e750
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x5d000-0x5e000, phys offs 0x0416e4
[JFFS2 DBG] (1) check_node_data: check node at 0x0416e4, data length 2694, partial CRC 0x000000, correct CRC 0x2b2aa8cb, data starts at 0x040ca2, start checking from 0x041728 - 2694 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e708a0 (v 97, 0x5d000-0x5e000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x5d000-0x5e000 @0x000416e4 on flash, newfrag *01e5e768
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x5c000-0x5d000, phys offs 0x040bb0
[JFFS2 DBG] (1) check_node_data: check node at 0x040bb0, data length 2798, partial CRC 0x000000, correct CRC 0xc8461ccc, data starts at 0x040106, start checking from 0x040bf4 - 2798 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "klogd", ino #163
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8360(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70860 (v 96, 0x5c000-0x5d000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x5c000-0x5d000 @0x00040bb0 on flash, newfrag *01e5e780
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x5b000-0x5c000, phys offs 0x040000
[JFFS2 DBG] (1) check_node_data: check node at 0x040000, data length 2921, partial CRC 0x000000, correct CRC 0xc2a2bf79, data starts at 0x03f4db, start checking from 0x040044 - 2921 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70840 (v 95, 0x5b000-0x5c000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x5b000-0x5c000 @0x00040000 on flash, newfrag *01e5e798
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x5a000-0x5b000, phys offs 0x03e764
[JFFS2 DBG] (1) check_node_data: check node at 0x03e764, data length 2519, partial CRC 0x000000, correct CRC 0x4e694d77, data starts at 0x03ddd1, start checking from 0x03e7a8 - 2519 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "iwspy", ino #162
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c82e4(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70800 (v 94, 0x5a000-0x5b000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x5a000-0x5b000 @0x0003e764 on flash, newfrag *01e5e7b0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x59000-0x5a000, phys offs 0x03dcdc
[JFFS2 DBG] (1) check_node_data: check node at 0x03dcdc, data length 2627, partial CRC 0x000000, correct CRC 0x38c703bc, data starts at 0x03d2dd, start checking from 0x03dd20 - 2627 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e707a0 (v 93, 0x59000-0x5a000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x59000-0x5a000 @0x0003dcdc on flash, newfrag *01e5e7c8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x58000-0x59000, phys offs 0x03d1e0
[JFFS2 DBG] (1) check_node_data: check node at 0x03d1e0, data length 2744, partial CRC 0x000000, correct CRC 0x74e0ca71, data starts at 0x03c76c, start checking from 0x03d224 - 2744 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "iwpriv", ino #161
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70760 (v 92, 0x58000-0x59000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x58000-0x59000 @0x0003d1e0 on flash, newfrag *01e5e7e0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x57000-0x58000, phys offs 0x03c744
[JFFS2 DBG] (1) check_node_data: check node at 0x03c744, data length 2645, partial CRC 0x000000, correct CRC 0x2dd8be74, data starts at 0x03bd33, start checking from 0x03c788 - 2645 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e706e0 (v 91, 0x57000-0x58000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x57000-0x58000 @0x0003c744 on flash, newfrag *01e5e7f8
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c8268(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x56000-0x57000, phys offs 0x03bd7c
[JFFS2 DBG] (1) check_node_data: check node at 0x03bd7c, data length 2436, partial CRC 0x000000, correct CRC 0xa3b160cc, data starts at 0x03b43c, start checking from 0x03bdc0 - 2436 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70960 (v 90, 0x56000-0x57000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x56000-0x57000 @0x0003bd7c on flash, newfrag *01e5e810
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x55000-0x56000, phys offs 0x03b2c8
[JFFS2 DBG] (1) check_node_data: check node at 0x03b2c8, data length 2669, partial CRC 0x000000, correct CRC 0x66d4d5e3, data starts at 0x03a89f, start checking from 0x03b30c - 2669 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "iwlist", ino #160
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c81ec(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70880 (v 89, 0x55000-0x56000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x55000-0x56000 @0x0003b2c8 on flash, newfrag *01e5e828
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x54000-0x55000, phys offs 0x03a7b8
[JFFS2 DBG] (1) check_node_data: check node at 0x03a7b8, data length 2764, partial CRC 0x000000, correct CRC 0xe142b658, data starts at 0x039d30, start checking from 0x03a7fc - 2764 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70780 (v 88, 0x54000-0x55000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x54000-0x55000 @0x0003a7b8 on flash, newfrag *01e5e840
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x53000-0x54000, phys offs 0x039cd8
[JFFS2 DBG] (1) check_node_data: check node at 0x039cd8, data length 2716, partial CRC 0x000000, correct CRC 0x47b05615, data starts at 0x039280, start checking from 0x039d1c - 2716 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70ae0 (v 87, 0x53000-0x54000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x53000-0x54000 @0x00039cd8 on flash, newfrag *01e5e858
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "iwgetid", ino #159
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x52000-0x53000, phys offs 0x0391fc
[JFFS2 DBG] (1) check_node_data: check node at 0x0391fc, data length 2709, partial CRC 0x000000, correct CRC 0xdb33f051, data starts at 0x0387ab, start checking from 0x039240 - 2709 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70aa0 (v 86, 0x52000-0x53000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x52000-0x53000 @0x000391fc on flash, newfrag *01e5e870
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b20a4(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x51000-0x52000, phys offs 0x038768
[JFFS2 DBG] (1) check_node_data: check node at 0x038768, data length 2639, partial CRC 0x000000, correct CRC 0x69167a9a, data starts at 0x037d5d, start checking from 0x0387ac - 2639 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70a60 (v 85, 0x51000-0x52000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x51000-0x52000 @0x00038768 on flash, newfrag *01e5e888
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x50000-0x51000, phys offs 0x037d10
[JFFS2 DBG] (1) check_node_data: check node at 0x037d10, data length 2578, partial CRC 0x000000, correct CRC 0xb91d3052, data starts at 0x037342, start checking from 0x037d54 - 2578 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "iwconfig", ino #158
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b2020(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70a40 (v 84, 0x50000-0x51000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x50000-0x51000 @0x00037d10 on flash, newfrag *01e5e8a0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x4f000-0x50000, phys offs 0x037348
[JFFS2 DBG] (1) check_node_data: check node at 0x037348, data length 2436, partial CRC 0x000000, correct CRC 0x4f9d0133, data starts at 0x036a08, start checking from 0x03738c - 2436 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70a20 (v 83, 0x4f000-0x50000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x4f000-0x50000 @0x00037348 on flash, newfrag *01e5e8b8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x4e000-0x4f000, phys offs 0x0368e0
[JFFS2 DBG] (1) check_node_data: check node at 0x0368e0, data length 2595, partial CRC 0x000000, correct CRC 0xe3730aaf, data starts at 0x035f01, start checking from 0x036924 - 2595 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70980 (v 82, 0x4e000-0x4f000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x4e000-0x4f000 @0x000368e0 on flash, newfrag *01e5e8d0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "iptunnel", ino #157
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1f9c(0).
[JFFS2 DBG] (1) check_tn_node: check node 0x4d000-0x4e000, phys offs 0x035f80
[JFFS2 DBG] (1) check_node_data: check node at 0x035f80, data length 2331, partial CRC 0x000000, correct CRC 0xec785836, data starts at 0x0356a9, start checking from 0x035fc4 - 2331 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e708c0 (v 81, 0x4d000-0x4e000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x4d000-0x4e000 @0x00035f80 on flash, newfrag *01e5e8e8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x4c000-0x4d000, phys offs 0x035584
[JFFS2 DBG] (1) check_node_data: check node at 0x035584, data length 2488, partial CRC 0x000000, correct CRC 0x58b561bb, data starts at 0x034c10, start checking from 0x0355c8 - 2488 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70940 (v 80, 0x4c000-0x4d000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x4c000-0x4d000 @0x00035584 on flash, newfrag *01e5e900
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x4b000-0x4c000, phys offs 0x034a54
[JFFS2 DBG] (1) check_node_data: check node at 0x034a54, data length 2793, partial CRC 0x000000, correct CRC 0x317ab2bf, data starts at 0x033faf, start checking from 0x034a98 - 2793 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70920 (v 79, 0x4b000-0x4c000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x4b000-0x4c000 @0x00034a54 on flash, newfrag *01e5e918
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "iprule", ino #156
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x4a000-0x4b000, phys offs 0x033fac
[JFFS2 DBG] (1) check_node_data: check node at 0x033fac, data length 2660, partial CRC 0x000000, correct CRC 0x88943bae, data starts at 0x03358c, start checking from 0x033ff0 - 2660 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70720 (v 78, 0x4a000-0x4b000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x4a000-0x4b000 @0x00033fac on flash, newfrag *01e5e930
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1f18(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x494cc-0x4a000, phys offs 0x033804
[JFFS2 DBG] (1) check_node_data: check node at 0x033804, data length 1891, partial CRC 0x000000, correct CRC 0x17336b21, data starts at 0x0330e5, start checking from 0x033848 - 1891 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e706c0 (v 77, 0x494cc-0x4a000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x494cc-0x4a000 @0x00033804 on flash, newfrag *01e5e948
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x49000-0x494cc, phys offs 0x033440
[JFFS2 DBG] (1) check_node_data: check node at 0x033440, data length 896, partial CRC 0x000000, correct CRC 0x6eae1e42, data starts at 0x033104, start checking from 0x033484 - 896 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "iproute", ino #155
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e707e0 (v 76, 0x49000-0x494cc, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x49000-0x494cc @0x00033440 on flash, newfrag *01e5e960
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x48000-0x49000, phys offs 0x032924
[JFFS2 DBG] (1) check_node_data: check node at 0x032924, data length 2773, partial CRC 0x000000, correct CRC 0x59f8e389, data starts at 0x031e93, start checking from 0x032968 - 2773 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e707c0 (v 75, 0x48000-0x49000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1e94(0).
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x48000-0x49000 @0x00032924 on flash, newfrag *01e5e978
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x47000-0x48000, phys offs 0x031de4
[JFFS2 DBG] (1) check_node_data: check node at 0x031de4, data length 2812, partial CRC 0x000000, correct CRC 0x5da5f846, data starts at 0x03132c, start checking from 0x031e28 - 2812 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70740 (v 74, 0x47000-0x48000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x47000-0x48000 @0x00031de4 on flash, newfrag *01e5e990
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x46000-0x47000, phys offs 0x03139c
[JFFS2 DBG] (1) check_node_data: check node at 0x03139c, data length 2563, partial CRC 0x000000, correct CRC 0x7328d2e3, data starts at 0x0309dd, start checking from 0x0313e0 - 2563 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "iplink", ino #154
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70700 (v 73, 0x46000-0x47000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x46000-0x47000 @0x0003139c on flash, newfrag *01e5e9a8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x45000-0x46000, phys offs 0x030a4c
[JFFS2 DBG] (1) check_node_data: check node at 0x030a4c, data length 2315, partial CRC 0x000000, correct CRC 0x9aa10f3c, data starts at 0x030185, start checking from 0x030a90 - 2315 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1e10(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70820 (v 72, 0x45000-0x46000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x45000-0x46000 @0x00030a4c on flash, newfrag *01e5e9c0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x44000-0x45000, phys offs 0x030000
[JFFS2 DBG] (1) check_node_data: check node at 0x030000, data length 2567, partial CRC 0x000000, correct CRC 0x5ff6cf28, data starts at 0x02f63d, start checking from 0x030044 - 2567 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70680 (v 71, 0x44000-0x45000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x44000-0x45000 @0x00030000 on flash, newfrag *01e5e9d8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x43000-0x44000, phys offs 0x02e1a4
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ipaddr", ino #153
[JFFS2 DBG] (1) check_node_data: check node at 0x02e1a4, data length 2469, partial CRC 0x000000, correct CRC 0x42ac50e4, data starts at 0x02d843, start checking from 0x02e1e8 - 2469 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e706a0 (v 70, 0x43000-0x44000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x43000-0x44000 @0x0002e1a4 on flash, newfrag *01e5e9f0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x42000-0x43000, phys offs 0x02d730
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1d90(0).
[JFFS2 DBG] (1) check_node_data: check node at 0x02d730, data length 2608, partial CRC 0x000000, correct CRC 0x118611f4, data starts at 0x02cd44, start checking from 0x02d774 - 2608 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e705c0 (v 69, 0x42000-0x43000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x42000-0x43000 @0x0002d730 on flash, newfrag *01e5ea08
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x41000-0x42000, phys offs 0x02cc4c
[JFFS2 DBG] (1) check_node_data: check node at 0x02cc4c, data length 2720, partial CRC 0x000000, correct CRC 0x58a560ce, data starts at 0x02c1f0, start checking from 0x02cc90 - 2720 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ip", ino #152
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e705e0 (v 68, 0x41000-0x42000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x41000-0x42000 @0x0002cc4c on flash, newfrag *01e5ea20
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x40000-0x41000, phys offs 0x02c18c
[JFFS2 DBG] (1) check_node_data: check node at 0x02c18c, data length 2682, partial CRC 0x000000, correct CRC 0x83529471, data starts at 0x02b756, start checking from 0x02c1d0 - 2682 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1d0c(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e705a0 (v 67, 0x40000-0x41000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x40000-0x41000 @0x0002c18c on flash, newfrag *01e5ea38
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x3f000-0x40000, phys offs 0x02b6cc
[JFFS2 DBG] (1) check_node_data: check node at 0x02b6cc, data length 2683, partial CRC 0x000000, correct CRC 0x54bd9c40, data starts at 0x02ac95, start checking from 0x02b710 - 2683 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e704e0 (v 66, 0x3f000-0x40000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x3f000-0x40000 @0x0002b6cc on flash, newfrag *01e5ea50
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "insmod", ino #151
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1c8c(0).
[JFFS2 DBG] (1) check_tn_node: check node 0x3e000-0x3f000, phys offs 0x02ab90
[JFFS2 DBG] (1) check_node_data: check node at 0x02ab90, data length 2808, partial CRC 0x000000, correct CRC 0x6359d708, data starts at 0x02a0dc, start checking from 0x02abd4 - 2808 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70580 (v 65, 0x3e000-0x3f000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x3e000-0x3f000 @0x0002ab90 on flash, newfrag *01e5ea68
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x3d000-0x3e000, phys offs 0x02a0c0
[JFFS2 DBG] (1) check_node_data: check node at 0x02a0c0, data length 2700, partial CRC 0x000000, correct CRC 0x11290290, data starts at 0x029678, start checking from 0x02a104 - 2700 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70520 (v 64, 0x3d000-0x3e000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x3d000-0x3e000 @0x0002a0c0 on flash, newfrag *01e5ea80
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x3c000-0x3d000, phys offs 0x029580
[JFFS2 DBG] (1) check_node_data: check node at 0x029580, data length 2810, partial CRC 0x000000, correct CRC 0xb17394b4, data starts at 0x028aca, start checking from 0x0295c4 - 2810 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "init", ino #150
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70500 (v 63, 0x3c000-0x3d000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x3c000-0x3d000 @0x00029580 on flash, newfrag *01e5ea98
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x3b000-0x3c000, phys offs 0x028ae8
[JFFS2 DBG] (1) check_node_data: check node at 0x028ae8, data length 2644, partial CRC 0x000000, correct CRC 0xe782946b, data starts at 0x0280d8, start checking from 0x028b2c - 2644 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1c0c(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70540 (v 62, 0x3b000-0x3c000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x3b000-0x3c000 @0x00028ae8 on flash, newfrag *01e5eab0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x3a000-0x3b000, phys offs 0x0280ac
[JFFS2 DBG] (1) check_node_data: check node at 0x0280ac, data length 2549, partial CRC 0x000000, correct CRC 0x824aea6e, data starts at 0x0276fb, start checking from 0x0280f0 - 2549 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e704c0 (v 61, 0x3a000-0x3b000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x3a000-0x3b000 @0x000280ac on flash, newfrag *01e5eac8
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ifup", ino #149
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x39000-0x3a000, phys offs 0x0275a4
[JFFS2 DBG] (1) check_node_data: check node at 0x0275a4, data length 2756, partial CRC 0x000000, correct CRC 0x2baa88ac, data starts at 0x026b24, start checking from 0x0275e8 - 2756 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e704a0 (v 60, 0x39000-0x3a000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1b88(0).
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x39000-0x3a000 @0x000275a4 on flash, newfrag *01e5eae0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x38000-0x39000, phys offs 0x026b30
[JFFS2 DBG] (1) check_node_data: check node at 0x026b30, data length 2605, partial CRC 0x000000, correct CRC 0xdf795550, data starts at 0x026147, start checking from 0x026b74 - 2605 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70480 (v 59, 0x38000-0x39000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x38000-0x39000 @0x00026b30 on flash, newfrag *01e5eaf8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x37000-0x38000, phys offs 0x026094
[JFFS2 DBG] (1) check_node_data: check node at 0x026094, data length 2648, partial CRC 0x000000, correct CRC 0x6f0165fd, data starts at 0x025680, start checking from 0x0260d8 - 2648 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ifdown", ino #148
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1b04(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e709a0 (v 58, 0x37000-0x38000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x37000-0x38000 @0x00026094 on flash, newfrag *01e5eb10
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x36000-0x37000, phys offs 0x0256a0
[JFFS2 DBG] (1) check_node_data: check node at 0x0256a0, data length 2478, partial CRC 0x000000, correct CRC 0x4a022a0d, data starts at 0x024d36, start checking from 0x0256e4 - 2478 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70560 (v 57, 0x36000-0x37000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x36000-0x37000 @0x000256a0 on flash, newfrag *01e5eb28
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x35000-0x36000, phys offs 0x024b3c
[JFFS2 DBG] (1) check_node_data: check node at 0x024b3c, data length 2848, partial CRC 0x000000, correct CRC 0x2dd566af, data starts at 0x024060, start checking from 0x024b80 - 2848 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ifconfig", ino #147
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1a80(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70420 (v 56, 0x35000-0x36000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x35000-0x36000 @0x00024b3c on flash, newfrag *01e5eb40
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x34000-0x35000, phys offs 0x024090
[JFFS2 DBG] (1) check_node_data: check node at 0x024090, data length 2663, partial CRC 0x000000, correct CRC 0xf53285d7, data starts at 0x02366d, start checking from 0x0240d4 - 2663 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70460 (v 55, 0x34000-0x35000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x34000-0x35000 @0x00024090 on flash, newfrag *01e5eb58
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x33000-0x34000, phys offs 0x0235c4
[JFFS2 DBG] (1) check_node_data: check node at 0x0235c4, data length 2696, partial CRC 0x000000, correct CRC 0xd0668bd9, data starts at 0x022b80, start checking from 0x023608 - 2696 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70440 (v 54, 0x33000-0x34000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x33000-0x34000 @0x000235c4 on flash, newfrag *01e5eb70
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x32000-0x33000, phys offs 0x022b14
[JFFS2 DBG] (1) check_node_data: check node at 0x022b14, data length 2668, partial CRC 0x000000, correct CRC 0xb11e6e83, data starts at 0x0220ec, start checking from 0x022b58 - 2668 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "hwclock", ino #146
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70360 (v 53, 0x32000-0x33000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x32000-0x33000 @0x00022b14 on flash, newfrag *01e5eb88
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x31537-0x32000, phys offs 0x022398
[JFFS2 DBG] (1) check_node_data: check node at 0x022398, data length 1847, partial CRC 0x000000, correct CRC 0xf52f0898, data starts at 0x021ca5, start checking from 0x0223dc - 1847 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70080 (v 52, 0x31537-0x32000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b19fc(0).
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x31537-0x32000 @0x00022398 on flash, newfrag *01e5eba0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x31000-0x31537, phys offs 0x021f7c
[JFFS2 DBG] (1) check_node_data: check node at 0x021f7c, data length 984, partial CRC 0x000000, correct CRC 0xca248892, data starts at 0x021be8, start checking from 0x021fc0 - 984 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70020 (v 51, 0x31000-0x31537, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x31000-0x31537 @0x00021f7c on flash, newfrag *01e5ebb8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x30000-0x31000, phys offs 0x0214a0
[JFFS2 DBG] (1) check_node_data: check node at 0x0214a0, data length 2711, partial CRC 0x000000, correct CRC 0xaf4edfce, data starts at 0x020a4d, start checking from 0x0214e4 - 2711 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "hdparm", ino #145
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70120 (v 50, 0x30000-0x31000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x30000-0x31000 @0x000214a0 on flash, newfrag *01e5ebd0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x2f000-0x30000, phys offs 0x020aec
[JFFS2 DBG] (1) check_node_data: check node at 0x020aec, data length 2414, partial CRC 0x000000, correct CRC 0x8e516bf, data starts at 0x0201c2, start checking from 0x020b30 - 2414 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b197c(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70240 (v 49, 0x2f000-0x30000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x2f000-0x30000 @0x00020aec on flash, newfrag *01e5ebe8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x2e000-0x2f000, phys offs 0x020000
[JFFS2 DBG] (1) check_node_data: check node at 0x020000, data length 2727, partial CRC 0x000000, correct CRC 0x39777173, data starts at 0x01f59d, start checking from 0x020044 - 2727 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e703e0 (v 48, 0x2e000-0x2f000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x2e000-0x2f000 @0x00020000 on flash, newfrag *01e5ec00
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x2d000-0x2e000, phys offs 0x01e368
[JFFS2 DBG] (1) check_node_data: check node at 0x01e368, data length 2738, partial CRC 0x000000, correct CRC 0xce1ccb48, data starts at 0x01d8fa, start checking from 0x01e3ac - 2738 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "halt", ino #144
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70380 (v 47, 0x2d000-0x2e000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x2d000-0x2e000 @0x0001e368 on flash, newfrag *01e5ec18
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x2c000-0x2d000, phys offs 0x01d8f8
[JFFS2 DBG] (1) check_node_data: check node at 0x01d8f8, data length 2604, partial CRC 0x000000, correct CRC 0xb1b18aa0, data starts at 0x01cf10, start checking from 0x01d93c - 2604 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b18f8(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70320 (v 46, 0x2c000-0x2d000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x2c000-0x2d000 @0x0001d8f8 on flash, newfrag *01e5ec30
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x2b000-0x2c000, phys offs 0x01ce08
[JFFS2 DBG] (1) check_node_data: check node at 0x01ce08, data length 2730, partial CRC 0x000000, correct CRC 0xf5322350, data starts at 0x01c3a2, start checking from 0x01ce4c - 2730 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70280 (v 45, 0x2b000-0x2c000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x2b000-0x2c000 @0x0001ce08 on flash, newfrag *01e5ec48
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x2a000-0x2b000, phys offs 0x01c2c8
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "getty", ino #143
[JFFS2 DBG] (1) check_node_data: check node at 0x01c2c8, data length 2810, partial CRC 0x000000, correct CRC 0xa4e2d7ac, data starts at 0x01b812, start checking from 0x01c30c - 2810 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70200 (v 44, 0x2a000-0x2b000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x2a000-0x2b000 @0x0001c2c8 on flash, newfrag *01e5ec60
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x29000-0x2a000, phys offs 0x01b92c
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b1878(0).
[JFFS2 DBG] (1) check_node_data: check node at 0x01b92c, data length 2390, partial CRC 0x000000, correct CRC 0x8cf4407f, data starts at 0x01b01a, start checking from 0x01b970 - 2390 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70160 (v 43, 0x29000-0x2a000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x29000-0x2a000 @0x0001b92c on flash, newfrag *01e5ec78
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x28000-0x29000, phys offs 0x01aff0
[JFFS2 DBG] (1) check_node_data: check node at 0x01aff0, data length 2294, partial CRC 0x000000, correct CRC 0xdc7a4c48, data starts at 0x01a73e, start checking from 0x01b034 - 2294 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e700c0 (v 42, 0x28000-0x29000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x28000-0x29000 @0x0001aff0 on flash, newfrag *01e5ec90
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x27000-0x28000, phys offs 0x01a54c
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "fsck", ino #142
[JFFS2 DBG] (1) check_node_data: check node at 0x01a54c, data length 2653, partial CRC 0x000000, correct CRC 0xea6707f6, data starts at 0x019b33, start checking from 0x01a590 - 2653 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70060 (v 41, 0x27000-0x28000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x27000-0x28000 @0x0001a54c on flash, newfrag *01e5eca8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b17f0(0).
[JFFS2 DBG] (1) check_tn_node: check node 0x26000-0x27000, phys offs 0x019a30
[JFFS2 DBG] (1) check_node_data: check node at 0x019a30, data length 2774, partial CRC 0x000000, correct CRC 0xa5c0a0c3, data starts at 0x018f9e, start checking from 0x019a74 - 2774 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70040 (v 40, 0x26000-0x27000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x26000-0x27000 @0x00019a30 on flash, newfrag *01e5ecc0
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "freeramdisk", ino #141
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x25000-0x26000, phys offs 0x018f94
[JFFS2 DBG] (1) check_node_data: check node at 0x018f94, data length 2645, partial CRC 0x000000, correct CRC 0xfb3558b6, data starts at 0x018583, start checking from 0x018fd8 - 2645 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70400 (v 39, 0x25000-0x26000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x25000-0x26000 @0x00018f94 on flash, newfrag *01e5ecd8
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b176c(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x24000-0x25000, phys offs 0x018468
[JFFS2 DBG] (1) check_node_data: check node at 0x018468, data length 2792, partial CRC 0x000000, correct CRC 0x271437f3, data starts at 0x0179c4, start checking from 0x0184ac - 2792 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70340 (v 38, 0x24000-0x25000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x24000-0x25000 @0x00018468 on flash, newfrag *01e5ecf0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x23000-0x24000, phys offs 0x0179cc
[JFFS2 DBG] (1) check_node_data: check node at 0x0179cc, data length 2647, partial CRC 0x000000, correct CRC 0xc158cbf6, data starts at 0x016fb9, start checking from 0x017a10 - 2647 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "devmem", ino #140
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0b16e8(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e702e0 (v 37, 0x23000-0x24000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x23000-0x24000 @0x000179cc on flash, newfrag *01e5ed08
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x22000-0x23000, phys offs 0x016ef4
[JFFS2 DBG] (1) check_node_data: check node at 0x016ef4, data length 2705, partial CRC 0x000000, correct CRC 0xb702d07, data starts at 0x0164a7, start checking from 0x016f38 - 2705 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e702a0 (v 36, 0x22000-0x23000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x22000-0x23000 @0x00016ef4 on flash, newfrag *01e5ed20
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x21000-0x22000, phys offs 0x016604
[JFFS2 DBG] (1) check_node_data: check node at 0x016604, data length 2219, partial CRC 0x000000, correct CRC 0x5f30ba58, data starts at 0x015d9d, start checking from 0x016648 - 2219 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e703a0 (v 35, 0x21000-0x22000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x21000-0x22000 @0x00016604 on flash, newfrag *01e5ed38
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "blkid", ino #139
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x20000-0x21000, phys offs 0x015d04
[JFFS2 DBG] (1) check_node_data: check node at 0x015d04, data length 2233, partial CRC 0x000000, correct CRC 0x65dad89, data starts at 0x01548f, start checking from 0x015d48 - 2233 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70180 (v 34, 0x20000-0x21000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x20000-0x21000 @0x00015d04 on flash, newfrag *01e5ed50
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0005fc(0).
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x1f000-0x20000, phys offs 0x01529c
[JFFS2 DBG] (1) check_node_data: check node at 0x01529c, data length 2594, partial CRC 0x000000, correct CRC 0x18697eb1, data starts at 0x0148be, start checking from 0x0152e0 - 2594 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70140 (v 33, 0x1f000-0x20000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x1f000-0x20000 @0x0001529c on flash, newfrag *01e5ed68
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) check_tn_node: check node 0x1e000-0x1f000, phys offs 0x0147f0
[JFFS2 DBG] (1) check_node_data: check node at 0x0147f0, data length 2662, partial CRC 0x000000, correct CRC 0x3869674c, data starts at 0x013dce, start checking from 0x014834 - 2662 bytes.
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e700a0 (v 32, 0x1e000-0x1f000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x1e000-0x1f000 @0x000147f0 on flash, newfrag *01e5ed80
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x1d000-0x1e000, phys offs 0x013ee0
[JFFS2 DBG] (1) check_node_data: check node at 0x013ee0, data length 2251, partial CRC 0x000000, correct CRC 0x54087b9c, data starts at 0x013659, start checking from 0x013f24 - 2251 bytes.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 000005fc
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70300 (v 31, 0x1d000-0x1e000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x1d000-0x1e000 @0x00013ee0 on flash, newfrag *01e5ed98
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x1c000-0x1d000, phys offs 0x0133c4
[JFFS2 DBG] (1) check_node_data: check node at 0x0133c4, data length 2775, partial CRC 0x000000, correct CRC 0x6bf6dd12, data starts at 0x012931, start checking from 0x013408 - 2775 bytes.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70220 (v 30, 0x1c000-0x1d000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x1c000-0x1d000 @0x000133c4 on flash, newfrag *01e5edb0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x1b000-0x1c000, phys offs 0x0128dc
[JFFS2 DBG] (1) check_node_data: check node at 0x0128dc, data length 2723, partial CRC 0x000000, correct CRC 0x62e32111, data starts at 0x011e7d, start checking from 0x012920 - 2723 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #15 were read, the highest version is 184, latest_mctime 1385610024, mctime_ver 184.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e701c0 (v 29, 0x1b000-0x1c000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x1b000-0x1c000 @0x000128dc on flash, newfrag *01e5edc8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x1a000-0x1b000, phys offs 0x011e6c
[JFFS2 DBG] (1) check_node_data: check node at 0x011e6c, data length 2602, partial CRC 0x000000, correct CRC 0xc645a349, data starts at 0x011486, start checking from 0x011eb0 - 2602 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e702c0 (v 28, 0x1a000-0x1b000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x1a000-0x1b000 @0x00011e6c on flash, newfrag *01e5ede0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x19000-0x1a000, phys offs 0x011470
[JFFS2 DBG] (1) check_node_data: check node at 0x011470, data length 2485, partial CRC 0x000000, correct CRC 0x112753ec, data starts at 0x010aff, start checking from 0x0114b4 - 2485 bytes.
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e775c0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70260 (v 27, 0x19000-0x1a000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x19000-0x1a000 @0x00011470 on flash, newfrag *01e5edf8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x18cc0-0x19000, phys offs 0x0111fc
[JFFS2 DBG] (1) check_node_data: check node at 0x0111fc, data length 557, partial CRC 0x000000, correct CRC 0xae35b7f4, data starts at 0x011013, start checking from 0x011240 - 557 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e701e0 (v 26, 0x18cc0-0x19000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x18cc0-0x19000 @0x000111fc on flash, newfrag *01e5ee10
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x18000-0x18cc0, phys offs 0x0109e8
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #16 pino/nlink is 1
[JFFS2 DBG] (1) check_node_data: check node at 0x0109e8, data length 1999, partial CRC 0x000000, correct CRC 0xb4d09f2d, data starts at 0x01025d, start checking from 0x010a2c - 1999 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e701a0 (v 25, 0x18000-0x18cc0, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x18000-0x18cc0 @0x000109e8 on flash, newfrag *01e5ee28
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x17000-0x18000, phys offs 0x010000
[JFFS2 DBG] (1) check_node_data: check node at 0x010000, data length 2466, partial CRC 0x000000, correct CRC 0x289e3f65, data starts at 0x00f6a2, start checking from 0x010044 - 2466 bytes.
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #16
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x00066c(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70100 (v 24, 0x17000-0x18000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x17000-0x18000 @0x00010000 on flash, newfrag *01e5ee40
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x16000-0x17000, phys offs 0x00e32c
[JFFS2 DBG] (1) check_node_data: check node at 0x00e32c, data length 2702, partial CRC 0x000000, correct CRC 0x5d955a05, data starts at 0x00d8e2, start checking from 0x00e370 - 2702 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e700e0 (v 23, 0x16000-0x17000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x16000-0x17000 @0x0000e32c on flash, newfrag *01e5ee58
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) check_tn_node: check node 0x15000-0x16000, phys offs 0x00d95c
[JFFS2 DBG] (1) check_node_data: check node at 0x00d95c, data length 2441, partial CRC 0x000000, correct CRC 0x6ee389e5, data starts at 0x00d017, start checking from 0x00d9a0 - 2441 bytes.
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e70000 (v 22, 0x15000-0x16000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x15000-0x16000 @0x0000d95c on flash, newfrag *01e5ee70
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x14000-0x15000, phys offs 0x00d0f0
[JFFS2 DBG] (1) check_node_data: check node at 0x00d0f0, data length 2085, partial CRC 0x000000, correct CRC 0xdc28f70e, data starts at 0x00c90f, start checking from 0x00d134 - 2085 bytes.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 0000066c
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39940 (v 21, 0x14000-0x15000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x14000-0x15000 @0x0000d0f0 on flash, newfrag *01e5ee88
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x13000-0x14000, phys offs 0x00c5e8
[JFFS2 DBG] (1) check_node_data: check node at 0x00c5e8, data length 2755, partial CRC 0x000000, correct CRC 0xcb19b040, data starts at 0x00bb69, start checking from 0x00c62c - 2755 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39fe0 (v 20, 0x13000-0x14000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x13000-0x14000 @0x0000c5e8 on flash, newfrag *01e5eea0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x12000-0x13000, phys offs 0x00bb00
[JFFS2 DBG] (1) check_node_data: check node at 0x00bb00, data length 2721, partial CRC 0x000000, correct CRC 0xf3b46e04, data starts at 0x00b0a3, start checking from 0x00bb44 - 2721 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39b40 (v 19, 0x12000-0x13000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #16 were read, the highest version is 1, latest_mctime 0, mctime_ver 0.
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x12000-0x13000 @0x0000bb00 on flash, newfrag *01e5eeb8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x11000-0x12000, phys offs 0x00b070
[JFFS2 DBG] (1) check_node_data: check node at 0x00b070, data length 2633, partial CRC 0x000000, correct CRC 0x6b77c758, data starts at 0x00a66b, start checking from 0x00b0b4 - 2633 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39a40 (v 18, 0x11000-0x12000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x11000-0x12000 @0x0000b070 on flash, newfrag *01e5eed0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x10000-0x11000, phys offs 0x00a5ec
[JFFS2 DBG] (1) check_node_data: check node at 0x00a5ec, data length 2624, partial CRC 0x000000, correct CRC 0x70546a0b, data starts at 0x009bf0, start checking from 0x00a630 - 2624 bytes.
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e771e0
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39aa0 (v 17, 0x10000-0x11000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x10000-0x11000 @0x0000a5ec on flash, newfrag *01e5eee8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xf000-0x10000, phys offs 0x009bd4
[JFFS2 DBG] (1) check_node_data: check node at 0x009bd4, data length 2514, partial CRC 0x000000, correct CRC 0xe737e6bb, data starts at 0x009246, start checking from 0x009c18 - 2514 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e39d40 (v 16, 0xf000-0x10000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xf000-0x10000 @0x00009bd4 on flash, newfrag *01e5ef00
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #17 pino/nlink is 1
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xe000-0xf000, phys offs 0x00914c
[JFFS2 DBG] (1) check_node_data: check node at 0x00914c, data length 2626, partial CRC 0x000000, correct CRC 0x101ef661, data starts at 0x00874e, start checking from 0x009190 - 2626 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e74f80 (v 15, 0xe000-0xf000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xe000-0xf000 @0x0000914c on flash, newfrag *01e5ef18
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #17
[JFFS2 DBG] (1) check_tn_node: check node 0xd000-0xe000, phys offs 0x008690
[JFFS2 DBG] (1) check_node_data: check node at 0x008690, data length 2679, partial CRC 0x000000, correct CRC 0x835d9600, data starts at 0x007c5d, start checking from 0x0086d4 - 2679 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e74fa0 (v 14, 0xd000-0xe000, ov 0) to fragtree
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c9050(0).
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xd000-0xe000 @0x00008690 on flash, newfrag *01e5ef30
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xc000-0xd000, phys offs 0x007b88
[JFFS2 DBG] (1) check_node_data: check node at 0x007b88, data length 2756, partial CRC 0x000000, correct CRC 0xbf919b9c, data starts at 0x007108, start checking from 0x007bcc - 2756 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e703c0 (v 13, 0xc000-0xd000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xc000-0xd000 @0x00007b88 on flash, newfrag *01e5ef48
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xb000-0xc000, phys offs 0x0072f0
[JFFS2 DBG] (1) check_node_data: check node at 0x0072f0, data length 2129, partial CRC 0x000000, correct CRC 0x3741f2a, data starts at 0x006ae3, start checking from 0x007334 - 2129 bytes.
[JFFS2 DBG] (38) jffs2_add_fd_to_list: add dirent "ldconfig", ino #187
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0006dc(0).
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77000 (v 12, 0xb000-0xc000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xb000-0xc000 @0x000072f0 on flash, newfrag *01e5ef60
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0xa000-0xb000, phys offs 0x006884
[JFFS2 DBG] (1) check_node_data: check node at 0x006884, data length 2597, partial CRC 0x000000, correct CRC 0xbd0936c7, data starts at 0x005ea3, start checking from 0x0068c8 - 2597 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77020 (v 11, 0xa000-0xb000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0xa000-0xb000 @0x00006884 on flash, newfrag *01e5ef78
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x9000-0xa000, phys offs 0x005df0
[JFFS2 DBG] (1) check_node_data: check node at 0x005df0, data length 2637, partial CRC 0x000000, correct CRC 0xdc26f81e, data starts at 0x0053e7, start checking from 0x005e34 - 2637 bytes.
[JFFS2 DBG] (38) read_more: read more 28 bytes
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77040 (v 10, 0x9000-0xa000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x9000-0xa000 @0x00005df0 on flash, newfrag *01e5ef90
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x8000-0x9000, phys offs 0x005360
[JFFS2 DBG] (1) check_node_data: check node at 0x005360, data length 2633, partial CRC 0x000000, correct CRC 0x3e017d08, data starts at 0x00495b, start checking from 0x0053a4 - 2633 bytes.
[JFFS2 DBG] (38) read_dnode: the node has no data.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77060 (v 9, 0x8000-0x9000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x8000-0x9000 @0x00005360 on flash, newfrag *01e5efa8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x7000-0x8000, phys offs 0x0048fc
[JFFS2 DBG] (1) check_node_data: check node at 0x0048fc, data length 2590, partial CRC 0x000000, correct CRC 0xcd2944dd, data starts at 0x003f22, start checking from 0x004940 - 2590 bytes.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: insert fragment 0x00-0x00, ver 1 at 000006dc
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77080 (v 8, 0x7000-0x8000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x7000-0x8000 @0x000048fc on flash, newfrag *01e5efc0
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x6000-0x7000, phys offs 0x003e58
[JFFS2 DBG] (1) check_node_data: check node at 0x003e58, data length 2653, partial CRC 0x000000, correct CRC 0x1a12a354, data starts at 0x00343f, start checking from 0x003e9c - 2653 bytes.
[JFFS2 DBG] (38) jffs2_add_tn_to_tree: keep new mdata with ver 1
[JFFS2 DBG] (38) jffs2_get_inode_nodes: nodes of inode #17 were read, the highest version is 185, latest_mctime 1386548272, mctime_ver 185.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e770a0 (v 7, 0x6000-0x7000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x6000-0x7000 @0x00003e58 on flash, newfrag *01e5efd8
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x5000-0x6000, phys offs 0x003494
[JFFS2 DBG] (1) check_node_data: check node at 0x003494, data length 2431, partial CRC 0x000000, correct CRC 0x92aeb9c4, data starts at 0x002b59, start checking from 0x0034d8 - 2431 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e770c0 (v 6, 0x5000-0x6000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x5000-0x6000 @0x00003494 on flash, newfrag *01e5f000
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x4000-0x5000, phys offs 0x002d20
[JFFS2 DBG] (1) check_node_data: check node at 0x002d20, data length 1839, partial CRC 0x000000, correct CRC 0x9a3ae47c, data starts at 0x002635, start checking from 0x002d64 - 1839 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e770e0 (v 5, 0x4000-0x5000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x4000-0x5000 @0x00002d20 on flash, newfrag *01e5f018
[JFFS2 DBG] (38) jffs2_build_inode_fragtree: potential mdata is ver 1 at 01e77040
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x3000-0x4000, phys offs 0x00269c
[JFFS2 DBG] (1) check_node_data: check node at 0x00269c, data length 1600, partial CRC 0x000000, correct CRC 0xf638dee4, data starts at 0x0020a0, start checking from 0x0026e0 - 1600 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77100 (v 4, 0x3000-0x4000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x3000-0x4000 @0x0000269c on flash, newfrag *01e5f030
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (1) check_tn_node: check node 0x2000-0x3000, phys offs 0x001cb8
[JFFS2 DBG] (1) check_node_data: check node at 0x001cb8, data length 2464, partial CRC 0x000000, correct CRC 0x4c0f8469, data starts at 0x00135c, start checking from 0x001cfc - 2464 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77120 (v 3, 0x2000-0x3000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x2000-0x3000 @0x00001cb8 on flash, newfrag *01e5f048
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) jffs2_do_read_inode_internal: ino #18 pino/nlink is 1
[JFFS2 DBG] (1) check_tn_node: check node 0x1000-0x2000, phys offs 0x00124c
[JFFS2 DBG] (1) check_node_data: check node at 0x00124c, data length 2600, partial CRC 0x000000, correct CRC 0xefad8b2, data starts at 0x000868, start checking from 0x001290 - 2600 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77140 (v 2, 0x1000-0x2000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x1000-0x2000 @0x0000124c on flash, newfrag *01e5f060
[JFFS2 DBG] (1) ver_insert: Link new node at 01c35c9c (root is 01c35c9c)
[JFFS2 DBG] (38) jffs2_get_inode_nodes: ino #18
[JFFS2 DBG] (38) jffs2_get_inode_nodes: read 40 bytes at 0x0c9328(0).
[JFFS2 DBG] (1) check_tn_node: check node 0x00-0x1000, phys offs 0x000830
[JFFS2 DBG] (1) check_node_data: check node at 0x000830, data length 2520, partial CRC 0x000000, correct CRC 0x67be30ff, data starts at 0xfffffe9c, start checking from 0x000874 - 2520 bytes.
[JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77160 (v 1, 0x0-0x1000, ov 0) to fragtree
[JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x00-0x1000 @0x00000830 on flash, newfrag *01e5f078
[JFFS2 DBG] (1) jffs2_truncate_fragtree: truncating fragtree to 0x000b9dc4 bytes

Then my debug code shows it hangs at below while loop: (fs/jffs2/compr_zlib.c)
while((ret = zlib_inflate(&inf_strm, Z_FINISH)) == Z_OK)
	;

Thanks for any comments and advices.

Regards,
Axel
