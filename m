Received: from web14906.mail.yahoo.com ([216.136.225.58])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wMp5-0000iW-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2002 14:12:23 +0100
Message-ID: <20021001131221.26804.qmail@web14906.mail.yahoo.com>
Date: Tue, 1 Oct 2002 06:12:21 -0700 (PDT)
From: Sriram Neelakandan Iyer <sriramneelakandan@yahoo.com>
Reply-To: sriramneelakandan@yahoo.com
Subject: MTD copy on JFFS2
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

hi list,
i have 2 jffs2 partitions(over mtd) used for storing
config files.
I need to copy all the files from one partition to
another, and the destination mtd partition is larger
than the source mtd partition.(i cannot mount the
second partition as jffs2 before the data is copied)

As of now i run mkfs.jffs2 over the source jffs2
directory and copy to ramfs and then erase the
destination partition and i do a mtd-write over the
destination partition.

But mkfs.jffs2 needs libz and both of them occupy
about 87K of space.

So i plan to do a plain mtd-copy ,i.e 
1. first unmount source jffs2,
2. read over the source mtd-char-device and 
3. dump it back to the second mtd-partition. 

Will jffs2 be able to mount the second partition
without trouble?  (or) must i do a mkfs.jffs2 always
to have a jffs2 mountable partition.

regards
sriram.


__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com
