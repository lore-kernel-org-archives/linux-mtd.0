Received: from smtp.teol.net ([81.93.64.10])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19yS7Q-0003os-Di
	for <linux-mtd@lists.infradead.org>; Sun, 14 Sep 2003 09:20:28 +0100
Received: from smtp.teol.net (root@localhost)
	by smtp.teol.net (8.12.9/8.12.9) with SMTP id h8E8Jm4s030126
	for <linux-mtd@lists.infradead.org>; Sun, 14 Sep 2003 10:19:48 +0200
Received: from alfa (ppp-69-24.teol.net [81.93.69.24])
	by smtp.teol.net (8.12.9/8.12.9) with SMTP id h8E8JgOU030108
	for <linux-mtd@lists.infradead.org>; Sun, 14 Sep 2003 10:19:45 +0200
Message-ID: <004f01c37a98$e88d5520$1ca9fea9@alfa>
From: "Mario Ivancic" <mario.i@teol.net>
To: "MTD Lista" <linux-mtd@lists.infradead.org>
Date: Sun, 14 Sep 2003 10:18:29 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: DoC on VIA Epia 5000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I'm playing with epia 5000 board, and DoC (DiskOnChip Millennium
Plus - MD2811 D16 in TSOP48), but can't get it to work!
DINFO from M-Systems can't find DoC, my own util can't find DoC
(looking on every 16 byte from c0000 to f0000), and on linux I tied
to build MTD utils and stuff, but can't 'modprobe -a docprobe'.
Dmesg says 'No Doc detected' or something.
I succeed to enable writing to flash, I pull BIOS out and still can't
find DOC.
I investigate connections on board and find out that DOC address
lines, data lines, CE#, OE#, WE# lines are connected to BIOS ROM
address lines, data lines, CE#, OE#, WE# line.
Is it OK to be that way? (DOC CE#  = BIOS CE# ).
I can boot from standard BIOS, so I think there is no conflicts
between DOC and BIOS, but it should be. Is my DOC dead?
What can I do to get it work?
Please Help!
