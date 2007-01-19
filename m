Received: from web30403.mail.mud.yahoo.com ([68.142.200.106])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7oJk-0004ZI-8F
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 02:37:57 -0500
Date: Thu, 18 Jan 2007 23:30:41 -0800 (PST)
From: Weiguang Shi <wgshizz@yahoo.com>
Subject: cat zImage >/dev/mtd1 does not work
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <893459.85516.qm@web30403.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

I'm running snapgear-3.4.0 on an IXDP425 board with RedBoot as 
the bootloader and I want to
be able to upgrade my kernel and filesystem, i.e., zImage and 
ramdisk.gz on the flash, under Linux.

So I shipped the zImage and ramdisk.gz onto the running system
and did
    # cat zImage >/dev/mtd1
    # cat ramdisk.gz >/dev/mtd2

after eraseall the two partitions. To my surprise, when I reboot,
RedBoot gave 
                        RedBoot> fis load ramdisk                             
                        ** Warning - checksum failure.  stored: 0x33dbe19b, computed:
                        0xc9d7dfef                                            
                        RedBoot> fis load kernel                              
                        ** Warning - checksum failure.  stored: 0xfb99dd45, computed:
                        0x788bb713                                            
                        RedBoot> exec -c "console=ttyS0,115200 root=/dev/ram0 
                        initrd=0x00800000,6M mem=32M@0x00000000" 0x01600000   
                        Can't execute Linux - invalid entry address           
and refused to boot.

I understand here the newly flashed images (as it was not done in RedBoot but in the OS) may
not have the same checksum as RedBoot calculated for the earlier images. And this caused the
problem.

Any help is appreciated.

Weiguang


BTW, my MTD partition layout looks like

# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00080000 00020000 "RedBoot"
mtd1: 00100000 00020000 "kernel"
mtd2: 00200000 00020000 "ramdisk"
mtd3: 00020000 00020000 "vendor_config"
mtd4: 0001f000 00020000 "FIS directory"
mtd5: 00001000 00020000 "RedBoot config"


 
____________________________________________________________________________________
Don't get soaked.  Take a quick peak at the forecast
with the Yahoo! Search weather shortcut.
http://tools.search.yahoo.com/shortcuts/#loc_weather
