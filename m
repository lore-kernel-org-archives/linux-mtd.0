Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8FUm-0008F2-89
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 22:52:01 +0000
Subject: [PATCH linux-next v4 09/11] mtd: bcm63xxpart: Null terminate and
 validate conversion of flash strings
To: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
References: <566DF43B.5010400@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566DF679.5040309@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 22:51:37 +0000
MIME-Version: 1.0
In-Reply-To: <566DF43B.5010400@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Strings read from flash could be missing null termination characters, or
not contain valid integers.

Null terminate the strings and check for errors when converting them to
integers.

Also validate that the addresses are at least BCM963XX_EXTENDED_SIZE
because this will be subtracted from them.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
v4: New patch.

 drivers/mtd/bcm63xxpart.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index eafbf52..41aa202 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -169,10 +169,39 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	/* Get the tag */
 	ret = bcm63xx_read_image_tag(master, "rootfs", cfelen, buf);
 	if (!ret) {
-		sscanf(buf->flash_image_start, "%u", &rootfsaddr);
-		sscanf(buf->kernel_address, "%u", &kerneladdr);
-		sscanf(buf->kernel_length, "%u", &kernellen);
-		sscanf(buf->total_length, "%u", &totallen);
+		STR_NULL_TERMINATE(buf->flash_image_start);
+		if (kstrtouint(buf->flash_image_start, 10, &rootfsaddr) ||
+				rootfsaddr < BCM963XX_EXTENDED_SIZE) {
+			pr_err("invalid rootfs address: %*ph\n",
+				sizeof(buf->flash_image_start),
+				buf->flash_image_start);
+			goto invalid_tag;
+		}
+
+		STR_NULL_TERMINATE(buf->kernel_address);
+		if (kstrtouint(buf->kernel_address, 10, &kerneladdr) ||
+				kerneladdr < BCM963XX_EXTENDED_SIZE) {
+			pr_err("invalid kernel address: %*ph\n",
+				sizeof(buf->kernel_address),
+				buf->kernel_address);
+			goto invalid_tag;
+		}
+
+		STR_NULL_TERMINATE(buf->kernel_length);
+		if (kstrtouint(buf->kernel_length, 10, &kernellen)) {
+			pr_err("invalid kernel length: %*ph\n",
+				sizeof(buf->kernel_length),
+				buf->kernel_length);
+			goto invalid_tag;
+		}
+
+		STR_NULL_TERMINATE(buf->total_length);
+		if (kstrtouint(buf->total_length, 10, &totallen)) {
+			pr_err("invalid total length: %*ph\n",
+				sizeof(buf->total_length),
+				buf->total_length);
+			goto invalid_tag;
+		}
 
 		kerneladdr = kerneladdr - BCM963XX_EXTENDED_SIZE;
 		rootfsaddr = rootfsaddr - BCM963XX_EXTENDED_SIZE;
@@ -188,6 +217,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 			rootfslen = spareaddr - rootfsaddr;
 		}
 	} else if (ret > 0) {
+invalid_tag:
 		kernellen = 0;
 		rootfslen = 0;
 		rootfsaddr = 0;
-- 
2.1.4

-- 
Simon Arlott
