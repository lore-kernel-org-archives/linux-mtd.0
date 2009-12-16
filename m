Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKiZB-0003j8-Kt
	for linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 01:20:42 +0000
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KUQ000VS126CU@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 10:20:30 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KUQ00HHO12646@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 10:20:30 +0900 (KST)
Date: Wed, 16 Dec 2009 10:20:30 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: RE: [PATCH] OneNAND: Fix test of unsigned in onenand_otp_walk()
In-reply-to: <4B282BBD.4050106@gmail.com>
To: 'Roel Kluin' <roel.kluin@gmail.com>, linux-mtd@lists.infradead.org,
	'Andrew Morton' <akpm@linux-foundation.org>,
	'LKML' <linux-kernel@vger.kernel.org>
Message-id: <003301ca7ded$f50a8930$df1f9b90$%park@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-language: ko
Content-transfer-encoding: 7BIT
References: <4B282BBD.4050106@gmail.com>
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

> -----Original Message-----
> From: Roel Kluin [mailto:roel.kluin@gmail.com]
> Sent: Wednesday, December 16, 2009 9:37 AM
> To: Kyungmin Park; linux-mtd@lists.infradead.org; Andrew Morton; LKML
> Subject: [PATCH] OneNAND: Fix test of unsigned in onenand_otp_walk()
> 
> mtd->writesize and len are unsigned so the test does not work.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> you can test this with:
> 
> #include <stdio.h>
> 
> int main()
> {
>         int c = 1, d = 1;
>         unsigned a = 30;
>         unsigned b = 10;
> 
>         if ((b * c) - (d + a) < 0)
>                 printf("good\n");
>         else
>                 printf("bad\n");
>         return 0;
> }
> 
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c
> b/drivers/mtd/onenand/onenand_base.c
> index ff66e43..cbe2711 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -2725,7 +2725,7 @@ static int onenand_otp_walk(struct mtd_info *mtd,
> loff_t from, size_t len,
>  	}
> 
>  	/* Check User/Factory boundary */
> -	if (((mtd->writesize * otp_pages) - (from + len)) < 0)
> +	if (mtd->writesize * otp_pages < from + len)
>  		return 0;
> 
>  	onenand_get_device(mtd, FL_OTPING);
