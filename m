Received: from gateway.innominate.fta-berlin.de ([141.16.74.40]
	helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE82b-0000gZ-Ot
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 15:40:33 +0100
Received: from tkeitel by tkeitel001.bln.innominate.local with local (Exim
	3.35 #1 (Debian))	id 1BE82Z-0008MF-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Apr 2004 16:40:31 +0200
Date: Thu, 15 Apr 2004 16:40:31 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <20040415144031.GU29551@tkeitel001.bln.innominate.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: JFFS2 writes fail with 2.4.25
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

I just switched from 2.4.19 to 2.4.25 and was afraid that there are
problems with file creation. Here is an example:

# mkdir x
jffs2_readdir() for dir_i #214
Dirent 0: ".", ino #214
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #214
jffs2_readdir() for dir_i #214
Dirent 0: ".", ino #214
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #214
Node read from 0094c2b0: node_crc 37d8e027, calculated CRC 37d8e027.
dsize 14, c
size 14, offset 0, buf c03138a0
Node read from 0086fdf8: node_crc 94fff751, calculated CRC 94fff751.
dsize 18, c
size 18, offset 0, buf c03138a0
Node read from 007fcf78: node_crc 479fd806, calculated CRC 479fd806.
dsize 18, c
size 18, offset 0, buf c03138a0
Node read from 007f9fb0: node_crc 14ceb272, calculated CRC 14ceb272.
dsize 7, cs
ize 7, offset 0, buf c03138a0
Node read from 007fcf78: node_crc 479fd806, calculated CRC 479fd806.
dsize 18, c
size 18, offset 0, buf c03138a0
Node read from 007f9fb0: node_crc 14ceb272, calculated CRC 14ceb272.
dsize 7, cs
ize 7, offset 0, buf c03138a0
jffs2_lookup()
jffs2_reserve_space(): Requested 0x44 bytes
Node read from 003af914: node_crc bc895f09, calculated CRC bc895f09.
dsize 12, c
size 12, offset 0, buf c1fa6280
Node read from 003af914: node_crc bc895f09, calculated CRC bc895f09.
dsize 12, c
size 12, offset 0, buf c1fa6280
Node read from 003af914: node_crc bc895f09, calculated CRC bc895f09.
dsize 12, c
size 12, offset 0, buf c1fa6280

...and so on.

The system is an Intel XScale IXP425 board (ARM little endian) with 16
MB NOR flash. I use the JFFS2 from the 2.4.25 kernel. Any hints what's
wrong here?

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   enabling security
tel: +49.30.6392-3308                      http://www.innominate.com/
