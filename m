Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTvfw-0006gz-RI
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 21:22:46 +0000
Received: by mail-wr1-x443.google.com with SMTP id j2so13742211wrw.1
 for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2018 13:22:33 -0800 (PST)
Sender: Mathieu Malaterre <mathieu.malaterre@gmail.com>
From: Mathieu Malaterre <malat@debian.org>
To: Paul Burton <paul.burton@mips.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mips: annotate implicit fall throughs
Date: Mon,  3 Dec 2018 22:22:13 +0100
Message-Id: <20181203212214.8862-1-malat@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a plan to build the kernel with -Wimplicit-fallthrough and
these places in the code produced warnings. Fix them up.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 drivers/mtd/nand/raw/jz4780_bch.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
index 731c6051d91e..7201827809e9 100644
--- a/drivers/mtd/nand/raw/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/jz4780_bch.c
@@ -136,8 +136,10 @@ static void jz4780_bch_read_parity(struct jz4780_bch *bch, void *buf,
 	switch (size8) {
 	case 3:
 		dest8[2] = (val >> 16) & 0xff;
+		/* fall through */
 	case 2:
 		dest8[1] = (val >> 8) & 0xff;
+		/* fall through */
 	case 1:
 		dest8[0] = val & 0xff;
 		break;
-- 
2.19.2
