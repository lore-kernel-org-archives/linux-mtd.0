Received: from web10806.mail.yahoo.com ([216.136.130.248])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qcej-0003LY-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2002 16:21:41 +0000
Message-ID: <20020328162139.73829.qmail@web10806.mail.yahoo.com>
Date: Thu, 28 Mar 2002 08:21:39 -0800 (PST)
From: Scott Kapu <kapus1@yahoo.com>
Subject: VFS never mounts root reaadonly
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

My system on startup finds LILO (on NFTLA) and will
boot from a harddisk. When I select DOC from lilo it
loads the
linux kernel but then hangs just before the message
VFS: Mounted root (ext2 filesystem) readonly
 
ie: this is the message that appears when booting
the kernel on hda1. I'm using the same kernel on both,
2.4.16, and lilo22.2

The DOC works great after the system boots from hda1
and mounts doc.

Am I missing something obvious?? 
Please help
Thanks in advance
 
-scott

__________________________________________________
Do You Yahoo!?
Yahoo! Movies - coverage of the 74th Academy Awards®
http://movies.yahoo.com/
