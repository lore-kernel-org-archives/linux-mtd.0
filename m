Received: from web3203.mail.yahoo.com ([216.115.110.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15As3C-0005jh-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jun 2001 12:46:07 +0100
Message-ID: <20010615115134.12572.qmail@web3203.mail.yahoo.com>
Date: Fri, 15 Jun 2001 04:51:34 -0700 (PDT)
From: qwerty t <qwerty172@yahoo.com>
Subject: Input/Output Errors
To: mtd support group <linux-mtd@lists.infradead.org>
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

I am getting some very strange results I would like to
share.

I have a 16 M DoC 2000. I have formated it as an ext2
partition, and have copied 10M in various directories.

During boot MTD support says that it found unformated
sectors and formats them. This doesn't happen all the
time. Sometimes after one of these unformated sections
is formatted the result is I/O errors when I try to
read a file or directory.

Has anyone seen this before? Has anyone used ext2 as
filesystem.

Bill


__________________________________________________
Do You Yahoo!?
Spot the hottest trends in music, movies, and more.
http://buzz.yahoo.com/
