Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pqpZ-0003nc-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 13:13:09 +0100
Received: from bigglesworth.mail.be.easynet.net ([212.100.160.67])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pqpY-0003nW-00
	for mtd@infradead.org; Wed, 18 Apr 2001 13:13:08 +0100
Received: from 212-100-176-175.adsl.easynet.be ([212.100.176.175] helo=derollebeek)
	by bigglesworth.mail.be.easynet.net with smtp (Exim 3.16 #1)
	id 14pqpU-0002EK-00
	for mtd@infradead.org; Wed, 18 Apr 2001 14:13:04 +0200
From: "Technische afdeling Troyan Systems" <roelandgeysen@easynet.be>
To: <mtd@infradead.org>
Subject: FW: Install linux on disk on chip
Date: Wed, 18 Apr 2001 14:06:36 +0200
Message-ID: <CIEEIJBEJKIAHOLEHBPOKECJCAAA.roelandgeysen@easynet.be>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi all,

A customer of us want to have linux red hat 7.0 installed on a DOC from
M-Systems.
The used components are:

- 486DX4-100 CPU on board, embedded in ACC Maple chipset
- One 72-pin SIMM socket up to 32MB EDO RAM
- Realtek RTL8019 10Mbps Ethernet chip on board
- HM86508 LCD/CRT VGA chip on board with 1MB video memory ( WAFER-4823 )
- Additional DOC-chip from M-System (16 MB)


I placed a DOC-chip on the board and I don't know what I have to do to
install a bootable DOC with linux on it.
Customer wants just a booting DOC in Linux-console.  Packages on Red Hat
CD-rom are not important.

I attached a floppy and CD-rom to begin installation Linux, but it installs
it on the HDD and this is not what I want.
Customer doesn't need a floppy and/or HDD.

I ran at several problems:

- Realtek 8019 (AS) or NEC-2000 ethernetcard is not recognized by Linux at
installation time.
- VGA-chipset isn't supported by Linux, this is not so important because DOC
has to be booted with linux in console-mode.

Are there any step-by-step manuals to install Linux on a DOC-chip?
I found different articles in PDF-file from M-system, but I don't know where
to start and this is very technical.

Can you please help me out?

Are there standard image-files present so I can copy it to the DOC, without
doing the step-by-step procedures?
The system only needs to boot in linux without use of KDE/GNOME and other
packages.


Thanks in advance!


Technical Department Troyan Systems

Pirlet Marco / Geysen Roeland
GSM   Marco: 0478 384 067
GSM Roeland: 0496 551 062



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
