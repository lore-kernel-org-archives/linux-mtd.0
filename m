Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16RbxC-0000t1-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 16:33:22 +0000
Message-ID: <3C48504B.68F8FE7F@comdev.cc>
Date: Fri, 18 Jan 2002 08:41:47 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
CC: ateam@comdev.cc
Subject: need help interpreting debug output from JFFS2
References: <20020118010528.A22777@swing.comdev.cc>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Still tracking problems.  I've set JFFS2 debug level to 1.
Does the output below indicate any horrible evil bugginess or
unrecoverableness?
Or is it just normal chatty debugging spew?

--Adam

XXXXXXXXX wrote:
> 
> APC was in bad state. Pingable but not logintoable. Here was the
> serial console debug
> 
> # sync
> jffs2_lookup()
> jffs2_lookup()
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 162
> jffs2_do_read_inode(): ino #162 nlink is 1
> jffs2_get_inode_nodes(): ino #162
> Node at 00080254 is a data node
> version 1, highest_version now 1
> dnode @00080254: ver 1, offset 0000, dsize 000c
> jffs2_add_full_dnode_to_inode(ino #162, f c324d5c0, fn c3f48e40)
> jffs2_read_inode() returning
> Node read from 00080254: node_crc 43769282, calculated CRC 43769282.
> dsize c, c0
> Node read from 00080254: node_crc 43769282, calculated CRC 43769282.
> dsize c, c0
> s# sync
> Node read from 00080254: node_crc 43769282, calculated CRC 43769282.
> dsize c, c0
> #
> #
> #
> #
> #
> # sync
> Node read from 00080254: node_crc 43769282, calculated CRC 43769282.
> dsize c, c0
> 
> # sync; reboot
> Node read from 00080254: node_crc 43769282, calculated CRC 43769282.
> dsize c, c0
> jffs2_lookup()
> jffs2_lookup()
> jffs2_lookup()
> jffs2_lookup()
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 365
> jffs2_do_read_inode(): ino #365 nlink is 1
> jffs2_get_inode_nodes(): ino #365
> Node at 008b16c0 is a data node
> version 1, highest_version now 1
> dnode @008b16c0: ver 1, offset 0000, dsize 000c
> jffs2_add_full_dnode_to_inode(ino #365, f c324d200, fn c3f48e30)
> jffs2_read_inode() returning
> Node read from 008b16c0: node_crc aee1ab3e, calculated CRC aee1ab3e.
> dsize c, c0
> Node read from 008b16c0: node_crc aee1ab3e, calculated CRC aee1ab3e.
> dsize c, c0
> 
> The system is going down NOW !!
> Sending SIGTERM to all processesjffs2_clear_inode(): ino #2993 mode
> 100000
> obliterating obsoleted node at 0x019bcfc8
> jffs2_reserve_space(): Requested 0x30 bytes
> jffs2_reserve_space(): alloc sem got
> jffs2_do_reserve_space(): Giving 0x3b330 bytes at 0x19c4cd0
> jffs2_write_dirent(ino #112, name at *0xc3844bfc "atd.pid"->ino #0,
> name_crc 0x)
> jffs2_add_physical_node_ref(): Node at 0x19c4cd0, size 0x30
> jffs2_complete_reservation()
> thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 70,
> dirty_size 0x46cc
> jffs2_add_fd_to_list( c3e8e360, c3c9d5dc (->c3e96520))
> Marking old dirent node (ino #2982) obsolete
> obliterating obsoleted node at 0x019af3d8
> Dirent "dhcpd.pid" (hash 0x10eb41ba, ino #2984
> Dirent "atd.pid" (hash 0xe6981d12, ino #0
> Dirent "sbusd.pid" (hash 0xea5a9fa8, ino #2987
> jffs2_clear_inode(): ino #2982 mode 100644
> obliterating obsoleted node at 0x019af408
> eth0: Promiscuous mode enabled.
> Terminated
> # jffs2_reserve_space(): Requested 0x34 bytes
> jffs2_reserve_space(): alloc sem got
> jffs2_do_reserve_space(): Giving 0x3b300 bytes at 0x19c4d00
> jffs2_write_dirent(ino #18, name at *0xc3c3bb3c "systemd.in"->ino #0,
> name_crc )
> jffs2_add_physical_node_ref(): Node at 0x19c4d00, size 0x34
> jffs2_complete_reservation()
> thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 70,
> dirty_size 0x4744
> jffs2_add_fd_to_list( c3e96620, c3ca9f1c (->c3e96660))
> Marking old dirent node (ino #2981) obsolete
> obliterating obsoleted node at 0x019af360
> Dirent "systemd.in" (hash 0x2bc0eb74, ino #0
> Dirent ".sysjournal" (hash 0x55ee7c4f, ino #2988
> Dirent "timezone18568.tmp" (hash 0x776fa589, ino #0
> Dirent ".sysalarm" (hash 0xfd250adc, ino #2978
> Sending SIGKILL to all processes.
> jffs2_clear_inode(): ino #2985 mode 100000
> obliterating obsoleted node at 0x019af79c
> jffs2_clear_inode(): ino #2979 mode 100000
> obliterating obsoleted node at 0x019af204
> jffs2_clear_inode(): ino #2981 mode 10644
> obliterating obsoleted node at 0x019af31c
> jffs2_garbage_collect_thread(): SIGKILL received.
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 182
> jffs2_do_read_inode(): ino #182 nlink is 1
> jffs2_get_inode_nodes(): ino #182
> Node at 000fe534 is a data node
> version 1, highest_version now 1
> dnode @000fe534: ver 1, offset 0000, dsize 000c
> jffs2_add_full_dnode_to_inode(ino #182, f c39af7a0, fn c3ec99a0)
> jffs2_read_inode() returning
> Node read from 000fe534: node_crc 99719a3f, calculated CRC 99719a3f.
> dsize c, c0
> jffs2_readdir() for dir_i #3
> Dirent 0: ".", ino #3
> Dirent 1: "..", ino #1
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 209
> jffs2_do_read_inode(): ino #209 nlink is 1
> jffs2_get_inode_nodes(): ino #209
> Node at 00120938 is a data node
> version 1, highest_version now 1
> dnode @00120938: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #209, f c3c02f00, fn c3ec9a00)
> Reading device numbers from flash
> Node read from 00120938: node_crc 71005e1e, calculated CRC 71005e1e.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 213
> jffs2_do_read_inode(): ino #213 nlink is 1
> jffs2_get_inode_nodes(): ino #213
> Node at 00120b14 is a data node
> version 1, highest_version now 1
> dnode @00120b14: ver 1, offset 0000, dsize 0004
> jffs2_add_full_dnode_to_inode(ino #213, f c3c02d20, fn c3ef7600)
> jffs2_read_inode() returning
> Node read from 00120b14: node_crc 235fd40c, calculated CRC 235fd40c.
> dsize 4, c0
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 205
> jffs2_do_read_inode(): ino #205 nlink is 1
> jffs2_get_inode_nodes(): ino #205
> Node at 00120768 is a data node
> version 1, highest_version now 1
> dnode @00120768: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #205, f c3c02960, fn c3edbda0)
> Reading device numbers from flash
> Node read from 00120768: node_crc d372441d, calculated CRC d372441d.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 210
> jffs2_do_read_inode(): ino #210 nlink is 1
> jffs2_get_inode_nodes(): ino #210
> Node at 001209ac is a data node
> version 1, highest_version now 1
> dnode @001209ac: ver 1, offset 0000, dsize 000d
> jffs2_add_full_dnode_to_inode(ino #210, f c3c02780, fn c3f45e30)
> jffs2_read_inode() returning
> Node read from 001209ac: node_crc afc4ef65, calculated CRC afc4ef65.
> dsize d, c0
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 238
> jffs2_do_read_inode(): ino #238 nlink is 1
> jffs2_get_inode_nodes(): ino #238
> Node at 001216bc is a data node
> version 1, highest_version now 1
> dnode @001216bc: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #238, f c38eef00, fn c3f48e20)
> Reading device numbers from flash
> Node read from 001216bc: node_crc c66d3e8a, calculated CRC c66d3e8a.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 239
> jffs2_do_read_inode(): ino #239 nlink is 1
> jffs2_get_inode_nodes(): ino #239
> Node at 00121730 is a data node
> version 1, highest_version now 1
> dnode @00121730: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #239, f c38eeb40, fn c3f48e10)
> Reading device numbers from flash
> Node read from 00121730: node_crc e2de107d, calculated CRC e2de107d.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 240
> jffs2_do_read_inode(): ino #240 nlink is 1
> jffs2_get_inode_nodes(): ino #240
> Node at 001217a4 is a data node
> version 1, highest_version now 1
> dnode @001217a4: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #240, f c38ee960, fn c3f48e00)
> Reading device numbers from flash
> Node read from 001217a4: node_crc 7338e416, calculated CRC 7338e416.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 241
> jffs2_do_read_inode(): ino #241 nlink is 1
> jffs2_get_inode_nodes(): ino #241
> Node at 00121818 is a data node
> version 1, highest_version now 1
> dnode @00121818: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #241, f c2c88700, fn c3f48df0)
> Reading device numbers from flash
> Node read from 00121818: node_crc 4ae2a5d5, calculated CRC 4ae2a5d5.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 214
> jffs2_do_read_inode(): ino #214 nlink is 1
> jffs2_get_inode_nodes(): ino #214
> Node at 00120b88 is a data node
> version 1, highest_version now 1
> dnode @00120b88: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #214, f c2ac9180, fn c3f48de0)
> Reading device numbers from flash
> Node read from 00120b88: node_crc c60971d6, calculated CRC c60971d6.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 208
> jffs2_do_read_inode(): ino #208 nlink is 1
> jffs2_get_inode_nodes(): ino #208
> Node at 001208c4 is a data node
> version 1, highest_version now 1
> dnode @001208c4: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #208, f c2ac9540, fn c3f48dd0)
> Reading device numbers from flash
> Node read from 001208c4: node_crc d2967652, calculated CRC d2967652.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 212
> jffs2_do_read_inode(): ino #212 nlink is 1
> jffs2_get_inode_nodes(): ino #212
> Node at 00120aa0 is a data node
> version 1, highest_version now 1
> dnode @00120aa0: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #212, f c2962740, fn c3f48dc0)
> Reading device numbers from flash
> Node read from 00120aa0: node_crc 8caa0572, calculated CRC 8caa0572.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 204
> jffs2_do_read_inode(): ino #204 nlink is 1
> jffs2_get_inode_nodes(): ino #204
> Node at 001206f4 is a data node
> version 1, highest_version now 1
> dnode @001206f4: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #204, f c2962ce0, fn c3f48db0)
> Reading device numbers from flash
> Node read from 001206f4: node_crc 70e46c51, calculated CRC 70e46c51.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 206
> jffs2_do_read_inode(): ino #206 nlink is 1
> jffs2_get_inode_nodes(): ino #206
> Node at 001207dc is a data node
> version 1, highest_version now 1
> dnode @001207dc: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #206, f c2962560, fn c3f48da0)
> Reading device numbers from flash
> Node read from 001207dc: node_crc ecb93a88, calculated CRC ecb93a88.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 207
> jffs2_do_read_inode(): ino #207 nlink is 1
> jffs2_get_inode_nodes(): ino #207
> Node at 00120850 is a data node
> version 1, highest_version now 1
> dnode @00120850: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #207, f c316d980, fn c3f48d90)
> Reading device numbers from flash
> Node read from 00120850: node_crc 4f2f12c4, calculated CRC 4f2f12c4.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 215
> jffs2_do_read_inode(): ino #215 nlink is 1
> jffs2_get_inode_nodes(): ino #215
> Node at 00120bfc is a data node
> version 1, highest_version now 1
> dnode @00120bfc: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #215, f c36da760, fn c3f48d80)
> Reading device numbers from flash
> Node read from 00120bfc: node_crc 6a05e02d, calculated CRC 6a05e02d.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 216
> jffs2_do_read_inode(): ino #216 nlink is 1
> Jffs2_get_inode_nodes(): ino #216
> Node at 00120c70 is a data node
> version 1, highest_version now 1
> dnode @00120c70: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #216, f c36da580, fn c3f48d70)
> Reading device numbers from flash
> Node read from 00120c70: node_crc aae364ec, calculated CRC aae364ec.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 217
> jffs2_do_read_inode(): ino #217 nlink is 1
> jffs2_get_inode_nodes(): ino #217
> Node at 00120ce4 is a data node
> version 1, highest_version now 1
> dnode @00120ce4: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #217, f c35203e0, fn c3f48d60)
> Reading device numbers from flash
> Node read from 00120ce4: node_crc 09754ca0, calculated CRC 09754ca0.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 218
> jffs2_do_read_inode(): ino #218 nlink is 1
> jffs2_get_inode_nodes(): ino #218
> Node at 00120d58 is a data node
> version 1, highest_version now 1
> dnode @00120d58: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #218, f c3520200, fn c3f48d50)
> Reading device numbers from flash
> Node read from 00120d58: node_crc 36be3235, calculated CRC 36be3235.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 219
> jffs2_do_read_inode(): ino #219 nlink is 1
> jffs2_get_inode_nodes(): ino #219
> Node at 00120dcc is a data node
> version 1, highest_version now 1
> dnode @00120dcc: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #219, f c35207a0, fn c3f48d40)
> Reading device numbers from flash
> Node read from 00120dcc: node_crc 95281a79, calculated CRC 95281a79.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 220
> jffs2_do_read_inode(): ino #220 nlink is 1
> jffs2_get_inode_nodes(): ino #220
> Node at 00120e40 is a data node
> version 1, highest_version now 1
> dnode @00120e40: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #220, f c33ce540, fn c3f48d30)
> Reading device numbers from flash
> Node read from 00120e40: node_crc 4928cf1f, calculated CRC 4928cf1f.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 244
> jffs2_do_read_inode(): ino #244 nlink is 1
> jffs2_get_inode_nodes(): ino #244
> Node at 0012197c is a data node
> version 1, highest_version now 1
> dnode @0012197c: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #244, f c33ce360, fn c3f48d20)
> Reading device numbers from flash
> Node read from 0012197c: node_crc f9e911ce, calculated CRC f9e911ce.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 190
> jffs2_do_read_inode(): ino #190 nlink is 1
> jffs2_get_inode_nodes(): ino #190
> Node at 00120078 is a data node
> version 1, highest_version now 1
> dnode @00120078: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #190, f c33ce180, fn c3f48d10)
> Reading device numbers from flash
> Node read from 00120078: node_crc 9e609b88, calculated CRC 9e609b88.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 191
> jffs2_do_read_inode(): ino #191 nlink is 1
> jffs2_get_inode_nodes(): ino #191
> Node at 001200ec is a data node
> version 1, highest_version now 1
> dnode @001200ec: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #191, f c3414ca0, fn c3f48d00)
> Reading device numbers from flash
> Node read from 001200ec: node_crc 3df6b3c4, calculated CRC 3df6b3c4.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 192
> jffs2_do_read_inode(): ino #192 nlink is 1
> jffs2_get_inode_nodes(): ino #192
> Node at 00120160 is a data node
> version 1, highest_version now 1
> dnode @00120160: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #192, f c34148e0, fn c3f48cf0)
> Reading device numbers from flash
> Node read from 00120160: node_crc 50775fef, calculated CRC 50775fef.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 193
> jffs2_do_read_inode(): ino #193 nlink is 1
> jffs2_get_inode_nodes(): ino #193
> Node at 001201d4 is a data node
> version 1, highest_version now 1
> dnode @001201d4: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #193, f c3414700, fn c3f48ce0)
> Reading device numbers from flash
> Node read from 001201d4: node_crc f3e177a3, calculated CRC f3e177a3.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 194
> jffs2_do_read_inode(): ino #194 nlink is 1
> jffs2_get_inode_nodes(): ino #194
> Node at 00120248 is a data node
> version 1, highest_version now 1
> dnode @00120248: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #194, f c3414340, fn c3f48cd0)
> Reading device numbers from flash
> Node read from 00120248: node_crc cc2a0936, calculated CRC cc2a0936.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 245
> jffs2_do_read_inode(): ino #245 nlink is 1
> jffs2_get_inode_nodes(): ino #245
> Node at 001219f0 is a data node
> version 1, highest_version now 1
> dnode @001219f0: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #245, f c3414e80, fn c3f48cc0)
> Reading device numbers from flash
> Node read from 001219f0: node_crc 5a7f3982, calculated CRC 5a7f3982.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 246
> jffs2_do_read_inode(): ino #246 nlink is 1
> jffs2_get_inode_nodes(): ino #246
> Node at 00121a64 is a data node
> version 1, highest_version now 1
> dnode @00121a64: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #246, f c1b27580, fn c3f48cb0)
> Reading device numbers from flash
> Node read from 00121a64: node_crc 65b44717, calculated CRC 65b44717.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 247
> jffs2_do_read_inode(): ino #247 nlink is 1
> jffs2_get_inode_nodes(): ino #247
> Node at 00121ad8 is a data node
> version 1, highest_version now 1
> dnode @00121ad8: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #247, f c1b27760, fn c3f48ca0)
> Reading device numbers from flash
> Node read from 00121ad8: node_crc c6226f5b, calculated CRC c6226f5b.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 248
> jffs2_do_read_inode(): ino #248 nlink is 1
> jffs2_get_inode_nodes(): ino #248
> Node at 00121b4c is a data node
> version 1, highest_version now 1
> dnode @00121b4c: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #248, f c2c25920, fn c3f48c90)
> Reading device numbers from flash
> Node read from 00121b4c: node_crc 06c4eb9a, calculated CRC 06c4eb9a.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 237
> jffs2_do_read_inode(): ino #237 nlink is 1
> jffs2_get_inode_nodes(): ino #237
> Node at 00121648 is a data node
> version 1, highest_version now 1
> dnode @00121648: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #237, f c2c25380, fn c3f48c80)
> Reading device numbers from flash
> Node read from 00121648: node_crc b2a7dbf2, calculated CRC b2a7dbf2.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 243
> jffs2_do_read_inode(): ino #243 nlink is 1
> jffs2_get_inode_nodes(): ino #243
> Node at 00121908 is a data node
> version 1, highest_version now 1
> dnode @00121908: ver 1, offset 0000, dsize 0004
> jffs2_add_full_dnode_to_inode(ino #243, f c2c251a0, fn c3f48c70)
> jffs2_read_inode() returning
> Node read from 00121908: node_crc 2f506fba, calculated CRC 2f506fba.
> dsize 4, c0
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 242
> jffs2_do_read_inode(): ino #242 nlink is 1
> jffs2_get_inode_nodes(): ino #242
> Node at 00121890 is a data node
> version 1, highest_version now 1
> dnode @00121890: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #242, f c2c25560, fn c3f48c60)
> Reading device numbers from flash
> Node read from 00121890: node_crc 8d516ff9, calculated CRC 8d516ff9.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 4
> jffs2_do_read_inode(): ino #4 nlink is 1
> jffs2_get_inode_nodes(): ino #4
> Node at 000001c8 is a dirent node
> Adding fd "dci1300", ino #6
> jffs2_add_fd_to_list( c02ae240, c25b1d0c (->00000000))
> Dirent "dci1300" (hash 0x023f0d22, ino #6
> Node at 00000158 is a dirent node
> Adding fd "bci", ino #5
> jffs2_add_fd_to_list( c3e8e420, c25b1d0c (->c02ae240))
> Dirent "bci" (hash 0x00232f8a, ino #5
> Dirent "dci1300" (hash 0x023f0d22, ino #6
> Node at 00000114 is a data node
> version 1, highest_version now 4
> dnode @00000114: ver 1, offset 0000, dsize 0000
> metadata @00000114: ver 1
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 282
> jffs2_do_read_inode(): ino #282 nlink is 1
> jffs2_get_inode_nodes(): ino #282
> Node at 00122ac0 is a data node
> version 1, highest_version now 1
> dnode @00122ac0: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #282, f c2602520, fn c3f48c40)
> Reading device numbers from flash
> Node read from 00122ac0: node_crc c0017418, calculated CRC c0017418.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 285
> jffs2_do_read_inode(): ino #285 nlink is 1
> jffs2_get_inode_nodes(): ino #285
> Node at 00122c30 is a data node
> version 1, highest_version now 1
> dnode @00122c30: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #285, f c2602ca0, fn c3f48c30)
> Reading device numbers from flash
> Node read from 00122c30: node_crc 37b15920, calculated CRC 37b15920.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 224
> jffs2_do_read_inode(): ino #224 nlink is 1
> jffs2_get_inode_nodes(): ino #224
> Node at 00121020 is a data node
> version 1, highest_version now 1
> dnode @00121020: ver 1, offset 0000, dsize 0002
> jffs2_add_full_dnode_to_inode(ino #224, f c2602ac0, fn c3f48c20)
> Reading device numbers from flash
> Node read from 00121020: node_crc ef9f3ac9, calculated CRC ef9f3ac9.
> dsize 2, c8
> jffs2_read_inode() returning
> jffs2_lookup()
> jffs2_lookup()
> jffs2_lookup()
> jffs2_read_inode(): inode->i_ino == 371
> jffs2_do_read_inode(): ino #371 nlink is 1
> jffs2_get_inode_nodes(): ino #371
> Node at 008c9ec8 is a data node
> version 1, highest_version now 1
> dnode @008c9ec8: ver 1, offset 0000, dsize 000c
> jffs2_add_full_dnode_to_inode(ino #371, f c26028e0, fn c3f48c10)
> jffs2_read_inode() returning
> Node read from 008c9ec8: node_crc f45da4fd, calculated CRC f45da4fd.
> dsize c, c0
> jffs2_lookup()
> jffs2_lookup()
> jffs2_lookup()
> Please stand by while rebooting the system.
> Restarting systeí
> 
> ppcboot 0.9.2 (Jan 14 2002 - 10:54:14)
> 
> MPC8260 Reset Status:
> 
> MPC8260 Clock Configuration
>  - Bus-to-Core Mult 2.5x, VCO Div 2, 60x Bus Freq  40-120, Core Freq
>  100-240
>   - dfbrg 0, corecnf 0x06, busdf 3, cpmdf 1, plldf 0, pllmf 1
>    - vco_out  264000000, cpm_clk  132000000, bus_clk   66000000
>     - scc_clk   66000000, brg_clk   66000000, cpu_clk  165000000
> 
>     Initializing...
>       CPU:   MPC8260 (Rev 01, Mask A.1 1K22A-XC) at 165 MHz
>         Board: Comdev 8260 Network Processor
>           DRAM:  64 MB
>             FLASH: 128 MB
>               In:    serial
>                 Out:   serial
>                   Err:   serial
> 
>                   Hit any key to stop autoboot:  0
> 


-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
