Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R6Bgz-00006R-BB
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 01:33:42 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 03/14] mtd: define `mtd_is_*()' functions
Date: Tue, 20 Sep 2011 18:30:51 -0700
Message-ID: <1316568651-21414-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1316503194.4849.39.camel@sauron>
References: <1316503194.4849.39.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These functions can be used instead of referencing -EUCLEAN and -EBADMSG
all over the place. They should help make code a little bit more
readable.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: use static inline functions, change names to `mtd_is_*' prefix,
    don't call bitflips "errors"

 include/linux/mtd/mtd.h |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 37d0827..4bce1eb 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -348,4 +348,16 @@ void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
 
 void mtd_erase_callback(struct erase_info *instr);
 
+static inline int mtd_is_bitflip(int err) {
+	return err == -EUCLEAN;
+}
+
+static inline int mtd_is_eccerr(int err) {
+	return err == -EBADMSG;
+}
+
+static inline int mtd_is_bitflip_or_eccerr(int err) {
+	return mtd_is_bitflip(err) || mtd_is_eccerr(err);
+}
+
 #endif /* __MTD_MTD_H__ */
-- 
1.7.5.4
