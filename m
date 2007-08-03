Received: from fk-out-0910.google.com ([209.85.128.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IH6YL-0004A7-KT
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 19:27:33 -0400
Received: by fk-out-0910.google.com with SMTP id 19so1496875fkr
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Aug 2007 16:27:28 -0700 (PDT)
From: Jesper Juhl <jesper.juhl@gmail.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: [PATCH] UBI: Don't use signed int as array index before testing if it
	is negative
Date: Sat, 4 Aug 2007 01:25:26 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708040125.26861.jesper.juhl@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Jesper Juhl <jesper.juhl@gmail.com>,
	linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I can't find anything guaranteeing that 'ubi_num' cannot be <0 in 
drivers/mtd/ubi/kapi.c::ubi_open_volume(), and in fact the code 
even tests for that and errors out if so. Unfortunately the test 
for "ubi_num < 0" happens after we've already used 'ubi_num' as 
an array index - bad thing to do if it is negative.
This patch moves the test earlier in the function and then moves 
the indexing using that variable after the check. A bit safer :-) 


Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

 drivers/mtd/ubi/kapi.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 4a458e8..5130e54 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -99,16 +99,21 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
 {
 	int err;
 	struct ubi_volume_desc *desc;
-	struct ubi_device *ubi = ubi_devices[ubi_num];
+	struct ubi_device *ubi;
 	struct ubi_volume *vol;
 
 	dbg_msg("open device %d volume %d, mode %d", ubi_num, vol_id, mode);
 
 	err = -ENODEV;
+	if (ubi_num < 0)
+		return ERR_PTR(err);
+
+	ubi = ubi_devices[ubi_num];
+	
 	if (!try_module_get(THIS_MODULE))
 		return ERR_PTR(err);
 
-	if (ubi_num < 0 || ubi_num >= UBI_MAX_DEVICES || !ubi)
+	if (ubi_num >= UBI_MAX_DEVICES || !ubi)
 		goto out_put;
 
 	err = -EINVAL;
