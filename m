Received: from web25502.mail.ukl.yahoo.com ([217.12.10.148])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ILSHG-000719-Ma
	for linux-mtd@lists.infradead.org; Wed, 15 Aug 2007 19:27:52 -0400
Date: Thu, 16 Aug 2007 01:21:09 +0200 (CEST)
From: <mailthrottle-mtd@yahoo.it>
Subject: Trying to use DOC2000 on Debian
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <485972.3949.qm@web25502.mail.ukl.yahoo.com>
Reply-To: mailthrottle-mtd@yahoo.it
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello to the list.

I'm sorry to ask here but I could not find the answers
by myself.
I have a "native" dos formatted DOC2000, my first goal
is access it from Linux.
I guessed I have to create the necessary device node
first so I created some of them (it seems MAKEDEV
script in debian only provides mtdX devices, I added
these by hand):

mknod /dev/ftla b 44 0
mknod /dev/ftla1 b 44 1
mknod /dev/ftla2 b 44 2
mknod /dev/ftla3 b 44 3
mknod /dev/ftla4 b 44 4
mknod /dev/nftla b 93 0
mknod /dev/nftla1 b 93 1
mknod /dev/nftla2 b 93 2
mknod /dev/nftla3 b 93 3
mknod /dev/nftla4 b 93 4

Then I tried "modprobe diskonchip" and I saw some
messages from which I guess the system recognized a
DiskOnChip device.
I could be happy now but when I try to mount
/dev/nftla1 or fdisk /dev/nftla the system delay a
while then prints some messages saying it is
formatting some blocks (I'm sorry I can't reproduce
the exact messages now).
After this I cannot access the device anymore and if I
reboot with a dos floppy disk I can see dos cannot
find any partition on DOC2000, I have to create it and
format it again.
Can you help me to understand what is happening?
It is possible to read the DOC "native" format using
mtd drivers?
I learn there are different format nftl/inftl but
can't say which one is really used by the device,
shoul I try to access it as inftl?

I'm using debian stable (Etch) kernel 2.6.18.

Thanks.

Alessandro.




      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: http://it.docs.yahoo.com/nowyoucan.html
