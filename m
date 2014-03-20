Received: from mail-pa0-f45.google.com ([209.85.220.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQaKX-0002ap-JP
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 10:36:10 +0000
Received: by mail-pa0-f45.google.com with SMTP id kl14so750086pab.32
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 03:35:44 -0700 (PDT)
Date: Thu, 20 Mar 2014 03:35:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 0/4] mtd: nand: omap: optimize chip->ecc.calculate()
 for H/W ECC schemes
Message-ID: <20140320103532.GL31517@norris-Latitude-E6410>
References: <1393410194-15094-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1393410194-15094-1-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 26, 2014 at 03:53:10PM +0530, Pekon Gupta wrote:
> Changes v6->v7
> rebased on http://lists.infradead.org/pipermail/linux-mtd/2014-February/052092.html
> 
> This patch series is split version of earlier patch:
> http://lists.infradead.org/pipermail/linux-mtd/2013-November/050240.html
> 
> chip->ecc.calculate() is used for calculating and fetching of ECC syndrome by
> processing the data passed during Read/Write accesses.
> Though all H/W ECC schemes in OMAP NAND use GPMC controller for ECC calculation
> But each of them implements its own callback to process and fetch ECC syndrome.
> 
> This patch tries to merge common code for different BCHx_ECC schemes into single
> omap_calculate_ecc_bch(). This imporves scalability for future ecc-schemes.
> Following is the summary of this patch series.
>  +----------------------+---------------------------+--------------------------+
>  | ecc-scheme           | nand_chip->ecc.calculate  | nand_chip->ecc.calculate |
>  |                      | (before this patch series)| (after this patch series)|
>  +----------------------+---------------------------+--------------------------+
>  | HAM1_ECC             | omap_calculate_ecc()      | omap_calculate_ecc()     |
>  | BCH4_HW_DETECTION_SW | omap3_calculate_ecc_bch4()| omap_calculate_ecc_bch() |
>  | BCH4_HW              | omap3_calculate_ecc_bch() | omap_calculate_ecc_bch() |
>  | BCH8_HW_DETECTION_SW | omap3_calculate_ecc_bch8()| omap_calculate_ecc_bch() |
>  | BCH8_HW              | omap3_calculate_ecc_bch() | omap_calculate_ecc_bch() |
>  +----------------------+---------------------------+--------------------------+

Pushed to l2-mtd.git. Thanks!

Brian
