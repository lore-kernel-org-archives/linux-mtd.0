Received: from pony1.arc.nasa.gov ([143.232.48.201] helo=mail.arc.nasa.gov)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jWsT-0001pw-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2001 03:14:17 +0100
Received: from sg-sdl-eng-1 (sg-sdl-eng1.arc.nasa.gov [128.102.173.53])
	by mail.arc.nasa.gov (8.9.3/8.9.3) with SMTP id TAA22382
	for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 19:20:20 -0700 (PDT)
Message-Id: <4.1.20010918183424.00a8fc20@mail.arc.nasa.gov>
Date: Tue, 18 Sep 2001 19:20:27 -0700
To: linux-mtd@lists.infradead.org
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
Subject: New interface to (old) JEDEC chips
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

Folks,
	I'm working on a 586 SBC with 2Megs of flash (AM29F016) mapped into a
window in the 0xD0000 area.  There is also some battery backed RAM mapped
nearby.  Dwmw2 suggested I check out the probe_jedec.c code for accessing
the flash.  Some comments:

In probe_jedec.c, jedec_probe_chip() :
1. I ran into a case where the code returned zeroes for both the
manufacturer ID and the chip ID (probably a bug in my low level driver).
The zeroes match the empty structure at the end of jedec_table[], so the
empty struct gets passed to cfi_jedec_init().  cfi_jedec_init() treats is
as a legit entry and happily builds some more structures.  In any case the
empty struct isn't needed (at least by jedec_probe_chip() ).  I deleted it
from my source.

2. The 'retried' variable is never incremented.  If we hit the " if
(!retried ) ... " clause, we can get an infinite loop which screws the
machine tight.  I've changed "if (!retried) ... " to "if (!retried++) ...".
 Should it only retry once?

More as I figure out what I'm doing.

Ted Hildum
