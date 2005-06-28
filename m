Received: from fmr13.intel.com ([192.55.52.67] helo=fmsfmr001.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dn9Q8-00068r-Hs
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 02:18:09 -0400
Message-ID: <42C0EBC6.6090106@intel.com>
Date: Tue, 28 Jun 2005 14:18:46 +0800
From: zhao <forrest.zhao@intel.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Question about JFFS2 testing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, David

We are going to do some test for JFF2 in kernel 2.4.31.
But the problem we met is that we can't find an ARM board
to run the latest 2.4 kernel. We can only find a board, which
can run 2.4.18. Do you have any experience to run 2.4.31 on
an ARM board? Or how did you test the JFFS2?

We noticed the RAM and block device emulation ways, but
it's better if we could do the test based on the real flash memory.

Thanks,
Forrest
