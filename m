Received: from creative.actrix.co.nz ([203.96.26.135])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VFRN-0000eE-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 17:19:33 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: rrhsin@yahoo.co.in
Subject: Re: Cf Card vs DiskOnChip
Date: Tue, 29 Jan 2002 06:12:26 +1300
References: <20020128061808.48848.qmail@web8105.in.yahoo.com>
In-Reply-To: <20020128061808.48848.qmail@web8105.in.yahoo.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020128173034.D1A5A1645@creative.actrix.co.nz>
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

>
> Thanks for all the help. I want to understand PCMCIA ,
> IDE , connectors , adapters,BIOS, hot-swapping, CF
> socket, wear levelling ... all these terms were used
> by you guys when u were helping me but being a newbie
> I don't understand these terms. Can anyone suggest
> some resources for me to understand these things.
>

Most of these are outside the scope of this discussion list.... you might 
want to call on uncle Google. 

IDE (loosely) is the way most hard drives are hooked up. Most drives are "IDE 
drives".
Compact Flash is a sub-set of PCMCIA. CF (and ATA-style PCMCIA cards) just 
look like a PCMCIA version of an IDE drive. Because they are PCMCIA capable 
yo can use extra pins to find out details about what the card is. This is 
used so that when you plug the card the system can tell the difference 
between a flash card and a modem - or whatever - and use the correct driver.

When you hook up a Compact Flash to the IDE bus, then you are not using those 
extra pins. It just looks like a disk drive. Hint: don't try hook up a modem 
to the IDE bus!

Flash has a limited number of times it can be erased. Somewhere between 1000 
and 1000,000 is typical depending on the technology, temperature, voltage. 
This is termed the "endurance". Because a disk drive/file system tesnds to 
erase/write some areas more often than others (eg. your program files will 
very seldom be written but data files and temporary files will get written a 
lot) some parts of the flash will wear out faster than others. Thus, maybe 
one file area might wear out long before the device wears out. To stop this 
happening, (or at least reduce it), wear levelling algorithms are used to 
move stuff around and level out the wearing.  Some devices do not apply wear 
levelling (eg. Compact Flash and SmartMedia). Some do (eg. full-size PCMCIA 
cards, DOC, JFFS).

The rest of what you ask is definitely beyond the scope of this discussion - 
try Google for a start.

Maybe an MTD FAQ/glossary could be useful?


-- Charles
