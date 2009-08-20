Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdzQQ-0006yn-EO
	for linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 04:39:03 +0000
Date: Thu, 20 Aug 2009 00:38:51 -0400
From: Sean MacLennan <smaclennan@pikatech.com>
To: Feng Kan <fkan@amcc.com>
Subject: Re: NAND  ECC Error with wrong SMC ording bug
Message-ID: <20090820003851.1a532444@lappy.seanm.ca>
In-Reply-To: <4A8C87E6.6070702@amcc.com>
References: <19081.57584.173693.798535@cargo.ozlabs.ibm.com>
	<1250569482.19007.23.camel@pasglop> <4A8C87E6.6070702@amcc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	u-boot@lists.denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Aug 2009 16:16:54 -0700
Feng Kan <fkan@amcc.com> wrote:

> I see other boards using SMC as well, can someone comment on the
> change I am proposing.
> Should I change the correction algorithm or the calculate function?
> If the later is preferred
> it would mean the change must be pushed in both U-Boot and Linux.

Odds are the calculate function is wrong. The correction algo is used
by many nand drivers, I *assume* it is correct. The calculate function
was set to agree with u-boot (1.3.0).

Cheers,
   Sean

P.S. Yes, I know the u-boot is an ancient version :(
