Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6Lwu-00055z-Ke
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 08:44:57 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K6Lwq-0000Zv-VN
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 08:44:53 +0000
Received: from vpn28.rz.tu-ilmenau.de ([141.24.172.28])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2008 08:44:52 +0000
Received: from andre.puschmann by vpn28.rz.tu-ilmenau.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2008 08:44:52 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
Subject: Mounting mtd block device raises "Block device required"
Date: Wed, 11 Jun 2008 10:44:44 +0200
Message-ID: <g2o39t$703$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

I am successfully running kernel 2.6.21 on a custom AT91RM9200-based
board. I now updated to kernel 2.6.25 for various reasons.

Now, we use the _new_ atmel_spi driver and mtd_dataflash driver (but the
problem also exist if I use the legacy one). If I try to mount a
jffs2 or cramfs image on dataflash I get the following error:
# mount /dev/mtdblock5 /mnt/flash
mount: mounting /dev/mtdblock5 on /mnt/flash failed: Block device required

Exactly the same line works with the 2.6.21 kernel. Also doing a cat
on the normal /dev/mtd* nodes also works.

"cat /proc/devices" shows:

Block devices:
  7 loop
 31 mtdblock

So I have no idea here. Any hints?


Thanks in advance.

Best regards,
	Andre
