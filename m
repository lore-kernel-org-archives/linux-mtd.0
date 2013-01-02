Received: from mail.dev.rtsoft.ru ([213.79.90.226] helo=wasted.dev.rtsoft.ru)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TqTuq-0004Dv-Sr
 for linux-mtd@lists.infradead.org; Wed, 02 Jan 2013 19:23:53 +0000
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH] davinci_nand: fix compilation with CONFIG_OF=y
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Date: Wed, 2 Jan 2013 23:22:27 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201301022322.27541.sshtylyov@ru.mvista.com>
Cc: davinci-linux-open-source@linux.davincidsp.com, hs@denx.de, nsekhar@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit cdeadd712f52b16a9285386d61ee26fd14eb4085 (mtd: nand: davinci: add OF
support for davinci nand controller) obviously has never been really build
tested with CONFIG_OF=y.  Now it prevents DaVinci family kernels from building:
all due to stupidly missing semicolon after a structure initializer...

Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: stable@vger.kernel.org # 3.7

---
Sekhar, have you build tested at least 3.8-rc1?


 drivers/mtd/nand/davinci_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/mtd/nand/davinci_nand.c
===================================================================
--- linux.orig/drivers/mtd/nand/davinci_nand.c
+++ linux/drivers/mtd/nand/davinci_nand.c
@@ -523,7 +523,7 @@ static struct nand_ecclayout hwecc4_2048
 static const struct of_device_id davinci_nand_of_match[] = {
 	{.compatible = "ti,davinci-nand", },
 	{},
-}
+};
 MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
 
 static struct davinci_nand_pdata
