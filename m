Received: from havoc.gtf.org ([69.61.125.42])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HsGzZ-00082J-4m
	for linux-mtd@lists.infradead.org; Sun, 27 May 2007 07:32:58 -0400
Date: Sun, 27 May 2007 07:32:54 -0400
From: Jeff Garzik <jeff@garzik.org>
To: Andrew Morton <akpm@linux-foundation.org>, dedekind@infradead.org
Subject: [PATCH] mtd/ubi: silence gcc warning
Message-ID: <20070527113254.GA11940@havoc.gtf.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Silence the gcc warning

drivers/mtd/ubi/eba.c: In function ‘ubi_eba_read_leb’:
drivers/mtd/ubi/eba.c:371: warning: ‘crc’ may be used uninitialized in this function

This is an example of the uninit'd-var warnings emitted by gcc that
can be proven to be bogus.

Normally I would commit this to my git repository containing
such verified cases, but with all the goto-driven control flow in
ubi_eba_read_leb(), I feel that initializing the 'crc' variable is
an easy way to both shut up gcc, and also make the code less fragile
for the long term.

Signed-off-by: Jeff Garzik <jeff@garzik.org>

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 7400294..3fe1722 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -368,7 +368,7 @@ int ubi_eba_read_leb(struct ubi_device *ubi, int vol_id, int lnum, void *buf,
 	int err, pnum, scrub = 0, idx = vol_id2idx(ubi, vol_id);
 	struct ubi_vid_hdr *vid_hdr;
 	struct ubi_volume *vol = ubi->volumes[idx];
-	uint32_t crc, crc1;
+	uint32_t crc = 0, crc1;
 
 	err = leb_read_lock(ubi, vol_id, lnum);
 	if (err)
