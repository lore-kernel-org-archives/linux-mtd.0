Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oe7V4-0005lw-Ez
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 14:20:54 +0000
Received: by bwz15 with SMTP id 15so4963392bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Jul 2010 07:20:49 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 28 Jul 2010 16:20:49 +0200
Message-ID: <AANLkTi=NAAdTjPkxPH89rGXJLvht+fKmc76LgCKbXJY8@mail.gmail.com>
Subject: MTDSB: lookup_bdev() returned 0 / MTDSB: New superblock for device 6
	("root(1)")
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

Do you know what this messages mean?

MTDSB: lookup_bdev() returned 0
MTDSB: New superblock for device 6 ("root(1)")


Is this a normal behavior for a read only filesystem?
I get them while mounting the the root-flash-filesystem. Next message is
VFS: Mounted root (jffs2 filesystem) readonly on device 31:6.

The reason why I ask: While powercycling my device I get sometime (1
in a 100) "uncorrectable error".
But this error dissapear after reboot... Now I set debug to level1 but
can't understand messages ...

Any help is welcome!!
Regards
Arno
