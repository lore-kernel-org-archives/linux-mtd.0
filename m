Received: from bay110-f5.bay110.hotmail.com ([65.54.229.15] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FecTn-0004OE-Ly
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 14:35:16 -0400
Message-ID: <BAY110-F56850C54FA653AED377E3BCAC0@phx.gbl>
From: "Han Chang" <posaune@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 12 May 2006 11:17:00 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Subject: NAND/JFFS2 utility tools.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to make use of the utility tools, such as mkfs.jffs2, 
flash_eraseall, flash_erase, flash_info, nanddump, etc.. Except the 
mkfs.jffs2, looks like other tools are using the mtdchar's ioctl.

When I enable the NAND driver, it creates the partition and puts entries as 
/dev/mtd2 and /dev/mtdblock2. I usually use the /dev/mtdblock2 for "dd" or 
"mount -t jffs2".

Now, I realized those tools don't work with /dev/mtdblock2, so i tried 
/dev/mtd2, which is the char driver. For flash_info, which tries to open 
/dev/mtd2 in RDONLY mode, it opened file ok, but got msg "Device /dev/mtd2 
has 0 erase regions". For flash_erase and flash_eraseall, which try to open 
/dev/mtd2 in RDWR mode, it got "File open error".

Anyone has any advices on making these tools working?

Thanks,
Han
