Received: from gateway.digitalview.com.hk
	([152.101.51.1] helo=janus.hk.panelx.com ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zYhN-0002tF-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 09:29:37 +0100
Message-ID: <009701c27036$ee169f00$9000010a@paulwong>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <linux-mtd@lists.infradead.org>
Subject: help! compile error
Date: Thu, 10 Oct 2002 16:27:54 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
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

hi all,
 I use linux-2.4.17 kernel with the newest mtd code (get from cvs and run
patchin.sh). Also I follow the NAND doc. to enable the MTD and NAND flash.
When I compile it , there are error to show:->

********************************

drivers/mtd/mtdlink.o(.text.lock+0x4d8):undefined reference to 'local
symbols in discarded section .text.exit'
mak[1]: *** [kallsyms] Error 1
make: *** [vmlinux] Error 2

*********************************

what wrong???

Paul
