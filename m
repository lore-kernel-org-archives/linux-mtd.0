Received: from [195.205.16.233] (helo=dgt-lab.com.pl)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15dpLA-00071W-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2001 09:44:20 +0100
Received: from dgt-lab.com.pl (unknown [192.168.6.66])
	by dgt-lab.com.pl (Postfix) with ESMTP id 9E34047A0
	for <linux-mtd@lists.infradead.org>; Mon,  3 Sep 2001 09:53:11 +0200 (CEST)
Message-ID: <3B934424.FECAFA24@dgt-lab.com.pl>
Date: Mon, 03 Sep 2001 10:49:40 +0200
From: Wojciech Kromer <krom@dgt-lab.com.pl>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: jffs2 problem
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
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

I can't guess whats wrong with my jffs2.

My test:

sh-2.03# mount /dev/mtdblock0 /mnt -t jffs2
sh-2.03# cp ./vtxcsmod /mnt/lib/modules/vtxcsmod
sh-2.03# diff ./vtxcsmod /mnt/lib/modules/vtxcsmod
sh-2.03# umount /mnt
sh-2.03# mount /dev/mtdblock0 /mnt -t jffs2
sh-2.03# diff ./vtxcsmod /mnt/lib/modules/vtxcsmod
sh-2.03# umount /mnt

Then ... boot from jffs2 filesystem
Now:

sh-2.03# diff ./vtxcsmod /mnt/lib/modules/vtxcsmod
Binary files ./vtxcsmod and /mnt/lib/modules/vtxcsmod differ

?????????????????????????????????????????????????????????
Anyone could help???????????????????????????????????????

Maby this dmesg helps:

eb58->c1c8eb6c)
frag 62000-63000: 0x0071b500 on flash (*c1c8eb6c->c1c8eb80)
frag 63000-64000: 0x0071bbb0 on flash (*c1c8eb80->c1c8eb94)
frag 64000-65000: 0x0071c394 on flash (*c1c8eb94->c1c8eba8)
frag 65000-66000: 0x0071caf4 on flash (*c1c8eba8->c1c8ebbc)
frag 66000-67000: 0x0071d2cc on flash (*c1c8ebbc->c1c8ebd0)
frag 67000-68000: 0x0071db58 on flash (*c1c8ebd0->c1c8ebe4)
frag 68000-69000: 0x0071e374 on flash (*c1c8ebe4->c1c8ebf8)
frag 69000-6a000: 0x0071ec30 on flash (*c1c8ebf8->c1c8ec0c)
frag 6a000-6a2d2: 0x0071f4a8 on flash (*c1c8ec0c->00000000)
metadata @0071f738: ver 113
Truncating fraglist to 0x0006a2d2 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #125, page at offset 0x0
jffs2_readpage: offset 0, end 4096
Reading 0-4096 from node at 0x74bd68
Node read from 0074bd68: node_crc f8b1f05f, calculated CRC f8b1f05f.
dsize 1000, csize 833, offs
et 0, buf c1ef3000
Read 2099 bytes to c1cca000
Data CRC matches calculated CRC 7e703afe
Decompress 2099 bytes from c1cca000 to 4096 bytes at c1ef3000
node read done
node read was OK. Looping
readpage finishing
readpage finished
jffs2_do_readpage_nolock(): ino #125, page at offset 0x1000
jffs2_readpage: offset 4096, end 8192
Reading 4096-8192 from node at 0x74c5e0
Node read from 0074c5e0: node_crc a8574e85, calculated CRC a8574e85.
dsize 1000, csize 7ea, offs
et 1000, buf c1d28000
Read 2026 bytes to c017e800
Data CRC matches calculated CRC 3795f5dc
Decompress 2026 bytes from c017e800 to 4096 bytes at c1d28000
node read done
node read was OK. Looping
readpage finishing
readpage finished
jffs2_do_readpage_nolock(): ino #125, page at offset 0x2000
jffs2_readpage: offset 8192, end 12288
Reading 8192-12288 from node at 0x74ce10
Node read from 0074ce10: node_crc eb81d4ff, calculated CRC eb81d4ff.
dsize 1000, csize 88f, offs
et 2000, buf c1e70000
Read 2191 bytes to c1cca000
Data CRC matches calculated CRC 4fddb0be
Decompress 2191 bytes from c1cca000 to 4096 bytes at c1e70000
node read done
node read was OK. Looping
readpage finishing
readpage finished
jffs2_do_readpage_nolock(): ino #125, page at offset 0x3000
jffs2_readpage: offset 12288, end 16384
Reading 12288-16384 from node at 0x74d6e4
Node read from 0074d6e4: node_crc f52e964e, calculated CRC f52e964e.
dsize 1000, csize 7c4, offs
et 3000, buf c0352000
Read 1988 bytes to c017e800
Data CRC matches calculated CRC 507e1bc8
Decompress 1988 bytes from c017e800 to 4096 bytes at c0352000
node read done
node read was OK. Looping
readpage finishing
readpage finished
jffs2_do_readpage_nolock(): ino #125, page at offset 0x4000
jffs2_readpage: offset 16384, end 20480
Reading 16384-20480 from node at 0x74deec
Node read from 0074deec: node_crc bd20cd65, calculated CRC bd20cd65.
dsize 1000, csize 798, offs
et 4000, buf c1de6000
Read 1944 bytes to c1c58000
Data CRC matches calculated CRC d63432e1
Decompress 1944 bytes from c1c58000 to 4096 bytes at c1de6000
node read done
node read was OK. Looping
readpage finishing
readpage finished
jffs2_do_readpage_nolock(): ino #125, page at offset 0x5000
jffs2_readpage: offset 20480, end 24576
Reading 20480-24576 from node at 0x74e6c8
Node read from 0074e6c8: node_crc 4c220bd3, calculated CRC 4c220bd3.
dsize 1000, csize 785, offs
et 5000, buf c1dc0000
Read 1925 bytes to c017e800
Data CRC matches calculated CRC 9eac187d
Decompress 1925 bytes from c017e800 to 4096 bytes at c1dc0000
node read done
node read was OK. Looping
readpage finishing
readpage finished
jffs2_lookup()
Node read from 002d57d0: node_crc 91b489d2, calculated CRC 91b489d2.
dsize 4, csize 4, offset 0,
 buf c0283a40
