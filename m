Received: from mail161.messagelabs.com ([216.82.253.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KIL8e-0002sG-Im
	for linux-mtd@lists.infradead.org; Mon, 14 Jul 2008 10:18:37 +0000
Date: Mon, 14 Jul 2008 12:18:29 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
To: <linux-mtd@lists.infradead.org>
Subject: M29W128GL doesn't like cfi_send_gen_cmd(0xFF, 0, ...)
Message-ID: <20080714101829.GA27534@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a machine here with a M29W128GL (8 Mbit x16[1]) assembled.  In
U-Boot this part is autodetected correctly using CFI, but Linux fails.
The reason is that the flash doesn't like having a 0xff written to it
before going into CFI mode:

	CC9P9215 # mw.w 0x50000000 0xf0
	CC9P9215 # mw.w 0x500000aa 0x98
	CC9P9215 # md.w 0x50000000
	50000000: 0020 227e ffff ffff ffff ffff ffff ffff     .~"............
	50000010: ffff ffff ffff ffff ffff ffff 2221 2200    ............!"."
	50000020: 0051 0052 0059 0002 0000 0040 0000 0000    Q.R.Y.....@.....
	50000030: 0000 0000 0000 0027 0036 00b5 00c5 0004    ......'.6.......
	50000040: 0004 0009 0010 0004 0002 0003 0004 0018    ................
	50000050: 0002 0000 0006 0000 0001 007f 0000 0000    ................
	50000060: 0002 0000 0000 0000 0000 0000 0000 0000    ................
	50000070: 0000 0000 0000 0000 0000 ffff ffff ffff    ................

(i.e. this works, 0051 0052 0059 at (word-)offset 0x10.)

	CC9P9215 # mw.w 0x50000000 0xf0
	CC9P9215 # mw.w 0x50000000 0xff
	CC9P9215 # mw.w 0x500000aa 0x98
	CC9P9215 # md.w 0x50000000
	50000000: 0015 ea00 f014 e59f f014 e59f f014 e59f    ................
	50000010: f014 e59f f014 e59f f014 e59f f014 e59f    ................
	50000020: 0180 0074 01e0 0074 0240 0074 02a0 0074    ..t...t.@.t...t.
	50000030: 0300 0074 0360 0074 03a0 0074 beef dead    ..t.`.t...t.....
	50000040: 0000 0074 0000 0074 cd18 0076 f438 0077    ..t...t...v.8.w.
	50000050: c0de 0bad c0de 0bad 003c 0074 0000 e10f    ........<.t.....
	50000060: 001f e3c0 00d3 e380 f000 e129 002f eb00    ..........)./...
	50000070: 0078 e24f 103c e51f 0001 e150 0011 0a00    x.O.<.....P.....

(i.e. doesn't work, this is the data contained in the flash.)

If I comment out all

	cfi_send_gen_cmd(0xFF, 0, ...)

in drivers/mtd/chips/cfi_probe.c, the flash is detected correctly by
Linux, too.

These calls were introduced in 67d4878e4e61ae4f73855ecc73e9e4d4fc18f2fb
(i.e. between v2.6.8-rc1 and v2.6.8-rc2).  That commit changed the CVS
$Id from $Id: cfi_probe.c,v 1.71 ...$ to $Id: cfi_probe.c,v 1.77 ...$.
So looking into CVS I think the "guilty" commit was 

	revision 1.77
	date: 2004/07/14 08:38:44;  author: dwmw2;  state: Exp;  lines: +8 -2
	Send 0xFF to switch Intel chips back to read mode too. Some of
	them ignore 0xF0

A quick fix that would work with my flash part and that might work with
these Intel chips, too, is to write 0xff before writing 0xf0.
Are these chips still available to test if it works for them?

Best regards
Uwe

[1] datasheet currently available at
http://www.numonyx.com/Documents/Datasheets/M29W128G.pdf
-- 
Uwe Kleine-König, Software Engineer
Digi International GmbH Branch Breisach, Küferstrasse 8, 79206 Breisach, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 13962
