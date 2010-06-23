Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ORDki-0007hH-CE
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 00:23:40 +0000
Date: Wed, 23 Jun 2010 01:23:35 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 2/3] flash_eraseall: move constants out of for loop
Message-ID: <20100623002334.GA22367@shareable.org>
References: <1276764159-28726-1-git-send-email-ext-andriy.shevchenko@nokia.com>
	<1276764159-28726-2-git-send-email-ext-andriy.shevchenko@nokia.com>
	<AANLkTilBFi58-kjjxM2Q5p0I1l9R5WQpiozBiV5udQYW@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTilBFi58-kjjxM2Q5p0I1l9R5WQpiozBiV5udQYW@mail.gmail.com>
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
> NAK: no explanation why you're doing this, and current code has the
> variables scoped to where they actually get used.
> 
> i wonder though why this code even bothers with "static".

The array is static to avoid compiling to code which fills in the
array at runtime.  I.e. it makes the code smaller, to the same size as
if they were globals.  And then, only because its static, the const
can put them in the .rodata section, reducing unshared data size.

Because they're static there's no benefit to moving them to another
scope.

-- Jamie
