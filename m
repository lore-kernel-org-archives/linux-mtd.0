Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16FxLF-00037p-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2001 12:58:01 +0000
Received: from jocke.lumentis.se (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id OAA24095
	for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2001 14:08:17 +0100 (MET)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Subject: Burst read and other improvements
Date: Mon, 17 Dec 2001 14:08:17 +0100
References: <0111121314140A.28381@jocke.lumentis.se>
In-Reply-To: <0111121314140A.28381@jocke.lumentis.se>
MIME-Version: 1.0
Message-Id: <01121714081700.06319@jocke.lumentis.se>
Content-Transfer-Encoding: 8bit
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

Hi all

Previously I reported that enabling burst read on Flash did not improve 
performance. That's not true :-(

I have measured the mount time with  this command:
time mount /dev/mtdblock4 /jffs2/
(Currently I am mostly intressted in lowering my mount times)

Here is what I get:
No optimization:  10.51 s.
with burst read:  9.12 s.
as above + patch to scan.c: 8.29 s
as above + #define  ACCT_PARANOIA_CHECK(jeb)  to nothing: 7.95 s.

This is on a MPC860 cpu at 80MHz and 40 MHz bus speed. 
Questions:
   Is the ACCT_PARANOIA_CHECK still needed?

   Does anybody else get better mount times by patching scan.c?
   Would be nice if this patch could make it into CVS ...

     Jocke

patch to scan.c:
--- scan.c      2001/10/25 12:11:11     1.4
+++ scan.c      2001/12/17 12:43:36
@@ -334,7 +334,7 @@
        __u32 scanlen = (jeb->offset + c->sector_size) - *startofs;
        __u32 curofs = *startofs;
 
-       buf = kmalloc(min((__u32)PAGE_SIZE, scanlen), GFP_KERNEL);
+       buf = kmalloc(min((__u32)PAGE_SIZE/4, scanlen), GFP_KERNEL);
        if (!buf) {
                printk(KERN_WARNING "Scan buffer allocation failed\n");
                return -ENOMEM;
@@ -343,7 +343,7 @@
                ssize_t retlen;
                int ret, i;
 
-               ret = c->mtd->read(c->mtd, curofs, min((__u32)PAGE_SIZE, 
scanlen), &retlen, (char *)buf);
+               ret = c->mtd->read(c->mtd, curofs, min((__u32)PAGE_SIZE/4, 
scanlen), &retlen, (char *)buf);
                if(ret) {
                        D1(printk(KERN_WARNING "jffs2_scan_empty(): Read 0x%x 
bytes at 0x%08x returned %d\n", min((__u32)PAGE_SIZE, scanlen), curofs, ret));
                        kfree(buf);

    
