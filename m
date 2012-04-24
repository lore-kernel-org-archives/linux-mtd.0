Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMeri-0001Er-2G
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2012 12:29:07 +0000
Received: by lbol5 with SMTP id l5so496334lbo.36
 for <linux-mtd@lists.infradead.org>; Tue, 24 Apr 2012 05:29:04 -0700 (PDT)
Date: Tue, 24 Apr 2012 15:28:55 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: add 'use_oob' argument to NAND
 {read,write}_page interfaces
Message-ID: <20120424152855.28df673d@pixies.home.jungo.com>
In-Reply-To: <1335212069-7450-2-git-send-email-computersforpeace@gmail.com>
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
 <1335212069-7450-2-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Viresh Kumar <viresh.kumar@st.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Lei Wen <leiwen@marvell.com>,
 Jamie Iles <jamie@jamieiles.com>, prabhakar@freescale.com,
 Mike Dunn <mikedunn@newsguy.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Bastian Hecht <hechtb@gmail.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
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

Thanks for the v2 adaptations.

Reviewing nand_base.c and nand.h (less familiar with the others).

BTW I think you missed one API convertion in gpmi-nand.c: there's a
call to 'chip->ecc.write_page_raw' not ported.

(still not completely happy with my suggestion, as the boolean
approach is not that elegant as you previously noted...)

On Mon, 23 Apr 2012 13:14:28 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index eb88d8b..c4989b5 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1066,12 +1066,13 @@ EXPORT_SYMBOL(nand_lock);
>   * @mtd: mtd info structure
>   * @chip: nand chip info structure
>   * @buf: buffer to store read data
> + * @use_oob: caller expects OOB data read to chip->oob_poi
>   * @page: page number to read
>   *
>   * Not for syndrome calculating ECC controllers, which use a special oob layout.
>   */
>  static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> -			      uint8_t *buf, int page)
> +			      uint8_t *buf, bool use_oob, int page)
>  {
>  	chip->read_buf(mtd, buf, mtd->writesize);
>  	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);

Why don't you adapt 'nand_read_page_raw' (and others) to use the
'use_oob' hint? Do you plan to?

IMO having a parameter called 'use_oob', but not using the parameter
value is very confusing.

Maybe we need an indication that states "hey, you may skip filling the
oob_poi if you don't want to, that's okay (but if you'd like to fill
it for your own purposes, it's okay too)"...
More of a 'oob_must_be_read' or 'oob_expected' for the read case (and
'oob_must_be_written' or 'oob_was_placed' for write).

(tried to come-up with better names, no success ;-)

>  static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
> -				uint8_t *buf, int page)
> +				uint8_t *buf, bool use_oob, int page)
>  {
>  	int i, eccsize = chip->ecc.size;
>  	int eccbytes = chip->ecc.bytes;
> @@ -1139,7 +1142,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
>  	uint8_t *ecc_code = chip->buffers->ecccode;
>  	uint32_t *eccpos = chip->ecc.layout->eccpos;
>  
> -	chip->ecc.read_page_raw(mtd, chip, buf, page);
> +	chip->ecc.read_page_raw(mtd, chip, buf, use_oob, page);

Should pass 'true' instead of 'use_oob'.
That's because 'nand_read_page_swecc' later uses 'chip->oob_poi' and
expects it to be read.
(relevant for few other calls, e.g. nand_write_page_swecc)

BTW you used 'bool', however convention for some other boolean parameters
around nand_base.c is 'int'.
(no preference, just like things consistent)

Regards,
Shmulik
