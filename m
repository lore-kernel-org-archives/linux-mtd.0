Received: from f147.law11.hotmail.com ([64.4.17.147] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e0is-0007bM-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 22:30:22 +0000
From: "Brian Peterson" <purdue1996@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: DiskOnChip 2000 read only file system
Date: Wed, 29 Jan 2003 17:00:01 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F147ztYnkp66U4PEFn7000023b4@hotmail.com>
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

I am running a read only file system with a 64M Disk On Chip 2000 and want 
to know if anyone else has seen the problem I am having.

My system is a PC104 with a 64M DiskOnChip running linux kernel version 
2.4.20.
I have two partitions mounted: root is Read only and the other is 
Read/Write.

During some testing of power loss scenarios, I lose the ability to use the 
device. The kernel boots and after it cleans up from the unclean unmount, I 
receive kernel messages indicating
"Argh! No free blocks found!..."

What level of confidence is there that the read only partition would be 
protected from this problem. In other words, can the data located in the 
Read only partition be trusted?

Any feedback would be appreciated.

Brian Peterson

_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail
