Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CiT4-0002xP-00
	for mtd-list@infradead.org; Thu, 13 Jul 2000 13:51:54 +0100
Message-ID: <396DBBB1.A5494318@matrox.com>
Date: Thu, 13 Jul 2000 08:53:05 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: MTD Mailing List <mtd@infradead.org>
Subject: Config.in
References: <21454.963389948@cygnus.co.uk>  <20000711212323.21257.qmail@web5302.mail.yahoo.com> <32068.963394509@cygnus.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Running make xconfig on 2.2.15, I get the following
drivers/mtd/Config.in: 14: unknown command

However, make menuconfig doesn't generate any error.  I'm not a kernel
config specialist so I don't know if define_tristate was introduced in
2.3 or why in doesn't work only with xconfig, but this is definitly a
bug of some sort.


--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
