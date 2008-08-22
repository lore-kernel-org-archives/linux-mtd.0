Received: from smtp108.mail.mud.yahoo.com ([209.191.85.218])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWM1R-00049e-Nb
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 02:05:06 +0000
From: Nick Piggin <nickpiggin@yahoo.com.au>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 22 Aug 2008 12:04:57 +1000
References: <48AD00C4.6060302@gmail.com>
	<ac9c93b10808202332n2654884eh877848df2da59f20@mail.gmail.com>
	<6934efce0808211232i21fcf347vb6baa6502246adb2@mail.gmail.com>
In-Reply-To: <6934efce0808211232i21fcf347vb6baa6502246adb2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808221204.57413.nickpiggin@yahoo.com.au>
Cc: cotte@de.ibm.com, Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	linux-embedded@vger.kernel.org,
	=?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 22 August 2008 05:32, Jared Hulbert wrote:
> > Jared, nice work!

> > - would axfs be suitable as a filesystem on a ram disk?
>
> It could be.  I plan on implementing support for brd.  That might work
> nicely.

I was going to take a look at this too. With any luck, it should be
little effort required as it looks like you have the block device
support in place?

This filesystem actually should in theory work fairly well with brd,
because then we wouldn't have to bring the data over into pagecache
for frequently used pages but we can retain the compressed storage
for the infrequently used stuff.

I say in theory because I don't know of any serious users (except
kernel testing) of brd :)
