Received: from tiku.hut.fi ([130.233.228.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15X5Dl-0004PN-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 Aug 2001 19:16:49 +0100
Received: from kosh.hut.fi (jlavi@kosh.hut.fi [130.233.228.10])
	by tiku.hut.fi (8.9.3/8.9.3) with ESMTP id VAA02575
	for <linux-mtd@lists.infradead.org>; Wed, 15 Aug 2001 21:22:40 +0300 (EET DST)
Received: (from jlavi@localhost)
	by kosh.hut.fi (8.9.3/8.9.3) id VAA23172
	for linux-mtd@lists.infradead.org; Wed, 15 Aug 2001 21:22:40 +0300 (EET DST)
Date: Wed, 15 Aug 2001 21:22:40 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: linux-mtd@lists.infradead.org
Subject: Slow mtd device & JFFS2
Message-ID: <20010815212240.A22207@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

I am playing with embedded device with Arm925 @ 13MHz. JFFS2 works, 
but it is painfully slow. I have made some measurements and it 
looks like the reason must be very slow write access to flash chip.

  eraseall /dev/mtd0:                    258 s (= 2.0 s/sector)
  copying (dd) /dev/mtd0 to /dev/null:    35 s (= 240 kiB/s or 8 us/word)
  copying (dd) /dev/zero to /dev/mtd0:   899 s (= 9.3 kiB/s or 210 us/word
  Mounting an empty 8 MiB filesystem:     40 s
  Copying ~ 300 kiB files to JFFS2       ~ 5 min
  Mounting ~700 kiB filesystem:           70 s
 
These figures are with compression off: jffs2_compress() is here
patched to return always JFFS2_COMPR_NONE. JFFS2 debugging level is
0. MTD debugging level is 0. CPU gives 11.1 BogoMIPS. I am using
couple days old mtd CVS image but my kernel version is rather old,
2.4.2. The 8MiB flash chip shows in physical memory as continous 
area and I am using mapping similar to physmap.c.

The writing speed looks awful! The chip is AMD 64Mbit chip for which
AMD claims 11 us typical programming time per word and 360 us worst
case. Read and erase figures look normal.

Is the slow write access the main reason for painfully slow JFFS2?

Jarkko Lavinen
