Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKTRI-0000gG-Og
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 11:52:49 +0000
Received: by wibhj13 with SMTP id hj13so422676wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 18 Apr 2012 04:52:44 -0700 (PDT)
Date: Wed, 18 Apr 2012 14:52:32 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: nand_do_{read,write}_ops - pass OOB
 buffer through
Message-ID: <20120418145232.6ba77552@pixies.home.jungo.com>
In-Reply-To: <1334615755-15418-3-git-send-email-computersforpeace@gmail.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-3-git-send-email-computersforpeace@gmail.com>
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

On Mon, 16 Apr 2012 15:35:55 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> Now that we have a function parameter for the OOB buffer, we can pass the OOB
> buffer as an argument to the nand_ecc_ctrl functions. This allows drivers to
> know when OOB data must be returned to the upper layers and when it is simply
> needed for internal calculations, potentially saving time for NAND HW/SW that
> can simply avoid reading the OOB data.

I think for consistency sake, existing chip->ecc.{read,write}_page_xxx
methods do need to be ported to support the new 'oob' parameter.

> @@ -2272,12 +2272,14 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
>  			size_t len = min(oobwritelen, oobmaxlen);
>  			oob = nand_fill_oob(mtd, oob, len, ops);
>  			oobwritelen -= len;
> +			oobpoi = chip->oob_poi;
>  		} else {
> +			oobpoi = NULL;
>  			/* We still need to erase leftover OOB data */
>  			memset(chip->oob_poi, 0xff, mtd->oobsize);
>  		}
>  
> -		ret = chip->write_page(mtd, chip, wbuf, NULL, page, cached,
> +		ret = chip->write_page(mtd, chip, wbuf, oobpoi, page, cached,
>  				       (ops->mode == MTD_OPS_RAW));
>  		if (ret)
>  			break;

The 'write_page' interface is problematic, as the meaning of 'oob'
parameter is a bit inconsistent:
- A NULL 'oob' actually states "no OOB buffer to write"
- Your driver instructs HW to write the page (ECC taken care of by HW)
- However default chip->ecc.write_page_xxx methods do need a temp buffer
  for OOB ECC calculation (hence will probably use the internal
  chip->oob_poi buffer)
- But when non-null 'oob' is passed to the default methods, they should
  probably use the given 'oob' buffer (and not a temp buffer)

(This is same for the read interface.)

So the 'oob' parameter is more of a boolean than an actual buffer to be
used by the various ecc.{read,write}_page implementors.

Any reason not to pass a boolean instead?

Regards,
Shmulik
