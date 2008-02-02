Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JLLmF-00048t-CG
	for linux-mtd@lists.infradead.org; Sat, 02 Feb 2008 17:03:45 +0000
Message-ID: <47A4A269.4010904@dave-tech.it>
Date: Sat, 02 Feb 2008 18:03:37 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: JFFS2: file contents in case of data CRC error
References: <47A1FD3F.2020102@dave-tech.it>
	<f383264b0801311142h3cbcbc91pb4e0d3a60fc78f4f@mail.gmail.com>
	<47A32628.2070808@dave-tech.it>
In-Reply-To: <47A32628.2070808@dave-tech.it>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> up to JFFS2. I'm not sure, but I think what happened from there is
>> that JFFS2 failed to decompress a block and instead of returning an
>> error it left the page zeroed. You can use jffs2dump to correlate the
>> offset reported in the CRC error with the problematic inode. Check the
>> thread "bit flip" in October 2007.
> Thanks a lot for this advice. The system is based on linux 2.4.20 and 
> ELDK 2.0.2 so the jffs2dump is not available out-of-the-box. I'll try to 
> build recent mtd-utils package.
Matt,

I managed to built jffs2dump. Here a snippet of the dump it generated:

...
          Inode      node at 0x01d0fc84, totlen 0x00000378, #ino     22, 
version     8, isize    26065, csize      820, dsize     1489, offset 
  24576
Wrong bitmask  at  0x01d0fffc, 0x0000
          Inode      node at 0x01d10000, totlen 0x00000307, #ino     20, 
version   356, isize  1318912, csize      707, dsize     3118, offset 
1315794
          Inode      node at 0x01d10308, totlen 0x000003b0, #ino     20, 
version   357, isize  1323008, csize      876, dsize     4096, offset 
1318912
...
          Inode      node at 0x01d9bdd0, totlen 0x0000006a, #ino     10, 
version     2, isize       38, csize       38, dsize       38, offset 
      0
          Inode      node at 0x01d9be3c, totlen 0x00000044, #ino     20, 
version     1, isize        0, csize        0, dsize        0, offset 
      0
          Dirent     node at 0x01d9be80, totlen 0x0000003f, #pino     4, 
version     4, #ino        20, nsize       23, name f.img
          Inode      node at 0x01d9bec0, totlen 0x0000013a, #ino     20, 
version     2, isize     1049, csize      246, dsize     1049, offset 
      0
Wrong bitmask  at  0x01d9bffc, 0x0000
          Inode      node at 0x01d9c000, totlen 0x00000550, #ino     18, 
version   230, isize   757760, csize     1292, dsize     1292, offset 
756468
...


IIUC the inode number of file f.img is 20 so I have to look for the 
lines including "#ino     20" to understand where the file physically is 
stored on NAND. One of these line is for example:

Inode      node at 0x01d10000, totlen 0x00000307, #ino     20, version 
  356, isize  1318912, csize      707, dsize     3118, offset  1315794

Then I looked at the binary dump of whole NAND device I created as follows:

nanddump /dev/mtd0 nand.bin 0 33554432

However around the offset 0x01d10000 in the file nand.bin all bytes are 
0xFF so it seems there are no data in that area. What offset in the file 
correspond to the physical address 0x01d10000 ?


-- 
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave.eu
email: r&d2@dave-tech.it
