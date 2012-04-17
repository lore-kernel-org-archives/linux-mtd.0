Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SK9Pu-0001G5-6q
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 14:30:02 +0000
Received: by wibhj13 with SMTP id hj13so434006wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 07:29:59 -0700 (PDT)
Date: Tue, 17 Apr 2012 17:29:48 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND
 {read,write}_page interfaces
Message-ID: <20120417172948.20ad0701@pixies.home.jungo.com>
In-Reply-To: <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Viresh Kumar <viresh.kumar@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Vipin Kumar <vipin.kumar@st.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Mike Dunn <mikedunn@newsguy.com>, Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>, Liu Shuo <b35362@freescale.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Huang Shijie <b32955@freescale.com>, Jiandong Zheng <jdzheng@broadcom.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

I have no inputs regarding the concept, others probably know better.

Only verified execution in nand_base.c and nand.h, see below.

On Mon, 16 Apr 2012 15:35:54 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
>  static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
> -				   uint8_t *buf, int page)
> +				   uint8_t *buf, uint8_t *oob, int page)
>  {
>  	int i, eccsize = chip->ecc.size;
>  	int eccbytes = chip->ecc.bytes;
>  	int eccsteps = chip->ecc.steps;
>  	uint8_t *p = buf;
> -	uint8_t *oob = chip->oob_poi;
> +	uint8_t *oobbuf = chip->oob_poi;
>  
>  	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
>  		int stat;
> @@ -1371,23 +1376,23 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>  		chip->read_buf(mtd, p, eccsize);
>  
>  		if (chip->ecc.prepad) {
> -			chip->read_buf(mtd, oob, chip->ecc.prepad);
> -			oob += chip->ecc.prepad;
> +			chip->read_buf(mtd, oobbuf, chip->ecc.prepad);
> +			oobbuf += chip->ecc.prepad;
>  		}
>  
>  		chip->ecc.hwctl(mtd, NAND_ECC_READSYN);
> -		chip->read_buf(mtd, oob, eccbytes);
> -		stat = chip->ecc.correct(mtd, p, oob, NULL);
> +		chip->read_buf(mtd, oobbuf, eccbytes);
> +		stat = chip->ecc.correct(mtd, p, oobbuf, NULL);
>  
>  		if (stat < 0)
>  			mtd->ecc_stats.failed++;
>  		else
>  			mtd->ecc_stats.corrected += stat;
>  
> -		oob += eccbytes;
> +		oobbuf += eccbytes;
>  
>  		if (chip->ecc.postpad) {
> -			chip->read_buf(mtd, oob, chip->ecc.postpad);
> +			chip->read_buf(mtd, oobbuf, chip->ecc.postpad);
>  			oob += chip->ecc.postpad;

Missed convertion of 'oob' in the last line above.
s/oob/oobbuf/

Same problem in the following lines of 'nand_read_page_syndrome'.
Should be:

@@ -1393,9 +1393,9 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
        }
 
        /* Calculate remaining oob bytes */
-       i = mtd->oobsize - (oob - chip->oob_poi);
+       i = mtd->oobsize - (oobbuf - chip->oob_poi);
        if (i)
-               chip->read_buf(mtd, oob, i);
+               chip->read_buf(mtd, oobbuf, i);
 
        return 0;
 }

> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 1482340..be9ee1f 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -363,15 +363,15 @@ struct nand_ecc_ctrl {
>  	int (*correct)(struct mtd_info *mtd, uint8_t *dat, uint8_t *read_ecc,
>  			uint8_t *calc_ecc);
>  	int (*read_page_raw)(struct mtd_info *mtd, struct nand_chip *chip,
> -			uint8_t *buf, int page);
> +			uint8_t *buf, uint8_t *oob, int page);
>  	void (*write_page_raw)(struct mtd_info *mtd, struct nand_chip *chip,
> -			const uint8_t *buf);
> +			const uint8_t *buf, const uint8_t *oob);
>  	int (*read_page)(struct mtd_info *mtd, struct nand_chip *chip,
> -			uint8_t *buf, int page);
> +			uint8_t *buf, uint8_t *oob, int page);
>  	int (*read_subpage)(struct mtd_info *mtd, struct nand_chip *chip,
>  			uint32_t offs, uint32_t len, uint8_t *buf);

No need to pass 'oob' to 'read_subpage'?

Regards,
Shmulik
