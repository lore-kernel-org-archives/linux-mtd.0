Received: from hal-5.inet.it ([213.92.5.24])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iuzE-0004wX-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 10:19:00 +0000
Received: (from root@localhost)
	by hal-5.inet.it (8.11.1/8.11.1) id g27AUOL296194
	for <linux-mtd@lists.infradead.org>; Thu, 7 Mar 2002 11:30:24 +0100
Message-ID: <3C87599B.410CDBA0@selta.it>
Date: Thu, 07 Mar 2002 11:14:19 -0100
From: stefania magistrali <s.magistrali@selta.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DiskOnChip booting for PPC
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

Hi!
I have a question about booting. Now I am using a FADS with powerpc 860T
and I use PPCBOOT to boot and everything is ok, but our proprietary
board will use DiskOnChip Millenium Plus and we will use the boot block
inside it.
Has anyone tried to boot fro DiskOnChip Millenium Plus in PPC
architecture? Can I find the IPL code somewhere? And, (sorry but I am
very confused, I am not familiar with DOC), can I use LILO to boot linux
or isn't possible for powerpc architecture?
I know the MTD driver doesn't support DiskOnChip Millenium Plus now, but
is it possible it will support it in a short time?
Any suggestion/experience is welcome.
Thanks,
Stefania
