Received: from ag-out-0708.google.com ([72.14.246.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KGBSs-0006eT-9n
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 11:34:34 +0000
Received: by ag-out-0708.google.com with SMTP id 9so15839895agd.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Jul 2008 04:34:33 -0700 (PDT)
Message-ID: <7f0bd2d90807080434h13007cj68e242a8fc6fb48a@mail.gmail.com>
Date: Tue, 8 Jul 2008 08:34:33 -0300
From: "rtkk 2008" <rtkk2008@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Partition Creation Doubt when upgrading from 16M bytes to 32 M bytes
	flash memory
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am upgrading my platform from a flash of 16 M bytes to another one
with 32 Mbytes. Before the upgrading, I had four partitions that took
all the size of the flash, so I created another partition including
the new 16 Mbytes of the new flash. When I started the platform, this
new partition was not been mounted, even though the boot was telling
that the partition was created.
Bellow there is my source which is responsable to create the partitions.
Note that the new partition, created after de upgrading is the TEST one.
Does anyone know if this file is correct?
Does anyone know how to adapt this file to use all of the new flash?

Thanks and best regards


=========== flash.c partition source code ==============================

#ifdef CONFIG_MPC832x_RDB
#define WINDOW_ADDR 0xFE000000
/*#define WINDOW_SIZE 0x01000000*/
              <------- 16M flash window size
#define WINDOW_SIZE 0x2000000
                 <------- 32M flash window size  (Is that correct?)
#define PARTITION_0 0x0080000 /* 0xFE0size of U-boot partition */
#define PARTITION_1 0x0080000 /* size of device tree partition */
#define PARTITION_2 0x0200000 /* size of kernel partition */
#define PARTITION_3 0x0100000 /* size of JFFS2 HOME partition */
#define PARTITION_4 0x0100000 /* size of JFFS2 ETC partition */
#define PARTITION_5 0x0B00000 /* size of JFFS2 TEST partition */  <--
New partition created after the flash upgrading
#define PARTITION_6 0X1000000 /* size of EXT2 partition */

#endif

/* partition_info gives details on the logical partitions that the split the
 * single flash device into. If the size if zero we use up to the end of the
 * device. */
static struct mtd_partition partition_info[]={
 {
 .name = "U-Boot",
 .offset = 0,
 .size = PARTITION_0,
 .mask_flags = MTD_WRITEABLE
 },
 {
 .name = "Device tree (dtb)",
 .offset = MTDPART_OFS_APPEND,
 .size = PARTITION_1
 },
 {
 .name = "Kernel",
 .offset = MTDPART_OFS_APPEND,
 .size = PARTITION_2
 },
 {
 .name = "JFFS2_HOME",
 .offset = MTDPART_OFS_APPEND,
 .size = PARTITION_3
 },
 {
 .name = "JFFS2_ETC",
 .offset = MTDPART_OFS_APPEND,
 .size = PARTITION_4
 },
 {
 .name = "TEST",                                       <--- TEST parameters
 .offset = MTDPART_OFS_APPEND,
 .size = PARTITION_5
 },
 {
