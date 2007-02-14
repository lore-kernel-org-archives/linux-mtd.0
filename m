Received: from [210.94.41.89] (helo=july7)
	by pentafluge.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HHFVX-0007yU-Lj
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 08:28:56 +0000
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: UBI: What's the correct assert condition in write_leb function in
	upd.c
Date: Wed, 14 Feb 2007 17:28:47 +0900
Message-ID: <005001c75012$2ab0ed20$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I think it's wrong assert condition in write_leb function in upd.c
What's the correct assert condition?

Thank you,
Kyungmin Park

diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index 1359ca4..09e394a 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -364,7 +364,7 @@ static int write_leb(const struct ubi_info *ubi, int
vol_id, int lnum,
 	if (vtr->vol_type == UBI_DYNAMIC_VOLUME) {
 		size_t l;
 
-		ubi_assert(len = vtr->usable_leb_size);
+		ubi_assert(len == vtr->usable_leb_size);
 
 		/* This is dynamic volume - skip the ending 0xFFs */
 		l = ubi_calc_data_len(ubi, buf, len);
