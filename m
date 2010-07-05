Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OVjgI-0005OS-Tj
	for linux-mtd@lists.infradead.org; Mon, 05 Jul 2010 11:17:47 +0000
Received: by bwz20 with SMTP id 20so968738bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jul 2010 04:17:44 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 5 Jul 2010 13:17:44 +0200
Message-ID: <AANLkTinAXEkD4_sYtGAojAuecpkiTlxyylxLlQP2i_9D@mail.gmail.com>
Subject: uncorrectable error :
From: Arno Steffen <arno.steffen@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While testing my OMAP board powering and unplug power it happens from
time to time that this message occur while mounting / (jffs2).
uncorrectable error :

Mostly the system continues booting, sometimes it crashes. I assume
that this depends on where this error is located.
The partition is writable but in this tests no write access will be done.

BUT: In the next power cycle the "uncorrectable error" is disappeared
- so it might not be really uncorrectable.
I am really helpless what might be the reason for this strange
behavior. As the flash content seems not to be corrupted, can this be
a read failure?
What can I do to find out what is going on here?

Below the complete message while boot..

IP-Config: Complete:
     device=eth0, addr=192.168.90.202, mask=255.255.255.0, gw=192.168.90.1,
     host=192.168.90.202, domain=, nis-domain=(none),
     bootserver=192.168.90.230, rootserver=192.168.90.230, rootpath=
uncorrectable error :
uncorrectable error :
mtd->read(0x400 bytes from 0x2a0000) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0000:
0xff30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0004:
0xff30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0008:
0xff30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a000c:
0xff30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0010:
0xff30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0014:
0xff30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0018:
0xdf30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a001c:
0xff30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0020:
0xff30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0024:
0xff30 instead
Further such events for this erase block will not be printed
VFS: Mounted root (jffs2 filesystem) on device 31:6.
Freeing init memory: 128K
init started: BusyBox v1.9.1 (2008-10-17 18:22:46 IST)


I do have an OMAP board with Micron NAND (not ONENAND), kernel is 2.6.33

Regards
Arno
