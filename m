Received: from 12-224-59-30.client.attbi.com ([12.224.59.30] helo=localhost.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17z9OJ-0000YC-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2002 06:28:15 +0100
Received: (from root@localhost)
	by localhost.localdomain (8.11.6/8.11.6) id g995Rfc04335
	for linux-mtd@lists.infradead.org; Tue, 8 Oct 2002 22:27:41 -0700
Date: Tue, 8 Oct 2002 22:27:41 -0700
From: John Telford <John@JohnTelford.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Booting IDE JFFS2
Message-ID: <20021009052741.GA4323@lnx2.labnet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello

I'm designing a disk-less, Linux-based router using regular, generic,
off the shelf motherboards.  It will be running the network-centric
bls linux distribution (http://bls.sf.net).

Replacing a hard drive with a JFFS2 file system, off the shelf
CompactFlash technology, and an inexpensive IDE adapter is *very*
attractive.

The problem is how to boot the sucker.

My understanding is lilo and grub don't do JFFS2 yet.

What booting alternatives do I have?

...John

-- 
John Telford - Owner
JohnTelford.com LLC
503-292-6865 - fax:503-292-3094
john@johntelford.com - www.johntelford.com
