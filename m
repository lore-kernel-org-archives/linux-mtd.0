Received: from [212.43.253.35] (helo=synergie-inf.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WNBc-0002Rt-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 20:52:29 +0000
Received: from archie.gsi.synergie-inf.com ([10.53.2.1])
	by gateway.synergie-inf.com ([127.0.0.1])
	with SMTP (MDaemon.PRO.v6.5.1.R)
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 22:23:12 +0100
Message-ID: <515CABE7496FD111AA3300201829FCBE3552E0@archie.gsi.synergie-inf.com>
From: Marc Neiger <m.neiger@synergie-inf.com>
To: tglx@linutronix.de, manningc2@actrix.gen.nz,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: 16 NANDS
Date: Wed, 8 Jan 2003 22:23:09 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Reply-To: m.neiger@synergie-inf.com
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

Hi Thomas,

> I have the framework ready to support different buswidths. 

It's dangerous talking to you, guys, one gets easily caught in the maelstrom
;-)

I'll gladly put my share back into the GPLd world, however my timeframe for
the current project is very tight; everything, board, embedded linux and
application should be working in less than 2 months.....
Moreover, although I, and my colleagues, are experienced programmers, both
in embedded and win32, I booted my first Linux about 6 weeks ago....

The project shall be using a customly developped board using AMD Alchemy
AU1000 (MIPS4Kc) processor. The board is planned to support both 8 and
16bits NAND flash, an EPLD shall, among other task, take care of data bus
bits reordering (8 and 16 bits NANDS are pin out compatible except for the
bit order). After reading some msg on this list, we already doubt about the
ease of mounting a root JFFS2 filesystem.


I'll have a look at the framework, then if I have some "time" and I feel
comfortable with your code, I'll try to finish it, and we'll test it on our
first board version. Otherwise, and it seems more likely, after the project
is delivered and we have some experience on Linux, including kernel
development since we are to write a driver for this very specific hardware,
I'll get more seriously hands on the code but without having a very short
deadline in front of me.
I already do much non computer related volunteer work and can not afford to
take on my "free" time anymore.

Cheers,
Marc Neiger
