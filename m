Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am5MG-0004y8-UU
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 20:07:54 +0000
Received: by mail-pf0-x235.google.com with SMTP id e128so76833584pfe.3
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 13:07:32 -0700 (PDT)
Date: Fri, 1 Apr 2016 13:07:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] mtd: nand: read (from DT) and store ECC algorithm
Message-ID: <20160401200728.GA3645@localhost>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <1455300685-27009-2-git-send-email-zajec5@gmail.com>
 <20160401160722.GC117117@google.com>
 <CACna6rz6mYSxAr1oSjcLc__sSKM1XdUf-cGOFanGvuij0nNC5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rz6mYSxAr1oSjcLc__sSKM1XdUf-cGOFanGvuij0nNC5Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 01, 2016 at 09:32:40PM +0200, Rafał Miłecki wrote:
> On 1 April 2016 at 18:07, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Fri, Feb 12, 2016 at 07:11:24PM +0100, Rafał Miłecki wrote:
> >> This will allow drivers handle ECC properly.
> >>
> >> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> >> ---
> >>  drivers/mtd/nand/nand_base.c | 6 +++++-
> >>  include/linux/mtd/nand.h     | 1 +
> >>  2 files changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> >> index f2c8ff3..ef977f3 100644
> >> --- a/drivers/mtd/nand/nand_base.c
> >> +++ b/drivers/mtd/nand/nand_base.c
> >> @@ -3979,7 +3979,7 @@ ident_done:
> >>  static int nand_dt_init(struct nand_chip *chip)
> >>  {
> >>       struct device_node *dn = nand_get_flash_node(chip);
> >> -     int ecc_mode, ecc_strength, ecc_step;
> >> +     int ecc_mode, ecc_algo, ecc_strength, ecc_step;
> >>
> >>       if (!dn)
> >>               return 0;
> >> @@ -3991,6 +3991,7 @@ static int nand_dt_init(struct nand_chip *chip)
> >>               chip->bbt_options |= NAND_BBT_USE_FLASH;
> >>
> >>       ecc_mode = of_get_nand_ecc_mode(dn);
> >> +     ecc_algo = of_get_nand_ecc_algo(dn);
> >>       ecc_strength = of_get_nand_ecc_strength(dn);
> >>       ecc_step = of_get_nand_ecc_step_size(dn);
> >>
> >> @@ -4003,6 +4004,9 @@ static int nand_dt_init(struct nand_chip *chip)
> >>       if (ecc_mode >= 0)
> >>               chip->ecc.mode = ecc_mode;
> >>
> >> +     if (ecc_algo >= 0)
> >> +             chip->ecc.algo = ecc_algo;
> >> +
> >
> > While this might appear to handle the absence of the nand-ecc-algo
> > property correctly, this isn't safe. This means that any existing DT
> > without the property will get treated as Hamming ECC. Perhaps we need
> > the enum to have a 0 value of 'NAND_ECC_ALGO_UNKNOWN' or something like
> > that?
> 
> You're commenting on an old series. If you take a look at:
> https://patchwork.ozlabs.org/patch/601180/
> that also got applied to the:
> https://github.com/linux-nand/linux/commits/nand/next
> repo, you'll see we have NAND_ECC_UNKNOWN there.

Ah, I guess I missed that because I was searching for the patch to
brcmnand (i.e., fixing the original problem you saw). AFAICT, this v2
series doesn't actually resolve your issue with brcmnand, no?

Brian
