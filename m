Received: from ug-out-1314.google.com ([66.249.92.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J2x0D-00041H-Cg
	for linux-mtd@lists.infradead.org; Thu, 13 Dec 2007 22:58:08 +0000
Received: by ug-out-1314.google.com with SMTP id 23so998892ugr.45
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Dec 2007 14:57:56 -0800 (PST)
From: Jesper Juhl <jesper.juhl@gmail.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: [PATCH] UBI: silence warning about possibly uninitialized use of
	variable in drivers/mtd/ubi/vmt.c ...
Date: Thu, 13 Dec 2007 23:53:08 +0100
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <4761b8f2.1c89420a.7f10.ffffe9db@mx.google.com>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jesper Juhl <jesper.juhl@gmail.com>

This patch silences the following warning :

  drivers/mtd/ubi/vmt.c:73: warning: 'ret' may be used uninitialized in this function

gcc can't see that we always initialize ret in all situations where it is 
actually used. The one case where it's not initialized is when we BUG(), 
but gcc doesn't know that we won't then continue and use an uninitialized 
'ret'.

This patch results in code that does exactely the same as before, but it 
also makes gcc shut up, so we generate one less line of warning noise.


Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

 vmt.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 88629a3..e44948d 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -70,13 +70,14 @@ static struct device_attribute attr_vol_upd_marker =
 static ssize_t vol_attribute_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
-	int ret;
+	int ret = -ENODEV;
+
 	struct ubi_volume *vol = container_of(dev, struct ubi_volume, dev);
 
 	spin_lock(&vol->ubi->volumes_lock);
 	if (vol->removed) {
 		spin_unlock(&vol->ubi->volumes_lock);
-		return -ENODEV;
+		return ret;
 	}
 	if (attr == &attr_vol_reserved_ebs)
 		ret = sprintf(buf, "%d\n", vol->reserved_pebs);
