Date: Tue, 21 Oct 2014 23:10:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] ARM: don't set unused name in struct flash_platform_data
Message-ID: <20141022061057.GC16128@brian-ubuntu>
References: <1411993853-6309-1-git-send-email-zajec5@gmail.com>
 <20141022055326.GB16128@brian-ubuntu>
 <CACna6rw8dG4+nBkgNb+A_xfom=4rjh-nXJGeQ=4GgWHcZMJwMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rw8dG4+nBkgNb+A_xfom=4rjh-nXJGeQ=4GgWHcZMJwMA@mail.gmail.com>
Cc: Wan ZongShun <mcuos.com@gmail.com>, linux-sh@vger.kernel.org,
 Kevin Hilman <khilman@deeprootsystems.com>,
 Magnus Damm <magnus.damm@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 Simon Horman <horms@verge.net.au>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 22, 2014 at 08:03:45AM +0200, Rafał Miłecki wrote:
> On 22 October 2014 07:53, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Sep 29, 2014 at 02:30:53PM +0200, Rafał Miłecki wrote:
> >> Loading correct SPI driver (m25p80) is handled using modalias from the
> >> struct spi_board_info. There is no point of setting name in the
> >> platform_data, m25p80 ignores it anyway.
> >
> > Wait, is 'name' actually ignored? It looks to me like it sets the MTD
> > name. See the comments in include/linux/spi/flash.h and
> > arch/arm/include/asm/mach/flash.h (BTW, why do we have two definitions
> > for this??):
> >
> >   @name: optional flash device name (eg, as used with mtdparts=)
> >
> > And I think it's used for exactly that in m25p80.c:
> >
> >         if (data && data->name)
> >                 flash->mtd.name = data->name;
> 
> And very few lines later in the m25p80.c you have this:
> if (data && data->type)
>         id = spi_nor_match_id(data->type);

How is that relevant to the value of 'flash->mtd.name'?

> Code I touched in my patch was using both: name and type. So what you
> got it "type" took a precedence and "name" value was ignored. It seems
> like ppl used to use "name" to trigger "m25p80" probe, which isn't
> needed (it's done by SPI layer).
> 
> Also see my comment about data->type usage I added in:
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=32f1b7c8352fd33d41bcec3cfb054ccdcfd40a42

But I'm not talking about probing / driver matching. The 'name' field is
used for assigning the MTD name deterministically. This name is used for
things like 'mtdparts'.

Brian
