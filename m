Received: from pogehseh134.us.infonet.com ([207.209.118.134]
	helo=msu-ex01.corp.m-sys.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jjuJ-0008TZ-Te
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 19:18:08 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 4 Aug 2003 20:17:46 +0200
Message-ID: <97303ED3C472254E8888E5F74A783471045BD2@msu-ex01.corp.m-sys.com>
From: "Zachi Friedman" <zachi.friedman@m-sys.com>
To: "Dave Dillow" <dave@thedillows.org>,
	<linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
cc: dwmw2@infradead.org
Subject: RE: Problems with 128MB DoC 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dave,

I have just grabbed one of those MD2202-D128, and ran some tests on it.
It is built out of 2 flash devices, 64MB each. They seem to be Samsung
KM29V512000, and their flash chip ID is EC 76.

It seems you have a problem if you get C6 C6... It is definitely not the
correct flash ID.

Zachi.

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Dave Dillow
Sent: Wednesday, July 30, 2003 4:56 PM
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org
Subject: Problems with 128MB DoC 2000

I've got a DoC MD2202-D128-X that I'm trying to get working with Linux.
The binary only drivers from M-Sys may be an option, but I'd much rather
have the source to work with.

I first tried the CVS version of docprobe, and it reported an unknown
chip ID of 0x30. Following an exchange between David Woodhouse and Zachi
Friedman, I cooked up the attached patch to docprobe, which lets it find
my 2000, but then it fails with the following errors:

Using configured DiskOnChip probe address 0xd0000
DiskOnChip 2000 found at address 0xD0000
Unknown flash chip found: C6 C6
Please report to dwmw2@infradead.org
Unknown flash chip found: C6 C6
Please report to dwmw2@infradead.org
Unknown flash chip found: C6 C6
Please report to dwmw2@infradead.org
Unknown flash chip found: C6 C6
Please report to dwmw2@infradead.org
No flash chips recognised.

It seems kind of odd that the flash id and manufacturer id are the same
number, so I also tried forcing the chip to be a Millennium, and got the
expected failure -- it did not report unknown flash chips; it didn't see
any at all.

So, if doc2000.c is working for DoC 2000 < 128MB, then it looks like the
new ASIC changed more than just the toggle bit?

I have a fairly urgent need to get this working in some form or fashion.
I'm guessing the programming information is not publicly available --
any pointers on who I should talk to? Zachi, maybe? I'm willing to write
the code if I can get the information, or at the very least, I can be a
pretty quick turnaround tester.
--=20
Dave Dillow <dave@thedillows.org>
