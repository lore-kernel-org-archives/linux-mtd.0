Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFVvP-0004vt-Gm
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 09:50:35 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AFVuC-0004jK-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 10:49:20 +0100
To: linux-mtd@lists.infradead.org
From: Miernik <miernik@ctnet.pl>
Date: Fri, 31 Oct 2003 10:49:20 +0100
Message-ID: <slrnbq4c10.qor.miernik@tarnica.ctnet.pl>
Sender: news <news@sea.gmane.org>
Subject: "this device cannot be used for FTL" with a SMART PCMCIA linear
	flash
Reply-To: Miernik <miernik@ctnet.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to get a "SMART Modular Technologies 4MB FAST FLASH CARD 
SM9FA2043IP280" PCMCIA linear flash Intel Series 2+ card working.

The explanation of SM9FA2043IP280:

SM      Smart Modular
9       Product Category:       Memory Card
F       Technology:             Flash
A       Attribute:              With Attribute (2kB)
2       Nop. of banks:          2 Bank
04      Card Density:           4 MB
3       Component Data Width:   x16
I       Device Manufacturer:    Intel
P       Pinout:                 68 Pin PC Card (Type I)
2       Interface:              x16 only
80      Card Speed:             80ns


FLA16MPX16ICB REV.A

To know what I'm working with, I have opened the card, and found these 
4 chips:

2 * chip:
---------
Intel

E28F016SA
70   5.0V
120  3.3V
U84433T1C
1993

Flash
---------

---------
ATMEL
AT28C16
15TC
9837
---------

---------
IDT 74FCT
108CTQ
KP84ST
---------

I have accidentally erased attribute memory of this card, so it is 
detected only as anonymous memory. I fix it like this:

card "Anonymous Memory"
  anonymous
  cis "cis/smartm-4mb-flash.dat"
  bind "memory_cs", "ftl_cs"


I am using 2.4.22-3 kernel from Debian, self-compiled, not compiling 
pcmcia-modules from the kernel, but separately. 
I compiled pcmcia-modules_3.2.2-1.4.

These are self-made packages of my kernel and pcmcia-modules:
http://www.miernik.ctnet.pl/debian/pool/kernel-image-2.4.22_tarnica.1.0_i386.deb
http://www.miernik.ctnet.pl/debian/pool/pcmcia-modules-2.4.22_3.2.2-1.4+tarnica.1.0_i386.deb

This is my problem:

tarnica:~# ftl_format -i /dev/mem0c0c
this device cannot be used for FTL!
format failed.
tarnica:~#

tarnica:~# ftl_check /dev/mem0c0c
Memory region info:
  Card offset = 0x0, region size = 4 mb, access speed = 200 ns
  Erase block size = 1 bytes, partition multiple = 1 bytes

No valid erase unit headers!
tarnica:~#

If I try a dd to it I get "input/output error" or no error messages, 
but when I try to dd it back ftom the card, I get a file with all bits 
set to 1. Depending on if I try to use /dev/mem0c, /dev/mem0c0b or 
/dev/mem0c0c.

I forgot to note exactly what when happens with dd, and I can't check 
it not, as I have my WLAN card in that PCMCIA slot to access the 
Internet, I can check it later if needed.

Logs, pcmcia configuration, and other detailed info of my problems can 
be found in: http://www.miernik.ctnet.pl/mtd/3-repeat-clear/

-- 
    Miernik         ________________________ jabber:miernik@jabber.gda.pl
__ ICQ: 4004001 ___/__ tel: +48608233394 __/      mailto:miernik@ctnet.pl
Protect Europe from a law-disaster. Petition for a Software Patent Free Europe
http://www.noepatents.org/index_html?LANG=en 
