Subject: Re: [PATCH v4] mach-realview: expose PB1176 ROM using physmap and
	map_rom
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Sep 2011 07:11:14 +0300
In-Reply-To: <CACRpkdb7Qp527PqGT_kT5DF48ajvYgAMazw-sKyeT6hMegrXzQ@mail.gmail.com>
References: <1315292023-4125-1-git-send-email-linus.walleij@stericsson.com>
	<1315747783.18731.59.camel@sauron>
	<CACRpkdb7Qp527PqGT_kT5DF48ajvYgAMazw-sKyeT6hMegrXzQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316405483.24366.15.camel@sauron>
Mime-Version: 1.0
Cc: Linus Walleij <linus.walleij@stericsson.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
	Russell King <rmk@arm.linux.org.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-09-11 at 23:12 +0200, Linus Walleij wrote:
> On Sun, Sep 11, 2011 at 3:29 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2011-09-06 at 08:53 +0200, Linus Walleij wrote:
> >> From: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> This exposes the PB1176 ROM if you compile in the MTD physmap
> >> mapping and also the map_rom chiptype.
> >>
> >> Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
> >
> > I think this should go in via the corresponding arm subtree.
> 
> Sure, but I think we need some nod from the MTD people that this is the
> right way to present a ROM, so is that an Acked-by?

Acked-by: Artem Bityutskiy <artem.bityutskiy@intel.com>

-- 
Best Regards,
Artem Bityutskiy
