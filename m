Received: from rhun.apana.org.au ([64.62.148.172] helo=arnor.apana.org.au)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nap1N-0005O8-1M
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 11:28:21 +0000
Date: Fri, 29 Jan 2010 22:27:57 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS assert failed in ubifs_dirty_inode
Message-ID: <20100129112757.GA1309@gondor.apana.org.au>
References: <4B591573.60602@theptrgroup.com>
	<1264480808.2401.78.camel@localhost.localdomain>
	<1264484928.3536.1017.camel@calx>
	<1264500214.3867.21.camel@localhost>
	<4B5F9A78.7080000@theptrgroup.com>
	<1264558433.3536.1543.camel@calx> <4B5FADE8.30803@theptrgroup.com>
	<1264566010.2401.143.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1264566010.2401.143.camel@localhost.localdomain>
Cc: Jeff Angielski <jeff@theptrgroup.com>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, Matt Mackall <mpm@selenic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 27, 2010 at 06:20:10AM +0200, Artem Bityutskiy wrote:
>
> Thanks for testing. So, who would bring Matt's patch upstream then, hmm?

I've got it in crypto-2.6.  Thanks!
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
