Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fw0P6-0000Tc-Qc
	for linux-mtd@lists.infradead.org; Thu, 29 Jun 2006 13:34:18 -0400
Date: Thu, 29 Jun 2006 19:32:06 +0200
From: Adrian Bunk <bunk@stusta.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [2.6 patch] make drivers/mtd/cmdlinepart.c:mtdpart_setup() static
Message-ID: <20060629173206.GF19712@stusta.de>
References: <20060626220215.GI23314@stusta.de>
	<1151416141.17609.140.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1151416141.17609.140.camel@hades.cambridge.redhat.com>
Cc: juha.yrjola@solidboot.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 27, 2006 at 02:49:00PM +0100, David Woodhouse wrote:
> On Tue, 2006-06-27 at 00:02 +0200, Adrian Bunk wrote:
> > This patch makes the needlessly global mtdpart_setup() static.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > 
> > --- linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c.old 2006-06-26 23:18:39.000000000 +0200
> > +++ linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c     2006-06-26 23:18:51.000000000 +0200
> > @@ -346,7 +346,7 @@
> >   *
> >   * This function needs to be visible for bootloaders.
> >   */
> > -int mtdpart_setup(char *s)
> > +static int mtdpart_setup(char *s) 
> 
> Patch lacks sufficient explanation. Explain the relevance of the comment
> immediately above the function declaration, in the context of your
> patch. Explain your decision to change the behaviour, but not change the
> comment itself.

My explanation regarding the relevance of the comment is that it seems 
to be nonsense.

Do I miss something, or why and how should a bootloader access 
in-kernel functions?

> Think. Or you will be replaced with a small shell script.

No problem, I'm waiting for your submission of Adrian 1.0 ;-)

> dwmw2

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
