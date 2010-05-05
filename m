Received: from havoc.gtf.org ([69.61.125.42])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9kHV-0004AM-Br
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 19:29:18 +0000
Date: Wed, 5 May 2010 15:29:12 -0400
From: Jeff Garzik <jeff@garzik.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git patches] Delete two zero-length files
Message-ID: <20100505192912.GA5525@havoc.gtf.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
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
 delete mode 100644 drivers/mtd/internal.h
 delete mode 100644 drivers/mtd/mtdbdi.c

Jeff Garzik (1):
      [MTD] Remove zero-length files mtdbdi.c and internal.ho

diff --git a/drivers/mtd/internal.h b/drivers/mtd/internal.h
deleted file mode 100644
index e69de29..0000000
diff --git a/drivers/mtd/mtdbdi.c b/drivers/mtd/mtdbdi.c
deleted file mode 100644
index e69de29..0000000
