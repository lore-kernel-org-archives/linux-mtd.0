Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WoaO-0005jv-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 02:07:52 +0000
Message-ID: <3E1E31F9.3020700@redswitch.com>
Date: Thu, 09 Jan 2003 18:37:45 -0800
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,  linuxppc-embedded@lists.linuxppc.org
Subject: rq_data_dir() in linux/blkdev.h is redundant
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

When compiling linuxppc_2_4_devel (2.4.21-pre3) with the latest 
MTD/JFFS2 code, I had such error posted in a previous message.

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

After traced down the problem, I found that it was caused by the 
definition of rq_data_dir() in linux/blkdev.h. The definition is as 
follows, which seems to be useless.

extern inline int rq_data_dir(struct request *rq)
{
	if (rq->cmd == READ)
		return READ;
	else if (rq->cmd == WRITE)
		return WRITE;
	else {
		BUG();
		return -1;
	}
}

Actually linux/mtd/compacmatmac.h defines rq_data_dir() as
   #define rq_data_dir(x) ((x)->cmd)
if the kernel version is older than 2.5.0.

-- 
Shawn Jin
RedSwitch Inc.
