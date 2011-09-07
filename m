Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OX4-0001Pp-5E
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:15:38 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 03/14] mtd: define `is_ecc_error()' macros
Date: Wed, 7 Sep 2011 13:13:30 -0700
Message-ID: <1315426421-16243-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These macros can be used instead of including -EUCLEAN and -EBADMSG all
over the place. They should help make code a little bit more readable.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/mtd.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index ead70ed..1dd74f4 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -348,4 +348,9 @@ void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
 
 void mtd_erase_callback(struct erase_info *instr);
 
+#define is_corrected_ecc_error(error) (error == -EUCLEAN)
+#define is_uncorrected_ecc_error(error) (error == -EBADMSG)
+#define is_ecc_error(error) ((is_corrected_ecc_error(error) || \
+			      is_uncorrected_ecc_error(error)))
+
 #endif /* __MTD_MTD_H__ */
-- 
1.7.5.4
