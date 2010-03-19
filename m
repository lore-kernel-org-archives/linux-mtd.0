Received: from havoc.gtf.org ([69.61.125.42])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nsgwg-0002hL-GU
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2010 18:29:23 +0000
Date: Fri, 19 Mar 2010 14:29:15 -0400
From: Jeff Garzik <jeff@garzik.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git patch] Delete zero-length MTD file
Message-ID: <20100319182915.GA9772@havoc.gtf.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: tony@atomide.com, ladis@linux-mips.org, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Please pull from 'zerolen' branch of
master.kernel.org:/pub/scm/linux/kernel/git/jgarzik/misc-2.6.git zerolen

to receive the following updates:

 0 files changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 drivers/mtd/maps/omap_nor.c

commit 17cf4442497cb2551eae1dedee638515db47c23e
Author: Jeff Garzik <jeff@garzik.org>
Date:   Fri Mar 19 14:25:45 2010 -0400

    Delete zero-length file drivers/mtd/maps/omap_nor.c
    
    The content was deleted in cc87edb173effdf74e680ee6d622a935ff0c1d6f,
    but the file remained as a zero-length file.
    
    Signed-off-by: Jeff Garzik <jgarzik@redhat.com>

diff --git a/drivers/mtd/maps/omap_nor.c b/drivers/mtd/maps/omap_nor.c
deleted file mode 100644
index e69de29..0000000
