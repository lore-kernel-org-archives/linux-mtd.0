Received: from river-bank.demon.co.uk ([62.49.20.162] helo=badger.river-bank.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g7NR-0007u0-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 18:00:58 +0000
From: Phil Thompson <phil@river-bank.demon.co.uk>
To: joakim.tjernlund@lumentis.se, David Woodhouse <dwmw2@infradead.org>
Date: Tue, 4 Feb 2003 18:00:53 +0000
Cc: linux-mtd@lists.infradead.org
References: <IGEFJKJNHJDCBKALBJLLMEPCFJAA.joakim.tjernlund@lumentis.se>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEPCFJAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200302041800.53683.phil@river-bank.demon.co.uk>
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

On Tuesday 04 February 2003 5:47 pm, Joakim Tjernlund wrote:
> > > > Why does ppcboot/uboot have two versions of crc32()? What's the
> > > > difference between them?
> > >
> > > The difference is the ^0xffffffff part you decribed above. One is used
> > > by uboot for crc'ing images, environment etc. The other for JFFS2
> > > support in uboot.
> >
> > So that would confirm my original observation that the kernel does use a
> > slightly different CRC algorithm than userspace zlib.
>
> hmm, does zlib use crc32() at all? I have only seen adler32() in zlib,
> I haven't look very hard though.

It does. It's needed to support gzip files.

Phil
