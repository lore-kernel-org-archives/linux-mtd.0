Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13AGdX-0007Ds-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 19:44:35 +0100
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13AGdL-0007Dj-00
	for mtd@infradead.org; Thu, 06 Jul 2000 19:44:32 +0100
Message-ID: <3964D3AB.51E9AB24@matrox.com>
Date: Thu, 06 Jul 2000 14:44:59 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
CC: mtd@infradead.org
Subject: Re: jffs super block
References: <3962EBC0.F16A20AF@evoserve.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

"Rogelio M. Serrano Jr." wrote:
>=20
> Does the jffs also have a super block on disk?
>=20
> I have been trying to use jffs on DOC but i just cant get it to mount.
> The jffs code could not find a single valid jffs inode on the DOC and
> then dumps the disk data and then hang when I mount it after i dd a jff=
s
> image to the it. The second time I boot I dont get any kind of output
> anymore and my machine hangs. For starters, How should I write the jffs
> file system on the DOC then? Should  I add a superblock on the chip?
>=20
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

I don't really know much about the DOC but doesn't it have it's own
filesystem (TrueFS or something like that) ?  If so, are linux drivers
available and open-sourced ?

Thanks,

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
