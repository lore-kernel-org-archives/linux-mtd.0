Received: from [212.68.212.198] (helo=barnabe.hellea.be ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MSZY-0001vr-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2002 12:36:12 +0000
Date: Thu, 12 Dec 2002 14:05:46 +0100
From: Geoffroy Stevenne <geof@hellea.com>
To: linux-mtd@lists.infradead.org
Cc: jch@hellea.be
Subject: bbram access problems
Message-Id: <20021212140546.3607a3e0.geof@hellea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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


Hi,

We're trying to use BBRAM on a VersaLogic VSBC-6 m-b.  We use the slram
driver and the 2.4.18 kernel.  The problem is that we can't acces the
entire memory of the BBRAM, just the first 64k page.

Other problem: we added to our lilo.conf:

append="slram=BBRAM,0xE0000,+0x10000"

We can write to the BBRAM but we noticed data corruption (not write
operation was done) in this address range.  Is there a way to lock this
memory area?  Is this the right thing to do?

What we need is to mount a filesystem on the entire BBRAM, not just the
first 64k. I can (and wish to) provide more information, test changes,
report bugs, etc. I can read and understand C code but I don't feel
competent in writing drivers on my own.

Thanks for your help,

--
Geoffroy Stévenne
Hellea SPRL
