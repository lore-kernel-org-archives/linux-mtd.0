Received: from ee.snu.ac.kr ([147.46.112.25])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15yn4b-0002hx-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2001 04:33:53 +0000
Date: Wed, 31 Oct 2001 13:26:35 +0900 (KST)
From: Kim Sang Hun <shkim@dsp.snu.ac.kr>
To: linux-mtd@lists.infradead.org
cc: dwmw2@infradead.org, sjhill@cotw.com
Subject: Sorry my wrong character code.... (Message again)
Message-ID: <Pine.SOL.4.10.10110311325020.5557-100000@fdma.snu.ac.kr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I said my environment in above messages....( see below..)

I can not have 2.2.18 for my board, so I use 2.2.13....

in porting to 2.2.18.....

kernel wants "compatmac.h", so I copied "/linux/include/compatmac.h" in
2.2.18 to "/linux/include/compatmac.h" in 2.2.13..
and compile the kernel. there's no error...

is it possible that generating my problem (ll_rw_block...)?

~~~ Before saying problem, i'll explain my environment...
~~~ 
~~~ ARM920T + NAND Flash...
~~~ 
~~~ Linux kernel 2.2.13
~~~ 
~~~ So, I use MTD for 2.2.18 and patch manualy...
~~~ 
~~~ and modify spia.c
~~~ 
~~~ Kernel configuration is
~~~ 
~~~ CONFIG_MTD=y
~~~ CONFIG_MTD_DEBUG=y
~~~ CONFIG_MTD_DEBUG_VERBOSE=0
~~~ CONFIG_MTD_NAND=y
~~~ CONFIG_MTD_NAND_ECC=y
~~~ CONFIG_MTD_NAND_SPIA=y
~~~ CONFIG_MTD_CHAR=y
~~~ CONFIG_MTD_BLOCK=y
~~~ 
~~~ and.... booting linux
~~~ 
~~~ > root> cat /proc/mtd
~~~ > mtd0: 0x00200000 "spia NAND flash partition 1"
~~~ ---> Find my nand flash...(ok?)
~~~ 
~~~ When I command read/write/erase using /dev/mtd0 , all operations work
~~~ well.
~~~ 
~~~ PROBLEM..........PROBLEM.........
~~~ 
~~~ but. 
~~~ To use JFFS.
~~~ > root> dd of=/dev/mtdblock0 if=jffs.img
~~~ > mtdblock_open
~~~ > ok
~~~ > ll_rw_block: Trying to read nonexistent block-device 1f:00 (0)
~~~ > /dev/mtdblock_release
~~~ > mtdblock0: Input/output error
~~~ > nand_sync:called
~~~ > ok
~~~ 
~~~ Failure happen in  "checking dev->request_fn" ( in functin
~~~ ll_rw_block)
~~~ 
~~~ I don't know the reason why this happen...?

######################################
Sang-Hun , Kim
Multimedia Systems Lab. SNU
School of EE. Seoul National Univ.
E-Mail : shkim@fdma.snu.ac.kr
Http://fdma.snu.ac.kr/~shkim
HP : 017-398-6203
######################################
