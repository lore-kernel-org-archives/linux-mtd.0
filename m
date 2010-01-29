Received: from rhun.apana.org.au ([64.62.148.172] helo=arnor.apana.org.au)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NamXW-00035i-Ha
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 08:49:22 +0000
Date: Fri, 29 Jan 2010 21:48:50 +1300
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Matt Mackall <mpm@selenic.com>
Subject: Re: UBIFS assert failed in ubifs_dirty_inode
Message-ID: <20100129084850.GA23140@gondor.apana.org.au>
References: <4B591573.60602@theptrgroup.com>
	<1264480808.2401.78.camel@localhost.localdomain>
	<1264484928.3536.1017.camel@calx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1264484928.3536.1017.camel@calx>
Cc: Jeff Angielski <jeff@theptrgroup.com>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 25, 2010 at 11:48:48PM -0600, Matt Mackall wrote:
>
> random: drop weird m_time/a_time manipulation
> 
> No other driver does anything remotely like this that I know of except
> for the tty drivers, and I can't see any reason for random/urandom to do
> it. In fact, it's a (trivial, harmless) timing information leak. And
> obviously, it generates power- and flash-cycle wasting I/O, especially
> if combined with something like hwrngd. Also, it breaks ubifs's
> expectations.
> 
> Signed-off-by: Matt Mackall <mpm@selenic.com>

Thanks Matt, I'll add this to crypto-2.6 and then stable.
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
