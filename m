Received: from disk.mail1.aus.datafoundry.com ([209.99.125.153])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HtU7z-0000nU-Q0
	for linux-mtd@lists.infradead.org; Wed, 30 May 2007 15:46:41 -0400
Received: from ram.mail1.aus.datafoundry.com (ram.mail1.aus.datafoundry.com
	[209.99.125.137])
	by backuprelay.datafoundry.com (Postfix) with ESMTP id 057439C5AB
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 May 2007 14:26:25 -0500 (CDT)
Message-ID: <1180553167.465dcfcfa4558@webmail.texas.net>
Date: Wed, 30 May 2007 14:26:07 -0500
From: catboat@texas.net
To: linux-mtd@lists.infradead.org
Subject: hard hang in jffs2 detected
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Subject: deadlock in jffs2
Date: May 30, 2007



Hi y'all,


I have a kernel crash dump that shows a deadlock in jffs2. It's the case
where locks are obtained in backward order for two different processes.
Here is the time line:

1. Process B is reading a file. Due to a missing or dirty VFS cache page,
generic_file_read obtains a page lock. Switch.

2. Process A is the jffs2 GC thread. It has come across a valid dnode, so
it calls iget for the inode, then obtains (downs) the jffs2_inode_info.sem
(f->sem). Switch.

3. Process B now calls from generic VFS code into jffs2 code at
jffs2_readpage which blocks on the down of f->sem owned by Process A. 
Switch.

4. Process A in jffs2_garbage_collect_dnode() makes a call to
read_cache_page() and blocks because Process B has it. Deadlock.

Thus Process B obtaining order is page lock, then f->sem. Process A 
obtaining order is f->sem, then page lock.

This deadlock has been discussed before, but I don't see a 
fix in the upstream.

Regarding a fix, I'm leaning towards the removal of the 
read_cache_page() interaction in jffs2_garbage_collect_dnode() and 
replacing with a more direct read of the flash? 

I would greatly appreciate a fix and/or suggestions for a fix. Comments
please. Thanks.


Monte Copeland
Austin TX
catboat@texas.net
copelanm@us.ibm.com
