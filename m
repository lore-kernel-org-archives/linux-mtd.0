Received: from na3sys009aob106.obsmtp.com ([74.125.149.76]
	helo=na3sys009aog106.obsmtp.com)
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QR7dW-0002tv-ST
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 18:56:24 +0000
Received: by gwj15 with SMTP id 15so2286239gwj.25
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 May 2011 11:56:20 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 1/3] UBIFS: assert no fixup when writing a node
Date: Mon, 30 May 2011 14:56:14 -0400
Message-Id: <4a63933a3365daf8d1ec38d22c9029a949f3eccd.1306780983.git.bengardiner@nanometrics.ca>
In-Reply-To: <cover.1306780983.git.bengardiner@nanometrics.ca>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
In-Reply-To: <cover.1306780983.git.bengardiner@nanometrics.ca>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current free space fixup can result in some writing to the UBI volume
when the space_fixup flag is set.

To catch instances where UBIFS is writing to the NAND while the space_fixup
flag is set, add an assert to ubifs_write_node().

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

---
 fs/ubifs/io.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 166951e..db298de 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -763,6 +763,8 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
 	if (c->ro_error)
 		return -EROFS;
 
+	ubifs_assert(!c->space_fixup);
+
 	ubifs_prepare_node(c, buf, len, 1);
 	err = ubi_leb_write(c->ubi, lnum, buf, offs, buf_len, dtype);
 	if (err) {
-- 
1.7.4.1
