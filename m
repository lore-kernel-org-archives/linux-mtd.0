Received: from endruntechnologies.com ([130.94.228.14])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Asz3Y-00046U-Gw
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2004 06:50:08 +0000
Received: from unknown (HELO endruntechnologies.com) ([67.169.85.122])
	(envelope-sender <bmpenrod@endruntechnologies.com>)
	by 130.94.228.14 (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 17 Feb 2004 06:50:05 -0000
Message-ID: <4031B99C.2040908@endruntechnologies.com>
Date: Mon, 16 Feb 2004 22:50:04 -0800
From: Bruce Penrod <bmpenrod@endruntechnologies.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 messages at shutdown
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using the MTD/JFFS2 contained in kernel 2.4.20 on a board with a 
FLASH configuration that is essentially the AMD NETSC520 evaluation 
board, i.e. two AM29LV641 chips on a 32 bit bus.  The erase block size 
for the two chips together is 128KB.  I have two JFFS2 partitions, each 
having 1024KB, so I meet the 5 erase blocks minimum requirement. 
Everything seems to be working OK, and has been for quite some time. 
However, there does seem to be a discrepancy between what df reports on 
the jffs2 partitions and what the actual files sizes stored there are. 
Perhaps this has been fixed in a later version?

The other question I have is whether or not to worry about these
messages, which are displayed while INIT is running the shutdown script:

jffs2: No clean _or_ dirty blocks to GC from! Where are they all?
jffs2: Couldn't find erase block to garbage collect!

Thanks,

Bruce
