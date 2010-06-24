Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ORaU1-0005yX-E5
	for linux-mtd@lists.infradead.org; Thu, 24 Jun 2010 00:39:57 +0000
Date: Thu, 24 Jun 2010 01:39:54 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 2/3] flash_eraseall: move constants out of for loop
Message-ID: <20100624003954.GK7058@shareable.org>
References: <1276764159-28726-1-git-send-email-ext-andriy.shevchenko@nokia.com>
	<1276764159-28726-2-git-send-email-ext-andriy.shevchenko@nokia.com>
	<AANLkTilBFi58-kjjxM2Q5p0I1l9R5WQpiozBiV5udQYW@mail.gmail.com>
	<20100623002334.GA22367@shareable.org>
	<AANLkTimllsVj3nGC7vWP9oKPJXwIyjd71y0KbA7rFhPH@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTimllsVj3nGC7vWP9oKPJXwIyjd71y0KbA7rFhPH@mail.gmail.com>
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, "Shevchenko Andriy \(EXT-Teleca/Helsinki\)"
	<ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Frysinger wrote:
> On Tue, Jun 22, 2010 at 20:23, Jamie Lokier wrote:
> > Mike Frysinger wrote:
> >> i wonder though why this code even bothers with "static".
> >
> > The array is static to avoid compiling to code which fills in the
> > array at runtime.  I.e. it makes the code smaller, to the same size as
> > if they were globals.  And then, only because its static, the const
> > can put them in the .rodata section, reducing unshared data size.
> 
> if it were generated on the stack at runtime, the .text is shared too

Shared, but larger than the static-const data it replaces.

> > Because they're static there's no benefit to moving them to another
> > scope.
> 
> that's sort of what i expected, but i found it odd that it isnt:
>     static const char * const short_options = "jq";

You're right, I missed that.
I'd have used this myself:

static const char short_options[] = "jq";

-- Jamie
