Received: from smtrly01.smartm.com ([158.116.149.131])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ADr6m-0004VU-3u
	for <linux-mtd@lists.infradead.org>; Sun, 26 Oct 2003 20:03:28 +0000
Message-ID: <903E17B6FF22A24C96B4E28C2C0214D7012BB2D8@sr-bng-exc01.int.tsbu.net>
From: "Karoliya, Abhishek" <Abhishek.Karoliya@fci.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 27 Oct 2003 01:30:52 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Intel K3 Flash + MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
  
     I am using an Intel 128k3 flash chips {4 chips in total with each pair
forming a 32MB capacity} on a PMC board having powerpc 7447 + marvel 64360
combination . I running Linux from kernel.org 2.4.20 version.
         I can erase and write to flash without any problems . But once
written to flash when I reboot and  read back {using the mtd utils } it just
returns 0x80 for all location. 
   I am pretty sure that write is successful as I burn my image and ramdisk
into the flash from Linux and can reboot the board using these flash
contents. Also I have taken care that the flash is unlocked every time by
writing the unlock pattern to the flash  through the init code in the mtd
map file.
   Is the cache playing some havoc??
Please provide some pointers in the direction of resolution of this problem.

thanks a million
Abhishek

 

   
