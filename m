Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Xgat-0005Px-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Feb 2002 10:43:27 +0000
Received: from pcjonashg.axis.se (pcjonashg.axis.se [10.13.8.50])
	by krynn.axis.se (8.12.1/8.12.1/Debian -5) with ESMTP id g14Apv5l023734
	for <linux-mtd@lists.infradead.org>; Mon, 4 Feb 2002 11:51:57 +0100
Subject: Patch for jedec_probe
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <8523.1012575879@redhat.com>
References: <1012574966.21595.10.camel@pcjonashg>
	<1012571237.21594.8.camel@pcjonashg> <1012561603.21481.4.camel@pcjonashg>
	<29597.1012570470@redhat.com> <31144.1012571348@redhat.com>  
	<8523.1012575879@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 04 Feb 2002 11:52:29 +0100
Message-Id: <1012819949.4315.2.camel@pcjonashg>
Mime-Version: 1.0
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

I need the jedec_probe to give up when finding a chip of a different
manufacturer or device id (or no chip at all) than a previously found
chip in the same map.

This patch below fixes that. Is it OK to commit?

/Jonas



Index: jedec_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.10
diff -u -r1.10 jedec_probe.c
--- jedec_probe.c       2002/01/21 18:09:01     1.10
+++ jedec_probe.c       2002/02/04 10:46:45
@@ -832,6 +832,19 @@
                        goto retry;
                }
                return 0;
+       } else {
+               __u16 mfr;
+               __u16 id;
+
+               /* Make sure it is a chip of the same manufacturer and
id */
+               mfr = jedec_read_mfr(map, base, cfi);
+               id = jedec_read_id(map, base, cfi);
+
+               if ((mfr != cfi->mfr) || (id != cfi->id)) {
+                       printk(KERN_DEBUG "%s: Found different chip or
no chip at all (mfr %x, id %x) at 0x%x\n",
+                              map->name, mfr, id, base);
+                       return 0;
+               }
        }

        /* Check each previous chip to see if it's an alias */
