Date: Fri, 25 Nov 2016 11:27:25 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: mxc: Fix mxc_v1 ooblayout
Message-ID: <20161125112725.0ee9d49d@bbrezillon>
In-Reply-To: <58eed307-ee50-9727-7b64-891d1b969790@gmail.com>
References: <1480065209-4179-1-git-send-email-boris.brezillon@free-electrons.com>
 <58eed307-ee50-9727-7b64-891d1b969790@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 25 Nov 2016 10:58:26 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 11/25/2016 10:13 AM, Boris Brezillon wrote:
> > Commit a894cf6c5a82 ("mtd: nand: mxc: switch to mtd_ooblayout_ops")
> > introduced a bug in the OOB layout description. Even if the driver claims
> > that 3 ECC bytes are reserved to protect 512 bytes of data, it's actually
> > 5 ECC bytes to protect 512+6 bytes of data (some OOB bytes are also
> > protected using extra ECC bytes).
> > 
> > Fix the mxc_v1_ooblayout_{free,ecc}() functions to reflect this behavior.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Fixes: a894cf6c5a82 ("mtd: nand: mxc: switch to mtd_ooblayout_ops")
> > Cc: <stable@vger.kernel.org>
> > ---
> >  drivers/mtd/nand/mxc_nand.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> > index 61ca020c5272..c19ec4f0983e 100644
> > --- a/drivers/mtd/nand/mxc_nand.c
> > +++ b/drivers/mtd/nand/mxc_nand.c
> > @@ -886,7 +886,7 @@ static int mxc_v1_ooblayout_ecc(struct mtd_info *mtd, int section,
> >  		return -ERANGE;
> >  
> >  	oobregion->offset = (section * 16) + 6;
> > -	oobregion->length = nand_chip->ecc.bytes;
> > +	oobregion->length = 5;  
> 
> Use a macro instead of hard-coding a value please :)

Ideally, we should change ->eccbytes value in the
imx27_nand_devtype_data and imx21_nand_devtype_data definitions, but I
fear it could break other things.

I'll define a macro.

> 
> >  	return 0;
> >  }
> > @@ -908,8 +908,7 @@ static int mxc_v1_ooblayout_free(struct mtd_info *mtd, int section,
> >  			oobregion->length = 4;
> >  		}
> >  	} else {
> > -		oobregion->offset = ((section - 1) * 16) +
> > -				    nand_chip->ecc.bytes + 6;
> > +		oobregion->offset = ((section - 1) * 16) + 5 + 6;  
> 
> DTTO here, the math here is cryptic enough.
> 
> >  		if (section < nand_chip->ecc.steps)
> >  			oobregion->length = (section * 16) + 6 -
> >  					    oobregion->offset;
> >   
> 
> 
