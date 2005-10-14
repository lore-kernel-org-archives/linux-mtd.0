Received: from sccrmhc11.comcast.net ([204.127.202.55])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQTIx-0000Uh-Qf
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2005 13:25:19 -0400
Date: Thu, 13 Oct 2005 18:07:26 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: linux-mtd@lists.infradead.org
Message-ID: <20051014010726.GA28898@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [PATCH] [Trivial] Make physmap messages more user friendly
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Can I commit the following to CVS? It makes the message a bit more
readalbe (and obvious that it is in hex) and tells the user if 
the probe failed.

Signed-off-by: Deepak Saxena <dsaxena@plexity.net>

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -50,11 +50,12 @@ static int __init init_physmap(void)
 	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
 	const char **type;
 
-       	printk(KERN_NOTICE "physmap flash device: %lx at %lx\n", physmap_map.size, physmap_map.phys);
+       	printk(KERN_NOTICE "MTD physmap flash device: %#010lx @ %#010lx\n", 
+			physmap_map.size, physmap_map.phys);
 	physmap_map.virt = ioremap(physmap_map.phys, physmap_map.size);
 
 	if (!physmap_map.virt) {
-		printk("Failed to ioremap\n");
+		printk("MTD physmap: Failed to ioremap\n");
 		return -EIO;
 	}
 
@@ -90,6 +91,8 @@ static int __init init_physmap(void)
 		add_mtd_device(mymtd);
 
 		return 0;
+	} else {
+		printk("MTD physmap: failed to probe flash\n");
 	}
 
 	iounmap(physmap_map.virt);

-- 
Deepak Saxena - dsaxena@plexity.net - http://www.plexity.net

Even a stopped clock gives the right time twice a day.
