Received: from dmzraw2.extranet.tce.com ([157.254.234.138])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKgQr-0001dV-GH
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 13:08:59 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Oct 2004 19:07:26 +0200
Message-ID: <2C1BAF8F8E1DD611862B0002A5D4C3FC02B6D197@renexch3.rennes.thmulti.com>
From: "Fillod Stephane" <stephane.fillod@thomson.net>
To: <bodhi@despammed.com>, <linux-mtd@lists.infradead.org>
Cc: 
Subject: RE: Howto write to flash from user space (II)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>I already read http://www.linux-mtd.infradead.org/
>but I found no useful informations

Maintainer: could this reply be added to a FAQ?

>How can I write directly into flash from an user space application ?
>I am using a SA1110 with 16MB StrataFlash.

	open("/dev/mtd0")
	lseek()
	write()
	read()
	close()

See "fcp" source code in mtd-utils for examples.

You need MTD char support built in your kernel.

>I tried using /dev/mem but I can only read and not write to flash.

/dev/mem would work for read's, but not write's since write requires
specific protocol. You should know that if you wanna use flash.
Read appropriate papers if need be.

>I do not have any /dev/mtd* device in my /dev , why ?

why? don't know. But you can go create them (MAKEDEV or mknod by hand),
AFAIAC I tend to run away from devfs.

>Do I need to develop a driver ?

no, StrataFlash is supported already. However, you may need a map driver
for declaring flash address and partitionning though.

>Please help me, with at least a useful link or better a sample.
>TIA

Hope it helps. Reading mailing list archives helps A LOT, as well as
kernel documentation, as well as other mtd tools, as weel as googling,
as well as linux/drivers/mtd/ ...

>
>(sorry for the broken thread, I've lost the original message)

Don't worry, my stinking MUA is not helping either :(

Regards
--=20
Stephane
