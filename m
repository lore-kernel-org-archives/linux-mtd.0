Received: from web13808.mail.yahoo.com ([216.136.175.18])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WJ2L-00011J-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 15:49:50 +0100
Message-ID: <20010813145542.24392.qmail@web13808.mail.yahoo.com>
Date: Mon, 13 Aug 2001 07:55:42 -0700 (PDT)
From: pirabusisamani visakan <kpsmanivisakan@yahoo.com>
Subject: Detection of mtd devices
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

Hello everybody,

I am trying to make mtd partitions in my ATMEL
AT49BV1604 flash, I have selected physical memory
mapping and edited that to make 3 partitions,
when I burn the flash and run the system, It gave some
errors as follows.

mtdblock_open
ok
...
...
...
maprom_write called
maprom_write called
...
...
maprom_write called
[4] jffs_gcd:branch through zero
Intenal error: Oops: 0
CPU:0
pc:[<ooooooo4>]
lr:[<02020424>]
...
...
and finally goes to the command promt.

When I cat the proc entry for mtd
mtd0:	00100000  00020000 "Physically mapped flash"
mtd1: 	00001000  00020000 "loader"
mtd2:	000b7000  00020000 "kernel"
mtd3:	00048000  00020000 "files"

Is this indicates the mtd is properly mounted?
I could not see any read operations and I can't do
write operation.

Does anybody find the fault, pls give me a clue to me?

Thanks in advance 	

__________________________________________________
Do You Yahoo!?
Send instant messages & get email alerts with Yahoo! Messenger.
http://im.yahoo.com/
