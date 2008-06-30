Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KDBXp-0002mw-Hc
	for linux-mtd@lists.infradead.org; Mon, 30 Jun 2008 05:03:18 +0000
From: David Brownell <david-b@pacbell.net>
To: "Kyungmin Park" <kmpark@infradead.org>
Subject: Re: [patch 2.6.26-rc8+] mtd: dataflash OTP support
Date: Sun, 29 Jun 2008 22:03:14 -0700
References: <200806292019.53376.david-b@pacbell.net>
	<9c9fda240806292114m43d4e940h3346c03d92d65b32@mail.gmail.com>
In-Reply-To: <9c9fda240806292114m43d4e940h3346c03d92d65b32@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806292203.15123.david-b@pacbell.net>
Cc: Bryan Wu <cooloney@kernel.org>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 29 June 2008, Kyungmin Park wrote:
> > +#ifdef CONFIG_MTD_OTP
> > +#define HAVE_OTP
> > +#endif
> > +
> > +#ifdef CONFIG_MTD_ONENAND_OTP
> > +#define HAVE_OTP
> > +#endif
> > +
> > +#ifdef CONFIG_MTD_DATAFLASH_OTP
> > +#define HAVE_OTP
> > +#endif
> > +
> 
> How about to add these at Kconfig like this,
> 
> config MTD_HAVE_OTP
>          bool
>          default n
> 
> and NOR, OneNAND, and DATAFLASH select MTD_HAVE_OTP if OTP support.

Shouldn't it be HAVE_MTD_OTP?

That'd be prettier, yes.  MTD_OTP would have been the obvious
choice for the generic symbol, but that's specific to CFI.
(And for that matter, CFI command set 1 ... I have set 2 chips
that can't yet expose their OTP data!)

I'd rather see that as a separate patch though -- either before
or after this one, I don't much care.

- Dave
