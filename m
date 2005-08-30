Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EA2rn-0004qt-KG
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2005 05:57:27 -0400
Date: Tue, 30 Aug 2005 11:56:10 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jared Hulbert <jaredeh@gmail.com>
Message-ID: <20050830095610.GA9504@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
	<1125087149.26481.12.camel@windu.rchland.ibm.com>
	<20050829100722.GB17088@wohnheim.fh-wedel.de>
	<1125340972.30800.7.camel@windu.rchland.ibm.com>
	<20050829185042.GA28514@wohnheim.fh-wedel.de>
	<6934efce0508291621656374d2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0508291621656374d2@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 29 August 2005 16:21:51 -0700, Jared Hulbert wrote:
> > 
> I need support for 256KiB eraseblocks. There are high volume consumer 
> devices hitting the market now which use that eraseblock size. More will be 
> coming. 512KiB is feasible in the near future.
> 
> I'm not sure I fully understand the issues involved. 
> 
> Is there something magical about the (128*1024)? Can we increase that to 256 
> or 512?

You cannot kmalloc() more than 128k in a chunk.  Depending on your
system, you could vmalloc() more.

It's not the eraseblock size that matters, it's the number of erase
blocks.  One struct jffs2_eraseblock is needed for each and right now,
they are put into a large array, allocated by kmalloc().  This array
hits the ceiling at 128k.

What we have to do is allocate the memory in smaller chunks and put
some effort into organizing it.  A slab cache would be the best idea.

Jörn

-- 
He who knows others is wise.
He who knows himself is enlightened.
-- Lao Tsu
