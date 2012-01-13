Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RlhnQ-00078i-2G
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 14:08:00 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] UBI: Handle empty string in verify_mkvol_req()
Date: Fri, 13 Jan 2012 15:07:40 +0100
Message-Id: <1326463660-17852-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently it's possible to create a volume without a name.
E.g:
ubimkvol -n 32 -s 2MiB -t static /dev/ubi0 -N ""

After that vtbl_check() will always fail because it does not permit
empty strings.

Cc: <stable@vger.kernel.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/cdev.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 3320a50..ad76592 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -632,6 +632,9 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
 	if (req->alignment != 1 && n)
 		goto bad;
 
+	if (!req->name[0] || !req->name_len)
+		goto bad;
+
 	if (req->name_len > UBI_VOL_NAME_MAX) {
 		err = -ENAMETOOLONG;
 		goto bad;
-- 
1.7.7.3
