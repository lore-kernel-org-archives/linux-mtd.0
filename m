Received: from imap.gmx.net ([213.165.64.20] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhEGl-0005cu-Bf
	for linux-mtd@lists.infradead.org; Sun, 04 Jul 2004 17:11:28 -0400
From: dkey <dk.dbox2@gmx.net>
To: linux-mtd@lists.infradead.org
Date: Sun, 4 Jul 2004 23:12:26 +0200
References: <Pine.LNX.4.44.0407012328180.18865-100000@xanadu.home>
In-Reply-To: <Pine.LNX.4.44.0407012328180.18865-100000@xanadu.home>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200407042312.26606.dk.dbox2@gmx.net>
Cc: Robert Lippmann <rlippmann@imsventures.com>, Nicolas Pitre <nico@cam.org>
Subject: Re: unresoved symbol __ffs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 02 July 2004 05:32, Nicolas Pitre wrote:
> On Thu, 1 Jul 2004, Robert Lippmann wrote:
> > hi all,
> >
> > haven't seen this covered before, but when i try to use recent snapshots
> > (late june-ish), i get this unresolved symbol when building a 2.4.26
> > kernel using linux-mips.  i assume it's because the compiler
> > sets --disable-builtins when compiling.  it occurs in cfi_cmdset_0001.c
> > oddly, the file compiles without warnings.  oh, and i'm using gcc 3.3.2
>
> __ffs should be defined in linux/asm/bitops.h.  It is defined for MIPS as
> follows in 2.6.7:
>

but in 2.4.x kernels, it is defined as ffs (without leading underscores), so 
maybe the code should be adapted to fit 2.6 and 2.4 kernels.

greets dkey
