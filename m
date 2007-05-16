Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoJUu-0001aZ-C9
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 09:24:57 -0400
Date: Wed, 16 May 2007 15:20:35 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516132035.GJ5472@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<Pine.LNX.4.64.0705161319060.5152@sbz-30.cs.Helsinki.FI>
	<20070516122603.GE5472@lazybastard.org>
	<84144f020705160536i189f6206sffc964a145177da7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84144f020705160536i189f6206sffc964a145177da7@mail.gmail.com>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 May 2007 15:36:44 +0300, Pekka Enberg wrote:
> On 5/16/07, Jörn Engel <joern@lazybastard.org> wrote:
> >
> >More trouble?
> 
> Forgot to add (see below). Seems logfs_segment_read would be simpler
> too if you fixed this.

Would it?  I think that code would still be needed, although possibly in
a different function.

There are two minor drawbacks to using the page cache, btw:
- Indirect blocks need some mapping too.  So either I need to steal a
  bit from the inode space or from the fpos space.
- OOM handling is a bit more complicated.  I would need a mempool for
  that.

> >[ Objects are the units that get compressed.  Segments can contain both
> >compressed and uncompressed objects. ]
> >
> >It is a trade-off.  Each object has a 24 Byte header plus X Bytes of
> >data.  Whether the data is compressed or not is indicated in the header.
> 
> Was my point really. Why do segments contain both compressed and
> uncompressed objects?

Compressing random data will actually enlarge it.  If that happens I
simply store the verbatim uncompressed data instead and mark it as such.

There is also demand for a user-controlled bit in the inode to disable
compression completely.  All those .jpg, .mpg, .mp3, etc. just waste
time by trying and failing to compress them.

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface.
-- Doug MacIlroy
