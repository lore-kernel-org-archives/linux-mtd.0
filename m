From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/10] mtd: remove dead map drivers
Date: Tue, 12 Mar 2013 13:14:05 +0200
Message-Id: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-pcmcia@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch-set removes a bunch of dean MTD map drivers. The way I judged
whether a driver is dead or not was looking at driver's dependencies in the
Kconfig file. Whenever I saw a driver depending on a Kconfig symbol which is
not defined anywhere, I treated the driver as dead.

The motivation for this patch-set is to clean up the MTD subsystem a little and
lessen the maintenance burden. Indeed, the less drivers we have, the easier it
is to do MTD framework refactoring.

Thanks,
Artem.