Read 4 bytes to c0283a40
Data CRC matches calculated CRC ad373c97
Node read from 007ea318: node_crc b6948f45, calculated CRC b6948f45.
dsize c, csize c, offset 0,
 buf c0283a40
Read 12 bytes to c0283a40
Data CRC matches calculated CRC e3734b99
Node read from 002d57d0: node_crc 91b489d2, calculated CRC 91b489d2.
dsize 4, csize 4, offset 0,
 buf c0283a40
Read 4 bytes to c0283a40
Data CRC matches calculated CRC ad373c97
Node read from 007ea318: node_crc b6948f45, calculated CRC b6948f45.
dsize c, csize c, offset 0,
 buf c0283a40
Read 12 bytes to c0283a40
Data CRC matches calculated CRC e3734b99
Node read from 002d57d0: node_crc 91b489d2, calculated CRC 91b489d2.
dsize 4, csize 4, offset 0,
 buf c0283a40
Read 4 bytes to c0283a40
Data CRC matches calculated CRC ad373c97
Node read from 007ea318: node_crc b6948f45, calculated CRC b6948f45.
dsize c, csize c, offset 0,
 buf c0283a40
Read 12 bytes to c0283a40
Data CRC matches calculated CRC e3734b99
Node read from 006d4a64: node_crc 0d3d26b6, calculated CRC 0d3d26b6.
dsize b, csize b, offset 0,
 buf c0283a00
Read 11 bytes to c0283a00
Data CRC matches calculated CRC 1193fcf4
Node read from 005463f8: node_crc 15a926a2, calculated CRC 15a926a2.
dsize d, csize d, offset 0,
 buf c0283a40
