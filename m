From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 8/8] mtd: nand: improve comment on
 NAND_BBT_DYNAMIC_STRUCT
Date: Tue, 31 May 2011 16:31:27 -0700
Message-ID: <1306884687-1824-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1306884687-1824-1-git-send-email-computersforpeace@gmail.com>
References: <1306884687-1824-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: baruch@tkos.co.il, Kevin Cernekee <cernekee@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	nsekhar@ti.com, b25806@freescale.com, tie-fei.zang@freescale.com,
	linux-mtd@lists.infradead.org,
	Florian Fainelli <ffainelli@freebox.fr>, jamie@jamieiles.com,
	Ivan Djelic <ivan.djelic@parrot.com>, kernel@wantstofly.org,
	khilman@ti.com, jesper.nilsson@axis.com, kgene.kim@samsung.com,
	linux@arm.linux.org.uk, hjk@linutronix.de, r64343@freescale.com,
	u.kleine-koenig@pengutronix.de,
	Ricard Wanderlof <ricard.wanderlof@axis.com>, alex@digriz.org.uk,
	john.ogness@linutronix.de, lucas.demarchi@profusion.mobi,
	nicolas.ferre@atmel.com, s.hauer@pengutronix.de,
	starvik@axis.com, joe@perches.com, ben-linux@fluff.org,
	cbouatmailru@gmail.com, linux-arm-kernel@lists.infradead.org,
	grant.likely@secretlab.ca, hong.xu@atmel.com,
	linux-cris-kernel@axis.com, sbranden@broadcom.com,
	nico@fluxnic.net, jkosina@suse.cz,
	Artem Bityutskiy <dedekind1@gmail.com>, blp@cs.stanford.edu,
	w.sang@pengutronix.de, mware@elphinstone.net,
	jdzheng@broadcom.com, chuanxiao.dong@intel.com, olof@lixom.net,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In an attempt to improve the documentation of the BBT code, I am expanding
the comments I left in commit:
    58373ff0afff4cc8ac40608872995f4d87eb72ec
    mtd: nand: more BB Detection refactoring and dynamic scan options

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/bbm.h |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 57d6a8d..c4eec22 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -113,7 +113,11 @@ struct nand_bbt_descr {
 /* Do not store flash based bad block table in OOB area; store it in-band */
 #define NAND_BBT_NO_OOB		0x00040000
 
-/* The nand_bbt_descr was created dynamicaly and must be freed */
+/*
+ * Flag set by nand_create_default_bbt_descr(), marking that the nand_bbt_descr
+ * was allocated dynamicaly and must be freed in nand_release(). Has no meaning
+ * in nand_chip.bbt_options.
+ */
 #define NAND_BBT_DYNAMICSTRUCT	0x80000000
 
 /* The maximum number of blocks to scan for a bbt */
-- 
1.7.0.4
