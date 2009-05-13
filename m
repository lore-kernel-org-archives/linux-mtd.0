Received: from rv-out-0708.google.com ([209.85.198.241])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4Be9-00074O-V1
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 10:25:16 +0000
Received: by rv-out-0708.google.com with SMTP id c5so408295rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 May 2009 03:25:07 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 13 May 2009 18:25:07 +0800
Message-ID: <50a974c70905130325n76826b89o5054d5c7473d63e1@mail.gmail.com>
Subject: map mtd partitions address for TWO NOR flash
From: "H. Johnny" <johnny.hung543@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys!
    I have a mpc8313erbd (powerpc arch) demo board. There are one NOR
flash and one NAND flash on board.
The drivers/mtd/map/mpc8313erbd.c do address map for NOR flash. I want
to add another NOR flash and take off the NAND flash.
So there are two NOR flash on board.
    I am trying to do address map for two NOR flash but I don't know
how to. Some part of drivers/mtd/map/mpc8313erbd.c code is as
following:
    Do I need to add another mtd_partition structure ? How to assign
the partition_info to specific NOR flash (coz the two NOR flash are
the same)
BTW, I know u-boot can pass the mtdparts parameters to linux kernel.
Which mtd partition info linux kernel will use, u-boot mtdparts info
or static address map code ?
    thanks, regards.

static struct mtd_partition partition_info[]={
    {
        .name        = "U-Boot",
        .offset     = 0,
        .size        = 0x100000,
        .mask_flags = MTD_WRITEABLE
    },
    {
        .name        = "Kernel",
        .offset        = MTDPART_OFS_APPEND,
        .size        = 0x200000
    },
    {
        .name        = "JFFS2",
        .offset        = MTDPART_OFS_APPEND,
        .size        = 0x400000,
        },
    {
        .name        = "dtb",
        .offset        = MTDPART_OFS_APPEND,
        .size        = 0x100000,
    },
};

-- 
H. Johnny
