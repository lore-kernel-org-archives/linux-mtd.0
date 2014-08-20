Received: from secvs02.rockwellcollins.com ([205.175.225.241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKCRF-0001Lq-E2
 for linux-mtd@lists.infradead.org; Wed, 20 Aug 2014 20:24:58 +0000
Received: by mail-vc0-f177.google.com with SMTP id hy4so9754566vcb.36
 for <linux-mtd@lists.infradead.org>; Wed, 20 Aug 2014 13:24:30 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 20 Aug 2014 15:24:30 -0500
Message-ID: <CAMQcK5J3x+eFnmUr2YrtZjTidQ3GBBU_U0XDp2BraK8CSRGSEQ@mail.gmail.com>
Subject: Using MTD Concat With QSPI NOR Flash
From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am currently working with a Spansion S70FL01GS QSPI Flash NOR (128
MB NOR Flash) on the 3.14 kernel with an Altera Cyclone V SoC as my
processor. The S70FL01GS contains two separate 64 MB flash chips that
have their own individual chip selects. Currently, it is only possible
to have flash chips appear as separate MTD flash devices (m25p80
driver). I would like to be able to combine the two 64 MB flash chips
together in order to put a JFFS2 filesystem that spans both of the
devices. In researching if this has been done before, I ran across
some work that was done on OpenWRT project where they combine a SPI
Flash chip into a single device was done using MTD Concat functality
[1].

I used this as my bases to create single MTD device that contains both
flash chips. I register a mtd_notifer that waits until both of the MTD
devices have been registered which is when I create a MTD concatenated
device. I am able to successfully to get a single 128 MB MTD device to
appear and am able to successfully access it using flash_erase to
clear the device. However, when I create a JFFS2 partition across the
partition I run into filesystem corruption issues after write numerous
files and then remounting the partition. The errors I get are as
follows:

jffs2: notice: (1355) check_node_data: wrong data CRC in data node at
0x0019eeb0: read 0x3b0018a4, calculated 0x3648671b.
jffs2: notice: (1362) read_dnode: node CRC failed on dnode at
0x6977b0: read 0xffffffff, calculated 0x2d48d97e
jffs2: notice: (1355) check_node_data: wrong data CRC in data node at
0x00191b3c: read 0x52b5069, calculated 0x324d9c93.
jffs2: notice: (1362) read_dnode: node CRC failed on dnode at
0x69676c: read 0xe1817f82, calculated 0xecf001dc
jffs2: notice: (1362) jffs2_get_inode_nodes: Node header CRC failed at
0x695728. {a33a,8abf,d155a3bf,4b20bb63}
jffs2: notice: (1355) check_node_data: wrong data CRC in data node at
0x001f4338: read 0x3d2bba6f, calculated 0x3648671b.
jffs2: notice: (1362) read_dnode: node CRC failed on dnode at
0x6946e4: read 0xffffffff, calculated 0xc4ce5519
jffs2: notice: (1362) jffs2_get_inode_nodes: Node header CRC failed at
0x6936a0. {29db,6e95,ff0a9f46,3d73de17}
jffs2: notice: (1362) jffs2_get_inode_nodes: Node header CRC failed at
0x69265c. {ec81,9c23,0f29d5b0,37d77ee1}
jffs2: notice: (1362) jffs2_get_inode_nodes: Node header CRC failed at
0x691618. {e707,3b2e,9e98db52,9213fae7}
jffs2: notice: (1362) jffs2_get_inode_nodes: Node header CRC failed at
0x6905d4. {885c,7f3f,923dc410,02a47875}
jffs2: notice: (1362) jffs2_get_inode_nodes: Node header CRC failed at
0x68f590. {8078,cf56,ec4fca3d,4c901aeb}
jffs2: notice: (1362) jffs2_get_inode_nodes: Node header CRC failed at
0x68e54c. {eaa6,6df5,526618d6,b87b3fb1}
jffs2: notice: (1362) jffs2_get_inode_nodes: Node header CRC failed at
0x68d508. {1750,0e59,7e8d331d,bdc3cfa2}
jffs2: notice: (1355) check_node_data: wrong data CRC in data node at
0x0027b2fc: read 0xfac80bdd, calculated 0x3648671b.

JFFS2 works fine if I do not utilize the MTD Concatenation
functionality and create two separate JFFS2 filesystems on each flash
chip. So my questions are as follows:

1 - Is using MTD Concatenation the best approach for making the
S70FL01GS appear as a single MTD flash device?

2 - Is there currently any support in the device tree for combining
these SPI NOR flash chips into a single device - much like there with
using a tuple with memory mapped NOR flash chips?

3 - What is the best approach to attempting to figure out how I am
getting filesystem corruption with JFFS2?

4 - Is there a better way that I can get a single filesystem that
spans these multiple flash chips? I am open to any suggestions.

Reference(s):
[1] - http://git.openwrt.org/?p=openwrt.git;a=blob;f=target/linux/ar71xx/files/arch/mips/ath79/dev-m25p80.c;h=9323b3123390ac29458566c4a3f69f24ed9aceef;hb=HEAD

Thanks,
-Ryan

------------------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
ryan.barnett@rockwellcollins.com
www.rockwellcollins.com
