Received: from gw1.its.umd.umich.edu ([141.215.69.136])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BB1dX-0005Bh-W4
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 02:13:52 +0100
Received: from merc.its.umd.umich.edu (merc.its.umd.umich.edu [141.215.69.17])
	by gw1.its.umd.umich.edu (Postfix) with ESMTP id 9833E38924
	for <linux-mtd@lists.infradead.org>;
	Tue,  6 Apr 2004 21:13:49 -0400 (EDT)
Received: from honor.its.umd.umich.edu
          (merchonor.its.umd.umich.edu [141.215.136.66])
          by merc.its.umd.umich.edu (Netscape Messaging Server 3.6)
           with ESMTP id AAA1F78 for <linux-mtd@lists.infradead.org>;
          Tue, 6 Apr 2004 21:13:48 -0400
Received: from umd.umich.edu (cpe-069-133-085-216.twmi.rr.com [69.133.85.216])
	by honor.its.umd.umich.edu (Postfix) with ESMTP id 93FAF1343A
	for <linux-mtd@lists.infradead.org>;
	Tue,  6 Apr 2004 21:13:47 -0400 (EDT)
Message-ID: <407355CB.8000602@umd.umich.edu>
Date: Tue, 06 Apr 2004 21:13:47 -0400
From: Jon Schlueter <jonschl@umd.umich.edu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0404041514100.12090-100000@kiire.colleduc.ee>
	<200404041421.11425.tglx@linutronix.de>
In-Reply-To: <200404041421.11425.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: CVS compile errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Thomas Gleixner wrote:

 >
> I'm in the middle of an overhaul of nand stuff. I modified the id structure 
> and forgot to adjust the doc stuff. I have a look into it
> 

Hello,


I think I found another missed update but I'm not sure.


I used CVS to pull down the whole mtd tree on 4-5-2004 after those 
changes were posted.

I used the automatic kernel patch script

When I get the following error when I compile the kernel modules

I am using the 2.4.25 kernel


make -C devices modules
make[3]: Entering directory `/usr/src/linux-2.4.25/drivers/mtd/devices'
gcc -D__KERNEL__ -I/usr/src/linux-2.4.25/include -Wall 
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common 
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i486 
-DMODULE  -nostdinc -iwithprefix include -DKBUILD_BASENAME=doc2000  -c 
-o doc2000.o doc2000.c
doc2000.c: In function `DoC_IdentChip':
doc2000.c:415: structure has no member named `page256'
doc2000.c: In function `DoC2k_init':
doc2000.c:601: warning: assignment from incompatible pointer type
doc2000.c:602: warning: assignment from incompatible pointer type
doc2000.c: In function `doc_writev_ecc':
doc2000.c:1026: warning: passing arg 7 of `doc_write_ecc' makes integer 
from pointer without a cast
make[3]: *** [doc2000.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.25/drivers/mtd/devices'
make[2]: *** [_modsubdir_devices] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.25/drivers/mtd'
make[1]: *** [_modsubdir_mtd] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.25/drivers'
make: *** [_mod_drivers] Error 2



CONFIG_MTD=y
CONFIG_NFTL=m
CONFIG_NFTL_RW=m
CONFIG_INFTL=m
CONFIG_MTD_DOC2000=m
CONFIG_MTD_DOC2001=m
CONFIG_MTD_DOC2001PLUS=m
CONFIG_MTD_DOCPROBE=m
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_IDS=y



Side Note:

I haven't been able to determine exactly what I need to compile to 
support my DiskOnChip  M02202-D256 chip with the 5.1.2 firmware from 
M-Systems.  Am I on the right path to getting it working?


Thanks,

Jon Schlueter
