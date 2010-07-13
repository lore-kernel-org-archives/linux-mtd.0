Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYbgP-0003KB-UE
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 09:21:47 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id A52C9260290
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jul 2010 11:21:43 +0200 (CEST)
Message-ID: <4C3C3024.8050104@parrot.com>
Date: Tue, 13 Jul 2010 11:21:40 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS memleak ?
Content-Type: multipart/mixed; boundary="------------040408040905090004010106"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------040408040905090004010106
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

in mount_ubifs shouldn't we do something like that in case of 
ubifs_leb_unmap error ?


Matthieu

--------------040408040905090004010106
Content-Type: text/x-diff; name="ubifs.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="ubifs.diff"

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 4d2f215..9362f16 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1318,7 +1318,7 @@ static int mount_ubifs(struct ubifs_info *c)
 			 */
 			err = ubifs_leb_unmap(c, c->gc_lnum);
 			if (err)
-				return err;
+				goto out_orphans;
 		}
 
 		err = dbg_check_lprops(c);

--------------040408040905090004010106--
