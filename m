Received: from bay14-f6.bay14.hotmail.com ([64.4.49.6] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EUKnt-000570-9t
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2005 05:09:14 -0400
Message-ID: <BAY14-F6816619ADEB02C2E69011DC760@phx.gbl>
In-Reply-To: <BAY14-F1500C94F4B63F41DF7A2D3DC770@phx.gbl>
From: "z xw" <zxwitsme@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 25 Oct 2005 16:51:38 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Subject: RE: NAND flash on dbmx1ads
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Because the NAND flash hasn't change the order of the mtd minor number, the 
root filesystem should be still norflash.But the mounting of root fs 
failed. I am puzzled about it.  
Thanks for you kindly help.

>From: "z xw" <zxwitsme@hotmail.com>
>To: linux-mtd@lists.infradead.org
>Subject: NAND flash on dbmx1ads 
>Date: Mon, 24 Oct 2005 09:04:00 +0800
>
>Dear All,
>
>          I want to use the k9f2808 NAND flash on my mx1ads board, 
>and I use kernel 2.4.27 version. Also, the nand_scan function can 
>sucussfully read the manufacture id and vendor id from my nand 
>flash, but when boot up, it will pop up such following message, it 
>seems that the kernel try to erase the NAND flash but failed and the 
>whole kernel halt.
>          Anybody has encounterred such a situation. I really got a 
>headache on my NAND device. Thanks for you help.
>          The kernel boot up information is as below:
>
>Linux version 2.4.27-vrs1-ssl7 (root@localhost.localdomain) (gcc 
>version 3.2.3) #22 五 10月 21 18:01:05 CST 2005
>CPU: Arm920Tid(wb) revision 0
>Machine: Motorola MX1ADS
>......
>start to init nand flash
>ep7312_fio_pbase=0xf2000000
>ep7312_fio_base=0xf2000000
>start to scan the mx1 nand flash
>nand_scan() function start
>nand_command
>nand_maf_id=0xec,nand_dev_id=0x73
>NAND device: Manufacture ID: 0xec, Chip ID: 0x73 (Samsung NAND 16MB 
>3,3V)
>bp6
>nand_scan() function end
>Using static partition definition
>Creating 1 MTD partitions on "NAND 16MB 3,3V":
>0x00000000-0x01000000 : "MX1 Nand Flash"
>init nand flash complete
>SDRAM disk initialized.
>cramfs: wrong magic
>FAT: bogus logical sector size 29440
>UMSDOS: msdos_read_super failed, mount aborted.
>FAT: bogus logical sector size 29440
>FAT: bogus logical sector size 29440
>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
>0x00000000: 0x3de5 instead
>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
>0x00000004: 0xe073 instead
>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
>0x00000008: 0x00ef instead
>......
>......
>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
>0x004e0004: 0x00ad instead
>jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
>0x004e0008: 0xb0f3 instead
>JFFS2: Erase block at 0x004e0000 is not formatted. It will be erased
>Cowardly refusing to erase blocks on filesystem with no valid JFFS2 
>nodes
>Kernel panic: VFS: Unable to mount root fs on 1f:02
>
>
>Regards,
>Vincent Zhou
>
>_________________________________________________________________
>免费下载 MSN Explorer:   http://explorer.msn.com/lccn
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/

_________________________________________________________________
享用世界上最大的电子邮件系统— MSN Hotmail。  http://www.hotmail.com  
