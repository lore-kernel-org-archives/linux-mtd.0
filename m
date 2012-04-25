Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SN6yU-0002Jb-Pg
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 18:29:59 +0000
Date: Wed, 25 Apr 2012 20:28:36 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2] ARM: OMAP3: gpmc: add BCH ecc api and modes
Message-ID: <20120425182836.GA17023@parrot.com>
References: <1334861024-27386-1-git-send-email-ivan.djelic@parrot.com>
 <20120425170313.GW3739@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120425170313.GW3739@atomide.com>
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tony,
Thanks for the review,

On Wed, Apr 25, 2012 at 06:03:14PM +0100, Tony Lindgren wrote:
(...)
> >  #define GPMC_ECC1_RESULT        0x200
> > +#define GPMC_ECC_BCH_RESULT_0   0x240
> 
> Can you please add a comment here saying something like:
> 
> #define GPMC_ECC_BCH_RESULT_0   0x240	/* Not available on omap2 */

OK sure.

> > +	/* check if ecc module is in use */
> > +	if (gpmc_ecc_used != -EINVAL)
> > +		return -EINVAL;
> > +	/*
> > +	 * FIXME: some OMAP3 revisions have a hardware bug which prevents
> > +	 * the 4-bit BCH mode from working properly. Such revisions could be
> > +	 * detected and rejected here.
> > +	 */
> 
> This should then be disabled to avoid corruption. Maybe only allow it
> initially on omaps that have been tested? And for omap2 it should return
> error  for sure.

OK I'll add a check.

> 
> Or do you know the broken omap3 versions?

Well, I was hoping that someone from linux-omap could tell me :)
I found this HW ECC feature table in
http://processors.wiki.ti.com/index.php/Raw_NAND_ECC:

         1b     4b      8b
---------------------------
OMAP35x  YES    NO      YES
AM35x    YES    YES     YES
AM/DM37x YES    YES     YES

and other wiki pages confirmed that 4-bit mode is not supported on all OMAP35xx chips.
OTOH, I know from TI support that 4-bit mode is at least supported on
OMAP3630 ES1.x (x >= 1).

So, a conservative approach would be to reject 4-bit mode on all chips but
omap3630 with rev >= 1.1. Other revisions/chips could be added later if they are
confirmed to work; what do you think ?

> Also, should you first request this feature in case multiple drivers
> need to share it?

According to TI documentation (OMAP36xx ES1.x TRM, §10.1.4, GPMC functional diagram),
the GPMC ECC engines (Hamming and BCH) are dedicated to NAND access only; therefore
I believe the mtd driver is the only potential user of this feature.
Also, the existing Hamming ecc API does not perform any request; or did I miss
something? If I need to perform the request, is there an existing api to do so?

Thanks,
--
Ivan
