Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FtJ49-0002sk-Tp
	for linux-mtd@lists.infradead.org; Thu, 22 Jun 2006 02:53:35 -0400
Subject: Re: Current mtd tree is broken
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0606211535y2b85e229ubd235b3849c2013e@mail.gmail.com>
References: <625fc13d0606211535y2b85e229ubd235b3849c2013e@mail.gmail.com>
Content-Type: multipart/mixed; boundary="=-75sr5aVni3PbpOFshped"
Date: Thu, 22 Jun 2006 10:52:53 +0400
Message-Id: <1150959173.4244.9.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-75sr5aVni3PbpOFshped
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-06-21 at 17:35 -0500, Josh Boyer wrote:
> As panto pointed out on IRC today, the current MTD git tree is
> completely broken for quite a few chip types.  Anything older than
> Intel Sibley or P30 is broken since writesize is not set to something
> other than 0 in the other cases.  This causes a BUG to trigger in
> add_mtd_device because someone decided writesize == 0 was not a sane
> thing.

How about this?

writesize is a new feature and many drivers may not initialize it. It
might be harmless, depending on the usage of the driver. So don't be
that difficult and issue warning instead of getting into panic.

Signed-off-by: Artem B. Bityutskiy <dedekind@infradead.org>

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.

--=-75sr5aVni3PbpOFshped
Content-Disposition: attachment; filename=writesize-warn.diff
Content-Type: text/x-patch; name=writesize-warn.diff; charset=KOI8-R
Content-Transfer-Encoding: 7bit

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 16a952d..8b5e99d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -47,7 +47,7 @@ int add_mtd_device(struct mtd_info *mtd)
 {
 	int i;
 
-	BUG_ON(mtd->writesize == 0);
+	WARN_ON(mtd->writesize == 0);
 	mutex_lock(&mtd_table_mutex);
 
 	for (i=0; i < MAX_MTD_DEVICES; i++)

--=-75sr5aVni3PbpOFshped--
