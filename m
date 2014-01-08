Received: from mail-db8lp0187.outbound.messaging.microsoft.com
 ([213.199.154.187] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0mNt-000484-9w
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 06:12:58 +0000
Date: Wed, 8 Jan 2014 13:38:17 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v0]  mtd: gpmi: Use cached syndromes to speedup erased
 region bitflip detection.
Message-ID: <20140108053816.GA28424@shlinux2.ap.freescale.net>
References: <1389123873-30663-1-git-send-email-eliedebrauwer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1389123873-30663-1-git-send-email-eliedebrauwer@gmail.com>
Cc: shijie8@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 07, 2014 at 08:44:32PM +0100, Elie De Brauwer wrote:
> Hello all,
> 
> This patch is incremental with respect to 'mtd: gpmi: Deal with bitflips in 
> erased regions' currently in its 7th version, which I consider more or less
> stable.
> The 7th version of that patch removed however a fast path option which 
> resulted in a flash throughput decrease. Everytime an erased block is read,
> each individual byte has its hamming weight calculated and bitflips corrected
> in software. I'm testing this on a poor old i.mx28 which isn't an powerful
> beast. 
> 
> Hence I've been looking for a way to regain some of the performance which 
> was lost (at the cost of making ubifs more reliable). And I've been a bit
> insipired by Pekon Gupta's work on omap (where I stole the first hamming 
> weight approach). 
> 
> Apparently the BCH block has the possibility to write the syndrome data
> to auxiliary memory (where also the status bytes are stored) when setting 
> the HW_BCH_CTRL:DEBUGSYNDROME). Hence I followed the approach where the 
> first time a correctly erase block is found these syndromes are cached 
> and future reads of likely-to-be--erased blocks can be identified based
> on the comparison of these syndroms as opposed to checking each individual
> bytes. For example on my 2k chip I would normally get the hamming weight 
> of 4 (chunks) of 512 bytes aka 2k bytes. But with an ecc8 I can replace 
> this by a memcmp() of 4x32 bytes. (4 sets of syndromes). The result is 
> obviously that the processor is more eager to do this resulting in a 
> regaining some of the lost speed.
> 
> I did some benchmarking on the following 2k and 4k nand chips:
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron MT29F4G08ABAEAH4), 512MiB, page size: 4096, OOB size: 224
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron MT29F2G08ABAEAH4), 256MiB, page size: 2048, OOB size: 64
> 
> By simply doing time dd if=/dev/mtd8 of=/dev/null bs=1M and calculating 
> the throughput (in megabyte/s). This gave the following results:
> 
> 2k  |4k
> ========
> 7.0 |11.3 <- v6 of the bitflips correction path (broken fast path)
> 4.7 |5.9  <- v7 of the bitflip correction patch (no fast path)
> 5.9 |8.4  <- with this patch applied.
> 
thanks for the new patch.

I suddenly think out a new solution about this issue:
  [1] when the bitflip occurs, the BCH will tells up the uncorrectable,
  [2] if we catch a uncorrectable error, we could check the whole buffer, and
      count the number of the bitflips. Assume we get the bitflips is N.

  [3] if N is < (gf_len ), we could think this is a erased page, and call the
      memset to the whole buffer, and tell the upper layer that this is a good
      empty page.

  [4] since the [1] is very rare, i think this method is much faster then the
      current solution.

the patch is something like this:
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index e2f5820..575327d 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -958,6 +958,29 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
 	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
 }
 
+static bool gpmi_erased_check(struct gpmi_nand_data *this,
+			unsigned char *data, unsigned int chunk)
+{
+	struct bch_geometry *geo = &this->bch_geometry;
+	int base = geo->ecc_chunk_size * chunk;
+	unsigned int flip_bits = 0;
+	unsigned threthold = geo->gf_len / 2;
+	int i;
+
+	/* Count bitflips */
+	for (i = 0; i < geo->ecc_chunk_size; i++)
+		flip_bits += hweight8(~data[base + i]);
+
+	if (threthold > geo->ecc_strength)
+		threthold = geo->ecc_strength;
+
+	if (flip_bits < threthold) {
+		memset(&data[base], 0xFF, geo->ecc_chunk_size);
+		return true;
+	}
+	return false;
+}
+
 static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int oob_required, int page)
 {
@@ -1007,6 +1030,8 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			continue;
 
 		if (*status == STATUS_UNCORRECTABLE) {
+			if (gpmi_erased_check(this, payload_virt, i))
+				continue;
 			mtd->ecc_stats.failed++;
 			continue;
 		}
-- 


thanks
Huang Shijie
