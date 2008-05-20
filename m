Received: from smtp-out4.atlngahp.sys.nuvox.net ([70.43.63.22]
	helo=smtp04.atlngahp.sys.nuvox.net)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JyXmY-0006e9-Fr
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 19:45:59 +0000
Received: from webmail.nuvox.net (webmail.nuvox.net [64.89.70.59])
	by smtp04.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m4KJjnCO029969
	for <linux-mtd@lists.infradead.org>; Tue, 20 May 2008 15:45:49 -0400
Message-ID: <40464.137.237.242.42.1211312749.squirrel@webmail.nuvox.net>
Date: Tue, 20 May 2008 15:45:49 -0400 (EDT)
Subject: Additional P33 flash strangeness
From: jkimble@one.net
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I apologize for breaking the rule of talking about anything but the latest
kernel but I'm stuck no 2.6.10 because that's all that's supported on my
current platform at this time (Freescale Coldfire).

I'm using Intel 256P33B StrataFlash with a jffs2 file system. This flash
supports CFI v1.4 whereas my kernel supports only up to CFI v1.3. I
modified the check in cfi_util.c and cfi_cmdset_0001.c to support
MinorVersion 1.3 and 1.4 (just changed the check, nothing else) and the
sytem boots and runs. However I still get a list of about 50 "Empty flash
at" errors and much more disturbing errors I get at random like:

"0x0077d40c(3) on flash (*c394d2a8). left (00000000), right (00000000),
parent (c394cdf8)"

I get one of these: "Dirent "libnss_nis.so" (hash 0x79acaa59, ino #596"

I suspect an interrupt is causing the text to be corrupted. Not making
much headway on what the problem is. I can read and write the file system.
I've used scp to download a 2.5MB file. The biggest issue is that some
file operations are dead slow. Takes about 2 or 3 minutes to mount the
root file system (8MB). Writing to a small file from vi can take 15 or 20
seconds.

I'm not even sure if this is an MTD thing or a jffs2 thing. Any ideas
would be much appreciated...


Boot Messages:
                           ;
Unlock all sector for Intel on Fire Engine...
physmap flash device: 4000000 at f0000000
In genprobe_new_chip
phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
  Feature/Command Support:      01E6
     - Chip Erase:              unsupported
     - Suspend Erase:           supported
     - Suspend Program:         supported
     - Legacy Lock/Unlock:      unsupported
     - Queued Erase:            unsupported
     - Instant block lock:      supported
     - Protection Bits:         supported
     - Page-mode read:          supported
     - Synchronous read:        supported
     - Simultaneous operations: unsupported
  Supported functions after Suspend: 01
     - Program after Erase Suspend: supported
  Block Status Register Mask: 0003
     - Lock Bit Active:      yes
     - Valid Bit Active:     yes
  Vcc Logic Supply Optimum Program/Erase Voltage: 3.0 V
  Vpp Programming Supply Optimum Program/Erase Voltage: 9.0 V
cfi_cmdset_0001: Erase suspend on write enabled
3 cmdlinepart partitions found on MTD device phys_mapped_flash
Creating 3 MTD partitions on "phys_mapped_flash":
0x00000000-0x00040000 : "Colilo"
0x00040000-0x00300000 : "kernel"
0x00300000-0x01000000 : "user"
                        ;
                        ;

