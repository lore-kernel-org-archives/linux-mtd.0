Received: from 3.mo5.mail-out.ovh.net ([46.105.40.108]
 helo=mo5.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RzmCy-0005NB-Tn
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2012 09:40:33 +0000
Received: from mail98.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo5.mail-out.ovh.net (Postfix) with SMTP id A36B2FFAD8F
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2012 10:42:58 +0100 (CET)
Date: Tue, 21 Feb 2012 10:32:24 +0100
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 5/6 V2] atmel/nand: add DT support
Message-ID: <20120221093224.GB9371@game.jcrosoft.org>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <1328524512-18159-2-git-send-email-plagnioj@jcrosoft.com>
 <4F30FD4B.4050501@atmel.com>
 <20120207115306.GF15647@game.jcrosoft.org>
 <4F43625E.7070908@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F43625E.7070908@atmel.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10:22 Tue 21 Feb     , Nicolas Ferre wrote:
> On 02/07/2012 12:53 PM, Jean-Christophe PLAGNIOL-VILLARD :
> > On 11:30 Tue 07 Feb     , Nicolas Ferre wrote:
> >> On 02/06/2012 11:35 AM, Jean-Christophe PLAGNIOL-VILLARD :
> >>> use a local copy of board informatin and fill with DT data
> >>>
> >>> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> >>> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> >>> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> >>> Cc: devicetree-discuss@lists.ozlabs.org
> >>> Cc: linux-mtd@lists.infradead.org
> >>
> >> [..]
> >>
> >>> +static int __devinit atmel_of_init_port(struct atmel_nand_host *host,
> >>> +					 struct device_node *np)
> >>
> >> Maybe you will need to protect this function in case of !DT builds: I
> >> suspect that some of the of_xxxxx() calls are not provided if !CONFIG_OF.
> > no-need on the of_ function are static inline it !CONFIG_OF
> 
> Sorry to come back to this but:
> 
> of_get_nand_ecc_mode(np);
> of_get_nand_on_flash_bbt(np);
> 
> for example are not available in case of non-DT compilation: so we must
> protect the atmel_of_init_port() against this error.
> 
> Can you please rework another patch.
yes seen too update send

Best Regards,
J.
