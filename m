Received: from auriga.auriga.ru ([80.240.102.100])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19mZ8V-0006vN-OT
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2003 14:24:27 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 12 Aug 2003 17:24:14 +0400
Message-ID: <5B439D84E6653F4AA2E14A5D8898A7E1656486@auriga.auriga.ru>
From: "Eugeny Mints" <eugeny.mints@auriga.ru>
To: <tglx@linutronix.de>
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
cc: samoutin@hotbox.ru
cc: linux-mtd@lists.infradead.org
cc: tharbaugh@lnxi.com
Subject: Toshiba TC58256AFTI question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, all!

I've read mail list archive, mainly letters with subject " Fw: corrupt
my NAND flash device" because I'm interested in NAND Toshiba TC58256ATF
flash support.

As I understood the main issues are(or were:):

  1. Write verify sometimes fail
  2. Write operation during erase sometimes cause data corruption =20

I've just started to work with mtd and this flash and have not
investigated the above issues on my hardware yet,
but it seems that I also experienced problems if the device is filled
once and an attempt to re-use previously used sectors is made.

Could anybody please summarize issues connected with this flash support?

Thanks in advance,
					Eugeny
