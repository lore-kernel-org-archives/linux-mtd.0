Received: from www.optixsoft.de ([213.187.73.226])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ODt6-0005qR-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2002 09:19:40 +0000
Date: Tue, 17 Dec 2002 10:49:38 +0100 (MET)
From: Tobias Otto-Adamczak <toa@indakom.de>
To: <linux-mtd@lists.infradead.org>
cc: Alex Pavloff <apavloff@eason.com>
Subject: RE: writing new BBRAM driver
In-Reply-To: <D3AF5F134D627243993F2F2FC32EE4D229C4B0@mailman.eason.com>
Message-ID: <Pine.LNX.4.31.0212171026220.5816-100000@www.optixsoft.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Alex Pavloff, 2002-12-16, 14:33h:

> Does the minix fs have a small overhead like FAT12?   Could I use FAT12 if I
> was willing to stick with 8.3?  (Which wouldn't be a bad idea anyway, for
> other reasons in my project).

Of course you can use FAT12 if that suits your needs.

> Alright, one more question:  What should the erasesize be for BBRAM?

I set it to 0 for my project. I read in other messages here that
blocksize=erasesize but for erasesize=0 this is definitely not the case
:-) I did no modifications to the slram code and the sizes are:

erasesize=0 byte
sectorsize=512 byte
blocksize=1024 byte

Be careful to use fresh mtd code when you try this (in the latest
slram.c, it is predefined with 0 anyway). I run into problems with old
releases.

Tobias
