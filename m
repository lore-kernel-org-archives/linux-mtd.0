Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXq3o-0007YX-T5
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 15:07:02 +0000
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/5] mtd/rfd_ftl: Adjustments for some function implementations
Message-ID: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Date: Sat, 6 Jan 2018 16:06:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 16:00:01 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete an error message for a failed memory allocation in scan_header()
  Less function calls in scan_header() after error detection
  Improve a size determination in two functions
  Return directly after a failed kmalloc() in erase_block()
  Add some spaces for better code readability

 drivers/mtd/rfd_ftl.c | 45 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

-- 
2.15.1
