Received: from auriga.auriga.ru ([80.240.102.100])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7cM4-0008Ed-GP
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 16:05:28 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 9 Oct 2003 19:04:27 +0400
Message-ID: <5B439D84E6653F4AA2E14A5D8898A7E163D806@auriga.auriga.ru>
From: "Eugeny Mints" <eugeny.mints@auriga.ru>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
cc: Dmitry Pervushin <dmitry.pervushin@auriga.ru>
Subject: NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Could anybody help me to solve such a problem with JFFS2 and NAND flash:
- the NAND flash Toshiba TC58256AFTI
- kernel 2.4.22 with latest MTD and JFFS2=20
- handy-written miniport for the paticular flash chip

The device works OK almost in any case, but when I try to execute  while
true; do dd if=3D/dev/zero of=3D/dev/mnt/foo count=3D1000; done after =
10-15
minutes the system hangs; I cannot login from console or via telnet, but
it is still ping'able. I tried to use YAFFS, perform dd to device itself
instead of file on the filesystem on top of flash - no hangs were
observed.

Could anybody help me, please?=20
--
cheers, dmitry pervushin
