Received: from moutng.kundenserver.de ([212.227.126.186])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv6uS-0004j6-0x
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 12:46:04 +0000
Received: from [10.0.18.3] (pc-matthias.esd [10.0.18.3])
 by comm-neu.esd (Postfix) with ESMTP id 13C641362CC
 for <linux-mtd@lists.infradead.org>; Wed,  8 Feb 2012 13:44:20 +0100 (CET)
Message-ID: <4F326E27.7020407@esd.eu>
Date: Wed, 08 Feb 2012 13:44:23 +0100
From: Matthias Fuchs <matthias.fuchs@esd.eu>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Updating UBIFS rootfilesystem
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

is there an elegant way to update an UBIFS rootfilesystem?

Let's say I have enough flash space for my actual rootfilesystem
(rootfs1) and a new version (rootfs2). So while running from rootfs1
I updated rootfs2 volume with a new rootfilesystem.

Now my idea was to use ubirename to exchange the volume names so that
after next reboot rootfs1 'points' to the new filesystem and rootfs2
contains the old one (ready for deletion or further updates).

As expected ubirename reports "Device or resource busy" probably because
it cannot rename mounted volumes. Of course I could tell my bootloader
to mount rootfs2 after a reboot. But isn't there a more elegant way?
ubirename really looks like the right way ....

Any ideas?

Matthias
