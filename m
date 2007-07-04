Received: from pc125.solomon-systech.com ([202.76.106.125]
	helo=virus-gateway.solomon-systech.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I605a-0001uR-Tm
	for linux-mtd@lists.infradead.org; Wed, 04 Jul 2007 04:20:02 -0400
Received: from SSLEXCHANGE.solomonsystech.com
	(cluster_server1.solomonsystech.com) by
	sweeper_server.solomonsystech.com
	(Content Technologies SMTPRS 4.3.6) with ESMTP id
	<T809e7071b4ac10000383c@sweeper_server.solomonsystech.com> for
	<linux-mtd@lists.infradead.org>; Wed, 4 Jul 2007 16:19:43 +0800
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: NAND FLASH 4KB page support
Date: Wed, 4 Jul 2007 16:19:44 +0800
Message-ID: <6334E09627481B4AA5C8DE1E69E19D3B06BF98A8@SSLEXCHANGE.solomonsystech.com>
From: <sasin@solomon-systech.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry to resend (reply bounces) - Forgot to add, I'm using linux
2.6.20.1 for ARM926.

Trying to boot off CRAMFS on a 4KB page NAND FLASH (new device), I ran
into the "wrong magic" issue.  MTD's nand_read
(drivers/mtd/nand/nand_base.c) is returning the right data.
Cramfs_fill_supper call cramfs_read (fs/cramfs/inode.c) which reads 4
pages and the 1st page of data gets corrupted.  If I set
BLKS_PER_BUF_SHIFT in this file to 0 or 1 instead of 2, so that only 1
or 2 pages are read, the data is uncorrupted and the magic value matches
but it crashes later (comments say that this values should be 2 or
higher, so this is not surprising).  So is 4KB page size supported by
the rest of Linux outside MTD?  Is there some size limit in some inode
related structure?
