Received: from main.gmane.org ([80.91.229.2])
	by pentafluge.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CQAng-0008Ux-Va
	for linux-mtd@lists.infradead.org; Fri, 05 Nov 2004 20:35:16 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CQAnf-0006VE-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Nov 2004 21:35:11 +0100
Received: from dsl081-242-215.sfo1.dsl.speakeasy.net ([64.81.242.215])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Nov 2004 21:35:11 +0100
Received: from dave-gnus by dsl081-242-215.sfo1.dsl.speakeasy.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Nov 2004 21:35:11 +0100
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Fri, 05 Nov 2004 12:35:05 -0800
Message-ID: <m33bzonifa.fsf@bfnet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@sea.gmane.org>
Subject: in situ MTD upgrade from userspace (kernel, CRAMFS, YAFFS)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In my embedded system, I have previously been using the boot loader to
upgrade software (linux kernel, CRAMFS partition, YAFFS partition).
Now I want to add the feature of upgrading these partitions from
userspace so that this process can be controlled remotely.

I have two questions:

1.  There are many other processes running at the time of the upgrade.
    They are running out of CRAMFS.  As I overwrite the CRAMFS
    partition, is it possible that my write could get corrupted?
    Perhaps by crashing programs that inadvertently do weird syscalls?

2.  To simplify the write, I created a fourth partition that covers
    the whole MTD device.  That way, my program doesn't have to break
    the upgrade image up into different partitions.  Is there any
    problem with such an overlapping partition?

  static struct mtd_partition partition_info[] = {
          { name: "MTD NAND Boot partition",
            offset: 0,
            size: NAND_KERNEL_FS_SIZE},
          { name: "MTD NAND partition 1 - ROOT FS(cramfs)",
            offset: NAND_KERNEL_FS_SIZE,
            size: NAND_ROOT_FS_SIZE},
          { name: "MTD NAND partition 2 - usr fs (yaffs)",
            offset: NAND_ROOT_FS_SIZE+NAND_KERNEL_FS_SIZE,
            size: NAND_HOME_FS_SIZE },
          { name: "NAND part 3 - all parititions rewrite alias",
            offset: 0,
            size: NAND_TOTAL_SIZE }
  };

Thanks,
Dave