dmesg:
c0781ca4 (->c3a91d20))
Dirent "text.txt" (hash 0x355070c8, ino #419
Dirent "watchdog" (hash 0x47ace6da, ino #420
Node at 0040b70c (2) is a dirent node
Adding fd "test.db", ino #418
jffs2_add_fd_to_list( c3a91c3c, c0781ca4 (->c3a91600))
Dirent "test.db" (hash 0x329f3efd, ino #418
Dirent "text.txt" (hash 0x355070c8, ino #419
Dirent "watchdog" (hash 0x47ace6da, ino #420
Node at 0040b69c (2) is a dirent node
Adding fd ".ssh", ino #417
jffs2_add_fd_to_list( c3a91990, c0781ca4 (->c3a91c3c))
Dirent ".ssh" (hash 0x00ce12f8, ino #417
Dirent "test.db" (hash 0x329f3efd, ino #418
Dirent "text.txt" (hash 0x355070c8, ino #419
Dirent "watchdog" (hash 0x47ace6da, ino #420
Node at 0040b5d0 (2) is a dirent node
Adding fd ".profile", ino #416
jffs2_add_fd_to_list( c3a915b4, c0781ca4 (->c3a91990))
Dirent ".ssh" (hash 0x00ce12f8, ino #417
Dirent "test.db" (hash 0x329f3efd, ino #418
Dirent "text.txt" (hash 0x355070c8, ino #419
Dirent "watchdog" (hash 0x47ace6da, ino #420
Dirent ".profile" (hash 0xd2e064d8, ino #416
Node at 0000042c (2) is a data node
version 1, highest_version now 418
dnode @0000042c: ver 1, offset 0000, dsize 0000
metadata @0000042c: ver 1
jffs2_read_inode() returning
jffs2_lookup()
jffs2_lookup()
Node read from 000bcd80: node_crc 34c11502, calculated CRC 34c11502. dsize
4, csize 4, offset 0, buf c3a91cd4
Read 4 bytes to c3a91cd4
Data CRC matches calculated CRC 9f415dc0
Node read from 000e86bc: node_crc 1ebf4eb4, calculated CRC 1ebf4eb4. dsize
b, csize b, offset 0, buf c3a91a28
Read 11 bytes to c3a91a28
Data CRC matches calculated CRC e4e73a9a
Node read from 003f8610: node_crc b6b042da, calculated CRC b6b042da. dsize
13, csize 13, offset 0, buf c3a91cd4
Read 19 bytes to c3a91cd4
Data CRC matches calculated CRC 876dd648
Node read from 0024eeb4: node_crc fea0bfc8, calculated CRC fea0bfc8. dsize
e, csize e, offset 0, buf c3a91cd4
Read 14 bytes to c3a91cd4
Data CRC matches calculated CRC a6d4a70e
Node read from 001a7208: node_crc 1d94bd45, calculated CRC 1d94bd45. dsize
d, csize d, offset 0, buf c3a91cd4
Read 13 bytes to c3a91cd4
Data CRC matches calculated CRC 75ff3fd9
Node read from 000cb054: node_crc e0401420, calculated CRC e0401420. dsize
c, csize c, offset 0, buf c3a91cd4
Read 12 bytes to c3a91cd4
Data CRC matches calculated CRC b18f356f
Node read from 002dbeb0: node_crc 5bfcfd52, calculated CRC 5bfcfd52. dsize
15, csize 15, offset 0, buf c3a91cd4
Read 21 bytes to c3a91cd4
Data CRC matches calculated CRC f32c2084
jffs2_lookup()
jffs2_read_inode(): inode->i_ino == 416
jffs2_do_read_inode(): getting inocache
jffs2_get_ino_cache(): ino 416
jffs2_get_ino_cache found c3edfe30 for ino 416
jffs2_do_read_inode(): Got inocache at c3edfe30
jffs2_do_read_inode_internal(): ino #416 nlink is 1
jffs2_get_inode_nodes(): ino #416
Node at 0040b600 (2) is a data node
version 1, highest_version now 1
dnode @0040b600: ver 1, offset 0000, dsize 0060
jffs2_add_full_dnode_to_inode(ino #416, f c31c8c3c, fn c30da920)
adding node 0000-0060 @0x0040b600 on flash, newfrag *c312a718
jffs2_lookup_node_frag(c31c8c50, 0)
Returning NULL, empty fragtree
j_a_f_d_t_f: Lookup gave no frag
Adding new frag (c312a718) at root of tree
frag 0000-0060: 0x0040b600(2) on flash (*c312a718). left (00000000), right
(00000000), parent (00000000)
jffs2_lookup_node_frag(c31c8c50, 96)
Considering frag 0-96 (c312a718). left 00000000, right 00000000
Going right from frag 0-96, before the region we care about
No match. Returning frag 0,96, closest previous
Truncating fraglist to 0x00000060 bytes
Truncating frag 0x00000000-0x00000060
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #416, page at offset 0x0
jffs2_read_inode_range: ino #416, range 0x00000000-0x00002000
jffs2_lookup_node_frag(c31c8c50, 0)
Considering frag 0-96 (c312a718). left 00000000, right 00000000
Returning frag 0,96, matched
jffs2_read_inode_range: offset 0, end 8192
Reading 0-96 from node at 0x0040b600 (2)
Node read from 0040b600: node_crc 6fba1781, calculated CRC 6fba1781. dsize
60, csize 55, offset 0, buf c37de000
Read 85 bytes to c325755c
Data CRC matches calculated CRC a4aa4625
Decompress 85 bytes from c325755c to 96 bytes at c37de000
inflate skipping adler32
node read done
node read was OK. Looping
jffs2_read_inode_range: offset 96, end 8192
Filling non-frag hole from 96-8192
readpage finished
jffs2_lookup()
jffs2_lookup()
jffs2_lookup()
jffs2_read_inode(): inode->i_ino == 35
jffs2_do_read_inode(): getting inocache
jffs2_get_ino_cache(): ino 35
jffs2_get_ino_cache found c3ed281c for ino 35
jffs2_do_read_inode(): Got inocache at c3ed281c
jffs2_do_read_inode_internal(): ino #35 nlink is 1
jffs2_get_inode_nodes(): ino #35
Node at 000aa8d4 (2) is a data node
version 1, highest_version now 1
dnode @000aa8d4: ver 1, offset 0000, dsize 0007
jffs2_add_full_dnode_to_inode(ino #35, f c31c9e9c, fn c30daba4)
adding node 0000-0007 @0x000aa8d4 on flash, newfrag *c312a740
jffs2_lookup_node_frag(c31c9eb0, 0)
Returning NULL, empty fragtree
j_a_f_d_t_f: Lookup gave no frag
Adding new frag (c312a740) at root of tree
frag 0000-0007: 0x000aa8d4(2) on flash (*c312a740). left (00000000), right
(00000000), parent (00000000)
jffs2_read_inode() returning
Node read from 000aa8d4: node_crc fc2ea5c0, calculated CRC fc2ea5c0. dsize
7, csize 7, offset 0, buf c3a91e50
Read 7 bytes to c3a91e50
Data CRC matches calculated CRC 186b259f
Node read from 000aa8d4: node_crc fc2ea5c0, calculated CRC fc2ea5c0. dsize
7, csize 7, offset 0, buf c3a91e50
Read 7 bytes to c3a91e50
Data CRC matches calculated CRC 186b259f
jffs2_lookup()
jffs2_create()
jffs2_new_inode(): dir_i 11, mode 0x81a4
jffs2_do_new_inode(): Assigned ino# 898
jffs2_add_ino_cache: Add c3c0481c (ino #898)
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x17b48 bytes at 0x8684b8
jffs2_do_create(): reserved 0x17b48 bytes
jffs2_add_physical_node_ref(): Node at 0x8684b8(2), size 0x44
jffs2_write_dnode wrote node at 0x008684b8(2) with dsize 0x0, csize 0x0,
node_crc 0x64626ded, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81a4
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 18,
dirty_size 0x374: no
jffs2_reserve_space(): Requested 0x30 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x17b04 bytes at 0x8684fc
jffs2_write_dirent(ino #11, name at *0xc31bef90 "tmp.txt"->ino #898,
name_crc 0xf6045629)
jffs2_add_physical_node_ref(): Node at 0x8684fc(2), size 0x30
jffs2_add_fd_to_list( c3a91cd4, c31c8da8 (->c3a91990))
Dirent ".ssh" (hash 0x00ce12f8, ino #417
Dirent "test.db" (hash 0x329f3efd, ino #418
Dirent "text.txt" (hash 0x355070c8, ino #419
Dirent "tmp.txt" (hash 0x3ec9875b, ino #898
Dirent "watchdog" (hash 0x47ace6da, ino #420
Dirent ".profile" (hash 0xd2e064d8, ino #416
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 18,
dirty_size 0x374: no
jffs2_create: Created ino #898 with mode 100644, nlink 1(1). nrpages 0
Node read from 000aa8d4: node_crc fc2ea5c0, calculated CRC fc2ea5c0. dsize
7, csize 7, offset 0, buf c3a91e50
Read 7 bytes to c3a91e50
Data CRC matches calculated CRC 186b259f
Node read from 000e86bc: node_crc 1ebf4eb4, calculated CRC 1ebf4eb4. dsize
b, csize b, offset 0, buf c3a913a0
Read 11 bytes to c3a913a0
Data CRC matches calculated CRC e4e73a9a
Node read from 001aa2d8: node_crc 9e69da31, calculated CRC 9e69da31. dsize
11, csize 11, offset 0, buf c3a91e50
Read 17 bytes to c3a91e50
Data CRC matches calculated CRC 1c2d7d52
Node read from 001a7208: node_crc 1d94bd45, calculated CRC 1d94bd45. dsize
d, csize d, offset 0, buf c3a91e50
Read 13 bytes to c3a91e50
Data CRC matches calculated CRC 75ff3fd9
