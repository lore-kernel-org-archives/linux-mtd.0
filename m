Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeTmE-0005T6-Pj
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 16:17:08 +0000
Date: Tue, 12 Jun 2012 18:16:54 +0200
From: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: mtd mxc_nand: mx35 kernel panic during request to read Device ID
Message-ID: <20120612161654.GR30400@pengutronix.de>
References: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD332F@MEP-EXCH.meprolight.com>
 <CAOMZO5A1xPzQs_7qMBPYJAPBu1OYc0wTRtibn-Kfu4=P6STgGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5A1xPzQs_7qMBPYJAPBu1OYc0wTRtibn-Kfu4=P6STgGA@mail.gmail.com>
Cc: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alex Gershgorin <alexg@meprolight.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 12, 2012 at 09:11:05AM -0300, Fabio Estevam wrote:
> Hi Alex,
> 
> On Tue, Jun 12, 2012 at 7:35 AM, Alex Gershgorin <alexg@meprolight.com> wrote:
> > Hi everybody,
> >
> > In kernel 3.4, I have not encountered this problem
> 
> Please try this patch:
> https://lkml.org/lkml/2012/6/8/366

This patch is necessary for the mxc_nand to work with flash based bbt.
However, without this patch the kernel won't crash.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
