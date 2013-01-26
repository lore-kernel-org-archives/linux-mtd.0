Received: from utopia.booyaka.com ([74.50.51.50])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tz0cf-00056d-Va
 for linux-mtd@lists.infradead.org; Sat, 26 Jan 2013 07:56:23 +0000
Date: Sat, 26 Jan 2013 07:56:20 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: onfi don't WARN if we are in 16 bits mode (fwd)
Message-ID: <alpine.DEB.2.00.1301260754500.19277@utopia.booyaka.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem, David,

if possible, it would be good to get this one into v3.8-rc, due to the 
large OMAP boot-time warning mentioned at:

http://article.gmane.org/gmane.linux.ports.arm.omap/91317


thanks,

- Paul

---------- Forwarded message ----------
Date: Wed, 16 Jan 2013 15:25:45 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Cc: dedekind1@gmail.com, paul@pwsan.com,
    Matthieu CASTET <matthieu.castet@parrot.com>
Subject: [PATCH] mtd: nand: onfi don't WARN if we are in 16 bits mode

ff3206b2450499203532af2505a7f6f8413e92c0 adds a WARN if the onfi probe is
in 16 bits mode.
This allows to detect driver that need to be fixed, but this is a bit noisy [1].
Transform the WARN in a pr_err.

[1]
http://article.gmane.org/gmane.linux.ports.arm.omap/91317

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8323ac9..3766682 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2857,8 +2857,11 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	int i;
 	int val;
 
-	/* ONFI need to be probed in 8 bits mode */
-	WARN_ON(chip->options & NAND_BUSWIDTH_16);
+	/* ONFI need to be probed in 8 bits mode, and 16 bits should be selected with NAND_BUSWIDTH_AUTO */
+	if (chip->options & NAND_BUSWIDTH_16) {
+		pr_err("Trying ONFI probe in 16 bits mode, aborting !\n");
+		return 0;
+	}
 	/* Try ONFI for unknown chip or LP */
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
 	if (chip->read_byte(mtd) != 'O' || chip->read_byte(mtd) != 'N' ||
-- 
1.7.10.4
