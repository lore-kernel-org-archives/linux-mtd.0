Message-ID: <1496213561.492.12.camel@mhfsdcap03>
Subject: Re: [PATCH v4 3/4] mtd: nand: mediatek: add support for different
 MTK NAND FLASH Controller IP
From: xiaolei li <xiaolei.li@mediatek.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <computersforpeace@gmail.com>, <matthias.bgg@gmail.com>,
 <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <rogercc.lin@mediatek.com>, <yt.shen@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Wed, 31 May 2017 14:52:41 +0800
In-Reply-To: <20170531081241.2137fe38@bbrezillon>
References: <1496201877-34373-1-git-send-email-xiaolei.li@mediatek.com>
 <1496201877-34373-4-git-send-email-xiaolei.li@mediatek.com>
 <20170531081241.2137fe38@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Wed, 2017-05-31 at 08:12 +0200, Boris Brezillon wrote:
> Le Wed, 31 May 2017 11:37:56 +0800,
> Xiaolei Li <xiaolei.li@mediatek.com> a écrit :
> 
> >  
> > -static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
> > +static int mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
> 
> Why do you change the prototype here? You seem to always return 0
> anyway.
> 
Sorry, it should be void.

But as your suggestion below, I will keep using int here to return error
if there is no entry that is less than *sps.

> >  {
> >  	struct nand_chip *nand = mtd_to_nand(mtd);
> > -	u32 spare[] = {16, 26, 27, 28, 32, 36, 40, 44,
> > -			48, 49, 50, 51, 52, 62, 63, 64};
> > -	u32 eccsteps, i;
> > +	struct mtk_nfc *nfc = nand_get_controller_data(nand);
> > +	const u8 *spare = nfc->caps->spare_size;
> > +	u32 eccsteps, i, j = 0;
> 
> Can we rename 'j' into 'closest_spare'?
> 
ok.

> >  
> >  	eccsteps = mtd->writesize / nand->ecc.size;
> >  	*sps = mtd->oobsize / eccsteps;
> > @@ -1144,28 +1102,28 @@ static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
> >  	if (nand->ecc.size == 1024)
> >  		*sps >>= 1;
> >  
> > -	for (i = 0; i < ARRAY_SIZE(spare); i++) {
> > -		if (*sps <= spare[i]) {
> > -			if (!i)
> > -				*sps = spare[i];
> > -			else if (*sps != spare[i])
> > -				*sps = spare[i - 1];
> > -			break;
> > +	for (i = 0; i < nfc->caps->num_spare_size; i++) {
> > +		if ((*sps >= spare[i]) && (spare[i] >= spare[j])) {
> 
> Parenthesis around the 'a >= b' tests are unneeded:
> 
> 		if (*sps >= spare[i] && spare[i] >= spare[j]) {
> 
ok.

> > +			j = i;
> > +			if (*sps == spare[i])
> > +				break;
> >  		}
> >  	}
> >  
> > -	if (i >= ARRAY_SIZE(spare))
> > -		*sps = spare[ARRAY_SIZE(spare) - 1];
> 
> Maybe you could return an error if you didn't find any entry that is
> less that *sps in the table, but I'm not sure this can really happen,
> and the minimum spare size seems to be the same for all IPs, this is
> something you can check before iterating over the array:
> 
> 	if (*sps < MTK_NFC_MIN_SPARE)
> 		return -EINVAL;
> 
OK. It seems better to check whether there is no entry that is less than
*sps.
Will add MTK_NFC_MIN_SPARE and check it.

> > +	*sps = spare[j];
> >  
> >  	if (nand->ecc.size == 1024)
> >  		*sps <<= 1;
> > +
> > +	return 0;
> >  }

Thanks.
Xiaolei
