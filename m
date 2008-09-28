Received: from galiil.marvell.com ([199.203.130.254] helo=il.marvell.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KjwYL-0002gI-I2
	for linux-mtd@lists.infradead.org; Sun, 28 Sep 2008 13:43:14 +0000
Received: from YK-HUB02.marvell.com ([10.4.102.52])
	by il.marvell.com (8.13.1/8.13.1) with ESMTP id m8SDhC4t014797
	for <linux-mtd@lists.infradead.org>;
	Sun, 28 Sep 2008 16:43:12 +0300 (IDT)
From: Michael Meriin <meriinm@marvell.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Sun, 28 Sep 2008 16:43:08 +0300
Subject: fclose in JFFS2 7 YAFFS2 sometimes takes 7 seconds
Message-ID: <E0F29C1343A0404DB4C86E66F5754EE47BE03D9CF9@IL-MB01.marvell.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

We are running Linux kernel 2.6.25 on ARM.
In two different platforms we are using almost the same code. But on one pl=
atform we are using JFFS2 and on the other platform YAFFS. On both platform=
s used ONENand Flash.
In both cases we have some process that periodically, every several seconds=
, updates some short (300 bytes) file.
The problem is that several times a day (1-2, in some load conditions even =
more times) it takes 7 seconds to perform fclose system call.
What can be the reasons for such behavior? Can it be FS garbage collection?


Best Regards,
              Michael Meriin
