Received: from [210.77.143.228] (helo=tsinghua.org.cn)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17l3Rw-00083Q-00
	for <linux-mtd@lists.infradead.org>; Sat, 31 Aug 2002 09:17:45 +0100
From: "" <yanhy@tsinghua.org.cn>
To: linux-mtd@lists.infradead.org  
Date: Sat, 31 Aug 2002 16:18:39 +0800
Reply-To: "" <yanhy@tsinghua.org.cn>
Subject: Help needed for jffs2
Content-Type: text/plain
Message-Id: <E17l3Rw-00083Q-00@pentafluge.infradead.org>
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

Hi,friends!I'm new to uClinux.
I am trying to port uClinx on Coldfire M5272C3.The kernel is linux-2.4.x.
Now, if i select MTD and romfs support, the kernel works well on the target.
I can see the four pre-defined flash patitions and erase them and cp files to
them.
Now,I want to use jffs1/2 .but when i select jffs1/2 support, compiling problems 
come as:
mkfs.jffs2.c:113: `__BYTE_ORDER' undeclared here (not in a function)
mkfs.jffs2.c:114: `__BYTE_ORDER' undeclared here (not in a function)
mkfs.jffs2.c: In function `create_target_filesystem':
mkfs.jffs2.c:980: warning: assignment makes pointer from integer without a cast
mkfs.jffs2.c:981: `DT_DIR' undeclared (first use in this function)
mkfs.jffs2.c:981: (Each undeclared identifier is reported only once
mkfs.jffs2.c:981: for each function it appears in.)
mkfs.jffs2.c:991: warning: assignment makes pointer from integer without a cast
mkfs.jffs2.c:999: `DT_SOCK' undeclared (first use in this function)
mkfs.jffs2.c:1004: `DT_FIFO' undeclared (first use in this function)
mkfs.jffs2.c:1024: `DT_LNK' undeclared (first use in this function)
mkfs.jffs2.c:1039: `DT_REG' undeclared (first use in this function)
mkfs.jffs2.c:1046: `DT_CHR' undeclared (first use in this function)
mkfs.jffs2.c:1051: `DT_BLK' undeclared (first use in this function)
mkfs.jffs2.c: In function `main':
mkfs.jffs2.c:1202: `__LITTLE_ENDIAN' undeclared (first use in this function)
mkfs.jffs2.c:1206: `__BIG_ENDIAN' undeclared (first use in this function)
make[2]: *** [mkfs.jffs2.o] Error 1
make[2]: Leaving directory `/user/snap-gear-uclinux/uClinux-dist/user/mt
d-utils'

What's the matter?Do i need some jffs2 patch or fix it manually?
Thanks
Yan
