Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNJIx-0008U4-Rs
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 12:30:20 +0000
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@sigma-star.at>
Subject: UBIFS orphans and ro-mounts
Message-ID: <57863442.1000303@sigma-star.at>
Date: Wed, 13 Jul 2016 14:29:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

I wonder why UBIFS processes orphan inodes also when mounting read-only.
Depending on the workload before a power cut this can take a few seconds
and since we mount read-only the updated TNC will not written back to flash,
so upon next mount the time is again wasted.

This hurts boot performance a lot on systems where u-boot loads the kernel
from UBIFS.
u-boot always mounts UBIFS read-only.
So even when Linux mounts UBIFS rw and a powercut happens orphan processing
will happen twice.

I'd suggest calling ubifs_mount_orphans() only when we mount rw or remount to
rw.
What do you think?

Thanks,
//richard
-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
