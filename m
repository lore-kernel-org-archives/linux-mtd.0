Received: from pd9eb906a.dip.t-dialin.net ([217.235.144.106] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dcP1-0002N4-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 19:27:44 +0000
Content-Type: text/plain;
  charset="iso-8859-15"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: JFFS2 list_dirty corruption
Date: Wed, 20 Feb 2002 20:41:48 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
MIME-Version: 1.0
Message-Id: <02022020414807.18560@thomas>
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

While hacking on JFFS2 for NAND I found a possibility, where scan_medium 
corrupts list_dirty.

jffs2_scan_medium calls
jffs2_scan_eraseblock calls
jffs2_scan_dirent_node calls	
jffs2_add_fd_to_list
	There is a duplicate entry detected, so it calls
jffs2_mark_node_obsolete
	There is it possible that the jeb is added to list_dirty,
	because it's a duplicate entry
	with list_add_tail
	We come back to
jffs2_scan_eraseblock 
	There is another condition, that marks the block dirty
	We come back to
jffs2_scan_medium
	There we add the block to list_dirty too with add_list
	Then we have a circular list entry.
Result:	chaos	

That's not a problem of the NAND modifications. I verified, that this can 
happen in the actual CVS-version too.
-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
