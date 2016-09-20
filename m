Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmFfH-0001xv-R0
 for linux-mtd@lists.infradead.org; Tue, 20 Sep 2016 07:40:29 +0000
Message-ID: <1474357196.2342.573.camel@gmail.com>
Subject: Re: [PATCH v5] mtd: nand: tango: import driver for tango chips
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Mason
 <slash.tmp@free.fr>
Cc: Sebastian Frias <sf84@laposte.net>, Richard Weinberger <richard@nod.at>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, Jean-Baptiste Lescher
 <jblescher@gmail.com>, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Date: Tue, 20 Sep 2016 10:39:56 +0300
In-Reply-To: <20160920092441.1f9fa21e@bbrezillon>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon> <57D189E1.3020508@sigmadesigns.com>
 <57D193C5.8040004@sigmadesigns.com> <57D2DF96.7060705@sigmadesigns.com>
 <57D5530B.2060209@free.fr> <20160912210810.79ac23c9@bbrezillon>
 <57DFE444.3000003@sigmadesigns.com> <20160919190623.3b9d7842@bbrezillon>
 <57E06892.6010008@free.fr> <20160920092441.1f9fa21e@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2016-09-20 at 09:24 +0200, Boris Brezillon wrote:
> > >> +  writel_relaxed(chip->timing1,   nfc->reg_base + NFC_TIMING1);
> > >> +  writel_relaxed(chip->timing2,   nfc->reg_base + NFC_TIMING2);
> > >> +  writel_relaxed(chip->xfer_cfg,  nfc->reg_base + NFC_XFER_CFG);
> > >> +  writel_relaxed(chip->pkt_0_cfg, nfc->reg_base + NFC_PKT_0_CFG);
> > >> +  writel_relaxed(chip->pkt_n_cfg, nfc->reg_base + NFC_PKT_N_CFG);
> > >> +  writel_relaxed(chip->bb_cfg,    nfc->reg_base + NFC_BB_CFG);  
> > > 
> > > Nit: can you avoid these weird alignments. Use a single space after the
> > > comma.  
> > 
> > I was trying to highlight the fact that all these writes are
> > within the reg_base area. I'll do as you ask, since you are
> > the gatekeeper.
> 
> Is that really less clear without the tabs?

Visually the aligned stuff looks nicer, and some kernel maintainers
prefer this style. Other maintainers avoid it because it causes more
churn. Indeed, imaging you need to add another field with longer name,
or one of the existing fields is renamed - then you need to re-align,
your patches become larger.

So my suggestion is to just follow maintainers' preferences.
