Received: from de01.mail.all-tld.net ([195.140.232.8])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1xTc-0007Yi-IC
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2010 07:57:37 +0000
Date: Wed, 14 Apr 2010 09:57:20 +0200
From: Anders Larsen <al@alarsen.net>
Subject: Re: [PATCH] Fix Oops with Atmel SPI
To: Iwo Mergler <iwo@call-direct.com.au>
In-Reply-To: <4BC56F21.6040909@call-direct.com.au> (from
	iwo@call-direct.com.au on Wed Apr 14 09:30:41 2010)
Message-Id: <1271231840l.5270l.0l@i-dmzi_al.realan.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
References: <4BC56F21.6040909@call-direct.com.au>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Ian McDonnell <ian@brightstareng.com>,
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Matthias Kaehlcke <matthias@kaehlcke.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Iwo,

On 2010-04-14 09:30:41, Iwo Mergler wrote:
> I wouldn't recommend that. MTD erase blocks are 64K or more. In a typical
> embedded system you will not be able to kmalloc that much memory after
> a few day's of operation - the page pool gets fragmented.

the original problem occurs with SPI flashes, which typically have a much
smaller erase block size (and it only occurs when they are driven by an Atm=
el
SoC SPI controller, hence the #ifdefs)

> A possibly better approach is to arrange for that memory to get allocated
> at driver start time.

The buffer in question is indeed allocated _once_ (at the first write
operation to the device) and only deallocated when the device is unmounted,
so allocating it at driver load time wouldn't make much difference IMHO.

I realize that my patch also affects e.g. parallel NOR flash on the system,
but unless an MTD device is unmounted/remounted over and over again, I don'=
t
see a problem.

Did I miss something else?

> An even better approach would be to change the algorithm to operate on
> a list of smaller allocations, e.g. MTD page size.

That's unfortunately beyond my abilities, I fear.

Cheers
Anders

> Anders Larsen wrote:
> > Tweak MTD's cache allocation to make it work with the atmel DMA'ed SPI.
> > Substitute kmalloc for vmalloc so the cache buffer is mappable as per
> > the Atmel SPI driver's requirements, otherwise an Oops would occur.
> >=20
> > The original patch by Ian McDonnell <ian@brightstareng.com> was found h=
ere:
> > http://lists.infradead.org/pipermail/linux-mtd/2007-December/020184.htm=
l
> >=20
> > Signed-off-by: Anders Larsen <al@alarsen.net>
> > Cc: Ian McDonnell <ian@brightstareng.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Matthias Kaehlcke <matthias@kaehlcke.net>
> > Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > Cc: Nicolas Pitre <nico@fluxnic.net>
