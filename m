Received: from [2002:c35c:f9fc::1] (helo=parcelfarce.linux.theplanet.co.uk)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwPzS-0003PS-Oq
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 14:16:39 -0500
Date: Wed, 2 Feb 2005 19:16:33 +0000
From: Al Viro <viro@parcelfarce.linux.theplanet.co.uk>
To: Linus Torvalds <torvalds@osdl.org>
Message-ID: <20050202191632.GE8859@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Al Viro <viro@www.linux.org.uk>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH] (8/27) block2mtd 64bit bug
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Passing pointer to size_t to function that expects u32 * and actually
stores a value there...
Signed-off-by: Al Viro <viro@parcelfarce.linux.theplanet.co.uk>
----
diff -urN RC11-rc2-bk10-sent/drivers/mtd/devices/block2mtd.c RC11-rc2-bk10-mtd/drivers/mtd/devices/block2mtd.c
--- RC11-rc2-bk10-sent/drivers/mtd/devices/block2mtd.c	Fri Jan 21 22:46:40 2005
+++ RC11-rc2-bk10-mtd/drivers/mtd/devices/block2mtd.c	Wed Feb  2 08:27:37 2005
@@ -422,7 +422,7 @@
 	char buf[80+12], *str=buf; /* 80 for device, 12 for erase size */
 	char *token[2];
 	char *name;
-	size_t erase_size = PAGE_SIZE;
+	u32 erase_size = PAGE_SIZE;
 	int i, ret;
 
 	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
