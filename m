Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Apn8H-0006O7-Iy
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 11:29:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Schirmer <jolt@tuxbox.org>
In-Reply-To: <007301c3ebea$29f96270$9602010a@jingle>
References: <007301c3ebea$29f96270$9602010a@jingle>
Content-Type: text/plain
Message-Id: <1076239710.12587.231.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 08 Feb 2004 11:28:30 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-05 at 14:15 +0100, Florian Schirmer wrote:
> i'm having a strange problem with a JFFS2 filesystem: I always get messages
> about incorrect CRC values while mounting the filesystem. What i did:

Also apply this.

Index: fs/jffs2/write.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/write.c,v
retrieving revision 1.80
diff -u -p -r1.80 write.c
--- fs/jffs2/write.c	27 Jan 2004 13:21:50 -0000	1.80
+++ fs/jffs2/write.c	8 Feb 2004 11:29:14 -0000
@@ -97,6 +97,12 @@ struct jffs2_full_dnode *jffs2_write_dno
 	int retried = 0;
 	unsigned long cnt = 2;
 
+	if (data && datalen && 
+	    (je32_to_cpu(ri->data_crc) != crc32(0, data, datalen))) {
+		    printk(KERN_CRIT "Eep. Data CRC not correct in jffs2_write_dnode()\n");
+		    BUG();
+	}
+
 	D1(if(je32_to_cpu(ri->hdr_crc) != crc32(0, ri, sizeof(struct jffs2_unknown_node)-4)) {
 		printk(KERN_CRIT "Eep. CRC not correct in jffs2_write_dnode()\n");
 		BUG();

-- 
dwmw2
