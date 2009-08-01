Received: from emailmx02.infoseek.jp ([203.190.60.206]
	helo=emailmx.infoseek.jp)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MX4qR-00019d-D2
	for linux-mtd@lists.infradead.org; Sat, 01 Aug 2009 03:01:20 +0000
Date: Sat, 01 Aug 2009 11:54:34 +0900
From: <coffee_4@infoseek.jp>
To: linux-mtd@lists.infradead.org
Subject: =?iso-2022-jp?B?cGFydGlhbCB3cml0ZSBvZiBOT1I=?=
Message-ID: <20090801115434.coffee_4@infoseek.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-type: text/plain; charset="ISO-2022-JP"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Are there any command for partial write of NOR flash memories?
How can i write one part of NOR flash memories?

For NAND flash memories, i can use nandwrite like this.
$ nandwrite /dev/mtd1 data --start=0x2000


Best regards,
Nobu
