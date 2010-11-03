Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYk0-0007nI-AJ
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:30:45 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/10] mtd-utils: nandwrite: prevent 32-bit overflow
Date: Wed, 3 Nov 2010 01:27:25 -0700
Message-ID: <1288772847-8120-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, Jehan Bing <jehan@orb.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For large block- and page-sizes, the multiplication of ebsize_aligned
and pagelen can overflow a 32-bit integer.  This overflow can be
prevented by a simple change in order of operations (i.e., do division
first).

Since ebsize_aligned is always a multiple of mtd.min_io_size, this
produces no change in results.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 8ec5afe..364acdf 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -441,7 +441,7 @@ int main(int argc, char * const argv[])
 	}
 
 	// Allocate a buffer big enough to contain all the data (OOB included) for one eraseblock
-	filebuf_max = pagelen * ebsize_aligned / mtd.min_io_size;
+	filebuf_max = ebsize_aligned / mtd.min_io_size * pagelen;
 	filebuf = xmalloc(filebuf_max);
 	erase_buffer(filebuf, filebuf_max);
 
-- 
1.7.0.4
