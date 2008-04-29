Received: from web31506.mail.mud.yahoo.com ([68.142.198.135])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jqghs-0006xg-8M
	for linux-mtd@lists.infradead.org; Tue, 29 Apr 2008 03:40:40 +0000
Date: Mon, 28 Apr 2008 20:40:38 -0700 (PDT)
From: Gayan Prabodha Hettiarachchi <gprabodha@yahoo.com>
Subject: scan.c
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID: <291538.17891.qm@web31506.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1.=0AI'm poting mtd driver on 2.6.14 to Spansion MirrorBit S29WS256N 32MB N=
OR flash device and accoding to my map file I make four static partitions i=
n following sizes,=0Amtdblock0 256KB=0Amtdblock1 1.75MB=0Amtdblock2 30MB=0A=
mtdblock3 2MB=0A=0ABut I found in the older version of my map file it alloc=
ates partitions as follows,=0Amtdblock0 1MB=0Amtdblock1 2MB=0Amtdblock2 24M=
B=0Amtdblock3 2MB=0A=0AThere is unpartitioned space. Is there any usage of =
that space?=0A=0A2.=0AIn kernel configuration I remove ftl support and it w=
orks fine. But if I remove nftl occurs a kernel panic even though I didn't =
use NAND flashes. Is that possible? What would be the reason for that?=0A=
=0A=0AThank you.=0ARegards,=0AGayan.=0A=0A=0A=0ASend instant messages to yo=
ur online friends http://uk.messenger.yahoo.com 
