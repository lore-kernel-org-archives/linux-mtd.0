Received: from [218.104.33.139] (helo=san.cn.mtlg.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7s4k-0004KN-2r
	for linux-mtd@lists.infradead.org; Mon, 29 Mar 2004 09:24:54 +0100
Message-ID: <37B6F35E2FFAE447B874C31B40D30105020AC3@san.cn.mtlg.org>
From: "Karl(Kai) Ji" <k.ji@cn.metrologic.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 29 Mar 2004 16:24:45 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Subject: JFFS2 memLevel and windowBits
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am working on a VZ-board with 8MB DRAM and using uClinux-2.4.17 as kernel.
It is using JFFS2 to operate its FLASH(2MB) As a no-mmu system, memory
fragmation becomes a headache for a stable performace. So I am trying to
tune down memory usage by lower variable `memLevel' and `windowBits'.  the
default value for memLevel is 8 and windowBits=15. 
memLevel=7 and windowBits=15 seems to be ok but memLevel=8 and windowBits=14
unfortunately do not work. Why is that? From reading the comments in
zlib.h/zconf.h seems such modification is allowed.  

/* The memory requirements for deflate are (in bytes):
            (1 << (windowBits+2)) +  (1 << (memLevel+9))
 that is: 128K for windowBits=15  +  128K for memLevel = 8  (default values)
 plus a few kilobytes for small objects. For example, if you want to reduce
 the default memory requirements from 256K to 128K, compile with
     make CFLAGS="-O -DMAX_WBITS=14 -DMAX_MEM_LEVEL=7"
 Of course this will generally degrade compression (there's no free lunch).

   The memory requirements for inflate are (in bytes) 1 << windowBits
 that is, 32K for windowBits=15 (default value) plus a few kilobytes
 for small objects.
*/

Any hints is appreciated.

Karl
