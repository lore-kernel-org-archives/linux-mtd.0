Received: from mail-oa0-f43.google.com ([209.85.219.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzAjN-0006nX-UN
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 19:48:30 +0000
Received: by mail-oa0-f43.google.com with SMTP id i7so16549838oag.16
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 11:48:05 -0800 (PST)
Date: Fri, 3 Jan 2014 11:48:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC/PATCH] mtd: Hide CONFIG_MTD_BLKDEVS from the menu
Message-ID: <20140103194801.GN5631@ld-irv-0074>
References: <1386943124-8005-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131220004712.GA12803@localhost>
 <20131220020518.GB18175@norris-Latitude-E6410>
 <20131220181757.GA17786@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131220181757.GA17786@localhost>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 20, 2013 at 03:17:58PM -0300, Ezequiel Garcia wrote:
> On Thu, Dec 19, 2013 at 06:05:18PM -0800, Brian Norris wrote:
> > On Thu, Dec 19, 2013 at 09:47:13PM -0300, Ezequiel Garcia wrote:
> > > Any comments on this one?
> > 
> > It looks OK to me. I might add a comment above MTD_BLKDEVS like I see in
> > some other similar Kconfig not-user-selectable options:
> > 
> > #
> > # MTD block device support is select'ed if needed
> > #
> > 
> 
> Fully agreed.

Since I didn't receive a follow-up, I just added the comment and pushed
to l2-mtd.git. Diff pasted below.

Thanks,
Brian

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 5fab4e6e8301..cdaa4e512c97 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -157,10 +157,11 @@ config MTD_BCM47XX_PARTS
 
 comment "User Modules And Translation Layers"
 
+#
+# MTD block device support is select'ed if needed
+#
 config MTD_BLKDEVS
-	tristate "Common interface to block layer for MTD 'translation layers'"
-	depends on BLOCK
-	default n
+	bool
 
 config MTD_BLOCK
 	tristate "Caching block device access to MTD devices"
