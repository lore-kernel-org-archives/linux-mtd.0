Received: from h013.c007.snv.cp.net ([209.228.33.241] helo=c007.snv.cp.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17WnFb-00054X-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Jul 2002 01:10:03 +0100
Message-ID: <003a01c231dd$03df6260$37032240@Presario>
Reply-To: "Allen Curtis" <acurtis@directvinternet.com>
From: "Allen Curtis" <acurtis@directvinternet.com>
To: <linux-mtd@lists.infradead.org>
Subject: 2.4.17 64-bit support, read-only
Date: Mon, 22 Jul 2002 17:03:32 -0700
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

The 2.4.17 distribution that I am using did not properly support 64-bit
flash. In order to fix this, I got the latest version of the MTD code from
CVS and integrated that into our source tree. I modified maps/physmap.c to
provide the partition information required for our configuration but no
matter what I do the partitions appear to be Read-only. I can not erase or
mount the partitions with Write enabled.

Any ideas?
