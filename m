From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45BA1A9D.60301@nokia.com> <45BA21E6.60301@nokia.com>
	<000101c7436b$14370420$c7a3580a@swcenter.sec.samsung.co.kr>
	<45BDACBA.2080503@nokia.com> <45BE1480.1060506@nokia.com>
	<003701c74435$0b1f61f0$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C0B8D4.2000807@nokia.com>
	<005601c745a8$55787b50$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C19A1F.4020201@nokia.com> <45C19E7B.9060006@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND:
	Add	support	forauto-placementofout-of-banddata
Date: Thu, 1 Feb 2007 17:50:23 +0900
Message-ID: <005c01c745de$0628ec70$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45C19E7B.9060006@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

How about the second mail about onenand_transfer_auto_oob

I will commit it both

Thank you,
Kyungmin Park

> 
> 
> >From 397419987d744ed971c74cfabae2eeac705f2fe0 Mon Sep 17 
> 00:00:00 2001
> From: Adrian Hunter <ext-adrian.hunter@nokia.com>
> Date: Thu, 1 Feb 2007 09:59:41 +0200
> Subject: [MTD] OneNAND: Remove line of code that was meant to 
> be deleted
> 
> Iterations of the patch to add oob auto-placement support to 
> OneNAND left a line of code that was meant to have been deleted.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> ---
>  drivers/mtd/onenand/onenand_base.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c 
> b/drivers/mtd/onenand/onenand_base.c
> index 67efbc7..9ec28bb 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1143,7 +1143,6 @@ static int onenand_fill_auto_oob(struct 
>  			writeend += free->offset - lastgap;
>  		lastgap = free->offset + free->length;
>  	}
> -	writeend = mtd->oobsize;
>  	for (free = this->ecclayout->oobfree; free->length; ++free) {
>  		int free_end = free->offset + free->length;
>  		if (free->offset < writeend && free_end > writecol) {
> --
> 1.4.3
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
