Received: from [217.72.192.243] (helo=fmmailgate05.web.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSoPW-00080P-23
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 09:12:10 +0000
Received: from web.de
	by fmmailgate05.web.de (Postfix) with SMTP id 9B72A5D0096B
	for <linux-mtd@lists.infradead.org>;
	Thu,  7 Jan 2010 10:11:29 +0100 (CET)
Date: Thu, 07 Jan 2010 10:11:27 +0100
Message-Id: <1128464590@web.de>
MIME-Version: 1.0
From: Arno Steffen <arno.steffen@web.de>
To: linux-mtd@lists.infradead.org
Subject: References: JFFS2 - speed up while booting
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Urspr=FCngliche Nachricht-----
> Von: "linux newbie" <linux.newbie79@gmail.com>
> Gesendet: 05.01.10 01:56:42
> An: linux-mtd@lists.infradead.org
> Betreff: JFFS2 - speed up while booting


I would expect that a ramdisk will take longer to boot.
It has to copy all content of rootfs from flash to RAM.

In opposite the flashfs only copies the files it really needs for booting =
to RAM.

Reading flash is slow - that has been the reason for me to switch to jffs2=
 as
filesystem. Am I wrong=3F

So where is the boot process slow=3F
How does your rootfs comes into SDRAM if you compare this booth=3F

Regards
Arno

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Preisknaller: WEB.DE DSL Flatrate f=FCr nur 16,99 Euro/mtl.!=20
http://produkte.web.de/go/02/
