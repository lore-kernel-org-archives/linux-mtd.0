Received: from [61.135.145.20] (helo=sohumx05.sohu.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17fYG9-0003aM-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2002 04:58:50 +0100
Received: from mail.sohu.com (unknown [192.168.41.41])
	by sohumx05.sohu.com (Postfix) with ESMTP id 98E8B596ED
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2002 11:54:13 +0800 (CST)
Message-ID: <6753069.1029470073112.JavaMail.postfix@mailsrv1.mail.sohu.com>
Date: Fri, 16 Aug 2002 11:54:20 +0800 (CST)
From: <jay.s@sohu.com>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Subject: grub loading problem, for help
Mime-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

thanks in advance.

I am doing as a document advice, since I havn't the choice of change boot sequence to NETWORK boot option in bios, I did ./configure without "--enable-diskonchip-biosnetboot ", now I halt the system and reboot it, it says :

DoC 2000 D800
E698
Jumping to Grub

then nothing appeared on the screen, the keyboard is not locked.

accidently, I reboot the system without the hard disk, things were changed as follows:

DoC 2000 D800
D698
Jumping to Grub
Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0xff
DiskOnChip 2000 found at d8000
floor 0, chip 0; manufacturer:Toshiba
Chip: Toshiba TC58V64AFT/DC, total size:8 MiB
erase unit: 8192 bytes, page: 512 bytes
total of 1 chip2 found - total capacity 8 MiB
Scanning for NFTL Media Header
NFTL Media Header found in flash sector 192
spare Media Header for NFTL 0 fount in flash sector 208
Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0xff
Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0x0
Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0x1
.....................
Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0xf
Attempting to open /boot/grub/menu.lst on drive 0x80, partition 0xff
Attempting to open /boot/grub/menu.lst on drive 0x80, partition 0xff
Attempting to open /boot/grub/menu.lst on drive 0x80, partition 0xf0
.....................
Attempting to open /boot/grub/menu.lst on drive 0x80, partition 0xf
Attempting to open /boot/grub/menu.lst on drive 0x0, partition 0xff
Attempting to open /boot/grub/menu.lst on drive 0x0, partition 0x0
.....................
Attempting to open /boot/grub/menu.lst on drive 0x0, partition 0xf

GRUB version 0.93 (616k lower / 31744k upper memory)

[ Minimal BASH-like line editing is supported......]
grub>


I feel lucky to see the prompt, however I cant access the doc anymore( I have tried to use "kernel ...." according to that howto), I have installed the contents in the doc and also the grub/menu.lst, but nothing help. Because I don't know grub much, I don't know what to do then.

could you have any suggestions?

regards

jays
