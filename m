Received: from mailout10.sul.t-online.com ([194.25.134.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qjlb-00076F-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2002 01:29:31 +0100
Date: Mon, 16 Sep 2002 02:28:48 +0200
From: Erich Schubert <erich@debian.org>
To: linux-mtd@lists.infradead.org
Subject: another question: what can break?
Message-ID: <20020916002848.GB23510@bombadil.xmldesign.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

My thin system is working nicely from a 8 mb partition on my disc
(only using 3 MB of that ;) and after 15 seconds it presents me a remote
X11 login screen - i'm happy... it also works from PXE, but takes much
longer then.

Most of the "used" system is a cramfs in /;
the real filesystem of the partition (ext2 containing the kernel and the
initrd, as well as a few config files - hostname, ip) is mounted ro all
the time.

So my system is almost ready for writing to the flash; i only need to
patch grub (or does the debian one contain the required patches
already?) and install it on the flash...

What can break here?

The problem is that i don't have some development board where i can
easily rewrite the flash; if the system doesn't boot from HD any more
then i'm doomed...

Right now the system boots from the hard disc, if a hard disc is
connected, and from the flash if there is no HD.
If i enable network boot it tries that first;
then falls back to HD, then Flash.

** Do i risk to change this behaviour when installing grub?

http://lists.infradead.org/pipermail/linux-mtd/2002-June/005240.html

my bios has a "network boot first" yes/no toggle (i can network boot)
but i don't want grub to break that... (i'd like to keep that as
fallback...)

can i get grub to hook _behind_ the hard disk boot?
like some floppy vector? (so i could select A,C and C,A as boot sequence
to switch between hard disc and grub)

Gruss,
Erich Schubert
-- 
        erich@(mucl.de|debian.org)        --        GPG Key ID: 4B3A135C
        A polar bear is a rectangular bear after a coordinate transform.
        Die kürzeste Verbindung zwischen zwei Menschen ist ein Lächeln.
Mathematik: Das Alphabet, mit dessen Hilfe Gott das Universum beschrieben hat.
