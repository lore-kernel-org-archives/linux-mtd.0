Received: from [203.177.23.162] (helo=eazix-win2ks0.eazix.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJQDN-000772-Cw
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2005 02:10:06 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 7 Apr 2005 14:08:17 +0800
Message-ID: <E02DDFEE79372340B35395EDE51EFAEE2CBB31@eazix-win2ks0.eazix.com>
From: "Franz De Rama" <francis.derama@eazix.com>
To: <linux-mtd@lists.infradead.org>
Subject: DoC Millennium Plus on RedBoot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Resend. (subject line changed)



Hi All,

I am currently developing a code to support DiskOnChip Millennium Plus
32MB on RedBoot. Such that I could be able to detect my DoC from redboot
and load the Linux and root file system image from it. I am using a
dragonball MX1 processor with an on-board flash for booting.=20

Odd as it may seem, I have added an IDE support for RedBoot and am
modifying the ide.c from redboot packages (/redboot/src/fs/ide.c) to
support DiskOnChip instead of IDEs and for the meantime, ext2 file
system.

Am I going the right direction? If not, could somebody shed light on
what I need to do to add DiskOnChip support on RedBoot?

Many thanks.
