Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 162B8J-0004w3-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Nov 2001 12:51:43 +0000
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6D10@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: TC58FVT160 question 
Date: Fri, 9 Nov 2001 13:59:45 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

The patch you gave me for mtdram was pretty useful. Do you want to commit it?

(I added "+ to" compared to your version so use the patch below if you commit)

/Jonas



 static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
              size_t *retlen, const u_char *buf)
 {
+  size_t c;
+  unsigned char *storage = (char *)mtd->priv + to;
+
   DEBUG(MTD_DEBUG_LEVEL2, "ram_write(pos:%ld, len:%ld)\n", (long)to, (long)len);   if (to + len > mtd->size) {
     DEBUG(MTD_DEBUG_LEVEL1, "ram_write() out of bounds (%ld > %ld)\n", (long)(to + len), (long)mtd->size);
     return -EINVAL;
   }
 
-  memcpy ((char *)mtd->priv + to, buf, len);
+  for (c = 0; c < len; c++) {
+    if ((storage[c] & buf[c]) != buf[c]) {
+      /* We're trying to set bits which weren't set before */
+      printk(KERN_WARNING "mtdram write at 0x%08x tried to set bits "
+             "(from %02x to %02x)\n", to + c, storage[c], buf[c]);
+      *retlen = c;
+      return -EIO;
+    }
+    storage[c] &= buf[c];
+  }
 
   *retlen=len;
   return 0;
