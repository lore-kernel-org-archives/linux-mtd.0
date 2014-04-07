Received: from smtp.codeaurora.org ([198.145.11.231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX20Z-0004Xc-8b
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 05:22:12 +0000
From: "Dolev Raviv" <draviv@codeaurora.org>
To: "'Tanya Brokhman'" <tlinder@codeaurora.org>,
	<dedekind1@gmail.com>
References: <1396339327-16090-1-git-send-email-tlinder@codeaurora.org>
In-Reply-To: <1396339327-16090-1-git-send-email-tlinder@codeaurora.org>
Subject: RE: [RFC/PATCH] mtd: ubi: Fix ubi free PEBs count calculation
Date: Mon, 7 Apr 2014 08:21:44 +0300
Message-ID: <001501cf5221$4651ad30$d2f50790$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: linux-mtd@lists.infradead.org, 'open list' <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reviewed-by: Dolev Raviv <draviv@codeaurora.org>

Thanks,
Dolev
-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
Tanya Brokhman
Sent: Tuesday, April 01, 2014 11:02 AM
To: dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org; open list; Tanya Brokhman
Subject: [RFC/PATCH] mtd: ubi: Fix ubi free PEBs count calculation

The ubi->free_count should be updated with every insert/remove to/from the
ubi->free list.

Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c index
9a36f78..ca74d19 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -690,6 +690,8 @@ static struct ubi_wl_entry *get_peb_for_wl(struct
ubi_device *ubi)
 
 	e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
 	self_check_in_wl_tree(ubi, e, &ubi->free);
+	ubi->free_count--;
+	ubi_assert(ubi->free_count >= 0);
 	rb_erase(&e->u.rb, &ubi->free);
 
 	return e;
@@ -1090,6 +1092,7 @@ static int wear_leveling_worker(struct ubi_device
*ubi, struct ubi_work *wrk,
 
 			/* Give the unused PEB back */
 			wl_tree_add(e2, &ubi->free);
+			ubi->free_count++;
 			goto out_cancel;
 		}
 		self_check_in_wl_tree(ubi, e1, &ubi->used);
--
1.7.6
--
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundat


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
