Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HXbZ-0005GY-00
	for mtd-list@infradead.org; Wed, 26 Jul 2000 21:16:37 +0100
Received: from mail.root.at ([212.172.120.146] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13HXbX-0005GS-00
	for mtd@infradead.org; Wed, 26 Jul 2000 21:16:35 +0100
Message-ID: <397F46EF.417AD6CE@linuxaustria.at>
From: Karl Pitrich <pit@linuxaustria.at>
MIME-Version: 1.0
To: Christian Lademann <cal@zls.de>
CC: mtd@infradead.org
Subject: Re: Request: examples of using LILO or GRUB to boot from DOC
References: <397F3B15.D420B9AF@zls.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Jul 2000 22:18:00 +0200
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Christian Lademann wrote:
> =

> I am trying hard to get a 4Mb DoC to boot something else but MS-DOS.
> Could somebody please mail me her/his lilo-
> or grub-configuration?
> Is there currently a working way to boot Linux from a DOC using free
> software, anyhow?

lilo works, use the patched one from the mtd package.
for a stable system it is recomended to use the DoC driver provided by
m-system, i guess.


Installation goes like this:

- mount the DoC to /mnt/doc.
- put a kernel with according driver in /mnt/doc/boot/, name it kernel;
- copy the boot.b from the mtd package to /mnt/doc/boot/
- change the rootdevice of the kernel with 'rdev /dev/fla1
/mnt/doc/boot/kernel'

- Generate /root/lilo-doc.conf similar to the following:

	boot=3D/dev/fla
	vga =3D normal  =

	read-only
	prompt
	timeout=3D50
	image =3D /mnt/doc/boot/kernel
	root =3D /dev/fla1
	label =3D linux


- install lilo with
	lilo-mtd -C /root/lilo-doc.conf -I /mnt/doc/boot/boot.b -m
/mnt/doc/boot/map


-reboot

Note:
dunno about a small DoC, but on a 16mb you will need a extra boot
partition with ie. 1MB,
because otherwise lilo will see too much cylinders (>1024) and therefore
can't be installed.
if you do this, surely change /dev/fla1 to /dev/fla2, because /dev/fla1
just holds the kernel.



-- =

Best regards, Karl Pitrich. icq #81091001

pitrich information technologies
linuxsoftwareinternetworkcommunication!
hauptstra=DFe 16-18 | 4040 linz | austria =

voice: +43 70 718884 | support: 0900 970 710 (.at only)
--
 Microsoft is prohibited from distributing this work in any form, in
 whole or in part, across any medium. Licenses for distribution are =

 available to Microsoft for $500. Posting without permission constitutes
 an agreement to these terms.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
