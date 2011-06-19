Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QYFNg-0002Rb-TD
	for linux-mtd@lists.infradead.org; Sun, 19 Jun 2011 10:37:29 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QYFNc-0000MJ-C3
	for linux-mtd@lists.infradead.org; Sun, 19 Jun 2011 12:37:24 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 Jun 2011 12:37:24 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 Jun 2011 12:37:24 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: "warning!: only 995 of 1984 eraseblocks have valid erase counter"
Date: Sun, 19 Jun 2011 12:37:13 +0200
Message-ID: <o4krv69m77vomji84cs3flljf6obpgfgcs@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

	After "make" built rootfs.ubifs, I ran ubinize before uploading the
file to a web server.

I then downloaded that file on a uClinux appliance, and ran the
following command to format /dev/mtd2 with the image:
=========
ubiformat /dev/mtd2 -s 512 -f rootfs.ubi.img
=========

This command triggers the following warning:
=========
...
libscan: scanning eraseblock 1982 -- 99 % complete  MTD_ioctl
MTD_read
libscan: scanning eraseblock 1983 -- 100 % complete  MTD_ioctl
MTD_read

ubiformat: 995 eraseblocks have valid erase counter, mean value is 14
ubiformat: 989 eraseblocks are supposedly empty
ubiformat: warning!: only 995 of 1984 eraseblocks have valid erase
counter
ubiformat: mean erase counter 14 will be used for the rest of
eraseblock
ubiformat: continue? (yes/no)
=========

Running just "ubiformat /dev/mtd2 -s 512" triggers the same warning.

I don't know what the warning really means, and what the consequences
are when answering "yes". Could someone tell me?

Thank you.
