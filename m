Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHV6M-0003qJ-Oo
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 21:22:06 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AHV57-0007Xn-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 22:20:49 +0100
To: linux-mtd@lists.infradead.org
From: Miernik <miernik@ctnet.pl>
Date: Wed, 5 Nov 2003 22:20:50 +0100
Message-ID: <slrnbqiqdi.ke.miernik@tarnica.ctnet.pl>
Sender: news <news@sea.gmane.org>
Subject: SMART PCMCIA linear flash: compiled latest CVS - still no luck
Reply-To: Miernik <miernik@ctnet.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I finally compiled the code from CVS (substituting the three 
problematic files with their versions from the Linus' tree).
My config file:
http://www.miernik.ctnet.pl/mtd/9-CVS/config-2.6.0-test9

This time the logs of my debug may be found in 
http://www.miernik.ctnet.pl/mtd/9-CVS/2/

Everything seems OK until I tru to do anything with an erase.

When I try erase or eraseall on /dev/mtd0 I get it do nothing 
endlessly, in the syslog it places messages like:
Nov  4 17:56:25 tarnica kernel: drivers/mtd/maps/pcmciamtd.c:pcmcia_read16_remap(): ofs = 0x00000000 (c00c8000) data = 0x00a8
millions of times. 

If I try try to ^C or kill it, it prints something like: 
"Kernel Panic .... aaaiee interupt handler..."
and I can only press RESET switch, or Alt+SysRq+B. 

BTW the same was for the stock kernel version, if I forgot to write 
that already.

Does anyone has any ideas what to try more?

How do I get it to try the MTD_OBSOLETE_CHIPS drivers?
I compiled MTD_SHARP and MTD_JEDEC, but how do I configure it to use 
them?

If you see that the "sharp" module is loaded in my dump of lsmod, it 
was just because I've put it in /etc/modules But it did not make it 
use it.

If anyone had ever sucess with a SMART Modular PCMCIA linear flash, a 
non-CFI model, can you please send me the output of lsmod, and 
/var/log/syslog fragment (with CONFIG_MTD_DEBUG_VERBOSE=3 preferably) 
while you erase/write/ftl_format the card?

-- 
    Miernik         ________________________ jabber:miernik@amessage.info
___________________/__ tel: +48608233394 __/      mailto:miernik@ctnet.pl
Truth about Bush's military operations: 
http://www.TruthAboutWar.org/
