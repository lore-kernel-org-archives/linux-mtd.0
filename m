Received: from m12-15.163.com ([220.181.12.15] helo=m5-85.163.com)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqf5e-000475-43
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 02:29:23 +0000
Date: Fri, 17 Oct 2008 10:26:34 +0800
From: "Bily" <hsssss1111@163.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: at91_nand could not be built as module?
Message-ID: <200810171026331871103@163.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,all
    it seems as if at91_nand could not be built as module in kernel-2.6.26;I am using the kernel-2.6.26 on at91rm9200, and i try to build at91_nand as module ,however i fail;and find out that the function "nand_partitions"in board-dk.c is defined as "__init",it limits the using of this function after the init of linux;
but when i remove the init, it does not work well because the "udev" in user space could not create the device node in /dev,so i just want to know if there is a right way to make at91_nand as module ? thanks for help!~




Bily
2008-10-17
