Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qMi6-0003OR-00
	for <linux-mtd@lists.infradead.org>; Sun, 15 Sep 2002 00:52:22 +0100
Date: Sun, 15 Sep 2002 01:51:39 +0200
From: Erich Schubert <erich@debian.org>
To: linux-mtd@lists.infradead.org
Subject: recommended Filesystem for DoC?
Message-ID: <20020914235138.GA28771@bombadil.xmldesign.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

I'm preparing a thin client employing a 8 MB M-Systems DoC.
My current system is at 6 MB uncompressed, but i'd like to add some
local fonts, and lpd and a sound server, so i'd like to use some
compression.
I was thinking about setting up the static part using a cramfs;
but i need some files on the flash to be writeable
(configuration files such as IP address, X11 server address etc.)

I've seen these two JFFS file systems; but actually i don't need much
journalling (after all i don't change the config too often ;)
and JFFS seems to be designed for the other flash type.
Should i use an ext2 filesystem then?
I was thinking about mounting a cramfs ro as root, a tmpfs in some other
dir for automatic files (such as xserver output) and the actual
filesytem on the device in /writefs.
On that i should then store the kernel and the cramfs-initrd?

any recommendations for the system?
grub or lilo? (right now i'm using grub to boot the system off a small
partition ~8 MB)
any good howto for installing the bootloader?

Gruss,
Erich Schubert
-- 
        erich@(mucl.de|debian.org)        --        GPG Key ID: 4B3A135C
          Go away or i'll replace you with a very small shell script.
            Ein Freund ist ein Geschenk, das man sich selbst macht.
               Humor sollte immmer dabeisein, auch bei Problemen.
