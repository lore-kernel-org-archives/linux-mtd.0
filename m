Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PGQmh-0004om-Kl
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2010 06:37:24 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 08/10] mtd-utils: nandwrite: prevent 32-bit overflow
Date: Wed, 10 Nov 2010 22:31:41 -0800
Message-ID: <1289457101-24040-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <AANLkTikCjW=P2ncq7E_4WLJtxzwPdaU4SWi1s-7Us7ZP@mail.gmail.com>
References: <AANLkTikCjW=P2ncq7E_4WLJtxzwPdaU4SWi1s-7Us7ZP@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
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
 nandwrite.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 8ec5afe..aea7572 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -440,8 +440,13 @@ int main(int argc, char * const argv[])
 		goto closeall;
 	}
 
-	// Allocate a buffer big enough to contain all the data (OOB included) for one eraseblock
-	filebuf_max = pagelen * ebsize_aligned / mtd.min_io_size;
+	/*
+	 * Allocate a buffer big enough to contain all the data (OOB included)
+	 * for one eraseblock. The order of operations here matters; if ebsize
+	 * and pagelen are large enough, then "ebsize_aligned * pagelen" could
+	 * overflow a 32-bit data type.
+	 */
+	filebuf_max = ebsize_aligned / mtd.min_io_size * pagelen;
 	filebuf = xmalloc(filebuf_max);
 	erase_buffer(filebuf, filebuf_max);
 
-- 
1.7.0.4
