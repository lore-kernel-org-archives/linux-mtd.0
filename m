Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYbjL-00083N-Iv
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 09:24:48 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id 4D84C2602B1
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jul 2010 11:24:46 +0200 (CEST)
Message-ID: <4C3C30D1.9030005@parrot.com>
Date: Tue, 13 Jul 2010 11:24:33 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubifs : corruption after power cut test
References: <4C346D5B.2000609@parrot.com> <4C3C1572.8080501@parrot.com>
	<4C3C2740.2040105@parrot.com>
In-Reply-To: <4C3C2740.2040105@parrot.com>
Content-Type: multipart/mixed; boundary="------------000602020804070504000400"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------000602020804070504000400
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Matthieu CASTET a écrit :
> Matthieu CASTET a écrit :
>> Hi,
>>
>> we found some bug in our driver. Now there no more ubifs error when
>> there is uncorrectable ecc error (they should happen in the last
>> (interrupted) written page).
>>
>> But now we got "validate_master: bad master node at offset 69632 error
>> 7" [1].
> notice that gc_lnum==-1 in this case.
> Also this didn't happen on power cut.
> The senario was :
> - power cut
> - mount fs [1]
> - do some fs operation
> - umount fs quickly (9 second after mount in this case) [2]
> - mount fs [3]
> 
> The the problem seems that gc_lnum==-1 is not handled in mount or
> shouldn't happen in umount.
> 
The attached patch try to support mount with gc_lnum == -1.

Does it look sane ?


Matthieu

--------------000602020804070504000400
Content-Type: text/x-diff; name="ubifs.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="ubifs.diff"

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index eb532e0..56de77f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1320,18 +1322,27 @@ static int mount_ubifs(struct ubifs_info *c)
 			if (err)
 				goto out_orphans;
 			err = ubifs_rcvry_gc_commit(c);
-		} else {
-			err = take_gc_lnum(c);
 			if (err)
 				goto out_orphans;
+		} else {
+			if (c->gc_lnum == -1) {
+				err = ubifs_rcvry_gc_commit(c);
+				if (err)
+					goto out_orphans;
+			}
+			else {
+				err = take_gc_lnum(c);
+				if (err)
+					goto out_orphans;
 
-			/*
-			 * GC LEB may contain garbage if there was an unclean
-			 * reboot, and it should be un-mapped.
-			 */
-			err = ubifs_leb_unmap(c, c->gc_lnum);
-			if (err)
-				return err;
+				/*
+				 * GC LEB may contain garbage if there was an unclean
+				 * reboot, and it should be un-mapped.
+				 */
+				err = ubifs_leb_unmap(c, c->gc_lnum);
+				if (err)
+					return err;
+			}
 		}
 
 		err = dbg_check_lprops(c);
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 28beaee..8d5b080 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -135,7 +135,7 @@ static int validate_master(const struct ubifs_info *c)
 		goto out;
 	}
 
-	if (c->gc_lnum >= c->leb_cnt || c->gc_lnum < c->main_first) {
+	if (c->gc_lnum != -1 && (c->gc_lnum >= c->leb_cnt || c->gc_lnum < c->main_first)) {
 		err = 7;
 		goto out;
 	}

--------------000602020804070504000400--
