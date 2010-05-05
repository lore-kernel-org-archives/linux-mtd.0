Subject: Re: [PATCH] ubi: init even if mtd device cannot be attached, if
	built into kernel
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
In-Reply-To: <1273036359.3702.35.camel@localhost>
References: <1272537664-21603-1-git-send-email-mkl@pengutronix.de>
	<1273036359.3702.35.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 08:14:42 +0300
Message-ID: <1273036482.3702.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dmitry Pervushin <dpervushin@embeddedalley.com>,
	Roel Kluin <roel.kluin@gmail.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-05 at 08:12 +0300, Artem Bityutskiy wrote:
> > +#ifdef CONFIG_MTD_UBI_MODULE
> > +static inline int ubi_is_module(void) { return 1; }
> > +#else
> > +static inline int ubi_is_module(void) { return 0; }
> > +#endif
> 
> I really hate these ifdefs. Dunno why, but they feel disgusting.
> 
> I understand your issue and agree that is should be fixed. And I cannot
> really see a better solution. So if no-one complains, I'll accept your
> patch.
> 
> However, for consistency with other UBI code (see debug.h), please, do
> this like
> 
> #ifdef CONFIG_MTD_UBI_MODULE
> #define ubi_is_module() 1
> #else
> #define ubi_is_module() 1
> #endif

Err, of course the second one should be 0, not 1. I can actually do this
modification myself, or you can re-send your patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
