Received: from [61.220.198.131] (helo=mail.coventive.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BYibe-0000vc-3y
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2004 05:45:52 -0400
Received: from coventive.com (mail [127.0.0.1])
	by mail.coventive.com (8.11.6/8.11.6) with ESMTP id i5B9p3j15715
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jun 2004 17:51:04 +0800
Message-ID: <40C97F5F.2070309@coventive.com>
Date: Fri, 11 Jun 2004 17:46:07 +0800
From: Jason Chen <jason_chen@coventive.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: undefined reference to `tx4925_read_nfmc'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello sir/madam;

I'am working on Toshiba TX4925 board with Linux 2.4.22 and I want to use
jffs2 on NAND flash. I have run the mtd patch on my kernel, but now my
kernel doesn't compile anymore, the error message is:

drivers/mtd/mtdlink.o: In function `tx4925ndfmc_readecc':
drivers/mtd/mtdlink.o(.text+0x13ab4): undefined reference to
`tx4925_read_nfmc'
drivers/mtd/mtdlink.o: In function `tx4925ndfmc_nand_read_byte':
drivers/mtd/mtdlink.o(.text+0x13b4c): undefined reference to
`tx4925_read_nfmc'
drivers/mtd/mtdlink.o: In function `tx4925ndfmc_nand_write_byte':
drivers/mtd/mtdlink.o(.text+0x13b78): undefined reference to
`tx4925_write_nfmc'
drivers/mtd/mtdlink.o: In function `tx4925ndfmc_nand_write_buf':
drivers/mtd/mtdlink.o(.text+0x13bc4): undefined reference to
`tx4925_write_nfmc'
drivers/mtd/mtdlink.o: In function `tx4925ndfmc_nand_read_buf':
drivers/mtd/mtdlink.o(.text+0x13c2c): undefined reference to
`tx4925_read_nfmc'
drivers/mtd/mtdlink.o: In function `tx4925ndfmc_nand_verify_buf':
drivers/mtd/mtdlink.o(.text+0x13c98): undefined reference to
`tx4925_read_nfmc'
make: *** [vmlinux] Error 1

Please help,

Thanks in advance.

Jason Chen
