Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=alex)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111XZ7-0005KG-00
	for mtd@infradead.org; Tue, 6 Jul 1999 16:55:25 +0100
Received: from localhost (alex@localhost)
	by tammy.signum.se (8.9.3/8.9.3) with ESMTP id RAA31330
	for <mtd@infradead.org>; Tue, 6 Jul 1999 17:59:56 +0200
Date: Tue, 6 Jul 1999 17:59:55 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: mtd@infradead.org
Subject: Re: Flash drivers and filesystem (fwd)
Message-ID: <Pine.LNX.4.10.9907061758490.24997-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <Pine.LNX.4.10.9907061758492.24997@tammy.signum.se>
Content-Disposition: INLINE
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I don't have time to look at this. Anyone interested?

Attachment at
ftp://ftp.signum.se/pub/alex/amd_changes.patch

(listserver ate the first try.)

/ Alex

---------- Forwarded message ----------
Date: Wed, 30 Jun 1999 13:31:41 +0000
From: kd@flaga.is
To: Alexander Larsson <alex@signum.se>
Subject: Re: Flash drivers and filesystem

Hello,

Thanks for the utils you sent me. I am now able to create ext2fs on a part
of the flash chip. Now I only need to get Linux
to reqognice the flash partition in the boot so that Linux can boot from
it...

Anyway, as I mentioned before I have changed some things to make the driver
compatible with the am29lv160B* flash chip.
I was going to clean up my changes before I sent them to you. But now I am
starting my summervaction and I don't have time
to do that until this autumn. I send you the patch and you decide what to
do with it it might be helpful for others.

There are also some changes that might be helpful for your chip (8x
bitwith) , especially in the detection code.

My proposition is for the time beeing is to make amd_flash8x.c (your
amd_flash.c) and amd_flash16x.c (amd_flash.c with my patch) and make just
one of them compiled in at any one time.

Anyway I will probably not touch this thing until august.

Regards,

K.D.

(See attached file: flash.diff)



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
