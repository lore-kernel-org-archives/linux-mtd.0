Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XstZi-0007tr-VH
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 13:21:09 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: Fastmap update v2 (pile 1)
Date: Mon, 24 Nov 2014 14:20:30 +0100
Message-Id: <1416835236-25185-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

as requested I'm resending my fastmap work in smaller pieces.
This is pile 1 of 7.
Rebasing my patches to ubifs.git was a massive PITA because the
logging style changes touched a lot of code and almost every patch
failed to apply and needed inspection by hand.
The first patches are bug fixes, the latter introduce cleanups
and new features.
After all bugfixes are mainline I'll make sure that all needed
fixes go into -stable.

[PATCH 1/6] UBI: Fastmap: Care about the protection queue
[PATCH 2/6] UBI: Fastmap: Ensure that only one fastmap work is
[PATCH 3/6] UBI: Fastmap: Ensure that all fastmap work is done upon
[PATCH 4/6] UBI: Fastmap: Fix races in ubi_wl_get_peb()
[PATCH 5/6] UBI: Split __wl_get_peb()
[PATCH 6/6] UBI: Fastmap: Make ubi_refill_pools() fair

The whole series can be found at
git://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git fastmap_upgrade2

Thanks,
//richard
