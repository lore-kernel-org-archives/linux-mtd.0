Received: from out012pub.verizon.net ([206.46.170.137] helo=out012.verizon.net)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CdwDt-0003oR-QC
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2004 14:51:11 -0500
Received: from [128.33.252.73] ([66.153.102.122]) by out012.verizon.net
	(InterMail vM.5.01.06.06 201-253-122-130-106-20030910) with ESMTP
	id <20041213195102.NOOI10436.out012.verizon.net@[128.33.252.73]>
	for <linux-mtd@lists.infradead.org>; Mon, 13 Dec 2004 13:51:02 -0600
Message-ID: <41BDF2A6.6000102@fortins.org>
Date: Mon, 13 Dec 2004 14:51:02 -0500
From: Chris Fortin <chris@fortins.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Request for low-risk DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi everyone,
  I've been trying to beat a M-Systems, DOC2000, 384MB chip into
working with the mtd drivers, and using grub to boot.  For some
reason that I havn't been able to localize, the installation
of grub fails ( failing on one of the erase lines ).  Since
this is under version 2.4.27 of the linux kernel, I thought
there might be some incompatabilities with pre-2.6 kernels.
I suspect something in the ../util/doc_loadbios call doesn't
like the inftl chip.

So ... what I'm asking is, does anyone have a M-Systems DOC,
over 256MB in size, running a 2.4.something kernel, using
grub to boot?  If so, would you please let me know the part
number, so I can go get some?

Thanks alot!
  Chris

-- 
Christopher Fortin, Ph.D. EE, Senior_Scientist@BBN <chris@fortins.org>
The magic BOFH-phrase you need to summon at this point is: "_Your_
lack of planning is not about to become _my_ emergency."  -- Tanuki
