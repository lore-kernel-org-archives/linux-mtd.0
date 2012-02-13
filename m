Received: from 1.mo5.mail-out.ovh.net ([188.165.57.91]
 helo=mo5.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RwlxF-0005bY-H0
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 02:47:51 +0000
Received: from mail98.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo5.mail-out.ovh.net (Postfix) with SMTP id 4F214FF972F
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2012 03:50:04 +0100 (CET)
Date: Mon, 13 Feb 2012 03:41:39 +0100
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH V3] MTD: atmel_nand: Update driver to support
 Programmable HW ECC controller
Message-ID: <20120213024139.GA3378@game.jcrosoft.org>
References: <1328491977-30448-1-git-send-email-hong.xu@atmel.com>
 <1328959692.22240.103.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1328959692.22240.103.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org, Hong Xu <hong.xu@atmel.com>,
 dwmw2@infradead.org, ivan.djelic@parrot.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13:28 Sat 11 Feb     , Artem Bityutskiy wrote:
> On Mon, 2012-02-06 at 09:32 +0800, Hong Xu wrote:
> > +static int16_t *pmecc_get_index_of(struct atmel_nand_host *host)
> > +{
> > +       int16_t *p = (int16_t *)host->rom_base;
this need to be passed via resource

Best Regards,
J.
