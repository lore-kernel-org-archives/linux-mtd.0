Received: from sun06.mazet.de ([193.29.17.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eeEZ-00030Y-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 16:04:55 +0100
Received: from se_server.mazet.de ([193.99.171.10])
	by sun06.MAZeT.de (8.9.3/8.9.3) with SMTP id RAA19882
	for <linux-mtd@lists.infradead.org>; Wed, 5 Sep 2001 17:03:11 +0200 (MET DST)
Message-Id: <3B96412B.49261E43@mazet.de>
Date: Wed, 05 Sep 2001 17:13:47 +0200
From: Holger Friedrich <friedrich@MAZeT.de>
Mime-Version: 1.0
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Boot from DOC 2000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
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

Hi all,
I got my kernel to recognize the DOC, I can mount it as nftla, I can put
file systems on it, read and write. I was even able to put a demo from
elinos on it and boot it, but this was on msdos fs using syslinux as
bootloader. =

Now I want to boot a "real" linux using ext2 or jffs. I've tried to work
through the mtd-jffs-HOWTO. It works fine as long as you just want to
detect the DOC. When it comes to booting from it it seems to assume a
mtd device, which I don't have. =

I'd like to know how to deal with nftl devices. =

Could anyone point me in the right direction?
Thanks in advance Holger
-- =

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Holger Friedrich

MAZeT GmbH                  mailto:friedrich@mazet.de
branch office Jena          Phone: +49 3641 280954
G=F6schwitzer Stra=DFe 32
07745 Jena
Germany
Visit our website: http://www.MAZeT.de
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
