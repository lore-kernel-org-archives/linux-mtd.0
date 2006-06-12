Received: from host2.innominate.fta-berlin.de ([141.16.82.35]
	helo=home.innominate.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fpp5O-0006HL-Pq
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 12:16:39 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by home.innominate.com (Postfix) with ESMTP id 6353A23303
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 17:43:30 +0200 (CEST)
Received: from home.innominate.com ([127.0.0.1])
	by localhost (home [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 13685-02 for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 17:43:30 +0200 (CEST)
Received: from localhost.localdomain (gw-dev-ext.bln.innominate.local
	[10.10.0.1])
	by home.innominate.com (Postfix) with ESMTP id 3C44623302
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 17:43:30 +0200 (CEST)
Received: from chris by localhost.localdomain with local (Exim 4.50)
	id 1FpoRO-0004WX-KI
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 17:34:58 +0200
Date: Mon, 12 Jun 2006 17:34:58 +0200
From: Christian Hohnstaedt <chohnstaedt@innominate.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: fix endian issue of additional protection fields
Message-ID: <20060612153458.GJ24758@tweety>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add byte-swapping for extended OTP areas (NumProtectionFields > 1)

Signed-off-by: Christian Hohnstaedt <chohnstaedt@innominate.com>

---

 drivers/mtd/chips/cfi_cmdset_0001.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

0bdeefafb76db54cdb12a10e8fcc5c197221c276
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 0d43581..3227d1e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -279,11 +279,24 @@ read_pri_intelext(struct map_info *map, 
 	if (extp->MajorVersion == '1' && extp->MinorVersion >= '3') {
 		unsigned int extra_size = 0;
 		int nb_parts, i;
+		struct cfi_intelext_otpinfo *otp;
 
 		/* Protection Register info */
 		extra_size += (extp->NumProtectionFields - 1) *
 			      sizeof(struct cfi_intelext_otpinfo);
 
+		if (extp_size < sizeof(*extp) + extra_size)
+			goto need_more;
+
+		/* Byteswapping for additional ProtectionFields */
+		otp = (struct cfi_intelext_otpinfo*)(extp->extra);
+		for (i=1; i<extp->NumProtectionFields; i++) {
+			otp->ProtRegAddr = le32_to_cpu(otp->ProtRegAddr);
+			otp->FactGroups = le16_to_cpu(otp->FactGroups);
+			otp->UserGroups = le16_to_cpu(otp->UserGroups);
+			otp++;
+		}
+
 		/* Burst Read info */
 		extra_size += 2;
 		if (extp_size < sizeof(*extp) + extra_size)
-- 
Christian Hohnstaedt
Software Engineer

Innominate Security Technologies AG  /device attached security/
tel: +49.30.6392-3285
fax: +49.30.6392-3307
Albert-Einstein-Str. 14
D-12489 Berlin, Germany
http://www.innominate.com
