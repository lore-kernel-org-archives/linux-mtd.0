From: David Woodhouse <dwmw2@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20041120163510.GD7984@ku-gbr.de>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
	<20041120145020.GA15782@synertronixx3>
	<1100962661.8600.41.camel@localhost.localdomain>
	<20041120163510.GD7984@ku-gbr.de>
Content-Type: multipart/mixed; boundary="=-PW4rZLxynm6LMIewXAPf"
Date: Sat, 20 Nov 2004 16:34:27 +0000
Message-Id: <1100968467.7949.8.camel@localhost.localdomain>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PW4rZLxynm6LMIewXAPf
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2004-11-20 at 17:35 +0100, Konstantin Kletschke wrote:
> Sadly I overlooked your other (cvs comitted) patch this evening and I am
> at home now, what a pity... That would have cleared the situation up in
> 5 minutes :/

No it wouldn't -- that isn't the problem either. I _think_ this is...

-- 
dwmw2

--=-PW4rZLxynm6LMIewXAPf
Content-Disposition: inline
Content-Description: Attached message - mtd/fs/jffs2 build.c,1.64,1.65
Content-Type: message/rfc822

Return-path: <linux-mtd-cvs-bounces+dwmw2=infradead.org@lists.infradead.org>
Envelope-to: dwmw2@baythorne.infradead.org
Delivery-date: Sat, 20 Nov 2004 16:12:50 +0000
Received: from [2002:cde9:da46::1] (helo=canuck.infradead.org) by
	baythorne.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux)) id
	1CVXr0-0007GO-1z for dwmw2@baythorne.infradead.org; Sat, 20 Nov 2004
	16:12:50 +0000
Received: from localhost ([127.0.0.1] helo=canuck.infradead.org) by
	canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux)) id
	1CVXxm-00076x-OP; Sat, 20 Nov 2004 11:19:50 -0500
Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux)) id
	1CVXxg-00076r-Qa for linux-mtd-cvs@canuck.infradead.org;
	Sat, 20 Nov 2004 11:19:45 -0500
Received: from dwmw2 by phoenix.infradead.org with local (Exim 4.42 #1 (Red
	Hat Linux)) id 1CVXxd-00050i-W8 for linux-mtd-cvs@lists.infradead.org;
	Sat, 20 Nov 2004 16:19:42 +0000
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-mtd-cvs@lists.infradead.org
X-CVS-Module: mtd
X-CVS-Directory: mtd/fs/jffs2
Precedence: first-class
Message-Id: <E1CVXxd-00050i-W8@phoenix.infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 20 Nov 2004 16:19:42 +0000
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
	phoenix.infradead.org See http://www.infradead.org/rpr.html
Subject: mtd/fs/jffs2 build.c,1.64,1.65
X-BeenThere: linux-mtd-cvs@lists.infradead.org
X-Mailman-Version: 2.1.5
List-Id: Linux MTD CVS commit list <linux-mtd-cvs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs>,
	<mailto:linux-mtd-cvs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd-cvs>
List-Post: <mailto:linux-mtd-cvs@lists.infradead.org>
List-Help: <mailto:linux-mtd-cvs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs>,
	<mailto:linux-mtd-cvs-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-cvs-bounces@lists.infradead.org
Errors-To: linux-mtd-cvs-bounces+dwmw2=infradead.org+dwmw2=infradead.org@lists.infradead.org
X-Evolution-Source: imap://dwmw2@pentafluge.infradead.org/
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Update of /home/cvs/mtd/fs/jffs2
In directory phoenix.infradead.org:/tmp/cvs-serv19258

Modified Files:
	build.c 
Log Message:
Fix freeing of refs belonging to unlinked inode


Index: build.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/build.c,v
retrieving revision 1.64
retrieving revision 1.65
diff -u -r1.64 -r1.65
--- build.c	20 Nov 2004 10:44:07 -0000	1.64
+++ build.c	20 Nov 2004 16:19:38 -0000	1.65
@@ -191,9 +191,12 @@
 
 	D1(printk(KERN_DEBUG "JFFS2: Removing ino #%u with nlink == zero.\n", ic->ino));
 	
-	for (raw = ic->nodes; raw != (void *)ic; raw = raw->next_in_ino) {
+	raw = ic->nodes;
+	while (raw != (void *)ic) {
+		struct jffs2_raw_node_ref *next = raw->next_in_ino;
 		D1(printk(KERN_DEBUG "obsoleting node at 0x%08x\n", ref_offset(raw)));
 		jffs2_mark_node_obsolete(c, raw);
+		raw = next;
 	}
 
 	if (ic->scan_dents) {


__________________________________________________________
Linux-MTD CVS commit list
http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs/

--=-PW4rZLxynm6LMIewXAPf--
