Received: from [62.99.145.147] (helo=mail.it-technology.at)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eE5Q-00040B-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 13:14:16 +0100
Received: from it-technology.at (localhost [127.0.0.1])
	by mail.it-technology.at (Postfix) with SMTP id D238E1F3CB
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 14:14:15 +0200 (CEST)
Message-ID: <46155.62.99.145.150.1029154455.squirrel@www.it-technology.at>
Date: Mon, 12 Aug 2002 14:14:15 +0200 (CEST)
Subject: mtdblock and preempt patch
From: "Peter Holik" <peter.holik@it-technology.at>
To: <linux-mtd@lists.infradead.org>
Reply-To: peter.holik@it-technology.at
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Everything works as expected without the preempt patch.

I'm using cfi_cmdset_0001, jedec_probe, physmap and mtdblock with
a 512kByte Intel Flash.

But with the patch after 3 to 5 times of copy a file to /dev/mtdblock0
linux userspace stops working.

Reading from /dev/mtdblock0 produces after 3 to 5 times a reboot.

any hints?

Peter
