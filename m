Received: from rhun.apana.org.au ([64.62.148.172] helo=arnor.apana.org.au)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HXF8Q-0001S1-J7
	for linux-mtd@lists.infradead.org; Fri, 30 Mar 2007 12:19:11 +0100
Date: Fri, 30 Mar 2007 21:18:06 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Richard Purdie <richard@openedhand.com>
Subject: Re: Kernel LZO compression + jffs2 and crypto usage
Message-ID: <20070330111806.GA25628@gondor.apana.org.au>
References: <1175249518.5822.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1175249518.5822.18.camel@localhost.localdomain>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, akpm <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 30, 2007 at 11:11:58AM +0100, Richard Purdie wrote:
>
> I'm not sure of the best way to merge this since it touches two
> subsystems. David, do you want to pull the initial patch and jffs2 parts
> and then the crpyto patch can follow through the crypto tree? I'm hoping
> this can make 2.6.22. 

That would be my preference.

Cheers,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
