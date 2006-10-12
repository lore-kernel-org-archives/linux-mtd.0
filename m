Received: from mo30.po.2iij.net ([210.128.50.53])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GXw5U-00060B-Oh
	for linux-mtd@lists.infradead.org; Thu, 12 Oct 2006 09:38:46 +0100
Date: Thu, 12 Oct 2006 17:38:15 +0900
From: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
To: dwmw2@infradead.org
Subject: [PATCH] remove ITE 8172G and Globespan IVR MTD support
Message-Id: <20061012173815.519af844.yoichi_yuasa@tripeaks.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>,
	yoichi_yuasa@tripeaks.co.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch has removed ITE 8172G and Globespan IVR MTD support.
These boards support have already been removed.

Yoichi

Signed-off-by: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
Acked-by: Ralf Baechle <ralf@linux-mips.org>

diff -pruN -X generic/Documentation/dontdiff generic-orig/drivers/mtd/maps/cstm_mips_ixx.c generic/drivers/mtd/maps/cstm_mips_ixx.c
--- generic-orig/drivers/mtd/maps/cstm_mips_ixx.c	2006-09-23 23:12:11.971148000 +0900
+++ generic/drivers/mtd/maps/cstm_mips_ixx.c	2006-09-24 00:03:39.219567750 +0900
@@ -40,62 +40,6 @@
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
 
-#if defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR)
-#define CC_GCR             0xB4013818
-#define CC_GPBCR           0xB401380A
-#define CC_GPBDR           0xB4013808
-#define CC_M68K_DEVICE     1
-#define CC_M68K_FUNCTION   6
-#define CC_CONFADDR        0xB8004000
-#define CC_CONFDATA        0xB8004004
-#define CC_FC_FCR          0xB8002004
-#define CC_FC_DCR          0xB8002008
-#define CC_GPACR           0xB4013802
-#define CC_GPAICR          0xB4013804
-#endif /* defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR) */
-
-#if defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR)
-void cstm_mips_ixx_set_vpp(struct map_info *map,int vpp)
-{
-	static DEFINE_SPINLOCK(vpp_lock);
-	static int vpp_count = 0;
-	unsigned long flags;
-
-	spin_lock_irqsave(&vpp_lock, flags);
-
-	if (vpp) {
-		if (!vpp_count++) {
-			__u16	data;
-			__u8	data1;
-			static u8 first = 1;
-
-			// Set GPIO port B pin3 to high
-			data = *(__u16 *)(CC_GPBCR);
-			data = (data & 0xff0f) | 0x0040;
-			*(__u16 *)CC_GPBCR = data;
-			*(__u8 *)CC_GPBDR = (*(__u8*)CC_GPBDR) | 0x08;
-			if (first) {
-				first = 0;
-				/* need to have this delay for first
-				   enabling vpp after powerup */
-				udelay(40);
-			}
-		}
-	} else {
-		if (!--vpp_count) {
-			__u16	data;
-
-			// Set GPIO port B pin3 to high
-			data = *(__u16 *)(CC_GPBCR);
-			data = (data & 0xff3f) | 0x0040;
-			*(__u16 *)CC_GPBCR = data;
-			*(__u8 *)CC_GPBDR = (*(__u8*)CC_GPBDR) & 0xf7;
-		}
-	}
-	spin_unlock_irqrestore(&vpp_lock, flags);
-}
-#endif
-
 /* board and partition description */
 
 #define MAX_PHYSMAP_PARTITIONS    8
@@ -107,29 +51,6 @@ struct cstm_mips_ixx_info {
 	int num_partitions;
 };
 
