Received: from river-bank.demon.co.uk ([62.49.20.162] helo=badger.river-bank.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g6y4-0007aV-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 17:34:44 +0000
From: Phil Thompson <phil@river-bank.demon.co.uk>
To: joakim.tjernlund@lumentis.se, David Woodhouse <dwmw2@infradead.org>
Date: Tue, 4 Feb 2003 17:34:24 +0000
Cc: linux-mtd@lists.infradead.org
References: <IGEFJKJNHJDCBKALBJLLMEPBFJAA.joakim.tjernlund@lumentis.se>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEPBFJAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200302041734.24986.phil@river-bank.demon.co.uk>
Subject: Re: Different zlib CRC Algorithms
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

On Tuesday 04 February 2003 5:06 pm, Joakim Tjernlund wrote:
> > > > 	crc = (crc32(crc ^ 0xffffffff),buf,len) ^ 0xffffffff);
> > > >
> > > > ...otherwise all the CRC checks fail.
> > >
> > > What bootloader? If ppcboot/uboot I think you will find that
> > > ppcboot/uboot has 2 versions of crc32 and you are using the
> > > wrong one?
> >
> > As I said above, at the moment I'm implementing it as a Linux application
> > and so using the crc32() in userspace zlib which (I am suggesting) is
> > different to the one in the kernel.
>
> OK, then I am lost.
>
> > Why does ppcboot/uboot have two versions of crc32()? What's the
> > difference between them?
>
> The difference is the ^0xffffffff part you decribed above. One is used by
> uboot for crc'ing images, environment etc. The other for JFFS2 support in
> uboot.

So that would confirm my original observation that the kernel does use a 
slightly different CRC algorithm than userspace zlib.

It's not a problem - I was just curious to know why.

Phil
