Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QXAgH-0005qf-FJ
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2011 11:24:17 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QXAgA-0007Ic-RC
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2011 13:24:06 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2011 13:24:06 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2011 13:24:06 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: [NAND] Are partitions persistent?
Date: Thu, 16 Jun 2011 13:23:52 +0200
Message-ID: <khpjv6l6bhe815s0rj9frue0l5qqpb8hfq@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

	I was wondering: Are partitions on NAND persistent, or is it up to
the developer to make sure the images used to populate the different
partitions are small enough to fit the partitions set in the NAND
driver?

For instance, this found through Google:
=============
static struct mtd_partition bfin_spi_flash_partitions[ ] = {
    {
        .name = "bootloader(spi)",
        .size = 0x00040000,
        .offset = 0,
        .mask_flags = MTD_CAP_ROM
    }, {
        .name = "linux kernel(spi)",
        .size = 0x180000,
        .offset = MTDPART_OFS_APPEND,
};
=============

Does it mean that, for instance, when using Uboot's nandwrite to
update the bootloader above, it's up to me to make sure that the image
is smaller than 0x40000 and Uboot will happily keep going and erase
part of the linux kernel, or is the MTDPART_OFS_APPEND option
precisely made to avoid this and trigger an error?

Thank you.
