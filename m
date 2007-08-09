Received: from birdland.snu.ac.kr ([147.46.15.76])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJ1bZ-0006fM-Fn
	for linux-mtd@lists.infradead.org; Thu, 09 Aug 2007 02:34:47 -0400
Date: Thu, 9 Aug 2007 15:18:10 +0900
From: Sookwan Lee <sklee@ssrnet.snu.ac.kr>
To: linux-mtd@lists.infradead.org
Subject: No page cache write buffering in jffs2
Message-ID: <20070809061810.GA27699@birdland.snu.ac.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I want to know why there is no .writepage method in
jffs2_file_address_operations.

I think that generally file write is delayed in page cache until
periodic dirty page cache flushing by pdflush or forced sync like sys_sync.

For example, in ext2, generic_commit_write (ie. ext2_aops->commit_write)
just marks the page cache dirty and does not issue disk traffic,
and later, pdflush actually flushes dirty pages using ext2_writepages
(ie. ext2_aops->writepage).

jffs2_file_address_operations defines prepare_write and commit_write but
no writepage method, and seems to me that actual flash write occures in
jffs2_commit_write.

It seems that when files are updated frequently, it cannot benefit from
page cache buffering.

Is it intentional? Is it because jffs2 is widely used in mobile devices,
so to survice unexpected power loss, all file writes should reach
flash media immediately?

Thanks in advance.

-- 
Sookwan Lee
