Received: from boisdslgw5poolb76.bois.uswest.net ([65.101.73.76] helo=ridgerun-lx.ridgerun.cxm)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15JbDW-00052Y-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2001 14:36:50 +0100
Message-ID: <3B49B4B2.87F7E8A5@ridgerun.com>
Date: Mon, 09 Jul 2001 07:42:10 -0600
From: Steve Kranz <skranz@ridgerun.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, skranz@ridgerun.com
Subject: MTD/mtdblock.c uclinux 2.0.38?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

1.
Anybody know if instruction exist for installing MTD and nftl
into an uclinux 2.0.38 tree?

2.
I'm interested in getting the SmartMedia slot of this arm7 board
working for both read and write -- and I'd like the SmartMedia
card to be readable/writable by a Windows machine too. Am I
correct that this interoperability constraint will prevent me from
using JFFS? I'm assuming that a vfat fs with MTD/nftl will do the
trick for me. Yes, no?

3.
I've been glancing at MTD code and didn't think I saw any logic
to deal with the bad (unusable) blocks of a NAND flash device.
Did I just miss it?

Thanks,
Steve Kranz
skranz@ridgerun.com
