Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Lssu-0002Kn-00
	for mtd-list@infradead.org; Mon, 07 Aug 2000 20:48:28 +0100
Message-ID: <398F1287.E29C8ECE@matrox.com>
Date: Mon, 07 Aug 2000 15:48:23 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: mtd@infradead.org, dwmw2@infradead.org
Subject: get_module_symbol / put_module_symbol
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I want to compile MTD builtin in the kernel but the usage of
get_module_symbol and put_module_symbol makes it impossible at the
moment.  I grepped -r 'put_module_symbol' in linux/drivers/* for linux
2.2.16 and MTD was the only driver using it.  I'm not sure how this
should be replaced but I'd really like to get rid of it.

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
