Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HE3Fk-0001yb-Q6
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 07:47:27 -0500
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l15Chtha031376
	for <linux-mtd@lists.infradead.org>; Mon, 5 Feb 2007 14:44:21 +0200
Message-ID: <45C72721.90302@nokia.com>
Date: Mon, 05 Feb 2007 14:46:25 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Do not understand use of oobfree
References: <872380.68552.qm@web58702.mail.re1.yahoo.com>
In-Reply-To: <872380.68552.qm@web58702.mail.re1.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Philip Rakity wrote:
> b) the oobfree area is specified as a {offset, length) pair.  When this
> gets to say the jffs2 file system what does it see.  For example
> 	.oobfree = { {8, 8} }

8 free bytes at offset 8

> 
> it would see 8 bytes starting at offset 8 OR 8 bytes starting at offset
> 0 and the mtd driver would do the mapping.
> 
> more complex example
> 	.oobfree = { {3, 2}, {6, 2} }
> 
> would jffs2 see 4 bytes at offset 0. or 2 sets of data at offset 3 and
> offset 6.

2 free bytes at offset 3
2 free bytes at offset 6

Note that the total free bytes for a page is stored in oobavail.
