Received: from mx1.riseup.net ([204.13.164.18])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K2REv-0007My-1c
	for linux-mtd@lists.infradead.org; Sat, 31 May 2008 13:35:21 +0000
Date: Sat, 31 May 2008 15:35:11 +0200
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [patch 1/2] MTD: use list_for_each_entry() in add_mtd_device()
Message-ID: <20080531133511.GA8734@traven>
References: <20080531132808.644758754@kaehlcke.net>
	<20080531132808.984625508@kaehlcke.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080531132808.984625508@kaehlcke.net>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

sorry, i forgot to tell quilt to refresh the patch, here comes the
good one

--

MTD: use list_for_each_entry() instead of list_for_each() in add_mtd_device()

Signed-off-by: Matthias Kaehlcke <matthias@kaehlcke.net>

Index: linux-2.6/drivers/mtd/mtdcore.c
===================================================================
--- linux-2.6.orig/drivers/mtd/mtdcore.c        2008-05-31
15:31:17.000000000 +0200
+++ linux-2.6/drivers/mtd/mtdcore.c     2008-05-31 15:32:19.000000000
+0200
@@ -53,7 +53,7 @@

        for (i=0; i < MAX_MTD_DEVICES; i++)
                if (!mtd_table[i]) {
-                       struct list_head *this;
+                       struct mtd_notifier *not;

                        mtd_table[i] = mtd;
                        mtd->index = i;
@@ -72,8 +72,7 @@
                        DEBUG(0, "mtd: Giving out device %d to
												%s\n",i, mtd->name);
                        /* No need to get a refcount on the module
												containing
                           the notifier, since we hold the
													 mtd_table_mutex */
-                       list_for_each(this, &mtd_notifiers) {
-                               struct mtd_notifier *not =
list_entry(this, struct mtd_notifier, list);
+                       list_for_each_entry(not, &mtd_notifiers, list)
{
                                not->add(mtd);
                        }

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

    I am incapable of conceiving infinity, and yet I do not accept finity
                          (Simone de Beauvoir)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
