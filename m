Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kVDE-0005VM-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2002 19:12:00 +0000
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id UAA26791
	for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2002 20:22:28 +0100
Date: Mon, 11 Mar 2002 20:23:23 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: [patch] dilnetpc.c broken?
Message-ID: <20020311202323.A11507@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Moin!

The DIL/Net PC mapping driver appears to be broken. At least, it
didn't compile properly on my machine. After a quick look at the code,
the following appears to be the correct fix for the problem.

That said, I have no idea, what the DIL/Net PC is or who is using that
driver. Can anyone comment on it? Is anyone using it?

Jörn

-- 
Learn the rules so you know how to break them properly.
-- reputely from the Dalai Lama, unverified

--- dilnetpc.c.old	Mon Mar 11 20:17:03 2002
+++ dilnetpc.c	Mon Mar 11 20:18:13 2002
@@ -319,7 +319,7 @@
 	},
 	{ 
 		name:		"ADNP system BIOS", 
-		offset:		MTDPART_OFS_NXTBLK,
+		offset:		MTDPART_OFS_APPEND,
 		size:		0x10000,
 #ifdef DNPC_BIOS_BLOCKS_WRITEPROTECTED
 		mask_flags:	MTD_WRITEABLE,
@@ -327,12 +327,12 @@
 	},
 	{
 		name:		"ADNP file system",
-		offset:		MTDPART_OFS_NXTBLK,
+		offset:		MTDPART_OFS_APPEND,
 		size:		0x2f0000,
 	},
 	{
 		name:		"ADNP system BIOS entry", 
-		offset:		MTDPART_OFS_NXTBLK,
+		offset:		MTDPART_OFS_APPEND,
 		size:		0x10000,
 #ifdef DNPC_BIOS_BLOCKS_WRITEPROTECTED
 		mask_flags:	MTD_WRITEABLE,
