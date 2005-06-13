Received: from karma.reboot.ca ([67.15.48.17])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DhuXP-00006e-Cn
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 15:24:00 -0400
Received: from niro (S01060004e28f4900.du.shawcable.net [70.67.196.121])
	by karma.reboot.ca (8.12.10/8.12.10) with SMTP id j5DIrZiB016244
	for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2005 11:53:36 -0700
Message-ID: <007401c57049$9fbd6440$6702a8c0@niro>
From: "Andre" <andre@rocklandocean.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 13 Jun 2005 11:56:35 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: diskonchip2000 how to
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a msys doc2000 384MB device and are running 2.6.11. I used to run in
2.4.27 with msys' trueffs doc driver, however I would like to give the
linux-mtd driver a try.

Is it better to use NFTL or JFFS2?

The documentation lists the following kernel options for getting JFFS2 on
NAND support in the kernel:
CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_YOURBOARD=y
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_NAND=y

What are the options that are needed to get NFTL to work on diskonchip
devices?

cheers,
Andre
