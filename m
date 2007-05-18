Received: from eva.fit.vutbr.cz ([147.229.176.14])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hp0Cb-0001Vu-JI
	for linux-mtd@lists.infradead.org; Fri, 18 May 2007 07:00:55 -0400
Received: from fit.vutbr.cz (hermina.fit.vutbr.cz [147.229.9.15])
	by eva.fit.vutbr.cz (envelope-from xbedna13@stud.fit.vutbr.cz)
	(8.13.8/8.13.7) with ESMTP id l4IAiJAX034842
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 May 2007 12:44:19 +0200 (CEST)
Message-ID: <20070518124419.zreeybdwggkskc84@email.fit.vutbr.cz>
Date: Fri, 18 May 2007 12:44:19 +0200
From: =?iso-8859-2?b?QmVkbuH4?= Jakub <xbedna13@stud.fit.vutbr.cz>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 softlinks problem
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-2;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody, I have a trouble wit JFFS2

   I have a device with NOR and NAND flash.
   On the NOR flash there are some partitions:
       - kernel image
       - cramfs initrd image
       - JFFS2 rootfs with links into cramfs initrd
          image (busybox and so on)
          This partiotion is mounted read only
          and is created with flash_erase mtd3 0x00 48; and
          decompresing of rootfs from tarbal

On the NAND flash there are other JFFS2 partitions created with
flash_eraseall -j mtd4;

If I fill the NAND JFFS2 partition with data several times, the links from
rootfs to cramfs and some folders in tmpfs got broken and lot of things
stops working. After reboot  the links are OK again.

How is it possible? Can something got wrong in RAM? Moving erase blocks
can broke links?

Thanks for Your help, really dont know where to start.
Regards Jakub
