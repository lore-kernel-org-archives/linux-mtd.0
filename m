Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13NAk9-0006GO-00
	for mtd-list@infradead.org; Fri, 11 Aug 2000 10:04:45 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13NAk7-0006GI-00
	for mtd@infradead.org; Fri, 11 Aug 2000 10:04:43 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <3993B83E.90CBABF2@arcom.co.uk> 
References: <3993B83E.90CBABF2@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: Can change permissions regardless of ownership? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 11 Aug 2000 10:04:36 +0100
Message-ID: <10481.965984676@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  When using JFFS it appears that you can change permissions and
> ownerships even for files you don't own. 


Index: inode-v22.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/inode-v22.c,v
retrieving revision 1.32
retrieving revision 1.33
diff -u -r1.32 -r1.33
--- inode-v22.c	2000/08/10 08:58:00	1.32
+++ inode-v22.c	2000/08/11 09:02:51	1.33
@@ -10,7 +10,7 @@
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  *
- * $Id: inode-v22.c,v 1.32 2000/08/10 08:58:00 dwmw2 Exp $
+ * $Id: inode-v22.c,v 1.33 2000/08/11 09:02:51 dwmw2 Exp $
  *
  * Ported to Linux 2.2.x by Sebastien Cote:
  * Copyright (C) 2000 Matrox Electronic Systems
@@ -194,6 +194,9 @@
 
 	D1(printk("***jffs_notify_change(): file: \"%s\", ino: %u\n",
 		  f->name, f->ino));
+
+	if ((res = inode_change_ok(inode, iattr)))
+		return res;
 
 	c = f->c;
 	fmc = c->fmc;


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
