Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REeHz-00022o-Kh
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 09:42:52 +0000
Received: by wwg9 with SMTP id 9so592151wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 02:42:48 -0700 (PDT)
Subject: Re: [smatch stuff] mtd/ubi/gluebi: signedness warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2011 12:42:18 +0300
In-Reply-To: <20111010092857.GA16165@elgon.mountain>
References: <20111010092857.GA16165@elgon.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318585345.12351.87.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-10-10 at 12:28 +0300, Dan Carpenter wrote:
> Smatch complains about some to the checks in gluebi.c
> 
> drivers/mtd/ubi/gluebi.c +177 gluebi_read(6) warn: unsigned 'len' is never less than zero.
> drivers/mtd/ubi/gluebi.c +221 gluebi_write(6) warn: unsigned 'len' is never less than zero.
> drivers/mtd/ubi/gluebi.c +270 gluebi_erase(7) warn: unsigned 'instr->len' is never less than zero.
> 
> I think probably these checks can just be removed?  Can these things
> wrap if we passed a huge value for instr->len?
> 
>    270          if (instr->len < 0 || instr->addr + instr->len > mtd->size)
>    271                  return -EINVAL;
> 
> I don't know enough about how these are called to say.

Dan, smatch is right, that check is stupid. And yes, things can wrap. So
I guess this need 2 patches - one removes the "< 0" check, the other
prevents wrapping. And the code is a bit messy WRT int vs size_t.

I guess we could fix the warnings with the following patch, but wrapping
would need a separate fix.



>From ec819dd49d1891aafb1212f445c76ed8b272cdf2 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@intel.com>
Date: Fri, 14 Oct 2011 12:31:56 +0300
Subject: [PATCH] UBI: gluebi: remove useless checks

drivers/mtd/ubi/gluebi.c +177 gluebi_read(6) warn: unsigned 'len' is never less than zero.
drivers/mtd/ubi/gluebi.c +221 gluebi_write(6) warn: unsigned 'len' is never less than zero.
drivers/mtd/ubi/gluebi.c +270 gluebi_erase(7) warn: unsigned 'instr->len' is never less than zero.

Remove the checks. However, there is an outstanding issue that we can
get huge offset and len which will wrap and pass the check against the
mtd size.

Reported by Dan Carpenter <dan.carpenter@oracle.com>, spotted by smatch.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@intel.com>
---
 drivers/mtd/ubi/gluebi.c |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 941bc3c..0b13fa2 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -171,10 +171,11 @@ static void gluebi_put_device(struct mtd_info *mtd)
 static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 		       size_t *retlen, unsigned char *buf)
 {
-	int err = 0, lnum, offs, total_read;
+	int err = 0, lnum, offs;
+	size_t total_read;
 	struct gluebi_device *gluebi;
 
-	if (len < 0 || from < 0 || from + len > mtd->size)
+	if (from < 0 || from + len > mtd->size)
 		return -EINVAL;
 
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
@@ -215,10 +216,11 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 			size_t *retlen, const u_char *buf)
 {
-	int err = 0, lnum, offs, total_written;
+	size_t total_written;
+	int err = 0, lnum, offs;
 	struct gluebi_device *gluebi;
 
-	if (len < 0 || to < 0 || len + to > mtd->size)
+	if (to < 0 || len + to > mtd->size)
 		return -EINVAL;
 
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
@@ -265,9 +267,9 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 	int err, i, lnum, count;
 	struct gluebi_device *gluebi;
 
-	if (instr->addr < 0 || instr->addr > mtd->size - mtd->erasesize)
+	if (instr->addr > mtd->size - mtd->erasesize)
 		return -EINVAL;
-	if (instr->len < 0 || instr->addr + instr->len > mtd->size)
+	if (instr->addr + instr->len > mtd->size)
 		return -EINVAL;
 	if (mtd_mod_by_ws(instr->addr, mtd) || mtd_mod_by_ws(instr->len, mtd))
 		return -EINVAL;
-- 
1.7.7

-- 
Best Regards,
Artem Bityutskiy
