Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AH6AA-0007qp-1z
	for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2003 18:44:22 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AH68f-0005Pp-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2003 19:42:49 +0100
To: linux-mtd@lists.infradead.org
From: Miernik <miernik@ctnet.pl>
Date: Tue, 4 Nov 2003 19:42:49 +0100
Message-ID: <slrnbqfsp9.k1.miernik@tarnica.ctnet.pl>
Sender: news <news@sea.gmane.org>
Subject: non-CFI PCMCIA linear flash: Waiting for chip to be ready timed
	out. Status a8
Reply-To: Miernik <miernik@ctnet.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is another try to get my SMART Modular Technologies 
SM9FA2043IP280 4 MB linear flash card working.

I have compiled the 2.6.0-test9 kernel (from Debian), without applying 
MTD CVS patches, with devfs turned on.

This time I have placed my configuration and logs of my problem in 
http://www.miernik.ctnet.pl/mtd/7-kernel2.6/

Please look at 
http://www.miernik.ctnet.pl/mtd/7-kernel2.6/log/syslog-cut 
http://www.miernik.ctnet.pl/mtd/7-kernel2.6/mtd_debug
for the most useful logs. 

In syslog-cut I have placed * where there was a huge number of 
identical lines (except time).
That was when I tried to run 
/usr/local/src/mtd/util/mtd_debug erase /dev/mtd/0 0 4194304
I finally stopped it with ^C. 

It looks like my flash is detected as a MTD_NORFLASH, 
I'm pretty sure that this card is a NAND card, but I don't remember 
where did I get that confidence from :(

The chip inside the card is:
---------
Intel

E28F016SA
70   5.0V
120  3.3V
U84433T1C
1993

Flash
---------

http://www.intel.com/design/flcomp/support/datashts/29048905.pdf

A document about software routines to erase blocks on this chip:
http://www.intel.com/design/flcomp/support/applnots/29212601.pdf

BTW I found an old post about the chip: 
http://lists.infradead.org/pipermail/linux-mtd/2002-August/005677.html
Does it matter if it's inside a PCMCIA card? 

Interesting that in /var/log/syslog I found a line: 
Nov  4 17:48:27 tarnica kernel: Found: Intel 28F016S5

What can be deducted from that? 

BTW it detected it as a 28F016S5 while it is a 28F016SA. The former is 
a 5V only chip and the latter is a dual 5V/3.3V.

P.S. I found this:
http://www.tuxmobil.org/pcmcia_ci10249.html

BTW: I found this comment about CONFIG_MTD_JEDECPROBE: 
This option enables JEDEC-style probing of flash chips which are not
compatible with the Common Flash Interface, but will use the common
CFI-targetted flash drivers for any chips which are identified which
are in fact compatible in all but the probe method. This actually
covers most AMD/Fujitsu-compatible chips, and will shortly cover also
non-CFI Intel chips (that code is in MTD CVS and should shortly be sent
for inclusion in Linus' tree)

My chip on the PCMCIA card is for sure a non-CFI Intel chip. Does the 
above comment matter if the chip is on a PCMCIA card?

-- 
    Miernik         ________________________ jabber:miernik@amessage.info
___________________/__ tel: +48608233394 __/      mailto:miernik@ctnet.pl
Do not use Paypal. They sometimes shut down accounts and steal users money!
http://www.paypalsucks.com/
