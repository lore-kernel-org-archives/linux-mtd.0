Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17haSA-0000W7-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2002 19:43:39 +0100
Received: from ns5.arlut.utexas.edu (ns5.arlut.utexas.edu [10.4.1.6])
	by ns2.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id g7LIhalg045221
	for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2002 13:43:36 -0500 (CDT)
Date: Wed, 21 Aug 2002 13:43:34 -0500
Subject: Cannot mount my NAND device with JFFS2
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
From: Ken Offer <koffer@arlut.utexas.edu>
To: LinuxMTD <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Message-Id: <E5BE2C26-B535-11D6-92ED-000393467F1A@arlut.utexas.edu>
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

Hi all,

I can erase and test my smart media card NAND driver just fine 
(i.e. eraseall seems to work, nandtest works, mtd0 and mtd1 show 
up in /proc/mtd).  So far so good.  However, when I try to mount 
the device with jffs2 I get:

 > mount -v -t jffs2 /dev/mtdblock1 /mnt/jffs
mount: wrong fs type, bad option, bad superblock on /dev/mtdblock1,
        or too many mounted file systems

I have:

(a) applied the 
"ftp://ftp.??.kernel.org/pub/linux/kernel/people/dwmw2/shared-
zlib/linux-2.4.19-pre10-shared-zlib.bz2" patch to a 2.4.19 
kernel,
(b) copied the latest and greatest cvs mtd/jffs2 sources into my kernel,
(c) made the appropriate changes to "file.c" for Page_uptodate,
(d) made the change for "CONFIG_JFFS2_FS_NAND" to "fs/Config.in",
(e) made a change to "include/linux/mtd/compatmac.h" to define 
"set_user_nice" (isn't defined for 2.4.19).

My driver is based on the autcpu12 driver in the nand sources.  
I have noticed that there is a "autcpu12-nvram" map driver to 
perform NVRAM mapping.  Is such a mapping device REQUIRED for 
JFFS2 support???  Or is it just for mapping the device to 
address space for other purposes?  The documentation is not 
clear (what's new...)

Got any ideas?

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
