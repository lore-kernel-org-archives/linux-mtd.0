Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KMKk-0004wq-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 17:59:58 +0100
Received: from fw-edm-dmz.yottayotta.com ([192.168.1.2] helo=edm-app01.yottayotta.com)
	by isengard.yottayotta.com with esmtp (Exim 3.33 #1)
	id 17KMFx-0006RU-00
	for linux-mtd@lists.infradead.org; Tue, 18 Jun 2002 10:55:01 -0600
Message-ID: <3D0F66D0.5090704@yottayotta.com>
Date: Tue, 18 Jun 2002 10:58:56 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: can't build jffs2 filesystem 2.4.18
Content-Type: text/plain; charset=us-ascii; format=flowed
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

After many attempts & many weeks, I am still having major problems 
upgrading from 2.4.5-rmk7 to 2.4.18-rmk3... or from mtd20000407 release 
to an mtd release from cvs 2 months ago.

Initially I erased everything from flash, and copied over the new zImage 
& everything else... but then some directories are not available since:
"Inode #2 was a directory with children - removing those too... " or 
other Inode #'s...

The way to copy over the files is to first boot via nfs (*not* from 
flash, since some files are not accessible) with the 2.4.18-rmk3, and 
then copy over all the files.

So I tried mkfs.jffs2 also... but I get a similar error. I build the 
image, and copied it onto /dev/mtd/1, yet when trying to mount 
/dev/mtd/1 errors are encountered:
Inode #2 was a directory with children - removing those too...
Inode #4 ....
.... etc. etc.

And most of the directories are unavailable.

Any help would be greatly appreciated.

Murtada Shah
