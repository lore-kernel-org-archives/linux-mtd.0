Received: from host11-107.pool62110.interbusiness.it ([62.110.107.11]
	helo=mailsrv.solari)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AUM9M-0002fl-17
	for <linux-mtd@lists.infradead.org>; Thu, 11 Dec 2003 08:26:20 +0000
Message-ID: <005b01c3bfc2$d6918ed0$0301a8c0@mcimenti>
From: "Michele Cimenti" <mcimenti@solari.it>
To: "mtd-mailing-list" <linux-mtd@lists.infradead.org>
Date: Thu, 11 Dec 2003 09:43:24 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: MTD tools
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'am working on a project that make intensive use of Flash device. For that
reason a tool that can report info about Flash residual life will be
usefull. I'm thinking about a inode record (JFFS2) that is written every
time the sector is erased. This record contains the number of times the
sector has been erased.
Did someone develop  such a tool/patch or similar?

Michele
