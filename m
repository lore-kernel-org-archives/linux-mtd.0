Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0HLB-0003PN-D6
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 23:13:10 +0000
Received: by wmww144 with SMTP id w144so57398156wmw.1
 for <linux-mtd@lists.infradead.org>; Sat, 21 Nov 2015 15:12:47 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 2/3] mtd: m25p80: handle HW message size restrictions
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
References: <564CEB61.2000601@gmail.com>
 <20151118215755.GL31303@sirena.org.uk> <564D0098.4030107@gmail.com>
 <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
Cc: Michal Suchanek <hramrach@gmail.com>, Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Message-ID: <5650F952.2060409@gmail.com>
Date: Sun, 22 Nov 2015 00:08:02 +0100
MIME-Version: 1.0
In-Reply-To: <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
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

Extend m25p80_read allowing to read in chunks in case the
SPI HW has a max supported message size.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c9c3b7f..df4c510 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -115,11 +115,7 @@ static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
 	}
 }
 
-/*
- * Read an address range from the nor chip.  The address range
- * may be any size provided it is within the physical boundaries.
- */
-static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
+static int _m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct m25p *flash = nor->priv;
@@ -153,6 +149,39 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 }
 
 /*
+ * Read an address range from the nor chip.  The address range
+ * may be any size provided it is within the physical boundaries.
+ */
+static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
+                       size_t *retlen, u_char *buf)
+{
+	struct m25p *flash = nor->priv;
+	size_t cmd_len, xfer_len, max_len;
+	int ret = 0;
+
+	/* convert the dummy cycles to the number of bytes */
+	cmd_len = m25p_cmdsz(nor) + nor->read_dummy / 8;
+
+	max_len = flash->spi->master->max_msg_size ?: SIZE_MAX;
+
+	if (unlikely(max_len < cmd_len))
+		return -EINVAL;
+
+	max_len -= cmd_len;
+
+	while (len) {
+		xfer_len = min(len, max_len);
+		ret = _m25p80_read(nor, from, xfer_len, retlen, buf);
+		if (ret < 0)
+			break;
+		from += xfer_len;
+		len -= xfer_len;
+	}
+
+	return ret;
+}
+
+/*
  * board specific setup should have ensured the SPI clock used here
  * matches what the READ command supports, at least until this driver
  * understands FAST_READ (for clocks over 25 MHz).
-- 
2.6.2
