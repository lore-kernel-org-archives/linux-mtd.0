Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13AHgs-0007MP-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 20:52:06 +0100
Date: Thu, 6 Jul 2000 20:50:54 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
cc: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>, mtd@infradead.org
Subject: Re: jffs super block
In-Reply-To: <3964D3AB.51E9AB24@matrox.com>
Message-ID: <Pine.LNX.4.21.0007062048380.1075-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 6 Jul 2000, [iso-8859-1] S=E9bastien C=F4t=E9 wrote:

> I don't really know much about the DOC but doesn't it have it's own
> filesystem (TrueFS or something like that) ?  If so, are linux drivers
> available and open-sourced ?

The DiskOnChip is just a clever way of attaching NAND flash chips to a
CPU. Generally it comes with the NAND Flash Translation Layer, which
emulates a block device, on top of which you put a 'normal' filesystem.

You end up with a journalled filesystem on top of what is essentially
already a journalled filesystem, and although we do have GPL'd NFTL
support, it's not 100% reliable yet.


--=20
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
