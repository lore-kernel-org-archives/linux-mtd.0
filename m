Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwG7b-0001ce-KA
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2016 22:11:04 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 10/28] UBI: fix uninitialized access of vid_hdr pointer
Date: Tue, 18 Oct 2016 00:10:13 +0200
Message-Id: <20161017221037.1781185-1-arnd@arndb.de>
In-Reply-To: <20161017220342.1627073-1-arnd@arndb.de>
References: <20161017220342.1627073-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A rework of UBI that just appeared in linux-next during the merge
window introduced caused the recover_peb to use a variable that
is never initialized as seen from this gcc warning:

drivers/mtd/ubi/eba.c: In function ‘recover_peb’:
drivers/mtd/ubi/eba.c:744:40: error: ‘vid_hdr’ may be used uninitialized in this function [-Werror=maybe-uninitialized]

It seems clear that the change to the function arguments was missing
the initialization that I'm now adding back to restore the
way the function was working before.

Fixes: 3291b52f9ff0 ("UBI: introduce the VID buffer concept")
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/ubi/eba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 95c4048..2e152be 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -719,7 +719,7 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 			   struct ubi_vid_io_buf *vidb, bool *retry)
 {
 	struct ubi_device *ubi = vol->ubi;
-	struct ubi_vid_hdr *vid_hdr;
+	struct ubi_vid_hdr *vid_hdr = ubi_get_vid_hdr(vidb);
 	int new_pnum, err, vol_id = vol->vol_id, data_size;
 	uint32_t crc;
 
-- 
2.9.0
