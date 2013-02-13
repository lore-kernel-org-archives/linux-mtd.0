Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5ZUu-00012x-3A
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 10:23:28 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 0/5] UBIFS: improve xattr and add support for security.*
 XATTR
Date: Wed, 13 Feb 2013 11:23:13 +0100
Message-Id: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
Cc: artem.bityutskiy@linux.intel.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

this patch series is based on Subodh Nijsure's patch [1] from May 2012. I've
splitted up the patch into smaller changes and fixed a locking problem. This
series is tested on mx28-evk with NAND. However, With lockdep enabled a
possible circular locking dependency is detected, as reported in [2]. Otherwise
the system is stable.

Please review and comment, regards,
Marc

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-May/041503.html
[2] http://www.spinics.net/lists/kernel/msg1480694.html
