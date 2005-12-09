Received: from web26307.mail.ukl.yahoo.com ([217.146.176.18])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ekbdc-0002lv-Pa
	for linux-mtd@lists.infradead.org; Fri, 09 Dec 2005 01:21:50 -0500
Message-ID: <20051209061506.55379.qmail@web26307.mail.ukl.yahoo.com>
Date: Fri, 9 Dec 2005 06:15:06 +0000 (GMT)
From: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Problem using JFFS2 on MTD mtd using Intel flash TE28F640!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,
      I am using and Intel TE28F640 NOR flash on an
ARM processor based target board. I am having problems
mounting a JFFS2 filesystem on this flash, If someone
has mounted JFFS2 on above flash device, can you
please comment on the problem I explain below.

Before I go to problem let me show you the
configuration options I am using.

--------------------------------------------------------
#General Setup

CONFIG_SET_MEM_PARAM=y
DRAM_BASE=00A00000
DRAM_SIZE=01E00000
FLASH_MEM_BASE=04800000
FLASH_SIZE=00800000
CONFIG_RAMKERNEL=y
CONFIG_CPU_ARM940_CPU_IDLE=y
CONFIG_CPU_ARM940_I_CACHE_ON=y
CONFIG_CPU_ARM940_D_CACHE_ON=y
CONFIG_CPU_ARM940_WRITETHROUGH=y

CONFIG_CNXT_IRQ_SPECIAL=y
CONFIG_CPU_32=y

CONFIG_CPU_32v4=y
CONFIG_CPU_ARM940T=y
CONFIG_NO_PGT_CACHE=y
CONFIG_CPU_WITH_CACHE=y
CONFIG_CPU_WITH_MCR_INSTRUCTION=y

# Memory Technology Devices (MTD)

CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y

# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_UTIL=y

# Mapping drivers for chip access

CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=04800000
CONFIG_MTD_PHYSMAP_LEN=00800000
CONFIG_MTD_PHYSMAP_BANKWIDTH=2

# File systems

CONFIG_JFFS_FS=y
CONFIG_JFFS_FS_VERBOSE=3
CONFIG_JFFS_PROC_FS=y
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=3
CONFIG_JFFS2_FS_WRITEBUFFER=1
CONFIG_JFFS2_ZLIB=y

-----------------------------------------------------------------


Also please allow me to show you my partition table
structure in the physmap.c file


/**********************************************************

static struct mtd_partition my_partitions[] = {
/* Put your own partition definitions here */
	{
		name:		"boot",
		size:		0x010000,
		offset:		0,
		mask_flags:	MTD_WRITEABLE,  /* force read-only */
	}
	,{
		name:		"kernel",
		size:		0x0F0000,
		offset:		MTDPART_OFS_APPEND,
		mask_flags:	MTD_WRITEABLE,  /* force read-only */
	}
	,{
		name:		"usr_cramfs",
		size:		0x300000,
		offset:		0x100000,
		mask_flags:	MTD_WRITEB_WRITEABLE,  /* force
read-only */
	}
	,{
		name:		"jffs2-rdonly",
		size:		0x050000,
		offset:		0x400000,
		mask_flags:	MTD_WRITEB_WRITEABLE,  /* force
read-only */
	}
	,{
		name:		"jffs2",
		size:		0x050000,
		offset:		0x400000,
                mask_flags:	MTD_WRITEB_WRITEABLE,  /*
force read-only */
	}
	,{
		name:		"root_cramfs",
		size:		MTDPART_SIZ_FULL,
		offset:		0x700000,
		mask_flags:	MTD_WRITEB_WRITEABLE,  /* force
read-only */
	}

};

*************************************************************/

Now please let me explain you the actual behaviour:

I try the following commands on target board

#mkdir /var/mnt
#mount -t jffs2 /dev/mtdblock4 /var/mnt

At this stage it mounts the JFFS2 properly on the
directory, but if I try to write a file on /var/mnt/,
it gives me an error saying "No space left on device".

#cp file1.txt /var/mnt/.
file1.txt: No Space let on device

#echo "hello" > /var/mnt/t.txt
t.txt: Cannot create

This Error appears even if I increase the partition
size in the above partition table. Apparently the
above error is coming from the function
'jffs2_reserve_space' where it returns me error
-ENOSPC

Also another problem I am facing is when I use some
flash utilities like 'flash_erase' on '/dev/mtd4', it
somehow corrupts other flash filesystem images, the
ones above to JFFS2 where I have some files in a
CRAMFS filesystem. My requirement is that  I need to
have both CRAMFS and JFFS2 co-exist on same flash
chip. 

Any comments on above problem I am facing would be of
great help for me. Is my configuration and partition
table right?

Thank you
Sreecharan.S





		
___________________________________________________________ 
To help you stay safe and secure online, we've developed the all new Yahoo! Security Centre. http://uk.security.yahoo.com
