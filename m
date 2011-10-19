Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGZr5-0000PJ-NR
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 17:23:04 +0000
Received: by pzk33 with SMTP id 33so4933824pzk.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Oct 2011 10:23:00 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: dhlm83@sapo.pt
Subject: Re: flash_erase ERROR!
Date: Wed, 19 Oct 2011 10:22:41 -0700
Message-Id: <1319044961-26745-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <20110922111511.15615t65c0et2ban@mail.sapo.pt>
References: <20110922111511.15615t65c0et2ban@mail.sapo.pt>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey, sorry for the delay here. One reason is that I don't really know all
the answers for your problem.

On Thu, Sep 22, 2011 at 3:15 AM, <dhlm83@sapo.pt> wrote:
> I think the mtd-utils version is the same to kernel 2.4.x and 2.6.x in my
> distro source.
> This can not generate some compatibility issues?

I'm not sure what distro is providing 2.4.x and 2.6.x kernels, but it would
seem to me like recent versions of mtd-utils (I think you're using
"mtd-utils v1.4.2") are not designed to support both kernels. Generally, it
is difficult for today's developers to test code for 2.4.x, and there is no
official support for MTD on 2.4.x. See:

http://www.linux-mtd.infradead.org/source.html#kernelversions

> In the past, mtd-utils have the utilities erase and erase_all. I think that
> utilities work with my kernel, is that possible?
> You know what version of mtd-utils are available (erase and erase_all)?
> I can try this version.

It is possible that some old version of mtd-utils had simpler utilities
that worked with 2.4.x. I don't see them in the git repository, though, so
they're likely older than 2006.

Brian

P.S. It looks like your problem is pretty simple to fix. Try this patch
out, and perhaps it can be integrated into mtd-utils to provide a small
breath of support for 2.4.x in the "legacy" section of libmtd :)

---

From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] libmtd_legacy: support kernels before ioctl(MEMGETBADBLOCK)
 existed

For really old kernels, ioctl(MEMGETBADBLOCK) did not exist, so we
always quit out with ENOTTY. We should at least allow this check to pass
and just proceed without bad block info. This is safe enough, as users
of these old kernels will not be using NAND (or anything with bad
blocks).

Reported-by: Domingos Goncalves <dhlm83@sapo.pt>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 lib/libmtd_legacy.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index d6c3938..14a3f27 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -248,7 +248,7 @@ int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd)
 
 	ret = ioctl(fd, MEMGETBADBLOCK, &offs);
 	if (ret == -1) {
-		if (errno != EOPNOTSUPP) {
+		if (errno != EOPNOTSUPP && errno != ENOTTY) {
 			sys_errmsg("MEMGETBADBLOCK ioctl failed");
 			goto out_close;
 		}
-- 
1.7.5.4
