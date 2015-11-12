Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwoET-00036D-MI
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 09:31:54 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: kernel@pengutronix.de
Subject: [PATCH v2 0/5] mkfs.ubifs: cleanups + extended attribute support
Date: Thu, 12 Nov 2015 10:31:23 +0100
Message-Id: <1447320688-3086-1-git-send-email-mkl@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

this series applies to current git master. The first 3 patches are cleanup
patches, in the 4th adds extended attributes support. Patch 5 adds a option to
write the used inode number to an extended attribute, so that other offline
tools like IMA, that process the inode number can work. See description of
patch 5 for a detailed explanation.

regards,
Marc

changes since v1:
- add Daniel Walter's reviewed by to patches 1-3
- add option to build without xattr support - patches 4,5 (as Daniel suggested)
- switch from dynamically allocated attr value buffer to fixed size array on stack,
  as inode numbers where not stable between mkfs.ubifs invocations - patch 4
