Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13a21h-0000X2-00
	for mtd-list@infradead.org; Fri, 15 Sep 2000 21:24:01 +0100
Message-ID: <39C28559.CDA25297@mvista.com>
Date: Fri, 15 Sep 2000 20:23:53 +0000
From: Scott Anderson <sanders@mvista.com>
MIME-Version: 1.0
To: Alex J Lennon <ajlennon@arcom.co.uk>
CC: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Re: sbc-mediagx
References: <NEBBLLDBMLGONJHPHHEKIEMNCHAA.ajlennon@arcom.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Alex J Lennon wrote:
> Also , there is a discussion of a possible pre-cursor to FlashFx in DDJ, May
> '93
> - although I haven't managed to source this .

You can get all the articles/source from 1988 up to now on the
Dr. Dobb's CD/Release 9:
	http://www.ddj.com/cdrom/
It's $100US though.  Here's a list of the FLASH articles that I
found on my Release 8 CD:

 May 93
 FLASH FILE SYSTEMS by Drew Gislason
 Flash memory packaged in solid-state, credit card-size PCMCIA cards is
 starting to change the face of embedded and portable systems. Drew
 examines Flash file systems and presents one that's FAT-like.

 Feb 95
 THE MICROSOFT FLASH FILE SYSTEM
 by Peter Torelli
 Peter examines flash file systems for DOS, focusing on the mechanics
 behind a flash file system based on the Microsoft data structures.

 Oct 95
 INSIDE FLASH MEMORY
 by Brian L. Dipert
 Direct-execute flash memory systems don't require the gigabyte hard
 disks and 64-Mbit DRAM arrays common in desktop systems.
 
The May 93 article has source that simply allocates a FLASH sector
for every sector of a FAT file system.  It doesn't do erases.  He
discusses that there is a better way, which he called "Byte-oriented
Flash File System", but there isn't much detail there.  What he
does say is that at Datalight (his employer) they use a linked
list of records with each header containing "approximately 12 bytes
(describing the data's owner) and a variable-length data field".
I do not see any mention of an FTL.  This last point interested
me because the article is from May 93 and the imfamous M-systems
patent was filed Mar 93.

    Scott Anderson		
    scott_anderson@mvista.com	MontaVista Software Inc.
    (408)328-9214		490 Potrero Ave.
    http://www.mvista.com	Sunnyvale, CA  94086


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
