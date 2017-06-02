Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGokQ-0004wG-Mp
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 15:44:25 +0000
Received: by mail-wr0-x243.google.com with SMTP id e23so421699wre.3
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2017 08:44:02 -0700 (PDT)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 1/5] mtd: block2mtd: Check for valid user supplied erase size
Date: Fri,  2 Jun 2017 17:43:38 +0200
Message-Id: <1496418222-23483-2-git-send-email-pali.rohar@gmail.com>
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

Erase size is limited to 32bit unsigned integer, but value parsed from user
is limited up to size_t C type.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/mtd/devices/block2mtd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 7c887f1..ee47cdd 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -419,7 +419,7 @@ static int block2mtd_setup2(const char *val)
 
 	if (token[1]) {
 		ret = parse_num(&erase_size, token[1]);
-		if (ret) {
+		if (ret || erase_size > U32_MAX) {
 			pr_err("illegal erase size\n");
 			return 0;
 		}
-- 
1.7.9.5
