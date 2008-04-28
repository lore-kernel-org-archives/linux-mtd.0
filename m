Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JqUpn-0001Od-63
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 15:00:04 +0000
Date: Tue, 29 Apr 2008 00:01:00 +0900 (JST)
Message-Id: <20080429.000100.02304871.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: Re: [PATCH] physmap: do not probe absent modules
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1209371162.25560.109.camel@pmac.infradead.org>
References: <20080424.223830.27953792.anemo@mba.ocn.ne.jp>
	<1209371162.25560.109.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 28 Apr 2008 09:26:02 +0100, David Woodhouse <dwmw2@infradead.org> wrote:
> > For example, if MTD_CFI was not enabled, probing it does nothing other
> > than just produces an error message.
> 
> Eww. We should _never_ have stuff in the static kernel depending on
> CONFIG_xxx_MODULE. What if you build the module later?

OK, I see.

> I wouldn't be entirely averse to making some of these config options
> boolean, though.

Well, maybe, but I'm not sure nobody want to make the redboot parser
loadable.

My intention was just removing a garbage in boot message.  How about
this alternative?  Is this acceptable?

-----------------------------------------------------------------
Subject: mtdpart: Do not report loud about absent parser module

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c66902d..f199ffc 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -560,7 +560,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 				parser = get_partition_parser(*types);
 #endif
 		if (!parser) {
-			printk(KERN_NOTICE "%s partition parsing not available\n",
+			printk(KERN_DEBUG "%s partition parsing not available\n",
 			       *types);
 			continue;
 		}
