Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNJLy-00011r-Mk
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2004 19:06:48 -0400
Received: from ben by aeryn.fluff.org.uk with local (Exim 3.36 #1 (Debian))
	id 1CNJLs-0008GD-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Oct 2004 00:06:40 +0100
Date: Fri, 29 Oct 2004 00:06:40 +0100
From: Ben Dooks <ben@fluff.org.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20041028230640.GB13105@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org>
Subject: Read/nBusy via interrupt
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does anyone here have any comments over the pros/cons of using
an interrupt which goes off to wait for a NAND flash ready/not-busy
signal?

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
