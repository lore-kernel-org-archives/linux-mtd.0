Received: from wr-out-0506.google.com ([64.233.184.233])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I0tYT-0008RF-T5
	for linux-mtd@lists.infradead.org; Wed, 20 Jun 2007 02:20:39 -0400
Received: by wr-out-0506.google.com with SMTP id 58so80463wri
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jun 2007 23:20:36 -0700 (PDT)
Message-ID: <4dde4acb0706192320n7ca4157q1219adfb68e50ce1@mail.gmail.com>
Date: Wed, 20 Jun 2007 11:50:35 +0530
From: "Midhun Agnihotram" <agnimidhun@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: /proc/mtd file does not show partitions
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hi All,

   We want to use the on board flash as our file system on our
Development Kit (CSB535FS). We have defined the partitions in the
respective file and the kernel creates the partitions while bootig.

RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
Cirrus Logic CS8900A driver for Linux (V0.02)
eth0: CS8900A rev E detected
physmap flash device: 800000 at c8000000
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
RedBoot partition parsing not available
mtd: Giving out device 0 to phys_mapped_flash
Probing flash00 at physical address 0xc8000000 (16-bit bankwidth)
flash00: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Done probing.
Setting mtd_parts to csbxxx_partitions.
Should be adding devices or partitions now.
Going to call add_mtd_partitions.
csbxxx: using static partition definition
Creating 3 MTD partitions on "flash00":
0x00000000-0x00200000 : "U-Boot flash"
mtd: Giving out device 1 to U-Boot flash
0x00200000-0x00400000 : "Kernel flash"
mtd: Giving out device 2 to Kernel flash
0x00400000-0x00800000 : "RootFS flash"
mtd: Giving out device 3 to RootFS flash


   I boot with a Ramdisk. I have created the required mtd entries in
the Ramdisk's /dev folder. On the target's linux prompt, when I do a
cat /proc/mtd, it says that the file does not exist. Who is supposed
to create this file? Is it not the kernel which creates this file when
the partitions are created? I am pretty new to MTD. What is the
problem here?

Thanks,
Midhun.
