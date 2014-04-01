Received: from smtp.codeaurora.org ([198.145.11.231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUtdm-0001sP-1p
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 08:01:54 +0000
From: Tanya Brokhman <tlinder@codeaurora.org>
To: dedekind1@gmail.com
Subject: [RFC/PATCH] mtd: ubi: Test return value of __wl_get_peb
Date: Tue,  1 Apr 2014 11:01:12 +0300
Message-Id: <1396339273-15904-1-git-send-email-tlinder@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>,
 Tanya Brokhman <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In case of an error (if there are not free PEB's for example),
__wl_get_peb will return a negative value. In order to prevent access
violation we need to test the returned value prior to using it later on.

Signed-off-by: Tatyana Brokhman <tlinder@codeaurora.org>

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 02317c1..457ead3 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -684,6 +684,9 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
 	peb = __wl_get_peb(ubi);
 	spin_unlock(&ubi->wl_lock);
 
+	if (peb < 0)
+		return peb;
+
 	err = ubi_self_check_all_ff(ubi, peb, ubi->vid_hdr_aloffset,
 				    ubi->peb_size - ubi->vid_hdr_aloffset);
 	if (err) {
-- 
1.7.6
-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
