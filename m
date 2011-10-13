Received: from na3sys009aog122.obsmtp.com ([74.125.149.147])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1REUtk-0004DW-3u
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2011 23:41:13 +0000
Received: by mail-yw0-f47.google.com with SMTP id 7so1972321ywf.20
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Oct 2011 16:41:06 -0700 (PDT)
Sender: Kevin Herbert <kevin.herbert@meraki.net>
To: <linux-mtd@lists.infradead.org>
Message-Id: <20111013234138.07E0CA1DDD@snowflake>
Date: Thu, 13 Oct 2011 16:41:37 -0700 (PDT)
From: Kevin Paul Herbert <kevin.herbert@meraki.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kevin Paul Herbert <kph@meraki.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD-UTILS] UBI: Track the PEB size in the UBI EC header


The UBI header does not contain the PEB size, so it is not possible
to do any consistency checking to verify that the PEB size is
consistent with the actual erase size of the flash.

This patch adds a peb_size field to each erase block and initializes
is. A subsequent patch will enable usage of this feature in the kernel.

Signed-off-by: Kevin Paul Herbert <kph@meraki.net>
---
 include/mtd/ubi-media.h |    4 +++-
 ubi-utils/libubigen.c   |    1 +
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/include/mtd/ubi-media.h b/include/mtd/ubi-media.h
index 08bec3e..30ea063 100644
--- a/include/mtd/ubi-media.h
+++ b/include/mtd/ubi-media.h
@@ -130,6 +130,7 @@ enum {
  * @vid_hdr_offset: where the VID header starts
  * @data_offset: where the user data start
  * @image_seq: image sequence number
+ * @peb_size: size of PEB, must be multiple of erase size
  * @padding2: reserved for future, zeroes
  * @hdr_crc: erase counter header CRC checksum
  *
@@ -162,7 +163,8 @@ struct ubi_ec_hdr {
 	__be32  vid_hdr_offset;
 	__be32  data_offset;
 	__be32  image_seq;
-	__u8    padding2[32];
+	__be32	peb_size;
+	__u8    padding2[28];
 	__be32  hdr_crc;
 } __attribute__ ((packed));
 
diff --git a/ubi-utils/libubigen.c b/ubi-utils/libubigen.c
index 9eaa7f5..60fec85 100644
--- a/ubi-utils/libubigen.c
+++ b/ubi-utils/libubigen.c
@@ -135,6 +135,7 @@ void ubigen_init_ec_hdr(const struct ubigen_info *ui,
 	hdr->vid_hdr_offset = cpu_to_be32(ui->vid_hdr_offs);
 	hdr->data_offset = cpu_to_be32(ui->data_offs);
 	hdr->image_seq = cpu_to_be32(ui->image_seq);
+	hdr->peb_size = cpu_to_be32(ui->peb_size);
 
 	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_EC_HDR_SIZE_CRC);
 	hdr->hdr_crc = cpu_to_be32(crc);
-- 
1.7.4.1
