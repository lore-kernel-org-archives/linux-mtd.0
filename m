Received: from host242-133.pool80206.interbusiness.it ([80.206.133.242]
	helo=dns.ctsgroup.it)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19RsCa-0008Lv-Cn
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2003 12:31:08 +0100
Received: from Massimo (dyn225.ctsgroup.it [192.6.1.225])
	by dns.ctsgroup.it (8.11.6/8.11.6) with SMTP id h5GBVbM04553
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2003 13:31:37 +0200
Message-ID: <001001c333fb$3c2b3ba0$e10106c0@Massimo>
From: =?iso-8859-1?Q?Massimo_Cal=F2?= <m.calo@ctsgroup.it>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 16 Jun 2003 13:34:23 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Data CRC failed on node...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

    I have a 5272 Motorola Coldfire based board, running "uClinux dist. :
uClinux-20030305.tar.gz" +

"Tool Chain : m68k-elf-tools-20030314.sh.".

I have a 2Mb flash (AMD AM29LV160DB) using MTD + JFFS2.

It has worked fine for a long time, then I received the following message
during the bootstarp :

        Command: mkdir /var/run
        Command: mkdir /var/lock
        Command: mount -t jffs2 /dev/mtdblock2 /mnt
        jffs2_scan_inode_node(): Data CRC failed on node at 0x0005ca64: Read
0xb399e587c
        jffs2_scan_inode_node(): Data CRC failed on node at 0x000a1424: Read
0xee61d2b26
        Command: ifconfig lo 127.0.0.1
        Command: route add -net 127.0.0.0 netmask 255.0.0.0 lo

To fix the problem I do the command "eraseall /dev/mtd2" and the error was
cleared.

I have posted the problem to the uClinux List and I received the following
answer :

>>        Yes. Pls umount when u done using the flash. Because if u don't
unmount
>>        properly it will just scan for the nodes once again when the
filesystems
>>        comes up next time. It's just scans all the nodes,if u properly
unmount
>>        the filesystem before turning it off. So pls ensure u umount the
>>        filesystem before turning off.


Do I have to mount/unmount the flash every time I have to read/write from it
?

Which is the correct way to read/write from flash to avoid the "Data CRC"
problem ?

Thanks!

Massimo.
