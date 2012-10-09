Received: from blu0-omc1-s29.blu0.hotmail.com ([65.55.116.40])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLZII-0000ql-24
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 12:52:18 +0000
Message-ID: <BLU170-W1123245400E4A0187A42D83C08F0@phx.gbl>
From: =?big5?B?rGanoSC4rQ==?= <balado0318@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [help] JFFS2 CRC failed in kernel 2.6.35
Date: Tue, 9 Oct 2012 12:52:16 +0000
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,
 
Sorry for my poor English first.
 
I develop the NAND controller driver on kernel 2.6.35 and use 
it to format NAND flash(512B page, Hynix H27US08561A) as JFFS2.

Under overnight test by the storage test item of BurnInTest tool,
it appeared the following info:
 
JFFS2 notice: (119) jffs2_get_inode_nodes: Node header CRC failed 
              at 0x98aff0. {5e78,f3f2,0a0c080f,0b0d090e}
JFFS2 notice: (119) read_dnode: node CRC failed on dnode 
              at 0xfd35d0: read 0x11281639, calculated 0xc4fcdd58
JFFS2 notice: (119) read_dnode: node CRC failed on dnode
              at 0xfc0dd0: read 0x3631417d, calculated 0xe3e58a1c
JFFS2 notice: (119) read_dnode: node CRC failed on dnode 
              at 0xfbaff0: read 0x4252f682, calculated 0x7fe31a5e
JFFS2 notice: (119) read_dnode: node CRC failed on dnode 
              at 0xfb75d0: read 0x21b1d7a5, calculated 0x19b26d31
JFFS2 notice: (119) read_dnode: node CRC failed on dnode 
              at 0xfaf5d0: read 0x4375dd2d, calculated 0xd826e6f7
...
Data CRC failed on REF_PRISTINE data node 
            at 0x00fd2330: Read 0xf43e5add, calculated 0x99772ea8
Node CRC failed on REF_PRISTINE data node 
            at 0x00df05b0: Read 0xfb1aa12a, calculated 0xfa63c826
Data CRC failed on REF_PRISTINE data node 
            at 0x00ea1770: Read 0xed8ec085, calculated 0x593d2074
Data CRC failed on REF_PRISTINE data node 
            at 0x00ce8410: Read 0xf43e5add, calculated 0xb4a5853f
Data CRC failed on REF_PRISTINE data node 
            at 0x00e26330: Read 0x9db49f5b, calculated 0xe41b6991
Data CRC failed on REF_PRISTINE data node 
            at 0x00d4dc10: Read 0x7ce2b87f, calculated 0x712748df
Data CRC failed on REF_PRISTINE data node 
            at 0x00c20c70: Read 0x4c64f44a, calculated 0x45cccbc8
...
 
It's so weird~ 
Although the crc failed appears from jffs2 layer, the written file 
seems not to be corrupted.(The comparison is accuracy)
Is it the issue of driver-level? 
 
However, this driver has passed the test-modules under 
<linux source>/driver/mtd/tests and the storage 
test item(Sequential data pattern, random seeking,...etc) of 
BurnInTest tool for 69 hours when the flash is formatted as 
the UBIFS filesystem.
 
Refer to the posts before, the CRC failed usually occurred in the case 
of power off when the gc didn't complete. 
But, I don't cut the power when I run the BurnInTest tool for 
overnight test.
 
Any suggestion or question is welcome!!
I will appreciate for your reply.
 
 		 	   		   		 	   		  