-#if defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR)
-#define PHYSMAP_NUMBER  1  // number of board desc structs needed, one per contiguous flash type
-const struct cstm_mips_ixx_info cstm_mips_ixx_board_desc[PHYSMAP_NUMBER] =
-{
-    {   // 28F128J3A in 2x16 configuration
-        "big flash",     // name
-	0x08000000,      // window_addr
-	0x02000000,      // window_size
-        4,               // bankwidth
-	1,               // num_partitions
-    }
-
-};
-static struct mtd_partition cstm_mips_ixx_partitions[PHYSMAP_NUMBER][MAX_PHYSMAP_PARTITIONS] = {
-{   // 28F128J3A in 2x16 configuration
-	{
-		.name = "main partition ",
-		.size = 0x02000000, // 128 x 2 x 128k byte sectors
-		.offset = 0,
-	},
-},
-};
-#else /* defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR) */
 #define PHYSMAP_NUMBER  1  // number of board desc structs needed, one per contiguous flash type
 const struct cstm_mips_ixx_info cstm_mips_ixx_board_desc[PHYSMAP_NUMBER] =
 {
@@ -151,7 +72,6 @@ static struct mtd_partition cstm_mips_ix
 	},
 },
 };
-#endif /* defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR) */
 
 struct map_info cstm_mips_ixx_map[PHYSMAP_NUMBER];
 
@@ -184,17 +104,10 @@ int __init init_cstm_mips_ixx(void)
 		cstm_mips_ixx_map[i].name = cstm_mips_ixx_board_desc[i].name;
 		cstm_mips_ixx_map[i].size = cstm_mips_ixx_board_desc[i].window_size;
 		cstm_mips_ixx_map[i].bankwidth = cstm_mips_ixx_board_desc[i].bankwidth;
-#if defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR)
-                cstm_mips_ixx_map[i].set_vpp = cstm_mips_ixx_set_vpp;
-#endif
 		simple_map_init(&cstm_mips_ixx_map[i]);
 		//printk(KERN_NOTICE "cstm_mips_ixx: ioremap is %x\n",(unsigned int)(cstm_mips_ixx_map[i].virt));
 	}
 
-#if defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR)
-        setup_ITE_IVR_flash();
-#endif /* defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR) */
-
 	for (i=0;i<PHYSMAP_NUMBER;i++) {
                 parts = &cstm_mips_ixx_partitions[i][0];
 		jedec = 0;
@@ -241,38 +154,6 @@ static void __exit cleanup_cstm_mips_ixx
 		}
 	}
 }
-#if defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR)
-void PCISetULongByOffset(__u32 DevNumber, __u32 FuncNumber, __u32 Offset, __u32 data)
-{
-	__u32	offset;
-
-	offset = ( unsigned long )( 0x80000000 | ( DevNumber << 11 ) + ( FuncNumber << 8 ) + Offset) ;
-
-	*(__u32 *)CC_CONFADDR = offset;
-	*(__u32 *)CC_CONFDATA = data;
-}
-void setup_ITE_IVR_flash()
-{
-		__u32	size, base;
-
-		size = 0x0e000000;		// 32MiB
-		base = (0x08000000) >> 8 >>1; // Bug: we must shift one more bit
-
-		/* need to set ITE flash to 32 bits instead of default 8 */
-#ifdef CONFIG_MIPS_IVR
-		*(__u32 *)CC_FC_FCR = 0x55;
-		*(__u32 *)CC_GPACR = 0xfffc;
-#else
-		*(__u32 *)CC_FC_FCR = 0x77;
-#endif
-		/* turn bursting off */
-		*(__u32 *)CC_FC_DCR = 0x0;
-
-		/* setup for one chip 4 byte PCI access */
-		PCISetULongByOffset(CC_M68K_DEVICE, CC_M68K_FUNCTION, 0x60, size | base);
-		PCISetULongByOffset(CC_M68K_DEVICE, CC_M68K_FUNCTION, 0x64, 0x02);
-}
-#endif /* defined(CONFIG_MIPS_ITE8172) || defined(CONFIG_MIPS_IVR) */
 
 module_init(init_cstm_mips_ixx);
 module_exit(cleanup_cstm_mips_ixx);
@@ -280,4 +161,4 @@ module_exit(cleanup_cstm_mips_ixx);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alice Hennessy <ahennessy@mvista.com>");
-MODULE_DESCRIPTION("MTD map driver for ITE 8172G and Globespan IVR boards");
+MODULE_DESCRIPTION("MTD map driver for MIPS boards");
