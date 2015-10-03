Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiRMc-0008Hf-DF
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 18:16:54 +0000
Date: Sat, 3 Oct 2015 20:13:19 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Felipe Balbi <balbi@ti.com>,
 Markus Pargmann <mpa@pengutronix.de>, Tejun Heo <tj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH -mm 0/3] minor kthread/signals cleanups and fix
Message-ID: <20151003181319.GA1036@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On top of signals-kill-block_all_signals-and-unblock_all_signals.patch

Simple but untested, hopefully maintainers can ack or nack 1/3 at least.

Oleg.

 drivers/block/nbd.c                          |    9 ++-------
 drivers/usb/gadget/function/f_mass_storage.c |    4 +---
 fs/jffs2/background.c                        |    7 ++-----
 include/linux/sched.h                        |   21 ++++++++++++++++-----
 4 files changed, 21 insertions(+), 20 deletions(-)
