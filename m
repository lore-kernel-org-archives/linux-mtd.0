Received: from h013.c007.snv.cp.net ([209.228.33.241] helo=c007.snv.cp.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17WnFd-00054Y-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Jul 2002 01:10:05 +0100
Message-ID: <003b01c231dd$053fdcc0$37032240@Presario>
Reply-To: "Allen Curtis" <acurtis@directvinternet.com>
From: "Allen Curtis" <acurtis@directvinternet.com>
To: <linux-mtd@lists.infradead.org>
Subject: 2.4.17 JFFS2 support, back porting zlib
Date: Mon, 22 Jul 2002 17:07:00 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

I wanted to integrate the latest JFFS2/JFFS file system into our 2.4.17
source tree. It appears that the interface to "zlib" has changed
significantly. Does anyone have suggestions for back porting JFFS2 to an
older kernel source tree?

THX