Read 13 bytes to c0283a40
Data CRC matches calculated CRC 808bf9b7
jffs2_lookup()
jffs2_read_inode(): inode->i_ino == 389
getting inocache
jffs2_get_ino_cache(): ino 389
jffs2_get_ino_cache found c02c3f04 for ino 389
jffs2_read_inode(): Got inocache at c02c3f04
jffs2_read_inode(): ino #389 nlink is 1
jffs2_get_inode_nodes(): ino #389
Node at 002d5430 is a data node
version 1, highest_version now 1
dnode @002d5430: ver 1, offset 0000, dsize 0000
metadata @002d5430: ver 1
jffs2_read_inode() returning
Node read from 006d4a64: node_crc 0d3d26b6, calculated CRC 0d3d26b6.
dsize b, csize b, offset 0,
 buf c02838c0
Read 11 bytes to c02838c0
Data CRC matches calculated CRC 1193fcf4
Node read from 005463f8: node_crc 15a926a2, calculated CRC 15a926a2.
dsize d, csize d, offset 0,
 buf c0283880
Read 13 bytes to c0283880
Data CRC matches calculated CRC 808bf9b7
Node read from 002d57d0: node_crc 91b489d2, calculated CRC 91b489d2.
dsize 4, csize 4, offset 0,
 buf c02837c0
Read 4 bytes to c02837c0
Data CRC matches calculated CRC ad373c97
jffs2_lookup()
jffs2_read_inode(): inode->i_ino == 19
getting inocache
jffs2_get_ino_cache(): ino 19
jffs2_get_ino_cache found c0287f2c for ino 19
jffs2_read_inode(): Got inocache at c0287f2c
jffs2_read_inode(): ino #19 nlink is 1
jffs2_get_inode_nodes(): ino #19
Node at 007e8af4 is a data node
version 2, highest_version now 2
dnode @007e8af4: ver 2, offset 0000, dsize 000c
node at 0x007e8a74 is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #19, f c0fc0eb8, fn c029df30)
adding node 0000-000c @0x007e8af4 on flash, newfrag *c1c8ec20
frag 0000-000c: 0x007e8af4 on flash (*c1c8ec20->00000000)
jffs2_read_inode() returning
Node read from 007e8af4: node_crc 59509f00, calculated CRC 59509f00.
dsize c, csize c, offset 0,
 buf c02837c0
Read 12 bytes to c02837c0
Data CRC matches calculated CRC e3734b99
Node read from 002d57d0: node_crc 91b489d2, calculated CRC 91b489d2.
dsize 4, csize 4, offset 0,
 buf c02837c0
Read 4 bytes to c02837c0
Data CRC matches calculated CRC ad373c97
Node read from 007e8af4: node_crc 59509f00, calculated CRC 59509f00.
dsize c, csize c, offset 0,
 buf c02837c0
Read 12 bytes to c02837c0
Data CRC matches calculated CRC e3734b99
Node read from 002d57d0: node_crc 91b489d2, calculated CRC 91b489d2.
dsize 4, csize 4, offset 0,
 buf c02837c0
Read 4 bytes to c02837c0
Data CRC matches calculated CRC ad373c97
Node read from 007e8af4: node_crc 59509f00, calculated CRC 59509f00.
dsize c, csize c, offset 0,
 buf c02837c0
Read 12 bytes to c02837c0
Data CRC matches calculated CRC e3734b99
Node read from 006d4a64: node_crc 0d3d26b6, calculated CRC 0d3d26b6.
dsize b, csize b, offset 0,
 buf c0283780
Read 11 bytes to c0283780
Data CRC matches calculated CRC 1193fcf4
Node read from 005463f8: node_crc 15a926a2, calculated CRC 15a926a2.
dsize d, csize d, offset 0,
 buf c02837c0
Read 13 bytes to c02837c0
Data CRC matches calculated CRC 808bf9b7
--
* * * * * * * * * * * *
* per pedes ad astra! *
* * * * * * * * * * * *    mailto:krom@dgt-lab.com.pl
