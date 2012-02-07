Received: from 3.mo3.mail-out.ovh.net ([46.105.44.175]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RujgY-0005TK-UC
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 11:58:12 +0000
Received: from mail617.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 11C141008331
 for <linux-mtd@lists.infradead.org>; Tue,  7 Feb 2012 12:58:09 +0100 (CET)
Date: Tue, 7 Feb 2012 12:53:06 +0100
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 5/6 V2] atmel/nand: add DT support
Message-ID: <20120207115306.GF15647@game.jcrosoft.org>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <1328524512-18159-2-git-send-email-plagnioj@jcrosoft.com>
 <4F30FD4B.4050501@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F30FD4B.4050501@atmel.com>
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

On 11:30 Tue 07 Feb     , Nicolas Ferre wrote:
> On 02/06/2012 11:35 AM, Jean-Christophe PLAGNIOL-VILLARD :
> > use a local copy of board informatin and fill with DT data
> > 
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> > Acked-by: Grant Likely <grant.likely@secretlab.ca>
> > Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> > Cc: devicetree-discuss@lists.ozlabs.org
> > Cc: linux-mtd@lists.infradead.org
> 
> [..]
> 
> > +static int __devinit atmel_of_init_port(struct atmel_nand_host *host,
> > +					 struct device_node *np)
> 
> Maybe you will need to protect this function in case of !DT builds: I
> suspect that some of the of_xxxxx() calls are not provided if !CONFIG_OF.
no-need on the of_ function are static inline it !CONFIG_OF

Best Regards,
J.
