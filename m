Message-ID: <1500151079.4457.80.camel@perches.com>
Subject: Re: [PATCH 00/11] Drop unnecessary static
From: Joe Perches <joe@perches.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>, linux-arm-kernel@lists.infradead.org
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, Hartmut Knaack
 <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter
 Meerwald-Stadler <pmeerw@pmeerw.net>, linux-input@vger.kernel.org,
 linux-iio@vger.kernel.org
Date: Sat, 15 Jul 2017 13:37:59 -0700
In-Reply-To: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2017-07-15 at 22:07 +0200, Julia Lawall wrote:
> These patches fix cases where there is a static on a local variable, but
> the variable is initialized before any possible use.  Thus, the static has
> no benefit.

Nice one.
