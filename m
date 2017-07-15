Date: Sat, 15 Jul 2017 23:00:36 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Joe Perches <joe@perches.com>
cc: Julia Lawall <Julia.Lawall@lip6.fr>, linux-arm-kernel@lists.infradead.org,
 keescook@chromium.org, kernel-janitors@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-input@vger.kernel.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH 00/11] Drop unnecessary static
In-Reply-To: <1500151079.4457.80.camel@perches.com>
Message-ID: <alpine.DEB.2.20.1707152300030.5105@hadrien>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
 <1500151079.4457.80.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Sat, 15 Jul 2017, Joe Perches wrote:

> On Sat, 2017-07-15 at 22:07 +0200, Julia Lawall wrote:
> > These patches fix cases where there is a static on a local variable, but
> > the variable is initialized before any possible use.  Thus, the static has
> > no benefit.
>
> Nice one.

Thanks.  It was suggested by Kees Cook a while ago.  There seem to be many
opportunities.

julia
