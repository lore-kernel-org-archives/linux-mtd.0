Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN43n-0000no-4N
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 15:23:15 +0000
Date: Wed, 25 Apr 2012 08:23:10 -0700
From: Tony Lindgren <tony@atomide.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] ARM: OMAP3: gpmc: add BCH ecc api and modes
Message-ID: <20120425152310.GR3739@atomide.com>
References: <1334652536-4442-1-git-send-email-ivan.djelic@parrot.com>
 <1335365341.6356.5.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1335365341.6356.5.camel@koala>
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Artem Bityutskiy <dedekind1@gmail.com> [120425 07:52]:
> On Tue, 2012-04-17 at 10:48 +0200, Ivan Djelic wrote:
> > This patch adds a simple BCH ecc computation api, similar to the
> > existing Hamming ecc api. It is intended to be used by the MTD layer.
> > It implements the following features:
> > 
> > - support 4-bit and 8-bit ecc computation
> > - do not protect user bytes in spare area, only data area is protected
> > - ecc for an erased NAND page (0xFFs) is also a sequence of 0xFFs
> > 
> > This last feature is obtained by adding a constant polynomial to
> > the hardware computed ecc. It allows to correct bitflips in blank pages
> > and is extremely useful to support filesystems such as UBIFS, which expect
> > erased pages to contain only 0xFFs.
> > 
> > This api has been tested on an OMAP3630 board.
> > 
> > Signed-off-by: Ivan Djelic <ivan.djelic@parrot.com>
> 
> Hi Tony,
> 
> what do you think about merging this patch? This is the enabler for
> making UBIFS actually usable on OMAP platforms which use BCH ECC. There
> are 2 other MTD patches which depend on this - so I wonder if it is
> easier to merge this one via the MTD tree, providing it has your/others'
> ack(s).

Looks OK to me, however there are other pending GPMC patches to convert
it to a platform device device driver. Need to look those closer though.
Anyways, it's best that I queue them to avoid merge conflicts.

Do you these for other changes for UBIFS? If so, I can set up an immutable
branch for GPMC that you can merge in as well.

Regards,

Tony
