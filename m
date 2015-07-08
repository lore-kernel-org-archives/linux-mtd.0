Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCr4r-0007GG-UJ
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 15:16:02 +0000
From: Johannes Thumshirn <jthumshirn@suse.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Johannes Thumshirn <jthumshirn@suse.de>
Subject: [PATCH] mtd: Destroy mtd_idr on module_exit
Date: Wed,  8 Jul 2015 17:15:34 +0200
Message-Id: <1436368534-30687-1-git-send-email-jthumshirn@suse.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Destroy mtd_idr on module_exit, reclaiming the allocated memory.

This was detected by the following semantic patch (written by Luis Rodriguez
<mcgrof@suse.com>)
<SmPL>
@ defines_module_init @
declarer name module_init, module_exit;
declarer name DEFINE_IDR;
identifier init;
@@

module_init(init);

@ defines_module_exit @
identifier exit;
@@

module_exit(exit);

@ declares_idr depends on defines_module_init && defines_module_exit @
identifier idr;
@@

DEFINE_IDR(idr);

@ on_exit_calls_destroy depends on declares_idr && defines_module_exit @
identifier declares_idr.idr, defines_module_exit.exit;
@@

exit(void)
{
 ...
  idr_destroy(&idr);
  ...
}

@ missing_module_idr_destroy depends on declares_idr && defines_module_exit && !on_exit_calls_destroy @
identifier declares_idr.idr, defines_module_exit.exit;
@@

exit(void)
{
 ...
 +idr_destroy(&idr);
}
</SmPL>

Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 drivers/mtd/mtdcore.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8bbbb75..8598e3b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1301,6 +1301,7 @@ static void __exit cleanup_mtd(void)
 		remove_proc_entry("mtd", NULL);
 	class_unregister(&mtd_class);
 	bdi_destroy(&mtd_bdi);
+	idr_destroy(&mtd_idr);
 }
 
 module_init(init_mtd);
-- 
2.4.3
