Received: from smtp12.singnet.com.sg ([165.21.6.22])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEmUK-0003df-6s
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2006 07:00:59 -0500
Received: from [167.116.151.204] ([63.150.136.42])
	by smtp12.singnet.com.sg (8.13.5/8.13.4) with ESMTP id k22BMbPm031997
	for <linux-mtd@lists.infradead.org>; Thu, 2 Mar 2006 19:22:37 +0800
Message-ID: <4406D574.8050808@singnet.com.sg>
Date: Thu, 02 Mar 2006 19:22:28 +0800
From: Terence Soh <gopher@singnet.com.sg>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: How to partition NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to get a 64 MByte nand flash to be partitioned in a 32MB 
cramfs and 32MB jffs2 partition.

I tried to do this in the kernel by

static struct mtd_partition partition_info[] = {
         [0] = {
                 .name   = "CRAM",
                 .offset = 0,
                 .size   = 32 * 1024 * 1024,
                 .mask_flags     = MTD_WRITEABLE,  /* force read-only */
         },
     [1] = {
                 .name   = "JFFS2",
                 .offset = 32 * 1024 * 1024,
                 .size   = MTDPART_SIZ_FULL,
     }
};

but when I cat/proc/mtd, I get
/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 04000000 00004000 "rootfs"

so I realise that this is affected by the bootargs passed which is
"console=ttyS0 mtdparts=a9m9750:0x4000000@0(rootfs) root=mtdblock/0 
rootfstype=jffs2"

How should I passed the bootargs?

Thanks in advance,
Terence.
