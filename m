Received: from 11.mo5.mail-out.ovh.net ([46.105.47.167])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dq1xb-000682-Ne
 for linux-mtd@lists.infradead.org; Thu, 07 Sep 2017 18:55:34 +0000
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id D7BDA1258DB
 for <linux-mtd@lists.infradead.org>; Thu,  7 Sep 2017 20:55:07 +0200 (CEST)
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
To: marek.vasut@gmail.com, linux-mtd@lists.infradead.org, geert@linux-m68k.org
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [DEBUG] mtd: spi-nor: dump DWORDs of the Basic Flash Parameter Table
Date: Thu,  7 Sep 2017 20:54:56 +0200
Message-Id: <20170907185456.4631-1-cyrille.pitchen@wedev4u.fr>
In-Reply-To: <CAMuHMdXKpheF5whZi2Ot2Pm8t3Lu+ramNV==sXBo87u_HerZxQ@mail.gmail.com>
References: <CAMuHMdXKpheF5whZi2Ot2Pm8t3Lu+ramNV==sXBo87u_HerZxQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

debug purpose only, should not be merged!

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
---

Hi Geert,

Can you apply this patch on your tree then report me what was printed, please?
I have an idea of the root cause of your issue then a potential work-around
but I first need to validate my assumption to confirm that the work-around
would actually work.

For instance, here is what I get with a Macronix MX25L25673G (same JEDEC ID as
MX25L25635E):

[    0.700000] atmel_qspi f0020000.spi: DWORD1 = 0xfffb20e5
[    0.710000] atmel_qspi f0020000.spi: DWORD2 = 0x0fffffff
[    0.710000] atmel_qspi f0020000.spi: DWORD3 = 0x6b08eb44
[    0.720000] atmel_qspi f0020000.spi: DWORD4 = 0xbb043b08
[    0.720000] atmel_qspi f0020000.spi: DWORD5 = 0xfffffffe
[    0.720000] atmel_qspi f0020000.spi: DWORD6 = 0xff00ffff
[    0.730000] atmel_qspi f0020000.spi: DWORD7 = 0xeb44ffff
[    0.730000] atmel_qspi f0020000.spi: DWORD8 = 0x520f200c
[    0.740000] atmel_qspi f0020000.spi: DWORD9 = 0xff00d810
[    0.740000] atmel_qspi f0020000.spi: DWORD10 = 0x00dd59d6
[    0.740000] atmel_qspi f0020000.spi: DWORD11 = 0xdb039f82
[    0.750000] atmel_qspi f0020000.spi: DWORD12 = 0x38670344
[    0.750000] atmel_qspi f0020000.spi: DWORD13 = 0xb030b030
[    0.760000] atmel_qspi f0020000.spi: DWORD14 = 0x5cd5bdf7
[    0.760000] atmel_qspi f0020000.spi: DWORD15 = 0xff299e4a
[    0.760000] atmel_qspi f0020000.spi: DWORD16 = 0x85f950f0
[    0.770000] atmel_qspi f0020000.spi: BFPT version 1.6 (length = 16)
[    0.770000] atmel_qspi f0020000.spi: mx25l25635e (32768 Kbytes)

Best regards,

Cyrille

 drivers/mtd/spi-nor/spi-nor.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 05254dd6a4a0..5066d99b9f50 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2136,8 +2136,14 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return err;
 
 	/* Fix endianness of the BFPT DWORDs. */
-	for (i = 0; i < BFPT_DWORD_MAX; i++)
+	for (i = 0; i < BFPT_DWORD_MAX; i++) {
 		bfpt.dwords[i] = le32_to_cpu(bfpt.dwords[i]);
+		dev_info(nor->dev, "DWORD%d = 0x%08x\n", i + 1, bfpt.dwords[i]);
+	}
+	dev_info(nor->dev, "BFPT version %d.%d (length = %u)\n",
+		 bfpt_header->major,
+		 bfpt_header->minor,
+		 bfpt_header->length);
 
 	/* Number of address bytes. */
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
-- 
2.11.0
