Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egHaK-00010u-AM
 for linux-mtd@lists.infradead.org; Mon, 29 Jan 2018 22:07:30 +0000
Received: by mail-wm0-x242.google.com with SMTP id x4so902432wmc.0
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2018 14:07:17 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v2 2/2] ubi-utils: ubiformat.c: convert to integer arithmetic
Date: Mon, 29 Jan 2018 23:07:12 +0100
Message-Id: <1517263632-11126-3-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1517263632-11126-1-git-send-email-andrea.adami@gmail.com>
References: <1517263632-11126-1-git-send-email-andrea.adami@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Do not cast percent to double, it is just used as upper limit.
Avoid floating point to fix compilation for aarch64 against klibc:

error: '-mgeneral-regs-only' is incompatible with floating-point code
|    int percent = ((double)si->ok_cnt)/si->good_cnt * 100;
|        ^~~~~~~

Notes:
* The checks in the code above this line ensure that si->good_cnt is not 0.

* The code assumes  si->good_cnt * 100  will not overflow, then we can use
  (si->ok_cnt * 100) safely because the former is bigger.

* The truncated result does not affect the logic:
  i.e. a value of 49.9 is truncated to 49 and is still <50.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
v2 no changes

 ubi-utils/ubiformat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index ef0378a..c38b9b4 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -844,7 +844,7 @@ int main(int argc, char * const argv[])
 	}
 
 	if (!args.override_ec && si->empty_cnt < si->good_cnt) {
-		int percent = ((double)si->ok_cnt)/si->good_cnt * 100;
+		int percent = (si->ok_cnt * 100) / si->good_cnt;
 
 		/*
 		 * Make sure the majority of eraseblocks have valid
-- 
2.7.4
