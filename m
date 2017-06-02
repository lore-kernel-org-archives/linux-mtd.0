Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGokj-0004xk-LX
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 15:44:45 +0000
Received: by mail-wr0-x244.google.com with SMTP id e23so422533wre.3
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2017 08:44:21 -0700 (PDT)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 5/5] ubi: Allow to use read-only UBI volume with not enough
 PEBs
Date: Fri,  2 Jun 2017 17:43:42 +0200
Message-Id: <1496418222-23483-6-git-send-email-pali.rohar@gmail.com>
In-Reply-To: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
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

In read-only mode is skipped auto-resize. For pre-build images ready for
auto-resize there can be reserved more PEBs as whole size of pre-build
image. In read-only we do not do any write operation therefore this would
allow to use read-only UBI volume which is not auto-resized yet.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/mtd/ubi/vtbl.c |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 263743e..1d708c5 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -240,8 +240,10 @@ static int vtbl_check(const struct ubi_device *ubi,
 		if (reserved_pebs > ubi->good_peb_count) {
 			ubi_err(ubi, "too large reserved_pebs %d, good PEBs %d",
 				reserved_pebs, ubi->good_peb_count);
-			err = 9;
-			goto bad;
+			if (!ubi->ro_mode) {
+				err = 9;
+				goto bad;
+			}
 		}
 
 		if (name_len > UBI_VOL_NAME_MAX) {
@@ -652,10 +654,12 @@ static int init_volumes(struct ubi_device *ubi,
 		if (ubi->corr_peb_count)
 			ubi_err(ubi, "%d PEBs are corrupted and not used",
 				ubi->corr_peb_count);
-		return -ENOSPC;
+		if (!ubi->ro_mode)
+			return -ENOSPC;
+	} else {
+		ubi->rsvd_pebs += reserved_pebs;
+		ubi->avail_pebs -= reserved_pebs;
 	}
-	ubi->rsvd_pebs += reserved_pebs;
-	ubi->avail_pebs -= reserved_pebs;
 
 	return 0;
 }
-- 
1.7.9.5
