Received: from wproxy.gmail.com ([64.233.184.194])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CfM8x-0007hu-Vh
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 12:43:57 -0500
Received: by wproxy.gmail.com with SMTP id 67so156662wri
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Dec 2004 09:43:54 -0800 (PST)
Message-ID: <d52a4b1c041217094333b5bf0@mail.gmail.com>
Date: Fri, 17 Dec 2004 11:43:54 -0600
From: Ian Yap <d2army@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Please help in getting kernel 2.6.8.1 to work with a DOC 2000
Reply-To: Ian Yap <d2army@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there everyone

I was wondering if anyone has been able to boot from a kernel 2.6.8.1
on with an M-Sys Disk-On-Chip(DOC) 2000 on an AMP (Advanced Micro
Peripherals) MICRO886ULP Single-Board-Computer with a Crusoe Transmeta
800 Mhz processor?

I have enabled DOC probing for both self contained MTD and NAND flash
devices when compiling the 2.6.8.1 kernel. However, when I try to boot
from this kernel image I made on the SBC, I get :

DiskOnChip 2000 found at address 0xD8000

Flash Chip found: Manufactureer ID: EC, Chip ID: 73 (Samsung: NAND 16
MiB 3 , 3V 8-bit)

(slight pause)

3 flash chips found. Total DiskOnChip size: 48 MiB

Ignoring DiskOnChip 2000 at 0xDA000 - already configured
Ignoring DiskOnChip 2000 at 0xDC000 - already configured
Ignoring DiskOnChip 2000 at 0xDE000 - already configured

DiskOnChip 2000 found at address 0xD8000

DiskOnChip 2000 responds to DWORD access

NAND device: Manufacturer ID: 0xec, Chip ID: 0x73 (Samsung NAND 16MiB
3, 3V 8-bit)

(hangs forever)

There is no kernel panic message though

I have a patched LILO on this machine already and someone got it to
work with 2.4.x using an initrd image that he would use to boot the
kernel from using "initrd="

Therefore, I am wondering if I really need to figure out how to make
an initrd boot image like that in order to make the 2.6.8.1 kernel
work as well

Thank a lot in advance!
I.S.
