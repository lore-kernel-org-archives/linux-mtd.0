Received: from mail04.syd.optusnet.com.au ([211.29.132.185])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K1buv-0002tO-PN
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 06:47:18 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <80b317760805282341n3ffbdc9bw2a919b22568ae618@mail.gmail.com>
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
	<1211755845.6724.29.camel@Ubuntu-Desktop>
	<80b317760805270042w39c409d4j230c1a2967bf0242@mail.gmail.com>
	<1211924779.6140.9.camel@Ubuntu-Desktop>
	<80b317760805272324p590e96fr2453176c6f035138@mail.gmail.com>
	<1212015172.6110.27.camel@Ubuntu-Desktop>
	<1212015577.6110.31.camel@Ubuntu-Desktop>
	<80b317760805282341n3ffbdc9bw2a919b22568ae618@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 29 May 2008 16:46:51 +1000
Message-Id: <1212043611.12909.8.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alessandro Rubini <rubini-list@gnudd.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	michael <trimarchi@gandalf.sssup.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-05-29 at 08:41 +0200, Richard Genoud wrote:
> > Just out of interest, I did the same over 10 pages.
> > $ ./flash_eraseall /dev/mtd0
> > $ dd if=/dev/urandom bs=2k count=10 of=/dev/mtd0
> > $ nanddump -p -l20480 /dev/mtd0 1> /dev/null
> > ECC failed: 3
> > ECC corrected: 0
> > Number of bad blocks: 0
> > Number of bbt blocks: 0
> > Block size 131072, page size 2048, OOB size 64
> > Dumping data starting at 0x00000000 and ending at 0x00005000...
> > ECC: 1 uncorrectable bitflip(s) at offset 0x00003800
> >
> > Foobar!

> ok, so this must be a hardware problem...

I've emailed Atmel.  I suspect a chip has undergone a dies shrink and
now there's a timing spec that's violated, unless I've got 2-3 boards
all with the same hardware problem.

I'll look through the EBI timing setup and the chip requirements when I
get another moment.

Thanks for your help in the diagnosis.  It was good just to know that
others are using this without such problems.

Regards,
James.
