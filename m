Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mxj1Z-0003am-Dk
	for linux-mtd@lists.infradead.org; Tue, 13 Oct 2009 15:11:00 +0000
Content-Type: text/plain; charset="iso-8859-1"
Date: Tue, 13 Oct 2009 17:10:49 +0200
From: "Philipp Boerker" <philipp.boerker@gmx.de>
Message-ID: <20091013151049.280490@gmx.net>
MIME-Version: 1.0
Subject: mtd partitions definition
To: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm sorry if this is the wrong place for such questions. I have done a lot of reading on the subject and have browsed through the kernel code for my device but still could not find the desired information (I'm no programming crack, I'm afraid). The situation is this:

I have an embedded device which has some mtd partitions which are controlled by the omap2-nand driver. The exact kernel sources for the device are unavailable at the moment (I expect them to be published by the manufacturer within the next weeks) so I collect most of the info I have from dmesg and grepping through the binaries. 

Now I would like to install my own bootloader which in the present case resides in an mtd partition that appears to be read-only (opening the device rw fails). I concluded that I had to change the partition definition to being writable in order to be able to write to the partition holding the bootloader (I assume that making the partition read-only was a kind of security measure on the side of the manufacturer). The remaining mtd partitions can be written using flash_image.

I have learned so far that there are (at least) three ways of defining mtd partitions: kernel command line ("cmdline parsing not available" in dmesg so it shouldn't be this), fixed (i.e. defined somewhere in the sources, however, a grep for the partition names listed in dmesg doesn't show anything) or redboot. The device does not use redboot as a bootloader but as far as I understand this does not mean that it doesn't use the redboot method for defining mtd partitions.

I have looked through the kernel sources for the omap2-nand driver and have come to a function called omap_nand_probe which seems to initialise (at least part of) the device but gets all the interesting information (i.e. partition definition) passed as an argument. So the partition information is set up somewhere else. And I can't find this somewhere else...

I wonder whether there is a user-space tool similar to fdisk for defining mtd partitions provided that the redboot method is used. (btw, the partition holding the bootloader does not use ubi.) I know that mtd partitions can be defined in redboot itself but this is some sort of a chicken-and-egg problem: I need to have the partitions rw in order to have my own bootloader installed and the device uses some other kind of bootloader...

Any help on this? I spend two days learning about mtd (a week ago I didn't know it existed) and I start feeling that pain in my neck... :)


Thank you for your work and time!

-- 
Hoy la lluvia no me moja, hoy en día soy el huracán
Voy levantando las hojas, voy zarpado por todo el lugar
Hoy la fuerza me sonríe, hoy la vida me quiere ayudar
Me levanto aunque me tiren, no me duele, no me ves llorar


Jetzt kostenlos herunterladen: Internet Explorer 8 und Mozilla Firefox 3.5 -
sicherer, schneller und einfacher! http://portal.gmx.net/de/go/chbrowser
