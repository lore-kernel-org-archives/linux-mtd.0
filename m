Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8aZB-0004n8-DD
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2005 03:59:50 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1D8aYw-0004di-7Z
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2005 09:59:34 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Mar 2005 09:59:34 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Mar 2005 09:59:34 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Tue, 08 Mar 2005 09:59:36 +0100
Message-ID: <d0jphc$re$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Many small files instead of one large files - writing, wearing,
	mount-time?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I'm about to make a choice of design. I have many many (i.e. O(3) - 
[0-9]*1000) "resources" in an application that need their states flushed 
to NAND-JFFS2 whenever they change - which happens with very different 
frequencies for different resources.

Hence, me initial strategy was to have a file in NAND for each resource. 
However, I noticed that mount-time increased "severely" when many files 
were put on the device, and doing an "ls" first time on the 
device/directory took lots of time as well.

Unfortunately low mount-time is one of the factors giving the user a 
good experience with the system, so I started considering another 
strategy - namely one large file to hold all these states.

However, I'm a bit concerned how fopen( ..., "rw" ) is handled 
underneith when I flush/sync the filedescriptor if I only mess with a 
small part of the file. Is the entire file flushed to NAND once more, or 
does Linux+JFFS2 handle this, and only write the parts (inodes) that are 
affected...

BR,
  Martin
