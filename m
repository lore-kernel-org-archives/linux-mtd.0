Received: from [195.134.130.80] (helo=pip5.mpl.ch)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nGV5-0003Hd-FQ
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 12:42:39 +0100
Received: from elsoft.ch (IDENT:1000@pcdm.elsoft.loc [192.168.11.10])
	h7EBgN2t008752
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 13:42:23 +0200
Message-ID: <3F3B75AA.6050701@elsoft.ch>
Date: Thu, 14 Aug 2003 13:42:34 +0200
From: =?ISO-8859-1?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
 <d.mueller@elsoft.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: JFFS2 internals question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

As i'm not a JFFS2 guru i hope someone familar with the JFFS2 internals
could answer this question:

Situation:

JFFS2 filesystem on a NAND flash device:


Is it true that the read calls emitted from the JFFS2 code to the MTD HW
driver do not cross NAND block boundries (nand_read_ecc() has its start
and end point of reading in the same NAND block)?

TIA

Dave
