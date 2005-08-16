Received: from xena.bway.net ([216.220.96.26] helo=mail.bway.net)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E58ac-0006Tr-Ap
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 17:03:24 -0400
Message-ID: <43025499.3030803@bway.net>
Date: Tue, 16 Aug 2005 21:03:21 +0000
From: "Ryan B. Lynch" <rlynch@bway.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: Erase block size on CF cards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Couple of questions about erase block size and compact flash cards:

- Does the erase block size matter when using JFFS2 on a compact flash
card, via the "blkmtd" or "block2mtd" drivers?

- If it does matter, how can you reliably determine the underlying erase
block size on a compact flash card?

So far, I've been assuming an erase block size of 64KiB, but I'd be
interested in learning if there's a more optimal configuration.

-Ryan
