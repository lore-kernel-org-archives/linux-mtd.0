Received: from fire.osdl.org ([65.172.181.4] helo=fire-1.osdl.org)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CHQs0-0002tE-OW
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2004 13:55:34 -0400
Message-ID: <416C18A8.2010105@osdl.org>
Date: Tue, 12 Oct 2004 10:47:20 -0700
From: "Randy.Dunlap" <rddunlap@osdl.org>
MIME-Version: 1.0
To: dwmw2@redhat.com, linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------070909060909020009050206"
Cc: 
Subject: [PATCH] MTD: dilnetpc: use %p for ptr printk arg.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070909060909020009050206
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


-- 
~Randy

--------------070909060909020009050206
Content-Type: text/x-patch;
 name="mtd_dilnetpc_printk.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd_dilnetpc_printk.patch"


Use %p to print a pointer, so that its length doesn't matter
and so that gcc won't complain.

drivers/mtd/maps/dilnetpc.c:416: warning: long unsigned int format, pointer arg (arg 2)

Signed-off-by: Randy Dunlap <rddunlap@osdl.org>

diffstat:=
 drivers/mtd/maps/dilnetpc.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -Naurp ./drivers/mtd/maps/dilnetpc.c~dilnetpc_printk ./drivers/mtd/maps/dilnetpc.c
--- ./drivers/mtd/maps/dilnetpc.c~dilnetpc_printk	2004-08-13 22:36:32.000000000 -0700
+++ ./drivers/mtd/maps/dilnetpc.c	2004-10-12 09:24:31.692189064 -0700
@@ -413,7 +413,7 @@ static int __init init_dnpc(void)
 	}
 	simple_map_init(&dnpc_map);
 
-	printk("FLASH virtual address: 0x%lx\n", dnpc_map.virt);
+	printk("FLASH virtual address: 0x%p\n", dnpc_map.virt);
 
 	mymtd = do_map_probe("jedec_probe", &dnpc_map);
 

--------------070909060909020009050206--
