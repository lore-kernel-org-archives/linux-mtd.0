Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUHvd-0002yj-5i
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 12:32:10 +0000
Received: by wyb28 with SMTP id 28so407944wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 05:32:05 -0700 (PDT)
Subject: Re: [PATCH v2] libmtd: add helper funcs for getting regioninfo and
	locked info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307533966.31223.66.camel@localhost>
References: <1307427548-29306-4-git-send-email-vapier@gentoo.org>
	<1307460482-3745-1-git-send-email-vapier@gentoo.org>
	<1307533966.31223.66.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 15:27:43 +0300
Message-ID: <1307536063.31223.67.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2011-06-08 at 14:52 +0300, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 11:28 -0400, Mike Frysinger wrote:
> > This extends the libmtd with the helper functions:
> > 	mtd_regioninfo: interface to MEMGETREGIONINFO
> > 	mtd_islocked: interface to MEMISLOCKED
> > 
> > Users of these functions will follow shortly ...
> > 
> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> 
> Pushed with a small tweak, thanks!
> 
> > +int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb)
> > +{
> > +	int ret;
> > +	erase_info_t ei;
> > +
> > +	ei.start = eb * mtd->eb_size;
> > +	ei.length = mtd->eb_size;
> > +
> > +	ret = ioctl(fd, MEMISLOCKED, &ei);
> > +	if (ret < 0)
> > +		return mtd_ioctl_error(mtd, eb, "MEMISLOCKED");
> > +
> 
> I've removed this error message - if we fail, better return an error
> code silently. At least your next patch is built a way that it will keep
> iterating and executing this function.
> 
> We might as well print an error message if (!ENOTTY && !ENOTSUPP), but I
> did not do this. I expect you to send a correction patch if you do not
> like this :-)

I've just pushed a correction patch on top of this:

>From 92a06994b7c3f146cbdb770b30780e32f021118f Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 8 Jun 2011 15:30:14 +0300
Subject: [PATCH] libmtd: improve mtd_islocked interface

This patch first of all, re-names 'mtd_islocked()' into 'mtd_is_locked()' since
this seems to be the name Mike wanted, and it looks a bit nicer.

This patch also makes 'mtd_is_locked()' print an error message if it fails. I'm
not sure if it is good idea for a library to do so, but all functions do this,
so it certainly _not_ a good idea to be inconsistent.

However, for the special case, when the the "is locked" ioctl is not supported
or is not valid for this device, we do not print an error message and return
ENOTSUPP error code.

Thus, the user can distinguish between real errors and non-fatal "not
supported" cases.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/libmtd.h |    8 +++++---
 lib/libmtd.c     |   13 +++++++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index 7275246..9efccbc 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -190,16 +190,18 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb);
 int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo);
 
 /**
- * mtd_islocked - see if the specified eraseblock is locked.
+ * mtd_is_locked - see if the specified eraseblock is locked.
  * @mtd: MTD device description object
  * @fd: MTD device node file descriptor
  * @eb: eraseblock to check
  *
  * This function checks to see if eraseblock @eb of MTD device described
  * by @fd is locked. Returns %0 if it is unlocked, %1 if it is locked, and
- * %-1 in case of failure.
+ * %-1 in case of failure. If the ioctl is not supported (support was added in
+ * Linux kernel 2.6.36) or this particular device does not support it, errno is
+ * set to @ENOTSUPP.
  */
-int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb);
+int mtd_is_locked(const struct mtd_dev_info *mtd, int fd, int eb);
 
 /**
  * mtd_torture - torture an eraseblock.
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 2573cc7..c34874e 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -900,14 +900,23 @@ int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo)
 	return 0;
 }
 
-int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb)
+int mtd_is_locked(const struct mtd_dev_info *mtd, int fd, int eb)
 {
+	int ret;
 	erase_info_t ei;
 
 	ei.start = eb * mtd->eb_size;
 	ei.length = mtd->eb_size;
 
-	return ioctl(fd, MEMISLOCKED, &ei);
+	ret = ioctl(fd, MEMISLOCKED, &ei);
+	if (ret < 0) {
+		if (errno != ENOTTY && errno != EOPNOTSUPP)
+			return mtd_ioctl_error(mtd, eb, "MEMISLOCKED");
+		else
+			errno = EOPNOTSUPP;
+	}
+
+	return ret;
 }
 
 /* Patterns to write to a physical eraseblock when torturing it */
-- 
1.7.2.3



-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
