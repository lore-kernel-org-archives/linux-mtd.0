Received: from natsmtp00.webmailer.de ([192.67.198.74] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19mtGO-0000LA-3m
	for <linux-mtd@lists.infradead.org>; Wed, 13 Aug 2003 11:53:56 +0100
Received: from pc50 (drsd-d9b844cb.pool.mediaWays.net [217.184.68.203])
	by post.webmailer.de (8.12.8/8.8.7) with SMTP id h7DArYxD008816
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Aug 2003 12:53:37 +0200 (MEST)
Message-ID: <000501c36189$2819d020$32fefe0a@pc50>
From: "=?iso-8859-1?B?SvZybiBHcnXrbA==?=" <gruel@inovision.de>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 13 Aug 2003 12:53:23 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Problem with M-Systems DiskOnChip ...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Working with kernel version 2.4.18 (ELinOS distribution), I always got
messages like:

> DiskOnChip Millennium found at address 0xD0000
> Flash chip found: Manufacturer ID: 98, Chip ID: E6 (NAND 1MB 5V)
> 1 flash chips found. Total DiskOnChip size: 1 MiB
> Ignoring DiskOnChip 2000 at 0xD2000 - already configured

That's wrong, because I have the MD-2810-DO8 on board. wich definitely has
8MBytes space ... after that conflict not wondering about these later
messages:

> NFTL driver: nftlcore.c $Revision: 1.87 $, nftlmount.c $Revision: 1.31 $
> NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think we
know
> what it means...
> NFTL Media Header sanity check failed:
> numvunits (1988) > nb_blocks (256) - nb_boot_blocks(6) - 2
> Could not find valid boot record
> Could not mount NFTL device

I'm really starting to hate the manufacturer of our ELAN 540 boards for his
idea not to use an IDE flashdisk ... but possibly I'm stupid myself an make
mistakes never dreaming of?

I tried with doc514.exb, 514p.exb, doc42.exb and unformatted - all that done
by dos tool dformat from M-Systems website ... always I got results like the
one above ...

An other approach has been to do formatting via /dev/mtd/0 (eraseall,
nftlformat) - but that try was obviously the wrong one - after that I get
write errors with all M-Systems tools ...

Hopefully someone has any helpful hint for me,
best regards,
Joern.
