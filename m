Received: from [86.61.157.50] (helo=hnilux.racom.cz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HpLlR-0004gv-Lr
	for linux-mtd@lists.infradead.org; Sat, 19 May 2007 06:02:19 -0400
Date: Sat, 19 May 2007 11:55:35 +0200
From: Jakub Bednar <bednar@hnilux.racom.cz>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 softlinks problem
Message-ID: <20070519115535.A8761@hnilux.racom.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody, I have a trouble with JFFS2 and softlinks.

  I have a device with NOR and NAND flash.
  On the NOR flash there are some partitions:
      - kernel image
      - cramfs initrd image
      - JFFS2 rootfs with links into cramfs initrd
         image (busybox and so on)
         This partiotion is mounted read-only
         and is created with flash_erase /dev/mtd3 0x00 48;
	 mounted with mount -t jffs2 mtd0 /mnt;
         and decompresing of rootfs from tarbal to /mnt;

On the NAND flash there are other JFFS2 partitions created with
flash_eraseall -j /dev/mtd4;

If I fill the NAND JFFS2 partition with data several times, the links from
rootfs to cramfs and some folders in tmpfs got broken and lot of things
stop working. After reboot  the links are OK again.

How is it possible? Can something got wrong in RAM? Moving erase blocks
can broke links?

Thanks for Your help, really dont know where to start.
Regards Jakub
