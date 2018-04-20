Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RMv-0007Xn-Np
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:11 +0000
Received: by mail-wr0-x244.google.com with SMTP id o15-v6so20637079wro.11
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:25:59 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Arnout Vandecappelle <arnout@mind.be>
Subject: [PATCH 03/18] mtd: nand: gpmi: put only once used functions inline
Date: Fri, 20 Apr 2018 10:19:31 +0200
Message-Id: <20180420081946.16088-4-sam.lefebvre@essensium.com>
In-Reply-To: <20180420081946.16088-1-sam.lefebvre@essensium.com>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sascha Hauer <s.hauer@pengutronix.de>

read_page_prepare(), read_page_end() and read_page_swap_end() are
trivial functions that are used only once and take 8 arguments each.
De-obfuscate the code by open coding these functions in
gpmi_ecc_read_page()

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: rebased
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 89 ++++++++----------------------
 1 file changed, 23 insertions(+), 66 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 5fa9cd4fac4a..774ac98fbdb2 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -668,56 +668,6 @@ static void release_resources(struct gpmi_nand_data *this)
 	release_dma_channels(this);
 }
 
-static int read_page_prepare(struct gpmi_nand_data *this,
-			void *destination, unsigned length,
-			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
-			void **use_virt, dma_addr_t *use_phys)
-{
-	struct device *dev = this->dev;
-
-	if (virt_addr_valid(destination)) {
-		dma_addr_t dest_phys;
-
-		dest_phys = dma_map_single(dev, destination,
-						length, DMA_FROM_DEVICE);
-		if (dma_mapping_error(dev, dest_phys)) {
-			if (alt_size < length) {
-				dev_err(dev, "Alternate buffer is too small\n");
-				return -ENOMEM;
-			}
-			goto map_failed;
-		}
-		*use_virt = destination;
-		*use_phys = dest_phys;
-		this->direct_dma_map_ok = true;
-		return 0;
-	}
-
-map_failed:
-	*use_virt = alt_virt;
-	*use_phys = alt_phys;
-	this->direct_dma_map_ok = false;
-	return 0;
-}
-
-static inline void read_page_end(struct gpmi_nand_data *this,
-			void *destination, unsigned length,
-			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
-			void *used_virt, dma_addr_t used_phys)
-{
-	if (this->direct_dma_map_ok)
-		dma_unmap_single(this->dev, used_phys, length, DMA_FROM_DEVICE);
-}
-
-static inline void read_page_swap_end(struct gpmi_nand_data *this,
-			void *destination, unsigned length,
-			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
-			void *used_virt, dma_addr_t used_phys)
-{
-	if (!this->direct_dma_map_ok)
-		memcpy(destination, alt_virt, length);
-}
-
 static int send_page_prepare(struct gpmi_nand_data *this,
 			const void *source, unsigned length,
 			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
@@ -1008,24 +958,33 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	int           ret;
 
 	dev_dbg(this->dev, "page number is : %d\n", page);
-	ret = read_page_prepare(this, buf, nfc_geo->payload_size,
-					this->payload_virt, this->payload_phys,
-					nfc_geo->payload_size,
-					&payload_virt, &payload_phys);
-	if (ret) {
-		dev_err(this->dev, "Inadequate DMA buffer\n");
-		ret = -ENOMEM;
-		return ret;
+
+	payload_virt = this->payload_virt;
+	payload_phys = this->payload_phys;
+	this->direct_dma_map_ok = false;
+
+	if (virt_addr_valid(buf)) {
+		dma_addr_t dest_phys;
+
+		dest_phys = dma_map_single(this->dev, buf, nfc_geo->payload_size,
+					   DMA_FROM_DEVICE);
+		if (!dma_mapping_error(this->dev, dest_phys)) {
+			payload_virt = buf;
+			payload_phys = dest_phys;
+			this->direct_dma_map_ok = true;
+		}
 	}
+
 	auxiliary_virt = this->auxiliary_virt;
 	auxiliary_phys = this->auxiliary_phys;
 
 	/* go! */
 	ret = gpmi_read_page(this, payload_phys, auxiliary_phys);
-	read_page_end(this, buf, nfc_geo->payload_size,
-			this->payload_virt, this->payload_phys,
-			nfc_geo->payload_size,
-			payload_virt, payload_phys);
+
+	if (this->direct_dma_map_ok)
+		dma_unmap_single(this->dev, payload_phys, nfc_geo->payload_size,
+				 DMA_FROM_DEVICE);
+
 	if (ret) {
 		dev_err(this->dev, "Error in ECC-based read: %d\n", ret);
 		return ret;
@@ -1034,10 +993,8 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	/* Loop over status bytes, accumulating ECC status. */
 	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
 
-	read_page_swap_end(this, buf, nfc_geo->payload_size,
-			   this->payload_virt, this->payload_phys,
-			   nfc_geo->payload_size,
-			   payload_virt, payload_phys);
+	if (!this->direct_dma_map_ok)
+		memcpy(buf, this->payload_virt, nfc_geo->payload_size);
 
 	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
 		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
-- 
2.14.1
