Received: from [202.114.36.28] (helo=bbs.ccnu.edu.cn)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 196mXN-00005l-En
	for <linux-mtd@lists.infradead.org>; Sat, 19 Apr 2003 08:13:26 +0100
Date: Sat, 19 Apr 2003 15:29:6 +0800
From: lhl <lhl@phy.ccnu.edu.cn>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Message-Id: <E196mXN-00005l-En@pentafluge.infradead.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Subject: How to Install grub on DiskOnChip?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I had download the doc-grub-20000128.tar.gz,then
#make
#/usr/src/mtd/util/doc_loadbios /dev/mtd0 grub_firmware
and I found the partition I had make in /dev/nftla had lost,and 
fdisk /dev/nfla again make nfla1
mke2fs /dev/nfla1
then cp the root filesystem onto /dev/nfla1
reboot,system still boot my hda device.
