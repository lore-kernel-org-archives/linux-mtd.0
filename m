Received: from web10801.mail.yahoo.com ([216.136.130.243])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16df0R-0002ZN-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 22:14:31 +0000
Message-ID: <20020220222547.96577.qmail@web10801.mail.yahoo.com>
Date: Wed, 20 Feb 2002 14:25:47 -0800 (PST)
From: Scott Kapu <kapus1@yahoo.com>
Subject: fdisk problem with DOC2000
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

When trying to fdisk /dev/nftla I get...

-------------------------------------------------
Command (m for help):
Disk /dev/nftla: 1 heads, 577728 sectors, 1 cylinders
Units = cylinders of 577728 * 512 bytes

     Device Boot    Start       End    Blocks   Id 
System
/dev/nftla1             1         1    288863+  83 
Linux
Partition 1 has different physical/logical endings:
     phys=(768, 0, 0) logical=(0, 0, 577728)
Partition 1 does not end on cylinder boundary:
     phys=(768, 0, 0) should be (768, 0, 577728)
------------------------------------------------
Any help appreciated!

-Scott K.


__________________________________________________
Do You Yahoo!?
Yahoo! Sports - Coverage of the 2002 Olympic Games
http://sports.yahoo.com
