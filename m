Received: from sun06.mazet.de ([193.29.17.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c79e-0005J9-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 16:21:23 +0100
Received: from se_server.mazet.de ([193.99.171.10])
	by sun06.MAZeT.de (8.9.3/8.9.3) with SMTP id RAA03606
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 17:19:39 +0200 (MET DST)
Message-Id: <3B8D0A69.69038782@mazet.de>
Date: Wed, 29 Aug 2001 17:29:45 +0200
From: Holger Friedrich <friedrich@MAZeT.de>
Mime-Version: 1.0
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: DOC2000 write speed
Content-Type: text/plain; charset=us-ascii
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

Hi all,
We need to figure out how much time it takes to write a file of a
specified size to the DOC. So I mounted it sync and did a 'time
scriptfile', where scriptfile is a shell script, which copies the file a
hundred times from ramdisk to DOC. When I wrote to a floppy disk the
same way I found that despite mounting it sync the floppy LED would not
come on while the script was running, although it took longer than
writing to DOC. It would only come on when doing sync or unmount. So I
guess I either can't trust the sync option or the floppy LED. In the
first case my results are bogus at least for the floppy and probably for
the DOC, too.
Any ideas how to force an immediate write?
Thanx in advance Holger
