Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OfrRK-0008UE-Ow
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2010 09:36:11 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id 46FDF26026D
	for <linux-mtd@lists.infradead.org>;
	Mon,  2 Aug 2010 11:36:09 +0200 (CEST)
Message-ID: <4C569186.4080404@parrot.com>
Date: Mon, 2 Aug 2010 11:36:06 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS memleak
Content-Type: multipart/mixed; boundary="------------080501040000070208000800"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------080501040000070208000800
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

In mount_ubifs, in case of ubifs_leb_unmap error, free allocated resources.


Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>



--------------080501040000070208000800
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

--------------080501040000070208000800--
