Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WTs5-0003Cj-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2003 04:00:45 +0000
Received: from [192.168.4.57] (account xjin HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2674881 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2003 20:31:47 -0800
Message-ID: <3E1CFAEC.2090608@redswitch.com>
Date: Wed, 08 Jan 2003 20:30:36 -0800
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Compilation error on the latest mtd code
Content-Type: text/plain; charset=us-ascii; format=flowed
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

When compiling the latest mtd code with the kernel linuxppc_2_4_devel 
checked out from bk://ppc.bkbits.net, I encountered the following error. 
This kind of error seems to be caused by some special control character 
in a text file. So I used 'dos2unix' to convert all header files. But it 
didn't solve the error. Any hints? Thank you very much.


ppc_8xx-gcc -D__KERNEL__ 
-I/u/xjin/2_4_devel/Software/Linux/MPC855/linuxppc_2_4_
devel/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 
-fno-strict-aliasing
-fno-common -fomit-frame-pointer 
-I/u/xjin/2_4_devel/Software/Linux/MPC855/linux
ppc_2_4_devel/arch/ppc -fsigned-char -msoft-float -pipe -ffixed-r2 
-Wno-uninitia
lized -mmultiple -mstring   -nostdinc -I 
/opt/eldk2.0/usr/lib/gcc-lib/ppc-linux/
2.95.4/include -DKBUILD_BASENAME=mtdblock_core  -c -o mtdblock-core.o 
mtdblock-c
ore.c
In file included from 
/u/xjin/2_4_devel/Software/Linux/MPC855/linuxppc_2_4_devel
/include/linux/blk.h:4,
                  from mtdblock-core.c:18:
/u/xjin/2_4_devel/Software/Linux/MPC855/linuxppc_2_4_devel/include/linux/blkdev.
h:147: parse error before `struct'

- Shawn.
