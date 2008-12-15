Received: from [2001:470:0:b3::1e] (helo=xenotime.net)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCMwo-0007GI-EG
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 23:33:58 +0000
Received: from ::ffff:71.117.247.66 ([71.117.247.66]) by xenotime.net for
	<linux-mtd@lists.infradead.org>; Mon, 15 Dec 2008 15:33:44 -0800
Message-ID: <4946E967.6030908@xenotime.net>
Date: Mon, 15 Dec 2008 15:33:59 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH -next] mtd: fix dataflash printk formats
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
In-Reply-To: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, akpm <akpm@linux-foundation.org>,
	linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings:

build-r7137.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/mtd_dataflash.c:156: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'uint64_t'
build-r7137.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/mtd_dataflash.c:156: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'uint64_t'
build-r7137.out:/local/linsrc/linux-next-20081215/drivers/mtd/devices/mtd_dataflash.c:670: warning: format '%d' expects type 'int', but argument 5 has type 'uint64_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/devices/mtd_dataflash.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--- linux-next-20081215.orig/drivers/mtd/devices/mtd_dataflash.c
+++ linux-next-20081215/drivers/mtd/devices/mtd_dataflash.c
@@ -153,9 +153,10 @@ static int dataflash_erase(struct mtd_in
 	unsigned		blocksize = priv->page_size << 3;
 	uint8_t			*command;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%x len 0x%x\n",
+	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%llx len 0x%llx\n",
 			dev_name(&spi->dev),
-			instr->addr, instr->len);
+			(unsigned long long)instr->addr,
+			(unsigned long long)instr->len);
 
 	/* Sanity checks */
 	if ((instr->addr + instr->len) > mtd->size
@@ -667,8 +668,8 @@ add_dataflash_otp(struct spi_device *spi
 	if (revision >= 'c')
 		otp_tag = otp_setup(device, revision);
 
-	dev_info(&spi->dev, "%s (%d KBytes) pagesize %d bytes%s\n",
-			name, DIV_ROUND_UP(device->size, 1024),
+	dev_info(&spi->dev, "%s (%llu KBytes) pagesize %d bytes%s\n",
+			name, (unsigned long long)DIV_ROUND_UP(device->size, 1024),
 			pagesize, otp_tag);
 	dev_set_drvdata(&spi->dev, priv);
 
