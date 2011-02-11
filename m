Received: from t111.niisi.ras.ru ([193.232.173.111])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnphf-0005OQ-OQ
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 09:54:17 +0000
Date: Fri, 11 Feb 2011 13:00:21 +0300
From: "Antony N. Pavlov" <antony@niisi.msk.ru>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: fix sector erase command for
	AM29LV040B
Message-Id: <20110211130021.a05a37ec.antony@niisi.msk.ru>
In-Reply-To: <20110210214131.GA6561@pengutronix.de>
References: <1297371877-32123-1-git-send-email-antony@niisi.msk.ru>
	<20110210214131.GA6561@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 10 Feb 2011 22:41:31 +0100
Wolfram Sang <w.sang@pengutronix.de> wrote:

Thank you for your quick response.

> On Fri, Feb 11, 2011 at 12:04:37AM +0300, Antony Pavlov wrote:
> > The AM29LV040B chips use 0x50 as sector erase command instead of 0x30 [1].
> > 
> > [1] http://www.datasheetcatalog.com/datasheets_pdf/A/M/2/9/AM29LV040B.shtml
> 
> I am confused. The datasheet says on page 15 it uses 0x30 while your
> description above says it uses 0x50...

It is my mistake! Of course it uses 0x30.

> > Signed-off-by: Antony Pavlov <antony@niisi.msk.ru>
> > ---
> >  drivers/mtd/chips/cfi_cmdset_0002.c |    9 +++++++++
> >  1 files changed, 9 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index f072fcf..a401dbe 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -332,6 +332,14 @@ static void fixup_s29gl032n_sectors(struct mtd_info *mtd)
> >  	}
> >  }
> >  
> > +static void fixup_use_sector_erase_cmd_30(struct mtd_info *mtd)
> > +{
> > +	struct map_info *map = mtd->priv;
> > +	struct cfi_private *cfi = map->fldrv_priv;
> > +
> > +	cfi->sector_erase_cmd = CMD(0x30);
> cfi_chip_setup
> ... but here you change it to 0x30 (which is the default) instead of 0x50?
> 

In the commit 08968041bef437ec363623cd3218c2b083537ada
 (mtd: cfi_cmdset_0002: make sector erase command variable)
introdused field sector_erase_cmd. In this commit initialisation
of cfi->sector_erase_cmd made in cfi_chip_setup()
(file drivers/mtd/chips/cfi_probe.c), so the CFI chip has no problem:

...
        cfi->cfi_mode = CFI_MODE_CFI;
        cfi->sector_erase_cmd = CMD(0x30);
...

But for the JEDEC chips this initialisation is not carried out.
In my case (AM29LV040B) I have sector_erase_cmd == 0.

I shall send the patch in a few seconds.

-- 
Best regards,
  Antony Pavlov
