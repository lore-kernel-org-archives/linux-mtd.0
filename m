Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WhIs-0004uB-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2003 18:21:18 +0000
Received: from [192.168.4.57] (account xjin HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2675365 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2003 10:52:21 -0800
Message-ID: <3E1DC4A0.3000009@redswitch.com>
Date: Thu, 09 Jan 2003 10:51:12 -0800
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: latest mtd code from CVS cannot be compiled with the latest linuxppc_2_4_devel
 tree? Weird???
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

Hi,

I had a compilation error when compiling linuxppc_2_4_devel 
(v2.4.21-pre3) with the latest mtd code. Here is the error message.

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

I tried to solve the problem by moving #include <linux/blk.h> forward, 
which is originally after #include <linux/mtd/compatmac.h>. So 
mtdblock-core.c became the following.

#include <linux/config.h>
#include <linux/types.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/slab.h>
#include <linux/blk.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/compatmac.h>
#include "mtdblock.h"

And the error was gone.

However when mtdblock-24.c was compiled, the same error message occured. 
And this time I had no such luck because there seems to be some specific 
sequence to be followed when headers are included. This time 
<linux/blk.h> cannot be moved forward. So I doubt that I solved the 
compilation error in mtdblock-core.c.

#include <linux/config.h>
#include <linux/types.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/slab.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/compatmac.h>
#include "mtdblock.h"

#define DEVICE_REQUEST mtdblock_request
#define DEVICE_NR(device) (device)
#define DEVICE_ON(device)
#define DEVICE_OFF(device)
#define DEVICE_NO_RANDOM
#include <linux/blk.h>

The compiler I used is from ELDK 2.0 (ppc_8xx-gcc 2.95.4). Is it a known 
  problem that already has been solved?

-- 
Shawn Jin
RedSwitch Inc.
