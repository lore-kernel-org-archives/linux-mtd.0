Received: from gprs189-60.eurotel.cz ([160.218.189.60] helo=amd.ucw.cz)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EaKa7-0006mb-V2
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2005 22:07:46 +0000
Date: Thu, 10 Nov 2005 23:06:39 +0100
From: Pavel Machek <pavel@suse.cz>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20051110220639.GB9905@elf.ucw.cz>
References: <1131616948.27347.174.camel@baythorne.infradead.org>
	<20051110103823.GB2401@elf.ucw.cz>
	<1131619903.27347.177.camel@baythorne.infradead.org>
	<20051110105954.GE2401@elf.ucw.cz>
	<1131621090.27347.184.camel@baythorne.infradead.org>
	<20051110120708.GG2401@elf.ucw.cz> <437344E0.9040502@cantab.net>
	<20051110130930.GJ2401@elf.ucw.cz>
	<1131644476.24595.18.camel@localhost.localdomain>
	<1131646197.23410.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1131646197.23410.27.camel@localhost.localdomain>
Cc: David Vrabel <dvrabel@cantab.net>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
Subject: Re: latest mtd changes broke collie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

> > > > Shouldn't you get hold of the datasheet for the flash chips and fill in
> > > > this information correctly?
> > > 
> > > I already have working sharp.c driver... And I do not even know
> > > manufacturer of the chip, just its ids.
> > 
> > The chip number is LF28F640BX which is a 64MBit device so perhaps Intel
> > StrataFlash 28F640? That seems to be a fairly common chip...
> 
> Some further research suggests it should perhaps be LH28F640BX which is
> a 48 pin Sharp flash chip (much more likely). The nearest datasheet I
> can find is:
> 
> http://www.datasheetarchive.com/semiconductors/download.php?Datasheet=1120647

That's strange; first the datasheet is pretty much useless; it does
not even give you product ID ("refer to documentation"). Then it
claims this device supports CFI. I guess it is easier to get the
values from sharp.c than from this datasheet :-(.

[It seems like the chip has many "options", and it is up to user how
it uses the chip.]
							Pavel
-- 
Thanks, Sharp!
