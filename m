Received: from relay01.roc.ny.frontiernet.net ([66.133.182.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbYB3-0005Hs-Js
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 01:51:09 -0500
From: John Bowler <jbowler@acm.org>
To: "'David Vrabel'" <dvrabel@arcom.com>
Date: Sun, 13 Nov 2005 22:50:41 -0800
Message-ID: <006101c5e8e7$bb98f460$1001a8c0@kalmiopsis>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <436F94D0.5070509@arcom.com>
Cc: 'Alessandro Zummo' <azummo-lists@towertech.it>,
	linux-mtd@lists.infradead.org
Subject: RE: ixp4xx stuff
Reply-To: jbowler@acm.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David originally posted this to linux-arm-kernel@lists.arm.linux.org.uk, but the
l-a-k maintainers want the patches on linux-mtd.  The patches are effectively
a rewrite of the NSLU2 fixes to ixp4xx.c to solve an alignment problem and get
it working on an LE ixp4xx system.

When we tested these changes against 2.6.15-rc1 we
found that, while LE systems work correctly, BE systems half-word-byte-swap
the flash - i.e. the flash ends up with PDP endianness.  We expect existing
systems (i.e existing flash) to work with an appropriately configured kernel,
and this isn't the case because of the change in byte sex (from big endian
to pdp endian.)

More details:

2.6.15-rc1 seems to have some of the fixes already applied, we applied just:

mtd-unaligned-read-fix
mtd-little-endian-support

along with the other NSLU2 patches.  We found that it is now necessary to
set CONFIG_MTD_LE_BYTE_SWAP - with the NSLU2 patches CONFIG_MTD_BE_BYTE_SWAP
must be set.  If this is not done (i.e. if BE is set) the flash probe fails.

After setting this the LE system worked fine, but BE fails reading the FIS
directory because of the half-word swapping - reflashing with a
half-word-byte-swapped FIS directory (and JFFS2) makes the system bootable.

Unfortunately it is not possible for me to examine the flash contents from
the booted BE system because the IXP ethernet drivers are also not working
in 2.6.15-rc1 (at least, I can't get an ethernet connection to my NSLU2).
Nevertheless, I am certain that examination would show other MTD partitions
are also half-word-byte-swapped on BE.  (We have confirmed that this does
not happen on LE).

John Bowler <jbowler@acm.org>
