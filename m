Received: from [202.190.100.200] (helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16aGsU-0008Ne-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2002 13:52:19 +0000
Date: Mon, 11 Feb 2002 21:58:15 +0800 (MYT)
From: David Woodhouse <dwmw2@infradead.org>
To: Chung Ming <min@hello.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: "No Flash Chips Recognized." error.
In-Reply-To: <009a01c1b301$7da37c90$f801a8c0@minibm>
Message-ID: <Pine.LNX.4.44.0202112157400.1558-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, 11 Feb 2002, Chung Ming wrote:

> "DiskOnChip found at address 0xEE000"
> No Flash Chips Recognized.

Try this and tell me what it says...

Index: doc2001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/devices/doc2001.c,v
retrieving revision 1.35
diff -u -r1.35 doc2001.c
--- doc2001.c	2001/10/02 15:05:13	1.35
+++ doc2001.c	2002/02/11 14:02:35
@@ -228,8 +228,10 @@
 		}
 	}
 
-	if (nand_flash_ids[i].name == NULL)
+	if (nand_flash_ids[i].name == NULL) {
+		printk("Chip with mfr %02x, id %02x unknown. Tell dwmw2\n");
 		return 0;
+	}
 	else
 		return 1;
 }



-- 
dwmw2
