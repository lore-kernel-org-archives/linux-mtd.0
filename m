Date: Wed, 19 Apr 2017 13:07:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] mtd: physmap_of: really fix the physmap add-ons
Message-ID: <20170419200732.GC20555@google.com>
References: <20170330153639.26819-1-linus.walleij@linaro.org>
 <20170331100451.069a76ab@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170331100451.069a76ab@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 31, 2017 at 10:04:51AM +0200, Boris Brezillon wrote:
> On Thu, 30 Mar 2017 17:36:39 +0200
> Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > The current way of building the of_physmap add-ons result in just
> > the add-on being in the object code, and not the actual core
> > implementation and regress the Gemini and Versatile.
> > 
> > Bake the physmap_of.o object by baking physmap_of_core.o and
> > adding the Versatile and/or Gemini add-ons to the final object.
> > Rename the source file physmap_of_core.c to get the desired
> > build components.
> > 
> > Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Fixes: 4f04f68e1598 ("mtd: physmap_of: fixup gemini/versatile dependencies")
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied
